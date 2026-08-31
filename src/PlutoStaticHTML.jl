module PlutoStaticHTML

if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@max_methods"))
    @eval Base.Experimental.@max_methods 1
end

import Base: string
import Pluto: PlutoRunner

using Base64: base64encode
using Dates: Dates, DateTime, Millisecond, now
using Gumbo: Gumbo, HTMLElement, parsehtml
using LazyArtifacts: LazyArtifacts
using Pkg:
    Types.Context,
    Types.UUID

using Pluto: Cell,
    Configuration.CompilerOptions,
    Notebook,
    PkgCompat.dependencies,
    Pluto,
    PlutoRunner,
    ServerSession,
    SessionActions

using RelocatableFolders: @path
using SHA: sha256
using TOML: parse as parsetoml
using tectonic_jll: tectonic

const PKGDIR = @path string(pkgdir(PlutoStaticHTML))::String
const JULIAMONO_VERSION = "0.045"

include("module_doc.jl")
include("context.jl")
include("cache.jl")
include("mimeoverride.jl")
include("with_terminal.jl")
include("output.jl")
include("style.jl")
include("html.jl")
include("html2tex.jl")
include("pdf.jl")
include("build.jl")
include("documenter.jl")

export OutputOptions
export documenter_output, franklin_output, html_output, pdf_output
export BuildOptions, build_notebooks

include("precompile.jl")

end # module
