using Documenter, ArbNumerics

makedocs(
    modules = [ArbNumerics],
    sitename = "ArbNumerics",
    pages  = Any[
        "Overview"                 => "index.md",
        "Setting Values"           => "settingvalues.md",
        "Math Functions"           => "mathfunctions.md",
        "Interval Functions"       => "intervalfunctions.md",
        "LibArb Differences"       => "libarb_differences.md",
        "References"               => "references.md",
        "Index"                    => "documentindex.md"
        ]
    )

deploydocs(
    repo = "github.com/JeffreySarnoff/ArbNumerics.jl.git",
    target = "build"
)
