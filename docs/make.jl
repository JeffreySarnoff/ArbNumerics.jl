using Documenter # , ArbNumerics

makedocs(
    # modules = [ArbNumerics],
    sitename = "ArbNumerics",
    pages  = Any[
        "Overview"                 => "index.md",
        "The Types"                => "thetypes.md",
        "Setting Values"           => "settingvalues.md",
        "Seeing Values"            => "seeingvalues.md",
        "Precisions"               => "precisions.md",
        "Rounding"                 => "rounding.md",
        "Elementary Functions"     => "mathfunctions.md",
        "Elliptic Integrals"       => "ellipticintegrals.md",
        "Elliptic Functions"       => "ellipticfunctions.md",
        "Matrix Functions"         => "matrixfunctions.md",
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
