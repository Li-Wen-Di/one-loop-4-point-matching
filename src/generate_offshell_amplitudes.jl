"""Project-local scalar off-shell adapter. Never calls generate_kin_relation.

Uses FeAmGen's actual UFO graph conversion and amplitude assembly. Keeps the
QGRAF routing and every internal propagator (including heavy tree bridges).
No installed package or saved QGRAF input is modified.
"""
ENV["QGRAF"] = joinpath(ENV["APPENDIXA_RUNTIME"], "qgraf-feamgen")
@assert haskey(ENV, "FORM")
using FeAmGen
using SHA
const FG = FeAmGen
const base = ENV["APPENDIXA_RUNTIME"]
json(x::Nothing) = "null"
json(x::Bool) = x ? "true" : "false"
json(x::Number) = string(x)
json(x::AbstractString) = "\"" * replace(x,"\\"=>"\\\\", "\""=>"\\\"", "\n"=>"\\n", "\r"=>"\\r", "\t"=>"\\t") * "\""
json(x::AbstractVector) = "[" * join(json.(x), ",") * "]"
json(x::AbstractDict) = "{" * join([json(string(k))*":"*json(v) for (k,v) in sort(collect(x);by=p->string(first(p)))], ",") * "}"
digest(path) = bytes2hex(sha256(read(path)))

function bridge_indices(d)
    nodes = [v["vertex_index"] for v in d["vertices"]]
    props = d["remnant_propagators"]
    result = Int[]
    for cut in eachindex(props)
        seen = Set([first(nodes)])
        while true
            old = length(seen)
            for (i,p) in enumerate(props)
                i == cut && continue
                a,b = p["birth_index"],p["death_index"]
                a in seen && push!(seen,b)
                b in seen && push!(seen,a)
            end
            length(seen) == old && break
        end
        length(seen) < length(nodes) && push!(result,cut)
    end
    result
end

function export_model(name)
    inputdir = joinpath(base,"results",name)
    card = FG.YAML.load_file(joinpath(inputdir,"process.yaml"))
    @assert card["n_loop"] == 1 && card["QCDCT_order"] == 0
    @assert !card["DropTadpole"] && !card["DropWFcorrection"]
    @assert isempty(card["momentum_symmetry"]) && isempty(card["color_symmetry"])
    @assert card["couplingfactor"] == "1"
    source = joinpath(inputdir,"qgraf_out.dat")
    source_sha = digest(source)
    model = FG.readin_model(card;model_paths=[joinpath(base,"models")])
    raw = FG.YAML.load_file(source)["FeynmanDiagrams"]
    retained,excluded = Any[],Any[]
    for d in raw
        bridges = bridge_indices(d)
        light = filter(i->d["remnant_propagators"][i]["field"]=="phi",bridges)
        if !isempty(light)
            push!(excluded,Dict("diagram_id"=>d["diagram_index"],
                "reason"=>"light-particle bridge (not 1LPI)",
                "light_bridge_propagator_ids"=>[d["remnant_propagators"][i]["propagator_index"] for i in light]))
            continue
        end
        g = FG.convert_qgraf_TO_Graph(d,model)
        @assert !isnothing(g) "FeAmGen dropped a retained graph"
        @assert all(e.property[:particle].spin == :scalar && e.property[:particle].color == :singlet for e in g.edge_list)
        colors,lorentz = FG.assemble_amplitude(g)
        @assert length(colors) == length(lorentz) && all(==(1),colors)
        assembled = sum(colors .* lorentz)
        den_product = FG.Basic(1)
        props = Any[]
        for e in g.edge_list
            p = e.property
            p[:style] == "External" && continue
            @assert p[:particle].width == 0
            den = FG.Basic("Den($(p[:momentum]),$(p[:particle].mass),0)")
            den_product *= den
            push!(props,Dict("propagator_id"=>p[:propagator_index],
                "momentum"=>string(p[:momentum]),"mass"=>string(p[:particle].mass),
                "field"=>p[:particle].name,"feamgen_style"=>p[:style]))
        end
        weight = FG.Basic(string(d["symmetry_factor"])) * FG.Basic(d["sign"])
        numerator = FG.expand(weight * assembled / den_product)
        @assert !occursin("Den(",string(numerator)) "Unfactored denominator"
        push!(retained,Dict("diagram_id"=>d["diagram_index"],
            "sign"=>d["sign"],"symmetry_factor"=>string(d["symmetry_factor"]),
            "heavy_bridge_propagator_ids"=>[d["remnant_propagators"][i]["propagator_index"] for i in bridges],
            "raw_feamgen_amplitude"=>string(assembled),
            "weighted_numerator_ufo"=>string(numerator),"propagators"=>props))
    end
    @assert digest(source) == source_sha
    files = filter(f->endswith(f,".py"),readdir(joinpath(base,"models",name);join=true))
    Dict("model"=>name,"raw_count"=>length(raw),"retained_count"=>length(retained),
        "excluded"=>excluded,"diagrams"=>retained,
        "couplings"=>Dict(string(k)=>string(v) for (k,v) in model.coupling_dict),
        "provenance"=>Dict("qgraf_sha256"=>source_sha,
            "card_sha256"=>digest(joinpath(inputdir,"process.yaml")),
            "ufo_sha256"=>Dict(basename(f)=>digest(f) for f in files)))
end

mkpath(joinpath(base,"results","offshell-amplitudes"))
# Invalidate downstream PASS records before producing a fresh generation.
for file in ["validation.json","soft-validation.json"]
    rm(joinpath(base,"results","offshell-amplitudes",file);force=true)
end
output = Dict("schema"=>1,"feamgen_version"=>string(pkgversion(FG)),
    "scope"=>"Project scalar singlet UFO models, connected one-loop four-point 1LPI amplitudes; no counterterms or integration",
    "convention"=>"iM = integral d^d q/(2pi)^d of weighted numerator times product 1/(r^2-m^2+i0); common dimensional scale factors external",
    "momentum_conservation"=>"K4=K1+K2-K3; p=(K1,K2,-K3,-K4)",
    "feamgen_source_sha256"=>Dict(f=>digest(joinpath(dirname(pathof(FG)),f)) for f in ["FeynmanDiagram.jl","Kin.jl","Universe.jl"]),
    "kinematic_relations"=>String[],
    "models"=>[export_model(n) for n in ["TwoScalarUV_UFO","ScalarGreenEFT_UFO"]])
write(joinpath(base,"results","offshell-amplitudes","feamgen-assembled.json"),json(output)*"\n")
for m in output["models"]
    println(m["model"],": ",m["retained_count"]," retained / ",m["raw_count"]," raw")
end
