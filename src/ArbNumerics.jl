module ArbNumerics

export ArbNumber,
       ArbFloat, ArbReal, ArbComplex,
       ArbRealMatrix,
       interval, setinterval, 
       lowerbound, upperbound,
       ball, setball,
       midpoint, radius,
       interval_abs,
       lowerbound_abs, upperbound_abs,
       increase_radius, decrease_radius,
       bits4digits, digits4bits,
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

       signs, signbits,
       significand_bits, relerror_bits, relaccuracy_bits,
       trim_bits, ulp, ulps, eps, epss,

       # other functions
       add2!, sub2!, mul2!, div2!,
       addmul, submul, mulsub,
       square, cube, rsqrt, rcbrt, pow, root, loghypot,
       risingfactorial, doublefactorial,

       # special functions
       agm1, agm,
       logsinpi, barnesg, logbarnesg,
       ei, si, ci, shi, chi,
       airyai, airyaiprime, airybi, airybiprime,
       besselj, besselj0, besselj1, bessely, bessely0, bessely1, besseli, besselk,
       elliptick, elliptice, ellipticpi, ellipticp,
       ellipticzeta, ellipticsigma,
       zeta, eta, xi,                  # Reimann
       lambertw,
       π, ℯ, γ, φ, catalan,

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
       floatmax, floatmin, typemax, typemin,

       iszero, isone, isinteger, isfinite, isinf, isnan, issubnormal,
       zero, one,
       precision, setprecision, eps, nextfloat, prevfloat, widen,

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
       asin, acos, atan, acsc, asec, acot,
       sinh, cosh, tanh, csch, sech, coth,
       asinh, acosh, atanh, acsch, asech, acoth,

       clamp, clamp!

import Random.rand

import SpecialFunctions: gamma, lgamma, lfact, digamma, invdigamma, polygamma, trigamma,
     beta, lbeta, sinint, cosint,
     erf, erfc, erfcinv, erfcx, erfi, erfinv,
     airyai, airyaiprime, airybi, airybiprime,
     besselj, besselj0, besselj1, bessely, bessely0, bessely1, besseli, besselk,
     eta, zeta

using  LinearAlgebra
import LinearAlgebra: tr, det, transpose, transpose!, norm, lu, ldlt, cholesky, tril, triu, eigvals, svdvals
using  GenericLinearAlgebra

import Base.MathConstants: π, ℯ, γ, φ, catalan

using Libdl
using Random

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

include("support/random.jl")

const ArbNumber = Union{ArbFloat, ArbReal, ArbComplex}

include("libarb/ArbRealMatrix.jl")  # must preceed ArbFloatMatrix
#include("libarb/ArbFloatMatrix.jl") # must preceed ArbComplexMatrix
#include("libarb/ArbComplexMatrix.jl")
include("libarb/promote.jl")
include("libarb/string.jl")
include("libarb/show.jl")

include("values/bitsdigits.jl")
include("values/intraconvert.jl")
include("values/interconvert.jl")
include("values/constructors.jl")
include("values/specialvals.jl")
include("values/compare.jl")
include("values/rounding.jl")
include("values/random.jl")

include("float/prearith.jl")
include("float/arith.jl")
include("float/arith_inplace.jl")
include("float/morearith.jl")
include("float/elementary.jl")
include("float/special.jl")
include("float/special2.jl")
include("float/export_fallbacks.jl")

include("intervals/intervalparts.jl")
include("intervals/complex_intervalparts.jl")
include("intervals/eps_ulp.jl")

include("support/helptext.jl")

end # ArbNumerics
