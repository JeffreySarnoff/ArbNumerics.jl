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

Internally, an `ArbComplex` represents as a pair of `ArbReal`, where the real part and the imaginary part are each
intervals given by midpoint and radius (half-width of the interval). This representation serves as a _ball_ over the complex numbers.
Calculations with `ArbComplex` generate results that are assured to contain the true mathematical result.
There is no a priori assurance on the width of the interval that results.
Good practice is to set the precision substantively greater than the precision
of the resultant width required, and to check the radius of results.

See also: [`ArbFloat`](@ref), [`ArbReal`](@ref), [`ball`](@ref), [`setball`](@ref), [`midpoint`](@ref), [`radius`](@ref)
"""
ArbComplex

# ArbComplex structs hold complex balls given as ArbReal pairs

mutable struct ArbComplex{P} <: Number  # P is the precision in bits
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
        minprec(P, ArbComplex)
        z = new{P}(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        ccall(@libarb(acb_init), Cvoid, (Ref{ArbComplex},), z)
        finalizer(clear_acb, z)
        return z
    end
end

ArbComplex{P}(x::T) where {P,T<:Number} = ArbComplex{P}(real(x), imag(x))

# for use within a struct, eg. ArbComplexMatrix
const PtrToArbComplex = Ptr{ArbComplex} # acb_ptr
const PtrToPtrToArbComplex = Ptr{Ptr{ArbComplex}} # acb_ptr*

const ArbFloatReal{P} = Union{ArbFloat{P},ArbReal{P}}
const ArbNumber1{P} = Union{ArbFloatReal{P},ArbComplex{P}}

# finalizer:
clear_acb(x::ArbComplex{P}) where {P} = ccall(@libarb(acb_clear), Cvoid, (Ref{ArbComplex},), x)

ArbComplex{P}(x::ArbComplex{P}) where {P} = x
ArbComplex(x::ArbComplex{P}) where {P} = x

ArbComplex(::Missing, ::Union{Missing,Real}...; kw...) = missing
ArbComplex(::Real, ::Missing; kw...) = missing
ArbComplex{P}(::Missing, ::Union{Missing,Real}...) where {P} = missing
ArbComplex{P}(::Real, ::Missing) where {P} = missing

ArbComplex(x::T; kw...) where {T<:Number} = ArbComplex(real(x), imag(x); kw...)

function ArbComplex(x::T, y::Real=0; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Real}
    bits = get_bits(bits, digits, base)
    iszero(y) ? ArbComplex{bits}(x) : ArbComplex{bits}(x, y)
end

ArbComplex(x::ArbNumber1{P}) where {P} = ArbComplex{P}(x)

ArbComplex(x::ArbFloatReal{P}, y::ArbFloatReal{S}) where {P,S} = ArbComplex{min(P, S)}(x, y)
ArbComplex(x::ArbFloatReal{P}, y::Real) where {P} = ArbComplex{P}(x, y)
ArbComplex(x::Real, y::ArbFloatReal{P}) where {P} = ArbComplex{P}(x, y)

@inline sign_bit(x::ArbComplex{P}, ::Type{RealPart}) where {P} = isodd(x.real_mid_size)
@inline sign_bit(x::ArbComplex{P}, ::Type{ImagPart}) where {P} = isodd(x.imag_mid_size)

# ArbComplex{P}(sqrt(2.0))
function ArbComplex{P}(rea::Base.IEEEFloat) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d), Cvoid, (Ref{ArbComplex}, Float64), z, rea)
    return z
end

function ArbComplex{P}(rea::ArbInts) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si), Cvoid, (Ref{ArbComplex}, Slong), z, rea)
    return z
end

function ArbComplex{P}(rea::ArbReal{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{ArbComplex}, Ref{ArbReal}), z, rea)
    return z
end

# ArbComplex{P}(sqrt(2.0), inv(17.0))
function ArbComplex{P}(re::Base.IEEEFloat, im::Base.IEEEFloat) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d_d), Cvoid, (Ref{ArbComplex}, Float64, Float64), z, re, im)
    return z
end

function ArbComplex{P}(x::ArbInts, y::ArbInts) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si_si), Cvoid, (Ref{ArbComplex}, Slong, Slong, Slong), z, x, y, P)
    return z
end

function copy(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end

deepcopy(x::ArbComplex{P}) where {P} = copy(x)

Complex(x::ArbNumber1) = convert(ArbComplex, x)
Complex(re::ArbFloatReal, im::ArbFloatReal) = ArbComplex(re, im)

complex(re::ArbNumber1) = convert(ArbComplex, re)
complex(re::ArbFloatReal, im::ArbFloatReal) = ArbComplex(re, im)

complex(::Type{T}) where {T<:ArbNumber1} = ArbComplex
complex(::Type{T}) where {P,T<:ArbNumber1{P}} = ArbComplex{P}

Base.Complex{T}(x::ArbComplex{P}) where {P,T<:ArbFloatReal{P}} = x

function ArbComplex{P}(x::T) where {P,T<:Integer}
    y = ArbReal{P}(x)
    z = ArbComplex{P}(y)
    return z
end


function ArbComplex{P}(x::T1, y::T2) where {P,T1<:Real,T2<:Real}
    x1 = convert(ArbReal{P}, x)
    y1 = convert(ArbReal{P}, y)
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
trunc(::Type{T}, x::ArbComplex{P}) where {P,T<:Integer} = T(trunc(real(x))), T(trunc(imag(x)))

floor(x::ArbComplex{P}) where {P} = ArbComplex{P}(floor(real(x)), floor(imag(x)))
floor(::Type{T}, x::ArbComplex{P}) where {P,T<:Integer} = T(floor(real(x))), T(floor(imag(x)))

ceil(x::ArbComplex{P}) where {P} = ArbComplex{P}(ceil(real(x)), ceil(imag(x)))
ceil(::Type{T}, x::ArbComplex{P}) where {P,T<:Integer} = T(ceil(real(x))), T(ceil(imag(x)))

function modf(x::ArbComplex{P}) where {P}
    repart = modf(real(x))
    impart = modf(imag(x))
    return (repart, impart)
end

function fmod(repart::Tuple{ArbReal{P1},ArbReal{P1}}, impart::Tuple{ArbReal{P2},ArbReal{P2}}) where {P1,P2}
    ArbComplex(fmod(repart), fmod(impart))
end

# a type specific hash function helps the type to 'just work'
const hash_arbcomplex_lo = (UInt === UInt64) ? 0x76143ad985246e79 : 0x5b6a64dc
const hash_0_arbcomplex_lo = hash(zero(UInt), hash_arbcomplex_lo)
function Base.hash(z::ArbComplex{P}, h::UInt) where {P}
    hash(z.real_mid_d1 ⊻ z.real_rad_exp ⊻ z.imag_mid_d1 ⊻ z.imag_rad_exp,
        h ⊻ hash(z.real_mid_d2 ⊻ (~reinterpret(UInt, P)), hash_arbcomplex_lo)
        ⊻
        hash_0_arbcomplex_lo)
end
