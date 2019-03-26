
## working precision

`ArbNumerics` values have an intrinsic precision, which is the number of bits
that are evaluated in computation.  Values that are determined by calculation
may be displayed at this, their full precision.  If this is the behavior you
prefer, start using the package this way:

```julia
using ArbNumerics
setextrabits(0)
```

## enclosed precision

The alternative is to use some of the least significant bits as a "cushion"
that protects against showing greater precision than is warranted by the
accuracy that is assured.  This is particularly important when showing values
that are point estimates of an interval that encloses the mathematical result.
If you prefer to be shown quantities as point values that best reflect the
accuracy available at the end of a computation by letting go of uncertain
trailing bits, start using the package this way:

```julia
using ArbNumerics
setextrabits(32)
```

## rounded precision

If you do specify the number of `extrabits` to use, then the working precision
will exceed the displayed precision by a fixed number of bits (24, the default).

`setextrabits` should be used __only__ at the start of work.
Reliabile computations presume you __not__ alter it midstream.


## precision modality

The number of displayed bits is given by any of:   
`precision(ArbFloat), precision(ArbReal), precision(ArbComplex)`    
All of these are kept in sync.

The number of working bits is given by any of:
`workingprecision(ArbFloat), workingprecision(ArbReal), workingprecision(ArbComplex)`    
All of these are kept in sync.

The number of `extrabits` is given by `extrabits()`.
