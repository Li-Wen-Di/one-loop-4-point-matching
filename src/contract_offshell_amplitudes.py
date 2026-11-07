"""Contract FeAmGen scalar numerators with FORM, without on-shell rules.

Exports both the complete UFO expression and its single dimension-six-insertion
projection. Denominators are separate records so repeated powers and heavy
tree propagators remain available for subsequent region expansions.
"""
from pathlib import Path
import hashlib
import json
import os
import re
import subprocess
import sympy as s

from runtime_paths import BASE, SOURCE
OUT = BASE / 'results/offshell-amplitudes'
VECTORS = ['K1', 'K2', 'K3', 'q1']
GRAM = {(i, j): s.Symbol(f'G{i+1}{j+1}') for i in range(4) for j in range(i, 4)}
mh, ml, c4, cd, c6 = s.symbols('mh ml c4 cd c6')


def parse_scalar(text):
    return s.sympify(text.replace('^', '**'), locals={'im': s.I}, rational=True)


def linear(text):
    names = {n: s.Symbol(n) for n in VECTORS + ['K4']}
    expr = s.expand(s.sympify(text, locals=names).subs(names['K4'], names['K1'] + names['K2'] - names['K3']))
    result = tuple(expr.coeff(names[n]) for n in VECTORS)
    assert s.expand(expr-sum(c*names[n] for c, n in zip(result, VECTORS))) == 0
    return result


def dot(a, b):
    return s.expand(sum(a[i]*b[j]*GRAM[min(i,j), max(i,j)] for i in range(4) for j in range(4)))


def parse_form(text):
    text = re.sub(r'\s+', '', text)
    def pair(match):
        a, b = sorted([VECTORS.index(match[1]), VECTORS.index(match[2])])
        return str(GRAM[a, b])
    text = re.sub(r'(K[1-3]|q1)\.(K[1-3]|q1)', pair, text)
    assert not re.search(r'FV\(|muv|K4|Den\(', text), text
    return s.sympify(text.replace('^', '**'), locals={'i_': s.I}, rational=True)


def project_dim6(expr):
    t = s.Symbol('zDim6')
    expr = s.Poly(s.expand(expr.subs({cd: t*cd, c6: t*c6})), t)
    return s.expand(expr.nth(0) + expr.nth(1))


def main():
    for name in ['amplitudes.json', 'validation.json', 'soft-validation.json']:
        (OUT/name).unlink(missing_ok=True)
    assembled_path = OUT/'feamgen-assembled.json'
    data = json.loads(assembled_path.read_text())
    script = ['Off Statistics;', 'Symbols gc1,gc2,gc3;',
              'Vectors K1,K2,K3,K4,q1,v;', 'Indices mu;',
              'AutoDeclare Index muv;', 'CFunctions FV;']
    keyed = []
    for mi, model in enumerate(data['models']):
        for d in model['diagrams']:
            key = f'N{mi}g{d["diagram_id"]}'
            numerator = d['weighted_numerator_ufo'].replace('im', 'i_')
            for i in range(1, 4):
                numerator = numerator.replace(f'gc_{i}', f'gc{i}')
            script.append(f'Local {key} = {numerator};')
            keyed.append((key, model, d))
    script += ['id FV(v?,mu?)=v(mu);', '.sort', 'id K4=K1+K2-K3;', '.sort']
    for key, _, _ in keyed:
        script.append(f'#write <contracted.txt> "{key} = %E;", {key}')
    script += ['.end']
    form_path = OUT/'contract-numerators.frm'
    form_path.write_text('\n'.join(script)+'\n')
    contracted_path = OUT/'contracted.txt'
    contracted_path.unlink(missing_ok=True)
    result = subprocess.run([os.environ['FORM'], '-q', form_path.name],
                            cwd=OUT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True)
    (BASE/'logs/contract-offshell-amplitudes.log').write_text(result.stdout)
    terms = dict(re.findall(r'(N\dg\d+)\s*=\s*(.*?);', contracted_path.read_text(), re.S))
    assert len(terms) == len(keyed)
    for key, model, d in keyed:
        couplings = {s.Symbol(k.replace('_', '')): parse_scalar(v) for k, v in model['couplings'].items()}
        numerator = s.expand(parse_form(terms[key]).subs(couplings))
        assert not numerator.atoms(s.Float), 'Inexact UFO coefficient'
        assert not numerator.has(s.I), 'Unexpected one-loop scalar phase'
        projected = project_dim6(numerator)
        denominators = []
        for p in d['propagators']:
            poly = dot(linear(p['momentum']), linear(p['momentum'])) - s.Symbol(p['mass'])**2
            denominators.append(dict(p, polynomial=str(poly), power=1))
        d.update(numerator_full=str(numerator), numerator_dim6=str(projected),
                 denominators=denominators, form_numerator_key=key)
    version = subprocess.run([os.environ['FORM'], '-v'],
                             text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True).stdout.strip()
    data.update(form_version=version,
                gram_basis={str(g): f'{VECTORS[i]}.{VECTORS[j]}' for (i,j), g in GRAM.items()},
                truncation='Full UFO numerators also retained; dim6 drops CD^2/MH^4 and all products of two dimension-six insertions. No soft-mass or momentum Taylor expansion yet.',
                assembled_sha256=hashlib.sha256(assembled_path.read_bytes()).hexdigest(),
                form_script_sha256=hashlib.sha256(form_path.read_bytes()).hexdigest())
    (OUT/'amplitudes.json').write_text(json.dumps(data, indent=2)+'\n')
    # An immediately usable FORM integrand file. D(momentum,mass,power)
    # is a scalar propagator WITHOUT i. Retain +i0 when integrating.
    lines = ['* iM = integral_q of the following integrands; scale factors external.',
             'Symbols mh,ml,lam0,lam1,lam2,c4,cd,c6;',
             'Vectors K1,K2,K3,q1;', 'CFunctions D;']
    for key, _, d in keyed:
        factors = []
        for p in d['propagators']:
            mom = str(sum(c*s.Symbol(n) for c,n in zip(linear(p['momentum']), VECTORS)))
            factors.append(f'D({mom},{p["mass"]},1)')
        num = s.sympify(d['numerator_dim6'])
        # Keep dot products native to FORM for subsequent region/tensor work.
        numtext = str(num).replace('**', '^')
        for (i,j), g in GRAM.items():
            numtext = re.sub(rf'\b{g}\b', f'({VECTORS[i]}.{VECTORS[j]})', numtext)
        lines.append(f'Local A{key[1:]} = ({numtext})*'+'*'.join(factors)+';')
    lines += ['.sort', '.end']
    (OUT/'integrands-dim6.frm').write_text('\n'.join(lines)+'\n')
    print(f'FORM contracted and exported {len(keyed)} off-shell amplitudes.')


if __name__ == '__main__':
    main()
