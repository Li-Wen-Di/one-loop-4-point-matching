"""Translate OPITeR output into direct weighted Package-X integrals.

No IBP, scalar master reduction, or independently coded integration is used.
Only interface reconstruction, phase/measure conversion and Laurent assembly.
"""
import json, hashlib, subprocess, os
import sympy as s
from sympy.parsing.mathematica import parse_mathematica
from contract_offshell_amplitudes import BASE, SOURCE, GRAM, parse_scalar
from run_regions import DEST, mh, ml, dh, dm, ds0, ds1, Q2, U, PP, D

eps,mu,L=s.symbols('eps mu L')


def split_scalar(r):
    hard=r['region']=='Hard';basis=[Q2,U,dh,dm] if hard else [Q2,U,ds0,ds1]
    result=[];reconstructed=0
    for term in s.expand(parse_scalar(r['tensor_reduced'])).as_ordered_terms():
        if term==0:continue
        powers=term.as_powers_dict(); rr,uu,a,b=[powers.get(x,0) for x in basis]
        assert all(int(n)==n and n>=0 for n in [rr,uu,a,b])
        assert not hard or uu==0
        mon=s.prod(x**n for x,n in zip(basis,[rr,uu,a,b]))
        coeff=s.cancel(term/mon)
        assert not any(coeff.has(x) for x in basis)
        assert s.denom(coeff).subs(D,4)!=0, 'Need higher epsilon order from scalar integral'
        key=('H' if hard else 'S')+f'a{a}b{b}r{rr}u{uu}'
        result.append(dict(key=key,kind='hard' if hard else 'soft',a=int(a),b=int(b),r=int(rr),u=int(uu),coefficient=str(coeff)))
        reconstructed+=coeff*mon
    assert s.cancel(reconstructed-parse_scalar(r['tensor_reduced']))==0
    return result


def main():
    source=DEST/'regions.json';data=json.loads(source.read_text())
    (DEST/'integrated.json').unlink(missing_ok=True)
    requests={};parts={}
    for r in data['records']:
        parts[r['key']]=split_scalar(r)
        for p in parts[r['key']]:requests[p['key']]={k:v for k,v in p.items() if k!='coefficient'}
    reqpath=DEST/'packagex-requests.json';reqpath.write_text(json.dumps(list(requests.values()),indent=2)+'\n')
    resultpath=DEST/'packagex-results.json';resultpath.unlink(missing_ok=True)
    process=subprocess.run([os.environ['WOLFRAMSCRIPT'],'-file',str(SOURCE/'src/packagex_integrals.wls'),str(reqpath),str(resultpath)],
                           text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
    (BASE/'logs/packagex-regions.log').write_text(process.stdout)
    assert process.returncode==0 and resultpath.exists(),process.stdout[-3000:]
    scalar={}
    for row in json.loads(resultpath.read_text()):
        expr=parse_mathematica(row['result']).subs({s.Symbol('Eps'):eps,s.Symbol('Mu'):mu})
        expr=expr.subs(s.log(mu**2/mh**2),-L)
        pole=s.expand(expr).coeff(eps,-1)
        finite=s.expand(expr-pole/eps)
        assert not finite.has(eps),row
        scalar[row['key']]=(pole,finite)
    assert scalar.keys()==requests.keys()
    output=[]
    for r in data['records']:
        pole=finite=s.Integer(0)
        for term in parts[r['key']]:
            coeff=parse_scalar(term['coefficient'])
            c0=s.cancel(coeff.subs(D,4));c1=s.cancel(-2*s.diff(coeff,D).subs(D,4))
            ip,iff=scalar[term['key']]
            pole+=c0*ip;finite+=c0*iff+c1*ip
        if r.get('PP'):
            pole=pole.subs(PP,parse_scalar(r['PP']));finite=finite.subs(PP,parse_scalar(r['PP']))
        output.append(dict(model=r['model'],diagram_id=r['diagram_id'],key=r['key'],region=r['region'],
                           scaleless=r['scaleless'],pole=str(s.factor(pole)),finite=str(s.factor(finite)),
                           scalar_terms=parts[r['key']]))
    manifest=dict(status='INTEGRATED',regions_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                  packagex_results_sha256=hashlib.sha256(resultpath.read_bytes()).hexdigest(),
                  normalization='Displayed M/h; the FeAmGen integrand is iM, and Package-X scalar results have the common i/(16pi^2) removed. Eps denotes the pole in the common MSbar convention; L=log(mh^2/mu^2).',
                  dimensional_assembly='For C(D) I, keep C(4)*I_pole/eps + C(4)*I_finite - 2*C_prime(4)*I_pole. C(D) is verified regular at D=4.',
                  distinct_scalar_integrals=len(requests),records=output)
    (DEST/'integrated.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print('PACKAGE_X_INTEGRATED',len(requests),'integrals;',len(output),'diagram-region records')


if __name__=='__main__':main()
