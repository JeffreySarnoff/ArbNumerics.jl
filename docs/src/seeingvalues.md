## Seeing Values

`show` works, `showall` shows the digits closer to `workingprecision`.
`string` and `stringall` correspond.

### @sprintf, @printf
```julia
using ArbNumerics, Printf

julia> @printf "%3.7f" ArbFloat(pi)^12
924269.1815234
julia> @sprintf "%3.12e" ArbReal(pi)^12
"9.242691815234e+05"
```
