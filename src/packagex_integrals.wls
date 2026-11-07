Get[FileNameJoin[{Environment["APPENDIXA_RUNTIME"],"vendor","PackageX","X","Kernel","init.m"}]];
args=Rest[$ScriptCommandLine];
requests=Import[args[[1]],"RawJSON"];
results=Table[
  kind=req["kind"]; r=req["r"]; u=req["u"];
  props=If[kind=="hard",
    Join[If[req["a"]>0,{{q,mh,req["a"]}},{}],If[req["b"]>0,{{q,0,req["b"]}},{}]],
    Join[If[req["a"]>0,{{q,ml,req["a"]}},{}],If[req["b"]>0,{{q+P,ml,req["b"]}},{}]]];
  numerator=LDot[q,q]^r LDot[q,P]^u;
  value=Check[LoopRefine[Apply[LoopIntegrate,Join[{numerator,q},props]],Analytic->True]/.LDot[P,P]->PP,$Failed];
  If[value===$Failed || !FreeQ[value,LoopIntegrate|LoopRefine|Indeterminate|ComplexInfinity],
     Print["PACKAGE_X_FAILURE ",req];Exit[1]];
  Print["PACKAGE_X_DONE ",req["key"]];
  <|"key"->req["key"],"result"->ToString[value,InputForm]|>,
  {req,requests}];
Export[args[[2]],results,"RawJSON"];
