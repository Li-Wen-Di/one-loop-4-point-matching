args=Rest[$ScriptCommandLine]; dir=First[args];
reference=Import[args[[2]],"RawJSON"];
names={"uvsoft","uvhard","eft_one_loop","soft_equality"};
Do[
  data=Check[Get[FileNameJoin[{dir,name<>".wl"}]],$Failed];
  json=reference[name];
  If[!AssociationQ[data],Print["Invalid Wolfram output: ",name];Exit[1]];
  keys=If[name=="soft_equality",{"pole_residual","finite_residual"},{"pole","finite"}];
  Do[If[!TrueQ[FullSimplify[data[key]-ToExpression[json["wolfram_expressions"][key],InputForm]]==0],
    Print["Internal reference/Wolfram mismatch: ",name," ",key];Exit[1]],{key,keys}];
  If[data["run_id"] =!= json["run_id"],Exit[1]],
  {name,names}];
uv=Get[FileNameJoin[{dir,"uvsoft.wl"}]];
eft=Get[FileNameJoin[{dir,"eft_one_loop.wl"}]];
Do[If[!TrueQ[FullSimplify[uv[key]-(eft[key]/.{c4->lam0-3 lam1^2,cd->4 lam1^2,c6->45 lam1^2 lam2})]==0],
  Print["Exported soft equality failed: ",key];Exit[1]],{key,{"pole","finite"}}];
Print["Wolfram Get / internal reference equivalence and exported soft equality PASS"];
