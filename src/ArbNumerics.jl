__precompile__()

module ArbNumerics

export ArbFloat, ArbBall, ArbComplex,
       LowerBound, UpperBound,
       getinterval, setinterval, getball, setball,
       midpoint, radius,
       lowerbound, upperbound, bounds,
       lowerbound_abs, upperbound_abs, bounds_abs,
       increase_radius, decrease_radius,
       precision_shown, bits4digits, digits4bits,

       ispos, isneg, isnonpos, isnonneg,

       isspecial,   # zero, infinite or NaN
       isnonfinite,
       isinf, isposinf, isneginf,
       isnonzero,
       isnormal,    # nonzero finite
       isexact,     # zero radius
       isinexact,   # nonzero radius
       isint,       # integer valued

       inf, posinf, neginf, nan,
       getprecision, resetprecision,

       signs, signbits,
       significand_bits, relerror_bits, relaccuracy_bits,
       trim_bits, ulp, ulps, epss,

       # other functions
       addmul, submul, mulsub,
       square, cube, rsqrt, pow, root, loghypot,
       # special functions
       agm1, agm,
       logsinpi, barnesg, logbarnesg,
       ei, si, ci, shi, chi,
       ellipticK, ellipticE, ellipticPi, ellipticP,
       ellipticZeta, ellipticSigma,
       zeta, eta, xi,                  # Reimann
       lambertw,
       π, ℯ, γ, φ, catalan


import Base: hash,
       promote_rule, promote_type, convert,
       copy, deepcopy, string, show,

       zero, one,

       Float16, Float32, Float64,
       UInt8, UInt16, UInt32, UInt64, UInt128,
       Int8, Int16, Int32, Int64, Int128,
       BigInt, BigFloat, Rational, Complex, real, imag,

       iszero, isone, isinteger, isfinite, isinf, isnan, issubnormal,
       zero, one,
       precision, setprecision, eps,

       abs, abs2, signbit, sign, copysign, flipsign,

       (==), (!=), (<), (<=), (>=), (>), isequal, isless,
       (+), (-), (*), (/), (\), inv,
       div, fld, cld, rem, mod, divrem, fldmod,
       ceil, floor, trunc, round,
       muladd, fma

import Base.Math:  max, min, minmax,
       exponent, significand,
       ldexp, frexp, modf,

       mod2pi, rem2pi,
       sqrt, cbrt, hypot,

       (^), exp, log, expm1, log1p, log2, log10,
       sin, cos, sincos, tan, csc, sec, cot, sinc,
       asin, acos, atan, acsc, asec, acot, atan2,
       sinh, cosh, tanh, csch, sech, coth,
       asinh, acosh, atanh, acsch, asech, acoth,

       clamp, clamp!


import SpecialFunctions:
       beta, lbeta, gamma, lgamma, lfact
  #=
       airyai, airyaiprime, airybi, airybiprime, airyaix, airyaiprimex, airybix, airybiprimex,
       besselh, besselhx, besseli, besselix, besselj, besselj0, besselj1, besseljx,
       besselk, besselkx, bessely, bessely0, bessely1, besselyx,
       dawson,
       erf, erfc, erfcinv, erfcx, erfi, erfinv,
       eta,
       digamma, invdigamma, polygamma, trigamma,
       hankelh1, hankelh1x, hankelh2, hankelh2x,
       zeta
       sinint, cosint
 =#

import Base.MathConstants: π, ℯ, γ, φ, catalan

include("support/arblib.jl")
include("support/abstractions.jl")

include("libarb/roundingmodes.jl")
include("libarb/Mag.jl")
include("libarb/ArbFloat.jl")
include("libarb/ArbBall.jl")
include("libarb/ArbComplex.jl")
include("libarb/promote.jl")
include("libarb/string.jl")
include("libarb/show.jl")

include("values/bitsdigits.jl")
include("values/intraconvert.jl")
include("values/interconvert.jl")
include("values/constructors.jl")
include("values/specialvals.jl")
include("values/compare.jl")

include("float/prearith.jl")
include("float/arith.jl")
include("float/morearith.jl")
include("float/elementary.jl")

include("intervals/intervalparts.jl")
include("intervals/eps_ulp.jl")


end # ArbNumerics
