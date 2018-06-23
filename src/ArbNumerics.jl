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
       risingfactorial, doublefactorial,
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
       muladd, fma,
       factorial, binomial

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

besselj
void arb_hypgeom_bessel_j(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the Bessel function of the first kind Jν(z)
void acb_hypgeom_bessel_j(acb_t res, const acb_t nu, const acb_t z, slong prec)

bessely
void arb_hypgeom_bessel_y(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the Bessel function of the second kind Yν(z)
void acb_hypgeom_bessel_y(acb_t res, const acb_t nu, const acb_t z, slong prec)

besseli
void arb_hypgeom_bessel_i(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the modified Bessel function of the first kind Iν(z)=zν(iz)−νJν(iz)
void acb_hypgeom_bessel_i(acb_t res, const acb_t nu, const acb_t z, slong prec)

besselk
void arb_hypgeom_bessel_k(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the modified Bessel function of the second kind Kν(z)
void acb_hypgeom_bessel_k(acb_t res, const acb_t nu, const acb_t z, slong prec)


void arb_hypgeom_bessel_i_scaled(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the function e−zIν(z)
void acb_hypgeom_bessel_i_scaled(acb_t res, const acb_t nu, const acb_t z, slong prec)

void arb_hypgeom_bessel_k_scaled(arb_t res, const arb_t nu, const arb_t z, slong prec)
    Computes the function ezKν(z)
void acb_hypgeom_bessel_k_scaled(acb_t res, const acb_t nu, const acb_t z, slong prec

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
