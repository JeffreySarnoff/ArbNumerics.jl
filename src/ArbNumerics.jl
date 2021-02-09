"""
    ArbNumerics

A performant package for numerics with settable extended precision.

primary exported types: `ArbFloat`, `ArbReal`, `ArbComplex`
"""
module ArbNumerics

export ArbNumber,
       ArbFloat, ArbReal, ArbComplex,
       interval, setinterval,
       lowerbound, upperbound,
       ball, setball,
       midpoint, radius,
       interval_abs,
       lowerbound_abs, upperbound_abs,
       increase_radius, decrease_radius,
       bits4digits, digits4bits,
       bits2digits, digits2bits,
       workingprecision, setworkingprecision,
       extrabits, setextrabits,

       stringall, showall,

       ispositive, isnegative, isnonpositive, isnonnegative,

       isspecial,     # zero, infinite or NaN
       isnonfinite,
       isinf, isposinf, isneginf,
       isnonzero,
       isnormal,      # nonzero finite
       isexact,       # zero radius
       isinexact,     # nonzero radius
       isinteger,     # integer valued
       isnoninteger,  # has nonzero fractional portion

       inf, posinf, neginf, nan,
       typemax, typemin, floatmax, floatmin,
       magnitude,     # complex magnitude, `angle` gives phase

       signs, signbits,
       significand_bits, relerror_bits, relaccuracy_bits,
       trim_bits, ulp, ulps, eps, epss,

       # other functions
       fmod, # inv of modf
       round!,
       add2!, sub2!, mul2!, div2!,
       addmul, submul, mulsub,
       square, cube, rsqrt, rcbrt, pow, root, loghypot,
       risingfactorial, doublefactorial,
       tanpi, cotpi,

       # special functions
       agm1, agm,
       erf, erfc, erfi, erfcx,
       logsinpi, barnesg, logbarnesg,
       ei, si, ci, shi, chi,
       airyai, airyaiprime, airybi, airybiprime,
       besselj, besselj0, besselj1, bessely, bessely0, bessely1, besseli, besselk,
       hypergeometric_0F1, hypergeometric_1F1, hypergeometric_2F1, hypergeometric_1F2,
       regular_hypergeometric_0F1, regular_hypergeometric_1F1, regular_hypergeometric_2F1, regular_hypergeometric_1F2,
       F₀₁,  F₁₁, F₂₁, F₁₂, regularF₀₁,  regularF₁₁, regularF₂₁, regularF₁₂,
       elliptic_k, elliptic_e, elliptic_pi, elliptic_f,
       elliptic_k2, elliptic_e2, elliptic_pi2, elliptic_f2, # modulus^2
       elliptic_rf, elliptic_rg, elliptic_rj,
       weierstrass_p, weierstrass_invp, weierstrass_zeta, weierstrass_sigma,
       zeta, eta, xi,                  # Reimann
       lambertw, polylog,
       π, ℯ, γ, φ, catalan,
       struve,

       # fft
       dft, inverse_dft,

       # special linear algebra
       determinant, inverse, fastmul, ⨱ # \timesbar

import Base: IEEEFloat,
       hash, promote_rule, promote_type, convert,
       copy, deepcopy, string, show,

       zero, one,

       Float16, Float32, Float64, float,
       UInt8, UInt16, UInt32, UInt64, UInt128,
       Int8, Int16, Int32, Int64, Int128,
       BigInt, BigFloat, Rational, Complex, real, imag, complex,
       floatmax, floatmin, typemax, typemin, maxintfloat,
       rationalize,

       iszero, isone, isinteger, isfinite, isinf, isnan, issubnormal,
       zero, one,
       precision, setprecision, eps, nextfloat, prevfloat, widen, isapprox,

       abs, abs2, signbit, sign, copysign, flipsign,

       (==), (!=), (<), (<=), (>=), (>), isequal, isless,
       (+), (-), (*), (/), (\), inv,
       div, fld, cld, rem, mod, divrem, fldmod,
       ceil, floor, trunc, round,
       muladd, fma,
       factorial, binomial,
       conj

import Base.Math:  max, min, minmax,
       exponent, significand,
       ldexp, frexp, modf,

       mod2pi, rem2pi,
       sqrt, cbrt, hypot,

       (^), exp, log, expm1, log1p, log2, log10,
       sin, cos, sincos, tan, csc, sec, cot, sinc, sinpi, cospi,
       asin, acos, atan, acsc, asec, acot,
       sinh, cosh, tanh, csch, sech, coth,
       asinh, acosh, atanh, acsch, asech, acoth,

       clamp, clamp!

import Random: rand, randn

import SpecialFunctions: gamma, lgamma, lfact, digamma, invdigamma, polygamma, trigamma,
     beta, lbeta, sinint, cosint,
     erf, erfc, erfcinv, erfcx, erfi, erfinv,
     airyai, airyaiprime, airybi, airybiprime,
     besselj, besselj0, besselj1, bessely, bessely0, bessely1, besseli, besselk,
     eta, zeta

using GenericSVD

using LinearAlgebra
import LinearAlgebra: tr, det, transpose, transpose!, norm, lu, ldlt,
                      cholesky, tril, triu, eigvals, svdvals, floatmin2,
                      mul!, rmul!, lmul!, eigvecs, svd, eigen, dot

export tr, det, transpose, transpose!, norm, mul!, lmul!, rmul!, lu, ldlt,
       cholesky, tril, tiru, eigvals, svdvals

import Base.MathConstants: π, ℯ, γ, φ, catalan

using Libdl
using Random
using Random: SamplerType, SamplerTrivial, CloseOpen01

using FLINT_jll
using Arb_jll

include("support/arblib.jl")
include("support/abstractions.jl")
include("support/matrices.jl")

include("libarb/roundingmodes.jl")
include("libarb/ArbMatrix.jl")
include("libarb/Flint2.jl")
include("libarb/Mag.jl")
include("libarb/ArbFloat.jl")
include("libarb/ArbReal.jl")
include("libarb/ArbComplex.jl")
include("support/complex.jl")

include("support/ArblibVector.jl")

include("support/random.jl")

const ArbNumber = Union{ArbFloat,ArbReal,ArbComplex}

include("libarb/ArbMatrix.jl")  # must preceed ArbRealMatrix
include("libarb/ArbRealMatrix.jl")  # must preceed ArbFloatMatrix
include("libarb/ArbFloatMatrix.jl") # must preceed ArbComplexMatrix
include("libarb/ArbComplexMatrix.jl")
include("libarb/ArbFFT.jl")
include("libarb/promote.jl")
include("libarb/string.jl")
include("libarb/parse.jl")
include("libarb/show.jl")

include("values/bitsdigits.jl")
include("values/intraconvert.jl")
include("values/interconvert.jl")
include("values/constructors.jl")
include("values/specialvals.jl")
include("values/compare.jl")
include("values/rounding.jl")
include("values/random.jl")

include("float/parametrics.jl")
include("float/prearith.jl")
include("float/arith.jl")
include("float/arith_inplace.jl")
include("float/morearith.jl")
include("float/muladd.jl")
include("float/dot.jl")
include("float/elementary.jl")
include("float/otherspecial.jl")
include("float/bessel.jl")
include("float/airy.jl")
include("float/elliptic.jl")
include("float/hypergeometric.jl")
include("float/export_fallbacks.jl")

include("float/float64.jl")

include("intervals/intervalparts.jl")
include("intervals/complex_intervalparts.jl")
include("intervals/eps_ulp.jl")

include("support/minprec.jl")
include("support/linearalgebra.jl")
include("support/printf.jl")
include("support/helptext.jl")


function __init__()
    ccall(@libflint(flint_set_num_threads), Cvoid, (Cint,), Sys.CPU_THREADS)
    return nothing
end

end # ArbNumerics
