include(joinpath(@__DIR__, "src", "launcher.jl"))
try
    execute("check_environment" == "check_environment" ? "check" : "check_environment", ARGS)
catch e
    println(stderr, "ERROR: ", sprint(showerror,e))
    exit(1)
end
