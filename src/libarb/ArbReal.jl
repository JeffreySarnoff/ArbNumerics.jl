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

ArbReal{P}(x::ArbReal{P}) where {P} = x
ArbReal(x::ArbReal{P}) where {P} = ArbReal{P}(x)

ArbReal{P}(::Missing) where {P} = missing
ArbReal(::Missing) = missing

@inline sign_bit(x::ArbReal{P}) where {P} = isodd(x.mid_size)

function ArbReal(x::T; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Number}
    bits = get_bits(bits, digits, base)
    ArbReal{bits}(x)
end

function swap!(x::ArbReal{P}, y::ArbReal{P}) where {P}
    ccall(@libarb(arb_swap), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

function copy(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end

function ArbReal{P}(x::ArbInts) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_si), Cvoid, (Ref{ArbReal}, Slong), z, x)
    return z
end

function ArbReal{P}(x::USlong) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_ui), Cvoid, (Ref{ArbReal}, USlong), z, x)
    return z
end
ArbReal{P}(x::T) where {P, T<:Integer} = ArbReal{P}(BigFloat(x, precision=P + 2))

function ArbReal{P}(x::Base.IEEEFloat) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_d), Cvoid, (Ref{ArbReal}, Cdouble), z, x)
    return z
end

function ArbReal{P}(x::BigFloat) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_interval_mpfr), Cvoid, (Ref{ArbReal}, Ref{BigFloat}, Ref{BigFloat}, Clong), z, x, x, P)
    return z
end

ArbReal{P}(x::Rational{T}) where {P, T<:Signed} = ArbReal{P}(BigFloat(x; precision=P + 2))

BigInt(x::ArbReal{P}) where {P} = BigInt(trunc(BigFloat(ArbFloat{P}(x))))

function Base.Integer(x::ArbReal)
    if isinteger(x)
       typemin(Int64) <= x <= typemax(Int64) ? Int64(x) : BigInt(x)
    else
       throw(InexactError(:Integer, Integer, x))
    end
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
        $F(::Type{T}, x::ArbReal{P}) where {P,T<:Integer} = T($F(x))
    end
end

function trunc(x::ArbReal{P}) where {P}
    newlo = trunc(ArbFloat(lowerbound(x)))
    newhi = trunc(ArbFloat(upperbound(x)))
    result = setinterval(newlo, newhi)
    return result
end

trunc(::Type{T}, x::ArbReal{P}) where {P, T<:Integer} = T(trunc(x))

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

function radius(x::ArbReal, ::Type{T}) where {T<:ArbFloat}
    z = ArbFloat{workingprecision(T)}()
    mag = radius_byref(x)
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{ArbFloat}, Ref{Mag}), z, mag)
    return z
end

# a type specific hash function helps the type to 'just work'
const hash_arbreal_lo = (UInt === UInt64) ? 0x37e642589da3416a : 0x5d46a6b4
const hash_0_arbreal_lo = hash(zero(UInt), hash_arbreal_lo)
# two values of the same precision
#    with identical midpoint significands and identical radius_exponentOf2s hash equal
# they are the same value, one is less accurate yet centered about the other
Base.hash(z::ArbReal{P}, h::UInt) where {P} =
    hash(z.mid_d1 ⊻ z.mid_exp,
         (h ⊻ hash(z.mid_d2 ⊻ (~reinterpret(UInt,P)), hash_arbreal_lo)
            ⊻ hash_0_arbreal_lo))
