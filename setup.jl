include(joinpath(@__DIR__, "src", "launcher.jl"))
try
    execute("setup" == "check_environment" ? "check" : "setup", ARGS)
catch e
    println(stderr, "ERROR: ", sprint(showerror,e))
    exit(1)
end
