file=FileNameJoin[{Environment["APPENDIXA_RUNTIME"],"vendor","PackageX","X","Kernel","init.m"}];
Get[file];
v=Check[LoopRefine[LoopIntegrate[1,q,{q,mh,1}],Analytic->True],$Failed];
If[v===$Failed || !FreeQ[v,LoopIntegrate|LoopRefine],Print["Package-X interface failure"];Exit[1]];
Print["Mathematica ",$Version];
Print["Bundled Package-X: ",file];
Print["Package-X interface PASS"];
