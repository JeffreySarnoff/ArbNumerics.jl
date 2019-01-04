## Setting Values

To set a floating point value with 100 bits of precision
```julia
julia> two = ArbFloat(2, bits=100)
2.0
julia> sqrt2 = sqrt(two)
1.41421356237309504880168872421
```

To set a floating point value with at least 30 digits precision
```julia
julia> two = ArbFloat(2, digits=30)
2.0
julia> sqrt2 = sqrt(two)
1.41421356237309504880168872421
```

To set a real valued interval with 100 bits of precision
```julia
two = ArbReal(2, bits=100)
sqrt2 = sqrt(two)
```

To set a real valued interval with at least 30 digits precision
```julia
two = ArbReal(2, digits=30)
sqrt2 = sqrt(two)
```
