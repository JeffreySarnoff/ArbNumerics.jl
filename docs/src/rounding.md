```@meta
DocTestSetup = :(using ArbNumerics)
```

# Rounding

## To an integral value

```jldoctest
julia> round(ArbFloat(2.5), RoundNearest), round(ArbFloat(3.5), RoundNearest)
(2.0, 4.0)

julia> round(ArbReal(4.5), RoundNearest), round(ArbReal(5.4), RoundNearest)
(4.0, 5.0)

julia> round(ArbFloat(pi), RoundDown), round(ArbFloat(pi), RoundUp)
(3.0, 4.0)

julia> round(ArbReal(pi), RoundToZero), round(ArbFloat(pi), RoundFromZero)
(3.0, 4.0)
```

## To a given number of bits
```

```

## To a given number±1 of digits
```

```
