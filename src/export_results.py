"""Export four Wolfram result files and validate them with Mathematica."""
import hashlib,json,os,subprocess
from pathlib import Path
from sympy.printing.mathematica import mathematica_code
from runtime_paths import BASE,SOURCE
from contract_offshell_amplitudes import parse_scalar

EXPR_KEYS={'pole','finite','pole_residual','finite_residual','c4','cd','c6'}
def wolfram_expr(value):
    return mathematica_code(parse_scalar(value)).replace('DiscB[','X`DiscB[')

def wl(value,key=''):
    if isinstance(value,dict):
        return '<|'+',\n'.join(json.dumps(k)+' -> '+wl(v,k if key!='wolfram_expressions' else '') for k,v in value.items())+'|>'
    if isinstance(value,list):return '{'+','.join(wl(v) for v in value)+'}'
    if isinstance(value,bool):return 'True' if value else 'False'
    if isinstance(value,str):return wolfram_expr(value) if key in EXPR_KEYS else json.dumps(value)
    return str(value)

def main():
    dest=BASE/'results/appendix-a'
    summary=json.loads((dest/'amplitude-summary.json').read_text())
    verdict=json.loads((dest/'soft-check.json').read_text())
    assert verdict['status']=='PASS' and all(parse_scalar(x)==0 for x in verdict['residuals'].values())
    assert hashlib.sha256((dest/'integrated.json').read_bytes()).hexdigest()==verdict['integrated_sha256']
    assert json.loads((BASE/'results/offshell-amplitudes/validation.json').read_text())['status']=='PASS'
    assert json.loads((dest/'regions-validation.json').read_text())['status']=='PASS'
    provenance={}
    for folder in ['models','src']:
        for p in sorted((SOURCE/folder).rglob('*')):
            if p.is_file() and '__pycache__' not in p.parts:
                provenance[p.relative_to(SOURCE).as_posix()]=hashlib.sha256(p.read_bytes()).hexdigest()
    shared=dict(schema=1,run_id=os.environ['APPENDIXA_RUN_ID'],normalization='M/h; h=1/(16*pi^2); amplitude=h*(pole/epsilon+finite)',
        dimension='d=4-2*epsilon',precision='Through Q^2/M^2; full soft light-mass and momentum dependence',
        symbols={'mh':'M (heavy mass)','ml':'m_L (light mass)','mu':'MSbar scale','L':'log(mh^2/mu^2)',
                 'lam0':'lambda_0','lam1':'lambda_1','lam2':'lambda_2','c4':'C_4,G^(0)','cd':'C_D,G^(0)','c6':'C_6,G^(0)',
                 's':'(p1+p2)^2','t':'(p1+p3)^2','u':'(p1+p4)^2','DiscB':'Package-X X`DiscB, with its +i0 convention'},
        expression_syntax='Amplitude and residual fields are Wolfram Language symbolic expressions',
        input_sha256=provenance,integrated_sha256=verdict['integrated_sha256'])
    output={}
    for name,key in [('uvsoft','UVSoft'),('uvhard','UVHard'),('eft_one_loop','EFTEFT')]:
        output[name]=dict(shared,**summary['totals'][key])
        output[name]['wolfram_expressions']={p:wolfram_expr(output[name][p]) for p in ['pole','finite']}
    residuals=verdict['residuals']
    output['soft_equality']=dict(shared,status='PASS',pole_residual=residuals['pole'],finite_residual=residuals['finite'],
        tree_matching={'c4':'lam0-3*lam1**2','cd':'4*lam1**2','c6':'45*lam1**2*lam2'},
        tree_two_point='Z_G^(0)=1, (m_G^2)^(0)=ml^2, C_Box,G^(0)=0',
        wolfram_expressions={p+'_residual':wolfram_expr(residuals[p]) for p in ['pole','finite']})
    target=BASE/'published';target.mkdir()
    for name,data in output.items():
        (target/(name+'.wl')).write_text('(* Generated symbolic result; load with Get. *)\n'+wl(data)+'\n')
    reference=dest/'export-reference.json'
    reference.write_text(json.dumps(output,indent=2)+'\n')
    result=subprocess.run([os.environ['WOLFRAMSCRIPT'],'-file',str(SOURCE/'src/validate_exports.wls'),str(target),str(reference)],capture_output=True,text=True)
    (BASE/'logs/validate-exports.log').write_text(result.stdout+result.stderr)
    assert result.returncode==0,result.stdout+result.stderr
    print('EXPORT_PASS: four Wolfram files, validated against internal references with Mathematica Get and soft residuals')

if __name__=='__main__':main()
