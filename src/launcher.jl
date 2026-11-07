using TOML, Dates, SHA, Pkg
const ROOT = normpath(joinpath(@__DIR__, ".."))

function read_config(args)
    if !(isempty(args) || (length(args)==2 && args[1]=="--config"))
        error("Usage: julia --project=. <entry>.jl [--config config.toml]")
    end
    path = isempty(args) ? joinpath(ROOT,"config.toml") : abspath(args[2])
    !isempty(args) && !isfile(path) && error("Configuration file does not exist: $path")
    isfile(path) ? TOML.parsefile(path) : Dict{String,Any}()
end

function executables(config)
    out = Dict{String,String}()
    entries = get(config,"executables",Dict())
    for (key,env,name) in [("form","FORM","form"),("qgraf","QGRAF","qgraf"),
            ("wolframscript","WOLFRAMSCRIPT","wolframscript"),("python","APPENDIXA_PYTHON","python3")]
        explicit = get(entries,key,"")
        value = isempty(explicit) ? get(ENV,env,name) : explicit
        path = isabspath(value) ? value : Sys.which(value)
        isnothing(path) && error("Cannot locate $key: $value. Set executables.$key in config.toml.")
        isfile(path) && (filemode(path)&0o111 != 0) || error("Not an executable file for $key: $path")
        out[key] = abspath(path)
    end
    out
end

function configure_artifacts(programs)
    # Local precedence prevents personal artifact overrides from changing this run.
    depot=joinpath(ROOT,"work","julia-depot")
    artifactdir=joinpath(depot,"artifacts");mkpath(artifactdir)
    overrides=Dict("ad6fea1375348ca4e3bad6f69fc88169fd8570e3"=>dirname(realpath(programs["qgraf"])),
        "fd52b7e8a49d815772456cac19a90303c9ec0517"=>joinpath(ROOT,"vendor","FeAmGen","resources"))
    open(joinpath(artifactdir,"Overrides.toml"),"w") do io; TOML.print(io,overrides); end
    filter!(p->abspath(p)!=abspath(depot),DEPOT_PATH)
    pushfirst!(DEPOT_PATH,depot)
    ENV["JULIA_DEPOT_PATH"]=join(DEPOT_PATH,":")
    Pkg.Artifacts.load_overrides(;force=true)
end

function check_integrity()
    hashes=TOML.parsefile(joinpath(ROOT,"src","source_hashes.toml"))["files"]
    for (path,wanted) in hashes
        file=joinpath(ROOT,path)
        isfile(file) && bytes2hex(sha256(read(file)))==wanted || error("Bundled file missing or modified: $path")
    end
end

function stage_runtime()
    # ASCII staging avoids FORM include-parser and upstream shell path limitations.
    base=mktempdir("/tmp";prefix="appendixa-",cleanup=false)
    mkdir(joinpath(base,"models")); mkdir(joinpath(base,"results")); mkdir(joinpath(base,"logs"))
    for (from,to) in [("UV_UFO","TwoScalarUV_UFO"),("EFT_UFO","ScalarGreenEFT_UFO")]
        cp(joinpath(ROOT,"models",from),joinpath(base,"models",to))
    end
    cp(joinpath(ROOT,"src","qgraf-feamgen"),joinpath(base,"qgraf-feamgen"))
    chmod(joinpath(base,"qgraf-feamgen"),0o755)
    symlink(joinpath(ROOT,"vendor"),joinpath(base,"vendor"))
    base
end

function runtime_env(programs,base)
    merge(copy(ENV),Dict("APPENDIXA_ROOT"=>ROOT,"APPENDIXA_RUNTIME"=>base,
        "APPENDIXA_QGRAF"=>programs["qgraf"],"FORM"=>programs["form"],
        "WOLFRAMSCRIPT"=>programs["wolframscript"],"PYTHONDONTWRITEBYTECODE"=>"1"))
end

function invoke(command,env,log)
    mkpath(dirname(log))
    println("Running ",basename(log)); flush(stdout)
    open(log,"w") do io
        process=run(pipeline(setenv(command,env),stdout=io,stderr=io);wait=false)
        wait(process)
        if !success(process)
            diagnostic=read(log,String)
            println(stderr,last(diagnostic,min(length(diagnostic),4000)))
            error("External stage failed: $(basename(log)). Diagnostics are preserved under work/.")
        end
    end
end

function probe(programs,base,reportdir)
    env=runtime_env(programs,base)
    invoke(`$(programs["python"]) $(joinpath(ROOT,"src","probe_python.py"))`,env,joinpath(reportdir,"python.log"))
    invoke(`$(Base.julia_cmd()) --startup-file=no --project=$ROOT $(joinpath(ROOT,"src","probe_interfaces.jl")) $(programs["python"])`,env,joinpath(reportdir,"interfaces.log"))
    report=Dict("status"=>"PASS","time_utc"=>string(now(UTC)),"platform"=>string(Sys.KERNEL,"/",Sys.ARCH),"julia"=>string(VERSION),"executables"=>programs)
    open(joinpath(reportdir,"environment.toml"),"w") do io; TOML.print(io,report); end
    println("Environment check PASS; report: ",reportdir)
end

function setup(config)
    programs=executables(config)
    configure_artifacts(programs)
    Pkg.activate(ROOT)
    regs=Pkg.Registry.reachable_registries()
    !any(r->r.name=="General",regs) && Pkg.Registry.add("General")
    !any(r->r.name=="IHEP-Multiloop",regs) && Pkg.Registry.add(Pkg.RegistrySpec(url="https://code.ihep.ac.cn/IHEP-Multiloop/JuliaRegistry.git"))
    ENV["PYTHON"]=programs["python"]
    # Resolve the supplied lock against Project.toml, without a package update.
    Pkg.resolve()
    Pkg.instantiate(;allow_autoprecomp=false)
    Pkg.build("PyCall")
    println("Initialization complete. Run check_environment.jl next.")
end

function execute(mode,args)
    mode=="setup" && return setup(read_config(args))
    stamp=Dates.format(now(UTC),"yyyymmddTHHMMSS")*"-"*string(getpid())
    reportdir=joinpath(ROOT,"work",mode*"-"*stamp); mkpath(reportdir)
    println("Run reports: ",reportdir)
    base=nothing
    lock=joinpath(ROOT,"work","run.lock")
    locked=false
    try
        if mode=="run"
            isdir(lock) && error("Another run owns work/run.lock. Remove it only after confirming that run has stopped.")
            mkdir(lock); locked=true
            open(joinpath(lock,"owner.toml"),"w") do io; TOML.print(io,Dict("pid"=>getpid(),"run_id"=>stamp)); end
            if isdir(joinpath(ROOT,"results"))
                mv(joinpath(ROOT,"results"),joinpath(reportdir,"previous-results"))
            end
            mkdir(joinpath(ROOT,"results"))
        end
        programs=executables(read_config(args))
        configure_artifacts(programs)
        check_integrity()
        base=stage_runtime()
        env=runtime_env(programs,base)
        probe(programs,base,reportdir)
        if mode=="run"
            for file in ["generate_diagrams.jl","generate_offshell_amplitudes.jl"]
                invoke(`$(Base.julia_cmd()) --startup-file=no --project=$ROOT $(joinpath(ROOT,"src",file))`,env,joinpath(base,"logs",file*".log"))
            end
            for file in ["classify.py","contract_offshell_amplitudes.py","check_offshell_adapter.py","run_regions.py","integrate_regions.py","summarize_appendix_a.py"]
                invoke(`$(programs["python"]) $(joinpath(ROOT,"src",file))`,env,joinpath(base,"logs",file*".log"))
            end
            env["APPENDIXA_RUN_ID"]=stamp
            invoke(`$(programs["python"]) $(joinpath(ROOT,"src","export_results.py"))`,env,joinpath(base,"logs","export.log"))
            # Export validation is complete before the new set is published.
            rm(joinpath(ROOT,"results")); mv(joinpath(base,"published"),joinpath(ROOT,"results"))
        end
        open(joinpath(reportdir,"status.toml"),"w") do io; TOML.print(io,Dict("status"=>"PASS","run_id"=>stamp,"mode"=>mode)); end
        println(uppercase(mode)," PASS")
    catch e
        open(joinpath(reportdir,"status.toml"),"w") do io; TOML.print(io,Dict("status"=>"FAIL","run_id"=>stamp,"error"=>sprint(showerror,e))); end
        rethrow()
    finally
        # Preserve diagnostics, but never duplicate third-party trees or cached model bytecode.
        if !isnothing(base)
            rm(joinpath(base,"vendor");force=true)
            cp(base,joinpath(reportdir,"runtime")); rm(base;recursive=true)
        end
        locked && rm(lock;recursive=true)
    end
end
