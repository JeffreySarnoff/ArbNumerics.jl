# ArbNumerics.jl


#### Copyright © 2015-2018 by Jeffrey Sarnoff.
####  This work is released under The MIT License.

When computing elementary and special functions
with 20..1200 radix 10 digits, this is _best-in-show_.

(please see Acknowledgements(https://github.com/JeffreySarnoff/ArbNumerics.jl/blob/master/README.md#acknowledgements))
-----

[![Build Status](https://travis-ci.org/JeffreySarnoff/ArbNumerics.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/ArbNumerics.jl)

----

## Introduction

ArbNumerics exports three types: `ArbFloat`, `ArbReal`, `ArbComplex`.  `ArbFloat` is an extended precision floating point type. Math using `ArbFloat` is expected to be very near the veridical value, and often is the closest value for the precision in use. `ArbReal` is an interval-valued quantity formed of an `ArbFloat` (the midpoint) and a `radius`.  Math functions with `ArbReal` are assured to enclose the veridical value.  This assurance extends to multiple function applications.  `ArbComplex` is an `ArbReal` pair (real, imaginary).  The same enclosure assurance applies.

While the bounds of an `ArbReal` or `ArbComplex` are available, the default is to show these values as digit sequences which almost assuredly are accurate, in a round to nearest sense, to the precision displayed.  Math with `ArbFloat` does not provide the assurance one gets using `ArbReal`, as an `ArbFloat` is a point value.  While some effort has been taken to provide you with more reliable results from math with `ArbFloat` values than would be the case using the underlying library itself, `ArbReal` or `ArbComplex` are suggested for work that is important to you.  `ArbFloat` is appropriate when exactness is not required during development, or with applications that are approximating something at increasing precisions.

## Installation

```julia
pkg> rm ArbNumerics
pkg> add ArbNumerics
pkg> build ArbNumerics  # takes a while
pkg> precompile
```

That should do it.  There should not be any error messages.  If there are, let me know.

After the installation is done. `using ArbNumerics` will make this package available.

Reading the sections that follow gives you a good platform from which to develop.

## Constructors

Initially, the default precision is set to 106 bits.  All ArbReal types use the same default precision. You can change this to e.g. 750 bits: `setprecision(ArbFloat, 750)` or `setprecision(ArbReal, 750)`. While you may use whatever precision you like, the underlying C library is optimized for precisions <= 4_000 bits (roughly).

The precision in use may be set globally, as with BigFloats, or it may be given with the constructor.  For most purposes, you should work at one, two, or three precisions.  It is helps clarity to convert precisions explicitly, however, it is not necessary.

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
- `asin`, `acos`, `atan`, `atan2`
- `sinh`, `cosh`, `tanh`, `csch`, `sech`, `coth`
- `asinh`, `acosh`, `atanh`

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

#### arithmetic-geometric mean

- `agm`, `agm1`

##### elliptic functions

- `elliptice`, `elliptick`
- `ellipticp`, `ellipticpi`
- `ellipticzeta`, `ellipticsigma`

#### other special functions

- `ei`, `si`, `ci`
- `shi`, `chi`
- `zeta`, `eta`, `xi`    # Reimann
- `lambertw`


## Intervals

#### parts

- midpoint, radius
- upperbound, lowerbound, bounds
- upperbound_abs, lowerbound_abs, bounds_abs

#### construction

- `setball(midpoint, radius)`
- `setinterval(lobound, hibound)`

#### retrieval

- `midpoint, radius = getball(x::ArbReal)`
- `lobound, hibound = getinterval(x::ArbReal)`

### working with intervals

The radii are kept using an ArbReal C library internal structure that has a 30 bit unsigned significand and a power-of-2 exponent that is, essentially, a BigInt.  All radii are nonnegative.  From the ArbReal documentation:

> The mag_t type holds an unsigned floating-point number with a fixed-precision mantissa (30 bits) and an arbitrary-precision exponent ..., suited for representing magnitude bounds. The special values zero and positive infinity are supported, but not NaN.   Operations that involve rounding will always produce a valid bound, For performance reasons, no attempt is made to compute the best possible bounds: in general, a bound may be several ulps larger/smaller than the optimal bound.

When constructing intervals , you should scale the radius to be as small as possible while preserving enclosure.

----

### a caution for BigFloat

```julia
ulia> p=64;setprecision(BigFloat,p);

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

## The ArbReal C library

- [ArbReal](https://arblib.org) is a C library for rigorous real and complex arithmetic with arbitrary precision.
  Fredrik Johansson is ArbReal's designer and primary author., with contributions from others.

- ArbReal tracks numerical errors automatically using the midpoint-radius representation of an interval.

- ArbReal is designed to provide evaluands that contain the veridical numerical result.
- ArbReal uses algorithms with provable error bounds foe multiprecision mathematical functions.

- The code is thread-safe, portable, and extensively tested. The library outperforms others.


## Acknowledgements

This work develops parts the Arb C library within Julia.  It is entirely dependent on Fredrik Johansson's work and the libraries required are fetched and made ready by the good work of William Hart and the Nemo.jl team.  The build file is theirs, as are the essential libraries (`Arb` and `Flint`).  They are used with permission.

## notes

- To propose internal changes, please use pull requests.
- To discuss improvements, please raise a GitHub issue.
