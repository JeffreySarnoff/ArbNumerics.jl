using Documenter, ArbNumerics

makedocs(
    modules = [ArbNumerics],
    sitename = "ArbNumerics",
    pages  = Any[
        "Overview"                 => "index.md",
        "References"               => "references.md",
        "Index"                    => "documentindex.md"
        ]
    )

deploydocs(
    repo = "github.com/JeffreySarnoff/ArbNumerics.jl.git",
    target = "build"
)
