ENV["QGRAF"]=joinpath(ENV["APPENDIXA_RUNTIME"],"qgraf-feamgen")
using FeAmGen
using SHA
const FG=FeAmGen
const base=ENV["APPENDIXA_RUNTIME"]
const root=ENV["APPENDIXA_ROOT"]
expected=realpath(joinpath(root,"vendor","FeAmGen","src","FeAmGen.jl"))
@assert realpath(pathof(FG))==expected "A global FeAmGen installation was loaded"
println("FeAmGen ",pkgversion(FG)," at ",pathof(FG))
@assert realpath(FG.art_dir())==realpath(joinpath(root,"vendor","FeAmGen","resources"))
println("Bundled FeAmGen resources: ",FG.art_dir())
selected=strip(read(`$(ARGS[1]) -c "import sys; print(sys.executable)"`,String))
actual=FG.PyCall.pyimport("sys").executable
println("PyCall Python: ",actual)
@assert abspath(actual)==abspath(selected) "PyCall uses another Python interpreter. Run setup.jl with the selected Python."
println("PyCall SymPy: ",FG.PyCall.pyimport("sympy").__version__)
probe=joinpath(base,"probe");mkpath(probe)
card=Dict{Any,Any}("model_name"=>"TwoScalarUV_UFO","unitary_gauge"=>false,"DropTadpole"=>false,
    "DropWFcorrection"=>false,"n_loop"=>1,"QCDCT_order"=>0,"Amp_QCD_order"=>0,"Amp_QED_order"=>4,
    "Amp_SPC_order"=>0,"Amp_Min_Ep_Xpt"=>-1,"Amp_Max_Ep_Xpt"=>0,"incoming"=>["phi","phi"],"outgoing"=>["phi","phi"],
    "couplingfactor"=>"1","momentum_symmetry"=>[],"color_symmetry"=>[])
model=FG.readin_model(card;model_paths=[joinpath(base,"models")])
FG.generate_QGRAF_model(model;dir=probe)
FG.generate_Feynman_diagram(model,card;dir=probe)
raw=FG.YAML.load_file(joinpath(probe,"qgraf_out.dat"))
@assert length(raw["FeynmanDiagrams"])==124 "Unexpected QGRAF output"
println(read(joinpath(probe,"appendixa-qgraf.stdout"),String))
println("QGRAF interface PASS (124 raw UV diagrams)")
form=joinpath(probe,"probe.frm")
write(form,"#: IncDir "*joinpath(base,"vendor","OPITeR","opiter")*"\n#include- opiter.frm\nOff Statistics;\nLocal probe=1;\nPrint;\n.end\n")
run(Cmd(`$(ENV["FORM"]) -q $form`;dir=probe))
println("FORM and bundled OPITeR interface PASS")
run(`$(ENV["FORM"]) -v`)
run(`$(ENV["WOLFRAMSCRIPT"]) -file $(joinpath(root,"src","probe_packagex.wls"))`)
println("Bundled interfaces PASS")
