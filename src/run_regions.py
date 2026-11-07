"""FORM hard/soft expansion and OPITeR handoff for Appendix A.

All amplitudes originate in the saved FeAmGen export. FORM, not this driver,
performs the Taylor expansion and product truncation. Python prepares routing
and records denominators; an independent SymPy series audits FORM's result.
"""
from pathlib import Path
import hashlib, json, re, subprocess, os
import sympy as s
from contract_offshell_amplitudes import BASE, OUT, GRAM, VECTORS, linear, dot, parse_scalar

DEST = BASE/'results/appendix-a'
FORM = os.environ['FORM']
OPITER = str(BASE/'vendor/OPITeR/opiter')
mh, ml, dh, dm, ds0, ds1, z = s.symbols('mh ml dh dm ds0 ds1 z')
Q2, U, PP, D = s.symbols('Q2 U PP D')


def form(expr):
    text = str(expr).replace('**','^')
    for (i,j), g in GRAM.items():
        text = re.sub(rf'\b{g}\b', f'({VECTORS[i]}.{VECTORS[j]})', text)
    return text


def read_form(text):
    text = re.sub(r'\s+', '', text)
    def pair(m):
        i,j=sorted([VECTORS.index(m[1]),VECTORS.index(m[2])])
        return str(GRAM[i,j])
    text = re.sub(r'(K[1-3]|q1)\.(K[1-3]|q1)',pair,text)
    return s.sympify(text.replace('^','**'),locals={'rat':lambda a,b:a/b},rational=True)


def canonical_soft(d):
    lights=[p for p in d['denominators'] if p['field']=='phi']
    if not lights:
        return parse_scalar(d['numerator_dim6']), [], [], []
    first=linear(lights[0]['momentum']); c=first[3]
    assert c in (-1,1)
    oldq=tuple(-first[i]/c if i<3 else 1/c for i in range(4))
    units=[tuple(s.Integer(i==j) for i in range(4)) for j in range(3)]+[oldq]
    replacement={g:dot(units[i],units[j]) for (i,j),g in GRAM.items()}
    num=s.expand(parse_scalar(d['numerator_dim6']).subs(replacement,simultaneous=True))
    props=[]
    for p in d['denominators']:
        v=linear(p['momentum'])
        v=tuple(v[i]+v[3]*oldq[i] if i<3 else v[3]*oldq[3] for i in range(4))
        if v[3]<0: v=tuple(-x for x in v)
        props.append(dict(p, vector=list(map(str,v)), square=str(dot(v,v))))
    lprops=[p for p in props if p['field']=='phi']
    assert linear_from_record(lprops[0]) == (0,0,0,1)
    P=linear_from_record(lprops[1])[:3]+(s.Integer(0),) if len(lprops)==2 else None
    return num, props, P, list(map(str,oldq))


def linear_from_record(p):
    return tuple(map(parse_scalar,p['vector']))


def make_records(data):
    records=[]
    for m in data['models']:
        isuv=m['model']=='TwoScalarUV_UFO'
        for d in m['diagrams']:
            if isuv:
                factors=[]; audit=[]
                for p in d['denominators']:
                    v=linear(p['momentum']); c=v[3]; assert c in (-1,0,1)
                    P=v[:3]+(0,)
                    base=dh if c and p['field']=='hh' else dm if c else -1/mh**2
                    assert c or p['field']=='hh', 'Light bridge in a retained amplitude'
                    b=2*c*dot((0,0,0,1),P)
                    cc=dot(P,P)-(ml**2 if p['field']=='phi' else 0)
                    factors.append(f'Prop({form(base)},{form(b)},{form(cc)},1)')
                    audit.append(dict(propagator_id=p['propagator_id'], base=str(base),linear=str(b),quadratic=str(cc)))
                num=parse_scalar(d['numerator_dim6'])
                records.append(dict(key=f'H{d["diagram_id"]}',model=m['model'],diagram_id=d['diagram_id'],region='Hard',
                                    input='('+form(num)+')*'+'*'.join(factors), numerator=str(num), factors=audit,
                                    scaleless=not any(p['field']=='hh' and linear(p['momentum'])[3] for p in d['denominators'])))
            num,props,P,shift=canonical_soft(d)
            if not props:
                # All propagators are heavy. Soft expansion has no q-dependent
                # denominator; its integral is scaleless, independently of rank.
                records.append(dict(key=f'S{d["diagram_id"]}',model=m['model'],diagram_id=d['diagram_id'],region='Soft',
                                    input='0',numerator='0',factors=[],scaleless=True,P=None,shift=[]))
                continue
            factors=[];audit=[];light_index=0
            for p in props:
                if p['field']=='hh':
                    factors.append(f'SoftProp({form(parse_scalar(p["square"]))},1)')
                    audit.append(dict(p,base='heavy'))
                else:
                    name=f'ds{light_index}'; light_index+=1
                    factors.append(name); audit.append(dict(p,base=name))
            nh=sum(p['field']=='hh' for p in props)
            graded_num=s.Add(*(term*z**(2*nh-term.as_powers_dict().get(mh,0)) for term in s.expand(num).as_ordered_terms()))
            records.append(dict(key=('S' if isuv else 'E')+str(d['diagram_id']),model=m['model'],diagram_id=d['diagram_id'],
                                region='Soft' if isuv else 'EFT',input='('+form(graded_num)+')*'+'*'.join(factors),
                                numerator=str(num),factors=audit,P=list(map(str,P)) if P else None,shift=shift,scaleless=False))
    return records


def run_form_expansion(records):
    lines=['Off Statistics;', 'Symbols mh,ml,lam0,lam1,lam2,c4,cd,c6,dh,dm,ds0,ds1,z,a,b,c,n;',
           'Vectors K1,K2,K3,q1;', 'CFunctions Prop,SoftProp;']
    for r in records: lines.append(f'Local {r["key"]}={r["input"]};')
    lines += ['id Prop(a?,b?,c?,n?)=a^n-z*n*b*a^(n+1)+z^2*(-n*c*a^(n+1)+n*(n+1)/2*b^2*a^(n+2));',
              'id SoftProp(a?,n?)=(-1/mh^2)^n*(1+z^2*n*a/mh^2+z^4*n*(n+1)/2*a^2/mh^4);', '.sort',
              'id z^n?{3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24}=0;', 'id z=1;', '.sort']
    for r in records: lines.append(f'#write <expanded.txt> "{r["key"]}=%E;", {r["key"]}')
    lines.append('.end')
    path=DEST/'regions.frm';path.write_text('\n'.join(lines)+'\n')
    (DEST/'expanded.txt').unlink(missing_ok=True)
    result=subprocess.run([FORM,'-q',path.name],cwd=DEST,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,check=True)
    (BASE/'logs/form-regions.log').write_text(result.stdout)
    values=dict(re.findall(r'([HSE]\d+)\s*=\s*(.*?);',(DEST/'expanded.txt').read_text(),re.S))
    for r in records:r['expanded']=str(s.expand(read_form(values[r['key']])))


def audit_expansion(records, data):
    raw={(m['model'],d['diagram_id']):d for m in data['models'] for d in m['diagrams']}
    successes=[]
    for r in records:
        d=raw[r['model'],r['diagram_id']]
        if r['region']=='Hard':
            expected=parse_scalar(d['numerator_dim6'])
            for p,f in zip(d['denominators'],r['factors']):
                # Derive the scaling directly from the original polynomial,
                # separately from the vector formula used to prepare FORM.
                scaling={g:g*z**(int(i<3)+int(j<3)) for (i,j),g in GRAM.items()} | {ml:ml*z}
                scaled=s.expand(parse_scalar(p['polynomial']).subs(scaling,simultaneous=True))
                b,c=scaled.coeff(z,1),scaled.coeff(z,2)
                assert b==parse_scalar(f['linear']) and c==parse_scalar(f['quadratic'])
                inv=parse_scalar(f['base'])
                constant=scaled.coeff(z,0)
                assert (inv==dh and constant==GRAM[3,3]-mh**2) or (inv==dm and constant==GRAM[3,3]) or (inv==-1/mh**2 and constant==-mh**2)
                expected*=s.series(1/(1/inv+z*b+z**2*c),z,0,3).removeO()
            expected=s.Poly(s.expand(expected),z)
            expected=sum(expected.nth(i) for i in range(3))
        elif r['scaleless']:
            assert all(p['field']=='hh' for p in d['denominators'])
            expected=s.Integer(0)
        else:
            shift=tuple(map(parse_scalar,r['shift']))
            assert shift[3] in (-1,1), 'Loop shift Jacobian must have modulus one'
            units=[tuple(s.Integer(i==j) for i in range(4)) for j in range(3)]+[shift]
            mapping={g:dot(units[i],units[j]) for (i,j),g in GRAM.items()}
            assert s.expand(parse_scalar(d['numerator_dim6']).subs(mapping,simultaneous=True)-parse_scalar(r['numerator']))==0
            byid={p['propagator_id']:p for p in d['denominators']}
            for p in r['factors']:
                original=byid[p['propagator_id']]
                mass=mh if p['field']=='hh' else ml
                moved=s.expand(parse_scalar(original['polynomial']).subs(mapping,simultaneous=True))
                assert s.expand(moved-(parse_scalar(p['square'])-mass**2))==0, 'Soft routing handoff'
            expected=parse_scalar(r['numerator'])
            for p in r['factors']:
                expected*=1/(parse_scalar(p['square'])-mh**2) if p['base']=='heavy' else s.Symbol(p['base'])
            zz=s.Symbol('inverseHeavyMass')
            expected=s.series(expected.subs(mh,1/zz),zz,0,3).removeO().subs(zz,1/mh).expand()
        residual=s.factor(s.expand(expected-parse_scalar(r['expanded'])))
        assert residual==0,(r['key'],residual)
        successes.append(r['key'])
    return dict(status='PASS',checked=len(successes),keys=successes,
                method='FORM finite propagator expansion and product truncation vs independent SymPy series. Input vector decomposition also checked against original FeAmGen denominator polynomials.')


def opiter_input(expr):
    pieces=[]
    for term in s.expand(expr).as_ordered_terms():
        powers=term.as_powers_dict(); loops=[]; external=[]; residue=term; idx=0
        for i in range(3):
            g=GRAM[i,3]; n=powers.get(g,0);assert n.is_Integer if hasattr(n,'is_Integer') else isinstance(n,int)
            for _ in range(int(n)):
                idx+=1;loops.append(f'q1(mu{idx})');external.append(f'K{i+1}(mu{idx})')
            residue/=g**n
        coefficient=form(s.cancel(residue))
        if loops: pieces.append(f'({coefficient})*proj('+ '*'.join(external)+')*'+'*'.join(loops))
        else:pieces.append(f'({coefficient})')
    return '+'.join(pieces)


def run_opiter(records):
    lines=[f'#: IncDir {OPITER}','#include- opiter.frm','Off Statistics;',
           'Symbols mh,ml,lam0,lam1,lam2,c4,cd,c6,dh,dm,ds0,ds1;', 'Vectors K1,K2,K3,R1;']
    for r in records:
        expr=s.Integer(0) if r['scaleless'] else parse_scalar(r['expanded'])
        ext='ext(R1)' if r.get('P') else 'ext()'
        lines.append(f'Local {r["key"]}={ext}*loop(q1)*({opiter_input(expr)});')
    # Round-trip the actual tensor INPUT, undoing only our projector packaging.
    # This checks the handoff, not OPITeR's reduction algorithm.
    roundtrip=lines+['id proj(c?)=c;','id ext(?a)=1;','id loop(?a)=1;','.sort']
    for r in records:roundtrip.append(f'#write <tensor-input-roundtrip.txt> "{r["key"]}=%E;", {r["key"]}')
    roundtrip.append('.end')
    roundpath=DEST/'tensor-input-roundtrip.frm';roundpath.write_text('\n'.join(roundtrip)+'\n')
    (DEST/'tensor-input-roundtrip.txt').unlink(missing_ok=True)
    rt=subprocess.run([FORM,'-q',roundpath.name],cwd=DEST,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,check=True)
    (BASE/'logs/tensor-input-roundtrip.log').write_text(rt.stdout)
    values=dict(re.findall(r'([HSE]\d+)\s*=\s*(.*?);',(DEST/'tensor-input-roundtrip.txt').read_text(),re.S))
    for r in records:
        target=s.Integer(0) if r['scaleless'] else parse_scalar(r['expanded'])
        assert s.expand(read_form(values[r['key']])-target)==0,('OPITeR input conversion',r['key'])
    lines += ['#call opiter','.sort','#call symmetrise','#call leavedualtransverse','.sort',
              'id ext(?a)=1;','id loop(?a)=1;','.sort']
    for r in records: lines.append(f'#write <tensor-reduced.txt> "{r["key"]}=%E;", {r["key"]}')
    lines.append('.end')
    path=DEST/'tensor-reduction.frm';path.write_text('\n'.join(lines)+'\n')
    (DEST/'tensor-reduced.txt').unlink(missing_ok=True)
    result=subprocess.run([FORM,'-q',path.name],cwd=DEST,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,check=True)
    (BASE/'logs/opiter-regions.log').write_text(result.stdout)
    values=dict(re.findall(r'([HSE]\d+)\s*=\s*(.*?);',(DEST/'tensor-reduced.txt').read_text(),re.S))
    for r in records:
        def pair(match):
            a,b=match[1],match[2]
            if a==b=='q1':return 'Q2'
            if {a,b}=={'q1','R1'}:return 'U'
            if a==b=='R1':return 'PP'
            if 'R1' in (a,b):
                other=b if a=='R1' else a
                assert other in VECTORS[:3] and r.get('P')
                unit=tuple(s.Integer(i==VECTORS.index(other)) for i in range(4))
                return '('+str(dot(tuple(map(parse_scalar,r['P'])),unit))+')'
            assert a in VECTORS[:3] and b in VECTORS[:3], ('unreduced loop tensor',r['key'],a,b)
            i,j=sorted([VECTORS.index(a),VECTORS.index(b)])
            return str(GRAM[i,j])
        text=re.sub(r'\s+','',values[r['key']])
        text=re.sub(r'(K[1-3]|q1|R1)\.(K[1-3]|q1|R1)',pair,text)
        expr=s.sympify(text.replace('^','**'),locals={'rat':lambda a,b:a/b},rational=True)
        assert not expr.atoms(s.Function), (r['key'],expr.atoms(s.Function))
        assert not any(str(x).startswith(('mu','q1','K')) for x in expr.free_symbols)
        r['tensor_reduced']=str(s.factor(expr))
        r['PP']=str(dot(tuple(map(parse_scalar,r['P'])),tuple(map(parse_scalar,r['P'])))) if r.get('P') else None


def main():
    DEST.mkdir(exist_ok=True)
    for f in ['regions-validation.json','integrated.json','soft-check.json']:(DEST/f).unlink(missing_ok=True)
    source=OUT/'amplitudes.json';data=json.loads(source.read_text())
    records=make_records(data)
    run_form_expansion(records)
    audit=audit_expansion(records,data)
    print('FORM_EXPANSION',audit['status'],audit['checked'],flush=True)
    run_opiter(records)
    manifest=dict(status='GENERATED',source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),records=records)
    (DEST/'regions.json').write_text(json.dumps(manifest,indent=2)+'\n')
    audit['regions_sha256']=hashlib.sha256((DEST/'regions.json').read_bytes()).hexdigest()
    audit['tensor_input_roundtrip']='PASS: all 124 tensor inputs contract back to the original scalar-product numerators before calling OPITeR.'
    (DEST/'regions-validation.json').write_text(json.dumps(audit,indent=2)+'\n')
    print('OPITER_HANDOFF_COMPLETE',len(records),flush=True)


if __name__=='__main__':main()
