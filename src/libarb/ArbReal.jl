"""
    ArbReal(x)
    ArbReal(x; [bits])
    ArbReal(x; [digits [, base=10]])

- `ArbReal`(x) == `ArbReal`(x, bits=workingprecision(ArbReal))
- `ArbReal`(x, digits=digits, base=2) == `ArbReal`(x, bits=digits)
- `ArbReal`(x, digits=digits, base=10) == `ArbReal`(x, digits=digits)

ArbReals are arbitrary precision binary floating-point regions with some specific precision established at construction.

The precision of an `ArbReal` must be >= 24 bits or >= 8 digits.

Internally, an `ArbReal` represents an interval given by its midpoint and radius (half-width of the interval).
This representation serves as a _ball_ over the real numbers.  Calculations with `ArbReals` generate results
that are assured to contain the true mathematical result.  There is no a priori assurance on the width of
the interval that results.  Good practice is to set the precision substantively greater than the precision
of the resultant width required, and to check the radius of results.

See also: [`ArbFloat`](@ref), [`ArbComplex`](@ref), [`ball`](@ref), [`setball`](@ref), [`midpoint`](@ref), [`radius`](@ref)
""" ArbReal

# ArbReal structs hold balls given as midpoint, radius

mutable struct ArbReal{P} <: Real     # P is the precision in bits
                    #      midpoint
    mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                    #      radius
    rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    rad_man::UInt   # mp_limb_t  radius, unsigned by definition

    function ArbReal{P}() where {P}
        z = new{P}(0,0,0,0,0,0)
        ccall(@libarb(arb_init), Cvoid, (Ref{ArbReal},), z)
        finalizer(arb_clear, z)
        return z
    end
end

# for use within structs, e.g. ArbRealMatrix
const PtrToArbReal = Ptr{ArbReal} # arb_ptr
const PtrToPtrToArbReal = Ptr{Ptr{ArbReal}} # arb_ptr*


arb_clear(x::ArbReal{P}) where {P} = ccall(@libarb(arb_clear), Cvoid, (Ref{ArbReal},), x)

ArbReal{P}(x::ArbReal{P}) where {P} = x
ArbReal(x::ArbReal{P}) where {P} = x

ArbReal{P}(x::Missing) where {P} = missing
ArbReal(x::Missing) = missing

@inline sign_bit(x::ArbReal{P}) where {P} = isodd(x.mid_size)

function ArbReal(x::T; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Number}
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bits = digits > 0 ? bits4digits(digits)+extrabits() : (bits > 0 ? bits+extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bits = bits > 0 ? bits+extrabits() : (digits > 0 ? digits+extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    ArbReal{bits}(x)
end

swap(x::ArbReal{P}, y::ArbReal{P}) where {P} = ccall(@libarb(arb_swap), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), x, y)

function copy(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end

function ArbReal{P}(x::Int32) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_si), Cvoid, (Ref{ArbReal}, Clong), z, x)
    return z
end
ArbReal{P}(x::T) where {P, T<:Union{Int8, Int16}} = ArbReal{P}(Int32(x))
ArbReal{P}(x::T) where {P, T<:Union{Int64, Int128}} = ArbReal{P}(BigInt(x))

function ArbReal{P}(x::UInt32) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_ui), Cvoid, (Ref{ArbReal}, Culong), z, x)
    return z
end
ArbReal{P}(x::T) where {P, T<:Union{UInt8, UInt16}} = ArbReal{P}(UInt32(x))
ArbReal{P}(x::T) where {P, T<:Union{UInt64, UInt128}} = ArbReal{P}(BigInt(x))

function ArbReal{P}(x::Float64) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_d), Cvoid, (Ref{ArbReal}, Cdouble), z, x)
    return z
end
ArbReal{P}(x::T) where {P, T<:Union{Float16, Float32}} = ArbReal{P}(Float64(x))

function ArbReal{P}(x::BigFloat) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_interval_mpfr), Cvoid, (Ref{ArbReal}, Ref{BigFloat}, Ref{BigFloat}, Clong), z, x, x, P)
    return z
end
ArbReal{P}(x::BigInt) where {P} = ArbReal{P}(BigFloat(x))
ArbReal{P}(x::Rational{T}) where {P, T<:Signed} = ArbReal{P}(BigFloat(x))

BigFloat(x::ArbReal{P}) where {P} = BigFloat(ArbFloat{P}(x))
BigInt(x::ArbReal{P}) where {P} = BigInt(trunc(BigFloat(ArbFloat{P}(x))))

function Base.Integer(x::ArbReal{P}) where {P}
    if isinteger(x)
       abs(x) <= typemax(Int64) ? Int64(x) : BigInt(x)
    else
       throw(InexactError("$x"))
    end
end

function ArbReal{P}(x::Irrational{S}) where {P,S}
    y = ArbFloat{P}(x)
    z = ArbReal{P}(y)
    return z
end

function ArbReal{P}(x::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, x)
    return z
end

for (F,A) in ((:floor, :arf_floor), (:ceil, :arf_ceil))
    @eval begin
        function $F(x::ArbReal{P}) where {P}
            z = ArbFloat{P}()
            ccall(@libarb($A), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
            return ArbReal{P}(z)
        end
        $F(::Type{T}, x::ArbReal{P}) where {P,T} = T($F(x))
    end
end

function trunc(x::ArbReal{P}) where {P}
    newlo = trunc(ArbFloat(lowerbound(x)))
    newhi = trunc(ArbFloat(upperbound(x)))
    result = setinterval(newlo, newhi)
    return result
end

trunc(::Type{T}, x::ArbReal{P}) where {P, T} = T(trunc(x))


function modf(x::ArbReal{P}) where {P}
    ipart = trunc(x)
    fpart = x - ipart
    return (fpart, ipart)
end

fmod(fpartipart::Tuple{ArbReal{P}, ArbReal{P}}) where {P} =
    fpartipart[1] + fpartipart[2]
fmod(fpart::ArbReal{P}, ipart::ArbReal{P}) where {P}=
    fpart + ipart


div(x::ArbReal{P}, y::ArbReal{P}) where {P} =
    trunc(x / y)

rem(x::ArbReal{P}, y::ArbReal{P}) where {P} =
    x - (div(x,y) * y)

function divrem(x::ArbReal{P}, y::ArbReal{P}) where {P}
    dv = div(x,y)
    rm = x - (dv * y)
    return (dv, rm)
end


fld(x::ArbReal{P}, y::ArbReal{P}) where {P} =
    floor(x / y)

mod(x::ArbReal{P}, y::ArbReal{P}) where {P} =
    x - (fld(x,y) * y)

function fldmod(x::ArbReal{P}, y::ArbReal{P}) where {P}
    fd = fld(x,y)
    md = x - (fd * y)
    return (fd, md)
end

cld(x::ArbReal{P}, y::ArbReal{P}) where {P} =
    ceil(x / y)    

function midpoint(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end

function radius(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end

function midpoint_byref(x::ArbReal{P}) where {P}
    w = ArbReal{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), w, x)
    z = ArbFloat{P}(w)
    return z
end

function radius_byref(x::ArbReal{P}) where {P}
    w = ArbReal{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), w, x)
    z = ArbFloat{P}(w)
    return z
end

midpoint(x::ArbReal{P}, ::Type{ArbFloat{P}}) where {P} = midpoint_byref(x)
radius(x::ArbReal{P}, ::Type{Mag}) where {P} = radius_byref(x)

function radius(x::ArbReal{P}, ::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    mag = radius_byref(x)
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{ArbFloat}, Ref{Mag}), z, mag)
    return z
end


# a type specific hash function helps the type to 'just work'
const hash_arbreal_lo = (UInt === UInt64) ? 0x37e642589da3416a : 0x5d46a6b4
const hash_0_arbreal_lo = hash(zero(UInt), hash_arbreal_lo)
# two values of the same precision
#    with identical midpoint significands and identical radus_exponentOf2s hash equal
# they are the same value, one is less accurate yet centered about the other
Base.hash(z::ArbReal{P}, h::UInt) where {P} =
    hash(z.d1 ⊻ z.exp,
         (h ⊻ hash(z.d2 ⊻ (~reinterpret(UInt,P)), hash_arbreal_lo)
            ⊻ hash_0_arbreal_lo))
