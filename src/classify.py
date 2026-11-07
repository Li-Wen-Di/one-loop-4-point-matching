from pathlib import Path
import json,itertools,collections
from fractions import Fraction
from runtime_paths import BASE as base
def graph(d):
 ext=collections.Counter(p['vertex_index'] for k in ['incoming_propagators','outgoing_propagators'] for p in d[k])
 edges=[(p['birth_index'],p['death_index'],p['field']) for p in (d['remnant_propagators'] or [])]
 nodes=sorted(v['vertex_index'] for v in d['vertices'])
 return nodes,edges,ext
def connected(nodes,edges):
 seen={nodes[0]}
 while True:
  more=seen|{v for a,b,*_ in edges for v,w in [(a,b),(b,a)] if w in seen}
  if more==seen:return len(seen)==len(nodes)
  seen=more
def bridges(nodes,edges):return [i for i in range(len(edges)) if not connected(nodes,edges[:i]+edges[i+1:])]
def canonical(nodes,edges,ext,colored=True):
 keys=[]
 for perm in itertools.permutations(nodes):
  ren={v:i for i,v in enumerate(perm)}
  keys.append((tuple(ext[v] for v in perm),tuple(sorted((min(ren[a],ren[b]),max(ren[a],ren[b]),c if colored else '') for a,b,c in edges))))
 return min(keys)
def contract(nodes,edges,ext,indices):
 parent={v:v for v in nodes}
 def get(a):
  while parent[a]!=a:a=parent[a]
  return a
 for i in indices:
  a,b,_=edges[i];parent[get(a)]=get(b)
 rem=[(get(a),get(b),c) for i,(a,b,c) in enumerate(edges) if i not in indices]
 ns=sorted(set(get(v) for v in nodes));ex=collections.Counter()
 for v in nodes:ex[get(v)]+=ext[v]
 return ns,rem,ex
def main():
    allres={}
    for model in ['TwoScalarUV_UFO','ScalarGreenEFT_UFO']:
     ds=json.loads((base/'results'/model/'diagrams.json').read_text())['FeynmanDiagrams']; groups={};excluded=[]
     for d in ds:
      nodes,edges,ext=graph(d);br=bridges(nodes,edges)
      if any(edges[i][2]=='phi' for i in br):excluded.append(d['diagram_index']);continue
      key=canonical(nodes,edges,ext)
      groups.setdefault(key,[]).append(d)
     ordered=sorted(groups.items(),key=lambda kv:(len(kv[0][0]),kv[0]))
     results=[]
     for n,(key,members) in enumerate(ordered,1):
      d=members[0];ns,ed,ex=graph(d);br=bridges(ns,ed);cycle=[i for i in range(len(ed)) if i not in br]
      cs=''.join(sorted('H' if ed[i][2]=='hh' else 'L' for i in cycle))
      hard=any(ed[i][2]=='hh' for i in cycle)
      heavy=[i for i,e in enumerate(ed) if e[2]=='hh']
      sg=contract(ns,ed,ex,heavy)
      soft=any(ed[i][2]=='phi' for i in cycle)
      skey=canonical(*sg) if soft else None
      r=dict(id=('UV' if 'UV' in model else 'EFT')+str(n),representative=d,diagram_ids=[a['diagram_index'] for a in members],count=len(members),symmetry_sum=str(sum((Fraction(str(a['symmetry_factor'])) for a in members),Fraction())),geometric_key=canonical(ns,ed,ex,False),cycle=cs,heavy_bridges=sum(ed[i][2]=='hh' for i in br),hard_nonzero=hard,soft_nonzero=soft,soft_key=skey,soft_graph=sg)
      results.append(r)
     print(model,'raw',len(ds),'1LPI',sum(len(v) for v in groups.values()),'classes',len(groups),'geometric',len(set(str(r['geometric_key']) for r in results)),'excluded',len(excluded))
     for r in results:print(r['id'],r['count'],r['symmetry_sum'],r['cycle'],'Hbridges',r['heavy_bridges'],'soft',r['soft_nonzero'],'hard',r['hard_nonzero'],r['representative']['vertices'])
     allres[model]=dict(raw=len(ds),excluded_light_bridge=excluded,classes=results)
    (base/'results'/'classification.json').write_text(json.dumps(allres,indent=2))

if __name__ == "__main__":
    main()
