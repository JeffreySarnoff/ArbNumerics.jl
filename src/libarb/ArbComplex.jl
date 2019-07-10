"""
    ArbComplex(x)
    ArbComplex(x; [bits])
    ArbComplex(x; [digits [, base=10]])

    ArbComplex(re, im)
    ArbComplex(re, im; [bits])
    ArbComplex(re, im; [digits [, base=10]])

- `ArbComplex`(re, im) == `ArbComplex`(re, im, bits=workingprecision(ArbComplex))
- `ArbComplex`(re, im, digits=digits, base=2) == `ArbComplex`(re, im, bits=digits)
- `ArbComplex`(re, im, digits=digits, base=10) == `ArbComplex`(re, im, digits=digits)

`ArbComplexs` are arbitrary precision complex binary floating-point regions with some specific precision established at construction.

The precision of an `ArbComplex` must be >= 24 bits or >= 8 digits.

Internally, an `ArbComplex` represents as a pair of `ArbReals`, where the real part and the imaginary part are each
intervals given by midpoint and radius (half-width of the interval). This representation serves as a _ball_ over the complex numbers.
Calculations with `ArbComplex` generate results that are assured to contain the true mathematical result.
There is no a priori assurance on the width of the interval that results.
Good practice is to set the precision substantively greater than the precision
of the resultant width required, and to check the radius of results.

See also: [`ArbFloat`](@ref), [`ArbReal`](@ref), [`ball`](@ref), [`setball`](@ref), [`midpoint`](@ref), [`radius`](@ref)
""" ArbComplex

# ArbComplex structs hold complex balls given as ArbReal pairs

mutable struct ArbComplex{P}  <: Number  # P is the precision in bits
                         #      real midpoint
    real_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    real_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    real_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    real_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                         #      real radius
    real_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    real_rad_man::UInt   # mp_limb_t  radius, unsigned by definition
                         #      imaginary midpoint
    imag_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    imag_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    imag_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    imag_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                         #      imaginary radius
    imag_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    imag_rad_man::UInt   # mp_limb_t  radius, unsigned by definition


    function ArbComplex{P}() where {P}
        z = new{P}(0,0,0,0,0,0,0,0,0,0,0,0)
        ccall(@libarb(acb_init), Cvoid, (Ref{ArbComplex},), z)
        finalizer(clear_acb, z)
        return z
    end
end

# for use within a struct, eg. ArbComplexMatrix
const PtrToArbComplex = Ptr{ArbComplex} # acb_ptr
const PtrToPtrToArbComplex = Ptr{Ptr{ArbComplex}} # acb_ptr*


clear_acb(x::ArbComplex{P}) where {P} = ccall(@libarb(acb_clear), Cvoid, (Ref{ArbComplex},), x)

ArbComplex{P}(x::ArbComplex{P}) where {P} = x
ArbComplex(x::ArbComplex{P}) where {P} = x

ArbComplex{P}(x::Missing) where {P} = missing
ArbComplex(x::Missing) = missing


function ArbComplex(x::T; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Real}
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bits = digits > 0 ? bits4digits(digits)+extrabits() : (bits > 0 ? bits+extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bits = bits > 0 ? bits+extrabits() : (digits > 0 ? digits+extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    ArbComplex{bits}(x, zero(T))
end

function ArbComplex(x::T, y::T; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Real}
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bits = digits > 0 ? bits4digits(digits)+extrabits() : (bits > 0 ? bits+extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bits = bits > 0 ? bits+extrabits() : (digits > 0 ? digits+extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    ArbComplex{bits}(x, y)
end

function ArbComplex(x::T1, y::T2; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T1<:Number, T2<:Number}
    ArbComplex(promote(x, y)...,)
end

ArbComplex(re::T, im::T) where T<:AbstractFloat = ArbComplex(ArbFloat(re), ArbFloat(im))

const Analytic = Cint(0) # prefer the non-analytic versions

@inline sign_bit(x::ArbComplex{P}) where {P} = isodd(x.real_mid_size)
@inline sign_bits(x::ArbComplex{P}) where {P} = isodd(x.real_mid_size), isodd(x.imag_mid_size)
@inline sign_bit(x::ArbComplex{P}, ::Type{RealPart}) where {P} = isodd(x.real_mid_size)
@inline sign_bit(x::ArbComplex{P}, ::Type{ImagPart}) where {P} = isodd(x.imag_mid_size)

# ArbComplex{P}(sqrt(2.0))
function ArbComplex{P}(rea::Float64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d), Cvoid, (Ref{ArbComplex}, Float64), z, rea)
    return z
end

function ArbComplex{P}(rea::Cint) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si), Cvoid, (Ref{ArbComplex}, Cint), z, rea)
    return z
end


function ArbComplex{P}(rea::ArbFloat{P}) where {P}
    x = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), x, rea)
    y = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), y, x)
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{ArbComplex}, Ref{ArbReal}), z, y)
    return z
end

function ArbComplex{P}(rea::ArbReal{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{ArbComplex}, Ref{ArbReal}), z, rea)
    return z
end

# ArbComplex{P}(sqrt(2.0), inv(17.0))
function ArbComplex{P}(re::Float64, im::Float64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d_d), Cvoid, (Ref{ArbComplex}, Float64, Float64), z, re, im)
    return z
end

function ArbComplex{P}(x::Int64, y::Int64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si_si), Cvoid, (Ref{ArbComplex}, Cint, Cint, Clong), z, x, y, P)
    return z
end


function copy(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end

deepcopy(x::ArbComplex{P}) where {P} = copy(x)


function ArbComplex{P}(x::ArbComplex{Q}, roundingmode::RoundingMode) where {P,Q}
    z = ArbComplex{P}()
    rounding = match_rounding_mode(roundingmode)
    res = ccall(@libarb(acb_set_round), Cint,
                (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Cint), z, x, P, rounding)
    return z
end

ArbComplex(x::ArbFloat{P}) where {P} = ArbComplex{P}(x)
ArbComplex(x::ArbReal{P}) where {P} = ArbComplex{P}(x)
ArbComplex(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = ArbComplex{P}(x,y)
ArbComplex(x::ArbReal{P}, y::ArbReal{P}) where {P} = ArbComplex{P}(x,y)
ArbComplex(x::ArbFloat{P}, y::ArbReal{P}) where {P} = ArbComplex{P}(ArbReal{P}(x),y)
ArbComplex(x::ArbReal{P}, y::ArbFloat{P}) where {P} = ArbComplex{P}(x,ArbReal{P}(y))

Base.Complex(x::ArbFloat{P}) where {P} = ArbComplex(x)
Base.Complex(x::ArbReal{P}) where {P} = ArbComplex(x)
Base.Complex(re::ArbFloat{P}, im::ArbFloat{P}) where {P} = ArbComplex(re, im)
Base.Complex(re::ArbReal{P}, im::ArbReal{P}) where {P} = ArbComplex(re, im)

Base.complex(re::ArbFloat{P}, im::ArbFloat{P}) where {P} = ArbComplex(re, im)
Base.complex(re::ArbReal{P}, im::ArbReal{P}) where {P} = ArbComplex(re, im)

Base.Complex(re::ArbFloat{P}, im::ArbReal{P}) where {P} = ArbComplex(ArbReal{P}(re), im)
Base.Complex(re::ArbReal{P}, im::ArbFloat{P}) where {P} = ArbComplex(re, ArbReal{P}(im))
Base.complex(re::ArbFloat{P}, im::ArbReal{P}) where {P} = ArbComplex(ArbReal{P}(re), im)
Base.complex(re::ArbReal{P}, im::ArbFloat{P}) where {P} = ArbComplex(re, ArbReal{P}(im))

Base.Complex{ArbFloat{P}}(x::ArbComplex{P}) where {P} = x
Base.Complex{ArbReal{P}}(x::ArbComplex{P}) where {P} = x


function ArbComplex{P}(x::T) where {P,T<:Integer}
    y = ArbReal{P}(x)
    z = ArbComplex{P}(y)
    return z
end


function ArbComplex{P}(x::T1, y::T2) where {P,T1<:Union{Integer,AbstractFloat},T2<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z  = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::Irrational{S}) where {P,S}
    y = ArbReal{P}(x)
    z = ArbComplex{P}(y)
    return z
end

function ArbComplex{P}(x::Irrational{S1}, y::Irrational{S2}) where {P,S1,S2}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z  = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::Irrational{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::Irrational{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbFloat{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbReal{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    z = ArbComplex{P}(x1, y)
    return z
end
function ArbComplex{P}(x::ArbReal{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x, y1)
    return z
end

function ArbComplex{P}(x::ArbFloat{P}, y::ArbReal{P}) where {P}
    x1 = ArbReal{P}(x)
    z = ArbComplex{P}(x1, y)
    return z
end
function ArbComplex{P}(x::ArbReal{P}, y::ArbFloat{P}) where {P}
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbFloat{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::T, y::ArbReal{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbReal{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S1}, y::ArbFloat{S2}) where {P,S1,S2}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbReal{S1}, y::ArbReal{S2}) where {P,S1,S2}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S1}, y::ArbReal{S2}) where {P,S1,S2}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbReal{S1}, y::ArbFloat{S2}) where {P,S1,S2}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function conj(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_conj), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end

function midpoint(x::ArbComplex{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = ArbReal{P}()
    zimag = ArbReal{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), zreal, xreal)
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), zimag, ximag)
    return ArbComplex{P}(zreal, zimag)
end

function radius(x::ArbComplex{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = ArbReal{P}()
    zimag = ArbReal{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), zreal, xreal)
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), zimag, ximag)
    return ArbComplex{P}(zreal, zimag)
end



trunc(x::ArbComplex{P}) where {P} = ArbComplex{P}(trunc(real(x)), trunc(imag(x)))
trunc(::Type{T}, x::ArbComplex{P}) where {P, T} = T(trunc(real(x))), T(trunc(imag(x)))

floor(x::ArbComplex{P}) where {P} = ArbComplex{P}(florr(real(x)), floor(imag(x)))
floor(::Type{T}, x::ArbComplex{P}) where {P, T} = T(floor(real(x))), T(floor(imag(x)))

ceil(x::ArbComplex{P}) where {P} = ArbComplex{P}(ceil(real(x)), ceil(imag(x)))
ceil(::Type{T}, x::ArbComplex{P}) where {P, T} = T(ceil(real(x))), T(ceil(imag(x)))

function modf(x::ArbComplex{P}) where {P}
    repart = modf(real(x))
    impart = modf(imag(x))
    return (repart, impart)
end

fmod(repart::Tuple{ArbReal{P1}, ArbReal{P1}}, impart::Tuple{ArbReal{P2},ArbReal{P2}}) where {P1, P2} =
    ArbComplex(fmod(repart), fmod(impart))

# phase angle
function Base.angle(x::ArbComplex{P}) where {P}
    rea, ima = reim(x / hypot(reim(x)...,))

    y = hypot(rea - 1.0, ima)
    x = hypot(rea + 1.0, ima)

    a = 2 * atan(y , x)
         
    T = ArbFloat{P}
    !(signbit(a) || signbit(T(pi) - a)) ? a : (signbit(a) ? zero(T) : T(pi))
end

# needed for GenericSVD

flipsign(x::ArbComplex{P}, y::T) where {P, T<:Base.IEEEFloat} =
    signbit(y) ? -x : x
flipsign(x::ArbComplex{P}, y::T) where {P, T<:Real} =
    signbit(y) ? -x : x
flipsign(x::ArbComplex{P}, y::T) where {P, T<:ArbFloat} =
    signbit(y) ? -x : x
flipsign(x::ArbComplex{P}, y::T) where {P, T<:ArbReal} =
    signbit(y) ? -x : x

copysign(x::ArbComplex{P}, y::T) where {P, T<:Base.IEEEFloat} =
    signbit(y) ? (signbit(x) ? x : -x) : (signbit(x) ? -x : x)
copysign(x::ArbComplex{P}, y::T) where {P, T<:Real} =
    signbit(y) ? (signbit(x) ? x : -x) : (signbit(x) ? -x : x)
copysign(x::ArbComplex{P}, y::T) where {P, T<:ArbFloat} =
    signbit(y) ? (signbit(x) ? x : -x) : (signbit(x) ? -x : x)
copysign(x::ArbComplex{P}, y::T) where {P, T<:ArbReal} =
    signbit(y) ? (signbit(x) ? x : -x) : (signbit(x) ? -x : x)


# a type specific hash function helps the type to 'just work'
const hash_arbcomplex_lo = (UInt === UInt64) ? 0x76143ad985246e79 : 0x5b6a64dc
const hash_0_arbcomplex_lo = hash(zero(UInt), hash_arbcomplex_lo)
Base.hash(z::ArbComplex{P}, h::UInt) where {P} =
    hash(z.real_mid_d1 ⊻ z.real_rad_exp ⊻ z.imag_mid_d1 ⊻ z.imag_rad_exp,     
           h ⊻ hash(z.real_mid_d2 ⊻ (~reinterpret(UInt,P)), hash_arbcomplex_lo)
               ⊻ hash_0_arbcomplex_lo)
    
