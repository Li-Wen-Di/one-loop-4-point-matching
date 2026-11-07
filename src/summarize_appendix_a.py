"""Integrated UV-soft/EFT verification and per-topology Appendix-A results."""
import hashlib,json
import sympy as s
from contract_offshell_amplitudes import BASE,GRAM,parse_scalar
from run_regions import DEST,mh,ml

lam0,lam1,lam2,c4,cd,c6,L,r=s.symbols('lam0 lam1 lam2 c4 cd c6 L r')
ss,tt,uu,v1,v2,v3=s.symbols('s t u v1 v2 v3')
invariants={GRAM[0,0]:v1,GRAM[1,1]:v2,GRAM[2,2]:v3,
            GRAM[0,1]:(ss-v1-v2)/2,GRAM[0,2]:(v1+v3-tt)/2,GRAM[1,2]:(v2+v3-uu)/2}


def simplify(expr):
    return s.factor(s.together(s.expand(expr.subs(invariants,simultaneous=True))))


def main():
    path=DEST/'integrated.json';data=json.loads(path.read_text())
    (DEST/'soft-check.json').unlink(missing_ok=True)
    groups=json.loads((BASE/'results/classification.json').read_text())
    totals={};classes={}
    for theory,region in [('UV','Soft'),('UV','Hard'),('EFT','EFT')]:
        rows=[row for row in data['records'] if row['region']==region]
        totals[theory+region]={part:simplify(sum(parse_scalar(row[part]) for row in rows)) for part in ['pole','finite']}
        model='TwoScalarUV_UFO' if theory=='UV' else 'ScalarGreenEFT_UFO'
        for group in groups[model]['classes']:
            selected=[row for row in rows if row['diagram_id'] in group['diagram_ids']]
            classes[group['id']+region]=dict(count=len(selected),diagram_ids=group['diagram_ids'],
                **{part:str(simplify(sum(parse_scalar(row[part]) for row in selected))) for part in ['pole','finite']})
    tree={c4:lam0-3*lam1**2,cd:4*lam1**2,c6:45*lam1**2*lam2}
    residuals={}
    for part in ['pole','finite']:
        difference=simplify(totals['UVSoft'][part]-totals['EFTEFT'][part].subs(tree))
        assert difference==0,('UV soft != EFT loop',part,difference)
        residuals[part]=str(difference)
    report=dict(status='PASS',integrated_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                residuals=residuals,scope='Integrated FORM -> OPITeR -> Package-X UV soft sum equals EFT loop sum off shell through dimension six, including poles and finite parts.')
    (DEST/'soft-check.json').write_text(json.dumps(report,indent=2)+'\n')
    hard=totals['UVHard']['finite']
    assert all(s.diff(hard,v)==0 for v in [v1,v2,v3])
    assert s.simplify(s.diff(hard,ss)-s.diff(hard,tt))==s.simplify(s.diff(hard,ss)-s.diff(hard,uu))==0
    cd_result=s.factor(4*mh**2*s.diff(hard,ss))
    c4_result=s.factor(-hard.subs({ss:0,tt:0,uu:0}).subs(ml**2,r*mh**2))
    summary=dict(normalization='Every displayed amplitude is M/h; poles are the coefficients of 1/eps.',
                 invariants='s=(p1+p2)^2,t=(p1+p3)^2,u=(p1+p4)^2; v_i=p_i^2; sum p_i^2=s+t+u, without on-shell conditions.',
                 totals={key:{part:str(value) for part,value in values.items()} for key,values in totals.items()},
                 classes=classes,C4_one_loop=str(c4_result),CD_one_loop=str(cd_result))
    (DEST/'amplitude-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    print('INTEGRATED_SOFT_CHECK',residuals)
    print('HARD_POLE',totals['UVHard']['pole'])
    print('HARD_FINITE',hard)


if __name__=='__main__':main()
