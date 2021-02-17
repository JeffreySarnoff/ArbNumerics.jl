#
# ArbNumerics.jl


#### Copyright © 2015-2019 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

For multiprecision numerical computing using values with 25..2,500 digits. With arithmetic and higher level mathematics, this package offers you the best balance of performance and accuracy.

This package uses the [Arb C Library](http://arblib.org/index.html), and adapts some C library interface work from [Nemo](https://github.com/wbhart/Nemo.jl) (see [_below_](https://github.com/JeffreySarnoff/ArbNumerics.jl/blob/master/README.md#acknowledgements)).


-----

[![Travis Build Status](https://travis-ci.org/JeffreySarnoff/ArbNumerics.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/ArbNumerics.jl)&nbsp;&nbsp;&nbsp;[![Docs](https://img.shields.io/badge/docs-stable-blue.svg)](http://jeffreysarnoff.github.io/ArbNumerics.jl/stable/)&nbsp;&nbsp;&nbsp;[![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](http://jeffreysarnoff.github.io/ArbNumerics.jl/dev/)


----

## Introduction

ArbNumerics exports three types: `ArbFloat`, `ArbReal`, `ArbComplex`.  `ArbFloat` is an extended precision floating point type. Math using `ArbFloat` is expected to be very near the veridical value, and often is the closest value for the precision in use. `ArbReal` is an interval-valued quantity formed of an `ArbFloat` (the midpoint) and a `radius`.  Math functions with `ArbReal` are assured to enclose the veridical value.  This assurance extends to multiple function applications.  `ArbComplex` is an `ArbReal` pair (real, imaginary).  The same enclosure assurance applies.

While the bounds of an `ArbReal` or `ArbComplex` are available, the default is to show these values as digit sequences which almost assuredly are accurate, in a round to nearest sense, to the precision displayed.  Math with `ArbFloat` does not provide the assurance one gets using `ArbReal`, as an `ArbFloat` is a point value.  While some effort has been taken to provide you with more reliable results from math with `ArbFloat` values than would be the case using the underlying library itself, `ArbReal` or `ArbComplex` are suggested for work that is important to you.  `ArbFloat` is appropriate when exactness is not required during development, or with applications that are approximating something at increasing precisions.


## Installation

```julia
pkg> add Readables
pkg> add ArbNumerics
```

### Important

When updating ArbNumerics, do `pkg> gc` to prevent accruing a great deal of unused diskspace.

## StartUp

`using ArbNumerics`
or, if you installed Readables, 
`using ArbNumerics, Readables`

## Precision

If you want to work with bit-level precision, first do `setextrabits(0)`.

Otherwise, some extra bits are used to assist with printing values rounded to the last digit displayed.  You can find out how many extra bits are used with `extrabits()`.  If you want to change the number of extra bits used, call `setextrabits` with the desired number of extra bits.

You can set the internal working precision (which is the same as the displayed precision with `setextrabits(0)`) to a given number of bits or a given number of decimal digits:

`setworkingprecision(ArbFloat, bits=250)`, `setworkingprecision(ArbReal, digits=100)` 

The type can be any of `ArbFloat`, `ArbReal`, `ArbComplex`.  All types share the same precision so interconversion makes sense.

You can set the external displayed precision (which is the the same as the internal precision with `setextrabits(0)`) to a given
number of bits or a given number of decimal digits:

`setprecision(ArbFloat, bits=250)`, `setworkingprecision(ArbReal, digits=100)` 

The type can be any of `ArbFloat`, `ArbReal`, `ArbComplex`.  All types share the same precision so interconversion makes sense.


## Using ArbFloat 

Reading the sections that follow gives you a good platform from which to develop.

- consider `using ArbNumerics, Readables`
```julia
julia> ArbFloat(pi, digits=30, base=10)
3.14159265358979323846264338328

julia> readable(ans)
3.14159_26535_89793_23846_26433_8328
```

[information about using Readables](https://github.com/JeffreySarnoff/Readables.jl/blob/master/README.md)

## Constructors

Initially, the default precision is set to 106 bits.  All ArbNumeric types use the same default precision. You can change this to e.g. 750 bits: `setprecision(ArbFloat, 750)` or `setprecision(ArbReal, 750)` or `setprecision(ArbComplex, 750)`. Change one default the others follow automatically.  This is done to preserve internal consistency.  Sometimes more than one type is used within a function.  The minimal precision allowed is 24 bits. There is no maximum. The underlying C library calculates more rapidly than BigFloat at any precision.

The precision in use may be set globally, as with BigFloats, or it may be given with the constructor.  For most purposes, you should work with a type at one, two, or three precisions.  It is helps clarity to convert precisions explicitly, however, it is not necessary.

#### Constructors using the default precision
```julia
julia> a = ArbFloat(3)
3.0000000000000000000000000000000

julia> b = ArbReal(pi)
3.1415926535897932384626433832795

julia> c = one(ArbComplex)
1.0000000000000000000000000000000 + 0im
```

#### Constructors using a specified precision
```julia
julia> BITS = 53;

julia> a = sqrt(ArbFloat(2, BITS))
1.414213562373095

julia> b = ArbReal(pi, BITS)
3.141592653589793

julia> c = ArbComplex(a, b, BITS)
1.414213562373095 + 3.141592653589793im
```
```julia
julia> DIGITS = 78;

julia> ArbFloat(pi, bits4digits(DIGITS))
3.14159265358979323846264338327950288419716939937510582097494459230781640628621

julia> DIGITS == length(string(ans)) - 1 # (-1 for the decimal point)
true
```
### changing precision

```julia
julia> a = ArbFloat(2, 25)
2.000000
julia> a = ArbFloat(a, 50)
2.00000000000000

julia> precision = 25
julia> a = ArbFloat(2, precision)
2.000000
julia> precision = 50
julia> a = ArbFloat(a, precision)
2.00000000000000
```
### interconversion

```julia
julia> a = sqrt(ArbFloat(2))
1.414213562373095048801688724210

julia> b = ArbReal(a)
1.414213562373095048801688724210

julia> c = ArbComplex(a, b)
1.414213562373095048801688724210 + 1.414213562373095048801688724210im

julia> Float64(a)
1.4142135623730951

julia> Float32(b)
1.4142135f0

julia> Float16(c)
Float16(1.414)
```

----

Consider using ArbReals instead of ArbFloats if you want your results to be rock solid. That way you can examine the enclosures for your results with `radius(value)` or `bounds(value)`.  This is strongly suggested when working with precisions that you are increasing dynamically.

----

### Math

#### arithmetic functions

- `+`,`-`, `*`, `/`
- `square`, `cube`, `sqrt`, `cbrt`, `hypot`
- `pow(x,i)`, `root(x,i)` _where i is an integer > 0_
- `factorial`, `doublefactorial`, `risingfactorial`
- `binomial`

#### elementary functions

- `exp`, `expm1`, `log`, `log1p`
- `sin`, `cos`, `tan`, `csc`, `sec`, `cot`
- `asin`, `acos`, `atan`, `atan(y,x)`
- `sinh`, `cosh`, `tanh`, `csch`, `sech`, `coth`
- `asinh`, `acosh`, `atanh`

#### arithmetic-geometric mean

- `agm`, `agm1`

#### gamma functions

- `gamma`, `lgamma`
- `rgamma`, `digamma`

#### error functions

- `erf`, `erfc`, `erfi`

#### Bessel functions

- `besselj`, `besselj0`, `besselj1`
- `bessely`, `bessely0`, `bessely1`
- `besseli`, `besselk`

#### Airy functions

- `airyai`, `airyaiprime`
- `airybi`, `airybiprime`

#### elliptic integrals

- `elliptic_e`, `elliptic_k`
- `elliptic_p`, `elliptic_pi`
- `elliptic_zeta`, `elliptic_sigma`

##### elliptic integrals of squared modulus
- `elliptic_e2`, `elliptic_k2`
- `elliptic_p2`, `elliptic_pi2`
- `elliptic_zeta2`, `elliptic_sigma2`

#### elliptic functions

- `weierstrass_p`, `weierstrass_invp`
- `weierstrass_zeta`, `weierstrass_sigma`

#### hypergeometric functions
- `hypergeometric_0F1`, `hypergeometric_1F1`, `hypergeometric_2F1`, `hypergeometric_1F2`
- `regular_hypergeometric_0F1`, `regular_hypergeometric_1F1`, `regular_hypergeometric_2F1`, `regular_hypergeometric_1F2` (regularized)
   
#### other special functions

- `ei`, `si`, `ci`
- `shi`, `chi`
- `zeta`, `eta`, `xi`    # Reimann
- `lambertw`, `polylog`
- `struve`

#### linear algebra

- `dot`                (vectors)
- `det`, `tr`, `inv`   (matrix)
- `*` (matrix multiply)
- see docs for more functions

#### transforms

- `dft`, `inverse_dft`
- see docs for use

## Intervals

#### parts

- midpoint, radius
- upperbound, lowerbound, bounds
- upperbound_abs, lowerbound_abs, bounds_abs

#### construction

- `setball(midpoint, radius)`
- `setinterval(lobound, hibound)`

#### retrieval

- `midpoint, radius = ball(x::ArbReal)`
- `lobound, hibound = interval(x::ArbReal)`

### working with intervals

The radii are kept using an Arb C library internal structure that has a 30 bit unsigned significand and a power-of-2 exponent that is, essentially, a BigInt.  All radii are nonnegative.  From the Arb documentation:

> The mag_t type holds an unsigned floating-point number with a fixed-precision mantissa (30 bits) and an arbitrary-precision exponent ..., suited for representing magnitude bounds. The special values zero and positive infinity are supported, but not NaN.   Operations that involve rounding will always produce a valid bound, For performance reasons, no attempt is made to compute the best possible bounds: in general, a bound may be several ulps larger/smaller than the optimal bound.

When constructing intervals , you should scale the radius to be as small as possible while preserving enclosure.

----

### a caution for BigFloat

```julia
julia> p=64;setprecision(BigFloat,p);

julia> ArbFloat(pi,p+8)
3.14159265358979323846

julia> ArbFloat(pi,p),BigFloat(pi)
(3.141592653589793238, 3.14159265358979323851)

julia> [ArbFloat(pi,p), BigFloat(pi)]
2-element Array{ArbFloat{88},1}:
 3.141592653589793238
 3.141592653589793239
```

----

## The Arb C library

- [Arb](https://arblib.org) is a C library for rigorous real and complex arithmetic with arbitrary precision.
  Fredrik Johansson is Arb's designer and primary author., with contributions from others.

- Arb tracks numerical errors automatically using the midpoint-radius representation of an interval.

- Arb is designed to provide evaluands that contain the veridical numerical result.
- Arb uses algorithms with provable error bounds foe multiprecision mathematical functions.

- The code is thread-safe, portable, and extensively tested. The library outperforms others.


## Acknowledgements

This work develops parts the Arb C library within Julia.  It is entirely dependent on Arb by Fredrik Johansson and would not exist without the good work of William Hart, Tommy Hofmann and the Nemo.jl team. The libraries for `Arb` and `Flint`, and build file are theirs, used with permission.

----

## Alternatives

For a numeric types like `Float64` and `ComplexF64` with about twice their precision, [Quadmath.jl](https://github.com/JuliaMath/Quadmath.jl) exports `Float128` and `ComplexF128`.  For almost as much precision with better performance, [DoubleFloats.jl](https://github.com/JuliaMath/DoubleFloats.jl) exports `Double64` and `ComplexDF64`. ValidatedNumerics.jl and other packages available at [JuliaIntervals](https://github.com/JuliaIntervals) provide an alternative approach to developing correctly contained results.  Those packages are very good and worthwhile when you do not require multiprecision numerics.

----
## notes

- To propose internal changes, please use pull requests.
- To discuss improvements, please raise a GitHub issue.
