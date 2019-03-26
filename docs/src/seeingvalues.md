## show, showall, string, stringall
```julia
using ArbNumerics

julia> string(ArbFloat(pi)^12)
"924269.1815233741862225791703585"

julia> stringall(ArbFloat(pi)^12)
"924269.18152337418622257917035847560717530"

julia> setprecision(ArbReal, 168)
168

julia> show(ArbFloat(pi)^12)
924269.18152337418622257917035847560717292226894005

julia> showall(ArbFloat(pi)^12)
924269.181523374186222579170358475607172922268940049306206
```

## @sprintf, @printf
```julia
using ArbNumerics, Printf

julia> @printf "%3.7f" ArbFloat(pi)^12
924269.1815234
julia> @sprintf "%3.12e" ArbReal(pi)^12
"9.242691815234e+05"
```
