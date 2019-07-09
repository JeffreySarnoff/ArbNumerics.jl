## Set a Floating Point value

To set a floating point value with 100 bits of precision
```julia
julia> two = ArbFloat(2, bits=100)
2.0
julia> sqrt2 = sqrt(two)
1.41421356237309504880168872421
```

To set a floating point value with a precision of 30 digits
```julia
julia> two = ArbFloat(2, digits=30)
2.0
julia> sqrt2 = sqrt(two)
1.41421356237309504880168872421
```

## Set a Real enclosure

To set a real valued interval with 100 bits of precision
```julia
two = ArbReal(2, bits=100)
sqrt2 = sqrt(two)           # precision(sqrt2, base=2) == 100
```

To set a real valued interval with a precision of 30 digits
```julia
two = ArbReal(2, digits=30)
sqrt2 = sqrt(two)            # precision(sqrt2, base=10) == 30
```

## Set a Complex value

To set a complex value with 100 bits of precision
```julia
ArbComplex(1.0, 0.5, bits=100)
# or
re = ArbFloat(1.0, bits=100)
im = ArbFloat(0.5, bits=100)
ArbComplex(re, im)
# or
re = ArbReal(1.0, bits=100)
im = ArbReal(0.5, bits=100)
ArbComplex(re, im)
```

To set a complex value with a precision of 30 digits
```julia
ArbComplex(1.0, 0.5, digits=30)
# or
re = ArbFloat(1.0, digits=30)
im = ArbFloat(0.5, digits=30)
ArbComplex(re, im)
# or
re = ArbReal(1.0, digits=30)
im = ArbReal(0.5, digits=30)
ArbComplex(re, im)
```

