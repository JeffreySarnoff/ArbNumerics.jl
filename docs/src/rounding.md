## Round To An Integral Value

```julia
julia> round(ArbFloat(2.5), RoundNearest), round(ArbFloat(3.5, RoundNearest)
2.0, 2.0

julia> round(ArbReal(4.5), RoundNearest), round(ArbReal(5.4, RoundNearest)
4.0, 4.0

julia> round(ArbFloat(pi), RoundDown), round(ArbFloat(pi), RoundUp)
3.0, 4.0

julia> round(ArbReal(pi), RoundToZero), round(ArbFloat(pi), RoundFromZero)
3.0, 4.0
```

## Round to a given number of bits
```

```

## Round to a given number±1 of digits
```

```
