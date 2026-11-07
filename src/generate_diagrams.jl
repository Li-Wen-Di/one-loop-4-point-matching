ENV["QGRAF"] = joinpath(ENV["APPENDIXA_RUNTIME"], "qgraf-feamgen")
@assert haskey(ENV, "FORM")
using FeAmGen
const base = ENV["APPENDIXA_RUNTIME"]
json(x::Nothing) = "null"
json(x::Bool) = x ? "true" : "false"
json(x::Number) = string(x)
json(x::AbstractString) = "\"" * replace(x,"\\"=>"\\\\", "\""=>"\\\"", "\n"=>"\\n", "\r"=>"\\r", "\t"=>"\\t") * "\""
json(x::AbstractVector) = "[" * join(json.(x), ",") * "]"
json(x::AbstractDict) = "{" * join([json(string(k))*":"*json(v) for (k,v) in x], ",") * "}"
for name in ["TwoScalarUV_UFO", "ScalarGreenEFT_UFO"]
    outdir = joinpath(base,"results",name)
    mkpath(outdir)
    card=Dict{Any,Any}("model_name"=>name,"unitary_gauge"=>false,"DropTadpole"=>false,
      "DropWFcorrection"=>false,"n_loop"=>1,"QCDCT_order"=>0,"Amp_QCD_order"=>0,
      "Amp_QED_order"=>4,"Amp_SPC_order"=>0,"Amp_Min_Ep_Xpt"=>-1,"Amp_Max_Ep_Xpt"=>0,
      "incoming"=>["phi","phi"],"outgoing"=>["phi","phi"],"couplingfactor"=>"1",
      "momentum_symmetry"=>[],"color_symmetry"=>[])
    FeAmGen.YAML.write_file(joinpath(outdir,"process.yaml"),card)
    model=FeAmGen.readin_model(card;model_paths=[joinpath(base,"models")])
    FeAmGen.generate_QGRAF_model(model;dir=outdir)
    FeAmGen.logging_model(model;dir=outdir)
    # Only diagram generation: the standard amplitude stage imposes on-shell relations.
    FeAmGen.generate_Feynman_diagram(model,card;dir=outdir)
    raw=FeAmGen.YAML.load_file(joinpath(outdir,"qgraf_out.dat"))
    write(joinpath(outdir,"diagrams.json"),json(raw))
    ds=raw["FeynmanDiagrams"]
    println("RAW_DIAGRAM_COUNT ", name, " ", length(ds))
end
