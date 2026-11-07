"""Independent, exact checks of the FeAmGen off-shell adapter.

Expected vertices come from the Lagrangian, not FeAmGen's assembled expressions.
QGRAF weights are additionally recomputed from labeled-graph automorphisms.
No integrated matching result is used as a target.
"""
from collections import Counter
from copy import deepcopy
from itertools import permutations
from math import factorial, prod
from pathlib import Path
import hashlib
import json
import subprocess
import os
import sympy as s
from contract_offshell_amplitudes import BASE, OUT, GRAM, linear, dot, parse_scalar

mh, ml, c4, cd, c6, lam0, lam1, lam2 = s.symbols('mh ml c4 cd c6 lam0 lam1 lam2')


def source_graph(d):
    nodes = [v['vertex_index'] for v in d['vertices']]
    edges = [(p['birth_index'], p['death_index'], p['field']) for p in d['remnant_propagators']]
    labels = {v: [] for v in nodes}
    for p in d['incoming_propagators']:
        labels[p['vertex_index']].append(p['in_index'])
    for p in d['outgoing_propagators']:
        labels[p['vertex_index']].append(2+p['out_index'])
    return nodes, edges, labels


def graph_key(d, relabel=lambda x:x):
    nodes, edges, labels = source_graph(d)
    keys = []
    for order in permutations(nodes):
        mapping = {v:i for i,v in enumerate(order)}
        keys.append((tuple(tuple(sorted(relabel(x) for x in labels[v])) for v in order),
                     tuple(sorted((min(mapping[a],mapping[b]), max(mapping[a],mapping[b]), f) for a,b,f in edges))))
    return min(keys)


def wick_weight(d):
    nodes, edges, labels = source_graph(d)
    edge_count = Counter((min(a,b), max(a,b), f) for a,b,f in edges)
    automorphisms = 0
    for order in permutations(nodes):
        mapping = dict(zip(nodes,order))
        if any(sorted(labels[v]) != sorted(labels[mapping[v]]) for v in nodes):
            continue
        moved = Counter((min(mapping[a],mapping[b]), max(mapping[a],mapping[b]), f) for a,b,f in edges)
        automorphisms += moved == edge_count
    edge_symmetry = prod(factorial(n) * (2**n if a==b else 1) for (a,b,_),n in edge_count.items())
    return s.Rational(1, automorphisms*edge_symmetry)


def independent_numerator(d, model):
    value = s.I**len(d['remnant_propagators'])
    for v in d['vertices']:
        momenta = [linear(p) for p in v['momentum_product']]
        assert all(s.expand(sum(p[i] for p in momenta)) == 0 for i in range(4)), 'Vertex momentum conservation'
        fields = Counter(v['fields'])
        if model == 'TwoScalarUV_UFO':
            vertex = {('phi',)*4: -s.I*lam0,
                      ('hh','phi','phi'): -s.I*lam1*mh,
                      ('hh','hh','phi','phi'): -s.I*lam2}[tuple(sorted(v['fields']))]
        elif fields == {'phi': 4}:
            vertex = -s.I*c4+s.I*cd*sum(dot(p,p) for p in momenta)/(4*mh**2)
        else:
            assert fields == {'phi': 6}
            vertex = -s.I*c6/mh**2
        value *= vertex
    return s.expand(value * wick_weight(d) * d['sign'])


def independent_dim6(expr):
    # Direct monomial filter, deliberately distinct from the exporter's t projection.
    return s.Add(*(term for term in s.expand(expr).as_ordered_terms()
                   if term.as_powers_dict().get(cd,0)+term.as_powers_dict().get(c6,0) <= 1))


def validate_diagram(exported, raw, model):
    expected = independent_numerator(raw, model)
    assert s.expand(parse_scalar(exported['numerator_full']) - expected) == 0, 'Full numerator mismatch'
    assert s.expand(parse_scalar(exported['numerator_dim6']) - independent_dim6(expected)) == 0, 'Dimension-six numerator mismatch'
    assert s.Rational(exported['symmetry_factor']) == wick_weight(raw)
    assert exported['sign'] == raw['sign'] == 1
    assert len(exported['denominators']) == len(raw['remnant_propagators'])
    denominator_by_id = {p['propagator_id']:p for p in exported['denominators']}
    assert len(denominator_by_id) == len(raw['remnant_propagators'])
    for p in raw['remnant_propagators']:
        actual = denominator_by_id[p['propagator_index']]
        mass = {'phi':ml, 'hh':mh}[p['field']]
        expected_den = dot(linear(p['momentum']), linear(p['momentum']))-mass**2
        assert s.expand(parse_scalar(actual['polynomial'])-expected_den) == 0, 'Routing/mass mismatch'
        assert actual['power'] == 1 and actual['field'] == p['field']
    # Four external scalars: numerator dimension = 2I-4 before the d^4 q measure.
    z = s.Symbol('zScale')
    scaling = {g:g*z**2 for g in GRAM.values()} | {mh:mh*z, ml:ml*z}
    assert s.expand(expected.subs(scaling, simultaneous=True)-expected*z**(2*len(raw['remnant_propagators'])-4)) == 0
    return expected


def mink_dot(a,b):
    return a[0]*b[0]-sum(x*y for x,y in zip(a[1:],b[1:]))


def main():
    (OUT/'validation.json').unlink(missing_ok=True)
    data = json.loads((OUT/'amplitudes.json').read_text())
    assert hashlib.sha256((OUT/'feamgen-assembled.json').read_bytes()).hexdigest() == data['assembled_sha256']
    assert hashlib.sha256((OUT/'contract-numerators.frm').read_bytes()).hexdigest() == data['form_script_sha256']
    assert data['kinematic_relations'] == []
    checked = []
    raw_by_model = {}
    expected_by_graph = {}
    mutation_checks = 0
    for m in data['models']:
        name = m['model']
        raw = json.loads((BASE/'results'/name/'diagrams.json').read_text())['FeynmanDiagrams']
        raw_by_model[name] = {d['diagram_index']:d for d in raw}
        assert hashlib.sha256((BASE/'results'/name/'qgraf_out.dat').read_bytes()).hexdigest() == m['provenance']['qgraf_sha256']
        assert hashlib.sha256((BASE/'results'/name/'process.yaml').read_bytes()).hexdigest() == m['provenance']['card_sha256']
        for file, digest in m['provenance']['ufo_sha256'].items():
            assert hashlib.sha256((BASE/'models'/name/file).read_bytes()).hexdigest() == digest
        # All raw QGRAF weights, including discarded graphs, checked independently.
        for d in raw:
            assert s.Rational(d['symmetry_factor']) == wick_weight(d)
        classes = json.loads((BASE/'results/classification.json').read_text())[name]
        wanted = {i for group in classes['classes'] for i in group['diagram_ids']}
        kept = {d['diagram_id'] for d in m['diagrams']}
        assert len(kept) == len(m['diagrams']) == m['retained_count']
        assert kept == wanted
        assert {d['diagram_id'] for d in m['excluded']} == set(classes['excluded_light_bridge'])
        assert len(raw) == m['raw_count'] == len(kept)+len(m['excluded'])
        assert sum(bool(d['heavy_bridge_propagator_ids']) for d in m['diagrams']) == (36 if name=='TwoScalarUV_UFO' else 0)
        original = Counter(graph_key(raw_by_model[name][i]) for i in kept)
        for perm in permutations([1,2,3,4]):
            mapped = dict(zip([1,2,3,4],perm))
            assert Counter(graph_key(raw_by_model[name][i],mapped.__getitem__) for i in kept) == original, 'External-permutation closure'
        for d in m['diagrams']:
            expected = validate_diagram(d, raw_by_model[name][d['diagram_id']], name)
            expected_by_graph[name,d['diagram_id']] = expected
            changed = deepcopy(d)
            changed['numerator_full'] = str(2*parse_scalar(d['numerator_full']))
            try:
                validate_diagram(changed, raw_by_model[name][d['diagram_id']], name)
            except AssertionError:
                mutation_checks += 1
            else:
                raise AssertionError('Bad vertex coefficient was not detected')
        checked.append(dict(model=name, raw_weights_verified=len(raw), amplitudes_symbolically_verified=len(kept),
                            external_permutations_verified=24, heavy_bridge_graphs_retained=sum(bool(d['heavy_bridge_propagator_ids']) for d in m['diagrams']),
                            tadpole_graphs_retained=sum(any(p['birth_index']==p['death_index'] for p in raw_by_model[name][i]['remnant_propagators']) for i in kept)))
    numeric_samples = []
    for n in range(1,7):
        vectors = [(5+n,1,0,1),(2,0,4+n,0),(3,1,1,n+1),(11+n,2,3,1)]
        k4 = tuple(vectors[0][i]+vectors[1][i]-vectors[2][i] for i in range(4))
        virtualities = [mink_dot(v,v) for v in vectors[:3]+[k4]]
        assert len(set(virtualities)) == 4 and all(v != s.Rational(4,9) for v in virtualities)
        values = {g:mink_dot(vectors[i],vectors[j]) for (i,j),g in GRAM.items()}
        values |= {mh:s.Integer(17), ml:s.Rational(2,3), lam0:s.Rational(3,7), lam1:s.Rational(2,5), lam2:s.Rational(5,11), c4:s.Rational(7,13), cd:s.Rational(11,17), c6:s.Rational(13,19)}
        for m in data['models']:
            for d in m['diagrams']:
                den = prod(parse_scalar(p['polynomial']).subs(values) for p in d['denominators'])
                assert den != 0
                actual = parse_scalar(d['numerator_dim6']).subs(values)/den
                expected = independent_dim6(expected_by_graph[m['model'],d['diagram_id']]).subs(values)/den
                assert actual == expected
        numeric_samples.append(dict(sample=n, virtualities=list(map(str,virtualities)), light_mass_squared='4/9', graphs_checked=64))
    # Four independent external virtualities are allowed subject to momentum
    # conservation. An erroneous diagonal on-shell substitution must be visible.
    eft = data['models'][1]
    bubble = next(d for d in eft['diagrams'] if parse_scalar(d['numerator_dim6']).has(cd))
    full = parse_scalar(bubble['numerator_dim6'])
    assert s.expand(full-full.subs(GRAM[0,0],ml**2)) != 0
    assert not full.has(ml), 'External virtuality silently replaced by light mass'
    # Compile the exported FORM interface, including its scalar denominator records.
    result = subprocess.run([os.environ['FORM'],'-q','integrands-dim6.frm'],cwd=OUT,
                            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,check=True)
    (BASE/'logs/check-offshell-form-export.log').write_text(result.stdout)
    report = dict(status='PASS', models=checked, exact_offshell_samples=numeric_samples,
                  bad_coefficient_mutations_detected=mutation_checks,
                  on_shell_substitution_detected=True, form_export_compiles=True,
                  scope='64 generated amplitudes checked exactly against independent Lagrangian vertices, graph weights, routing and dimension-six projection; no integration, counterterm subtraction or hard-region matching result verified here.',
                  amplitude_sha256=hashlib.sha256((OUT/'amplitudes.json').read_bytes()).hexdigest())
    (OUT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__ == '__main__':
    main()
