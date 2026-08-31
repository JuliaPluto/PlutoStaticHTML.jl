include("preliminaries.jl")

@testset "pdf" begin
    include("pdf.jl")
end

@testset "context" begin
    include("context.jl")
end

@testset "cache" begin
    include("cache.jl")
end

@testset "mimeoverride" begin
    include("mimeoverride.jl")
end

@testset "with_terminal" begin
    include("with_terminal.jl")
end

@testset "html" begin
    include("html.jl")
end

@testset "style" begin
    include("style.jl")
end

@testset "build" begin
    include("build.jl")
end

@testset "aqua" begin
    Aqua.test_all(PlutoStaticHTML; ambiguities = false)
end

@testset "explicitimports" begin

    ignore = (
        # Pluto
        :Cell,
        :Notebook,
        :Operations,
        :PlutoRunner,
        :ServerSession,
        :SessionActions,
        :update_save_run!,
        
        # SessionActions
        :open,
        :shutdown,
    
        # PlutoRunner
        :PRETTY_STACKTRACES,
        :is_mime_enabled,
    )
    
    @static if VERSION >= v"1.11.0"
        @test ExplicitImports.check_all_explicit_imports_are_public(PlutoStaticHTML; from = (Pluto,), ignore) === nothing
        @test ExplicitImports.check_all_qualified_accesses_are_public(PlutoStaticHTML; from = (Pluto,),  ignore) === nothing
    end
    
    @test ExplicitImports.check_no_implicit_imports(PlutoStaticHTML) === nothing
    @test ExplicitImports.check_all_explicit_imports_via_owners(PlutoStaticHTML) === nothing
    @test ExplicitImports.check_no_stale_explicit_imports(PlutoStaticHTML, ignore=(:parse,)) === nothing
    @test ExplicitImports.check_all_qualified_accesses_via_owners(PlutoStaticHTML) === nothing
    @test ExplicitImports.check_no_self_qualified_accesses(PlutoStaticHTML) === nothing
end

@testset "undocumentednames" begin
    if isdefined(Docs, :undocumented_names) # >=1.11
        @test isempty(Docs.undocumented_names(PlutoStaticHTML))
    end
end


nothing
