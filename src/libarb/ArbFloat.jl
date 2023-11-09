"""
    ArbFloat(x)
    ArbFloat(x; [bits])
    ArbFloat(x; [digits [, base=10]])

- ArbFloat(x) == ArbFloat(x, bits=workingprecision(ArbFloat))
- ArbFloat(x, digits=digits, base=2) == ArbFloat(x, bits=digits)
- ArbFloat(x, digits=digits, base=10) == ArbFloat(x, digits=digits)

ArbFloats are arbitrary precision binary floating-point numbers with some specific precision established at construction.

The precision of an ArbFloat must be >= 24 bits or >= 8 digits.

Negative zero, unsigned Infinity, NaNs with distinct payloads are not supported.

See also: [`ArbReal`](@ref), [`ArbComplex`](@ref), [`workingprecision`](@ref), [`displayprecision`](@ref)
"""
ArbFloat

ArbFloat{P}(x::ArbFloat{P}) where {P} = x
ArbFloat(x::ArbFloat{P}) where {P} = x

ArbFloat{P}(::Missing) where {P} = missing
ArbFloat(::Missing; kw...) = missing

@inline sign_bit(x::ArbFloat{P}) where {P} = isodd(x.size)

function ArbFloat(x::Union{AbstractFloat,AbstractIrrational,Integer,ArbNumber}; kw...)
    _ArbFloat(x; kw...)
end
function ArbFloat(x::Rational; kw...)
    _ArbFloat(x; kw...)
end
function _ArbFloat(x::Number; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2)
    bits = get_bits(bits, digits, base, x)
    ArbFloat{bits}(x)
end

function get_bits(bits, digits, base, x::ArbNumber{P}, y::ArbNumber{Q}) where {P,Q}
    if bits == digits == 0
        max(P, Q)
    else
        get_bits(bits, digits, base)
    end
end
function get_bits(bits, digits, base, x::ArbNumber{P}, y::Any=0) where {P}
    if bits == digits == 0
        P
    else
        get_bits(bits, digits, base)
    end
end
function get_bits(bits, digits, base, y::Any, x::ArbNumber{P}) where {P}
    if bits == digits == 0
        P
    else
        get_bits(bits, digits, base)
    end
end

function get_bits(bits, digits, base, ::Any...)
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bi = digits > 0 ? bits4digits(digits) + extrabits() : (bits > 0 ? bits + extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bi = bits > 0 ? bits + extrabits() : (digits > 0 ? digits + extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    bi
end

function swap!(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    ccall(@libarb(arf_swap), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)
end

function copy(x::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
    return z
end

function copy(x::ArbFloat{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    minprec(bitprecision, ArbFloat, copy)
    z = ArbFloat{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

copy(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = copy(x, P, roundingmode)
copy(x::ArbFloat{P}, bitprecision::Int) where {P} = copy(x, bitprecision, RoundNearest)


function ArbFloat{P}(x::ArbInts) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_si), Cvoid, (Ref{ArbFloat}, Slong), z, x)
    return z
end

function ArbFloat{P}(x::USlong) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_ui), Cvoid, (Ref{ArbFloat}, USlong), z, x)
    return z
end

ArbFloat{P}(x::T) where {P,T<:Integer} = ArbFloat{P}(BigFloat(x, precision=P + 2))

function ArbFloat{P}(x::Base.IEEEFloat) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_d), Cvoid, (Ref{ArbFloat}, Cdouble), z, x)
    return z
end

function ArbFloat{P}(x::BigFloat) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_mpfr), Cvoid, (Ref{ArbFloat}, Ref{BigFloat}), z, x)
    return z
end

ArbFloat{P}(x::Rational{T}) where {P,T<:Signed} = ArbFloat{P}(BigFloat(x, precision=P + 2))

function ArbFloat{P}(x::Irrational{S}) where {P,S}
    y = BigFloat(x, precision=P + 32)
    z = ArbFloat{P}(y)
    return z
end

function (::Type{T})(x::ArbFloat, roundingmode::RoundingMode) where {T<:ArbInts}
    if !(typemin(T) <= x <= typemax(T))
        throw(InexactError(nameof(T), T, x))
        # attention: ccall segfaults, if result would become too large for Slong
    end
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_si), Slong, (Ref{ArbFloat}, Cint), x, rounding)
    return convert(T, z)
end
function (::Type{T})(x::ArbFloat) where {T<:ArbInts}
    if !(isinteger(x) && typemin(T) <= x <= typemax(T))
        throw(InexactError(nameof(T), T, x))
        # attention: ccall segfaults, if result would become too large for Slong
    end
    rounding = match_rounding_mode(RoundNearest)
    z = ccall(@libarb(arf_get_si), Slong, (Ref{ArbFloat}, Cint), x, rounding)
    return convert(T, z)
end

function (::Type{T})(x::ArbFloat{P}, roundingmode::RoundingMode) where {P,T<:Integer}
    y = round(x, roundingmode)
    z = BigFloat(y; precision=P + 2)
    return convert(T, z)
end
function (::Type{T})(x::ArbFloat{P}) where {P,T<:Integer}
    !isinteger(x) && throw(InexactError(nameof(T), T, x))
    z = BigFloat(x, precision=P + 2)
    return convert(T, z)
end

"""
    BigFloat(::ArbFloat, [roundingmode=RoundNearest]; [precision=workingprecision(x))

Construct a `BigFloat`from an `ArbFloat`.
"""
function BigFloat(x::ArbFloat, roundingmode::RoundingMode=RoundNearest; precision::Int=workingprecision(x))
    rounding = mpfr_rounding_mode(roundingmode)
    z = BigFloat(0; precision)
    roundingdir = ccall(@libarb(arf_get_mpfr), Cint, (Ref{BigFloat}, Ref{ArbFloat}, Cint), z, x, rounding)
    return z
end

function Base.Integer(x::ArbFloat{P}) where {P}
    if isinteger(x)
        typemin(Int64) <= abs(x) <= typemax(Int64) ? Int64(x, RoundNearest) : BigInt(x)
    else
        throw(InexactError(:Integer, Integer, x))
    end
end

for (F, A) in ((:floor, :arf_floor), (:ceil, :arf_ceil))
    @eval begin
        function $F(x::ArbFloat{P}) where {P}
            z = ArbFloat{P}()
            ccall(@libarb($A), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
            return z
        end
        $F(::Type{Bool}, x::ArbFloat{P}) where {P} = Bool($F(x))
        $F(::Type{T}, x::ArbFloat{P}) where {P,T<:Integer} = T($F(x))
    end
end

trunc(x::ArbFloat{P}) where {P} = signbit(x) ? ceil(x) : floor(x)
trunc(::Type{Bool}, x::ArbFloat{P}) where {P} = Bool(trunc(x))
trunc(::Type{T}, x::ArbFloat{P}) where {P,T<:Integer} = T(trunc(x))

midpoint(x::ArbFloat{P}) where {P} = x
radius(::ArbFloat{P}) where {P} = zero(ArbFloat{P})

function modf(x::ArbFloat{P}) where {P}
    ipart = trunc(x)
    fpart = x - ipart
    return (fpart, ipart)
end

fmod(fpartipart::Tuple{ArbFloat{P},ArbFloat{P}}) where {P} = fpartipart[1] + fpartipart[2]
fmod(fpart::ArbFloat{P}, ipart::ArbFloat{P}) where {P} = fpart + ipart

div(x::ArbFloat{P}, y::ArbFloat{P}, rm::RoundingMode) where {P} = round(x / y, rm)

rem(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = x - (div(x, y) * y)

function divrem(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    dv = div(x, y)
    rm = x - (dv * y)
    return (dv, rm)
end

# fld(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = floor(x / y)

mod(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = x - (fld(x, y) * y)

function fldmod(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    fd = fld(x, y)
    md = x - (fd * y)
    return (fd, md)
end

# cld(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = ceil(x / y)


# a type specific hash function helps the type to 'just work'
const hash_arbfloat_lo = (UInt === UInt64) ? 0x37e642589da3416a : 0x5d46a6b4
const hash_0_arbfloat_lo = hash(zero(UInt), hash_arbfloat_lo)
hash(z::ArbFloat{P}, h::UInt) where {P} =
    hash(reinterpret(UInt, z.d1) ⊻ z.exp,
        (h ⊻ hash(z.d2 ⊻ (~reinterpret(UInt, P)), hash_arbfloat_lo) ⊻ hash_0_arbfloat_lo))
