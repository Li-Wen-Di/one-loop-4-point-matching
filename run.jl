include(joinpath(@__DIR__, "src", "launcher.jl"))
try
    execute("run" == "check_environment" ? "check" : "run", ARGS)
catch e
    println(stderr, "ERROR: ", sprint(showerror,e))
    exit(1)
end
