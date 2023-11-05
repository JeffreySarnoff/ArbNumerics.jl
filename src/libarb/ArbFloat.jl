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

mutable struct ArbFloat{P} <: AbstractFloat    # P is the precision in bits
    exp::Int        # fmpz         exponent of 2 (2^exp)
    size::UInt      # mp_size_t    nwords and sign (lsb holds sign of significand)
    d1::UInt        # significand  unsigned, immediate value or the initial span
    d2::UInt        #   (d1, d2)   the final part indicating the significand, or 0

    function ArbFloat{P}() where {P}
        minprec(P, ArbFloat)
        z = new{P}(0, 0, 0, 0)
        ccall(@libarb(arf_init), Cvoid, (Ref{ArbFloat},), z)
        finalizer(arf_clear, z)
        return z
    end
end

# for use within structs, e.g ArbFloatMatrix
const PtrToArbFloat = Ptr{ArbFloat} # arf_ptr
const PtrToPtrToArbFloat = Ptr{Ptr{ArbFloat}} # arf_ptr*

arf_clear(x::ArbFloat{P}) where {P} = ccall(@libarb(arf_clear), Cvoid, (Ref{ArbFloat},), x)

ArbFloat{P}(x::ArbFloat{P}) where {P} = x
ArbFloat(x::ArbFloat{P}) where {P} = x

ArbFloat{P}(::Missing) where {P} = missing
ArbFloat(::Missing) = missing

@inline sign_bit(x::ArbFloat{P}) where {P} = isodd(x.size)

function ArbFloat(x::Union{AbstractFloat,AbstractIrrational,Integer}; kw...)
    _ArbFloat(x; kw...)
end
function ArbFloat(x::Union{Rational}; kw...)
    _ArbFloat(x; kw...)
end
function _ArbFloat(x::Real; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2)
    bits = get_bits(bits, digits, base)
    ArbFloat{bits}(x)
end
function get_bits(bits, digits, base)
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bits = digits > 0 ? bits4digits(digits) + extrabits() : (bits > 0 ? bits + extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bits = bits > 0 ? bits + extrabits() : (digits > 0 ? digits + extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    bits
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

function (::Type{T})(x::ArbFloat, roundingmode::RoundingMode=RoundNearest) where {T<:ArbInts}
    rounding = match_rounding_mode(roundingmode)
    if !( typemin(T) <= x <= typemax(T))
        throw(InexactError(nameof(T), T, x))
        # attention: ccall segfaults, if result would become too large for Slong
    end
    z = ccall(@libarb(arf_get_si), Slong, (Ref{ArbFloat}, Cint), x, rounding)
    return convert(T, z)
end

function (::Type{T})(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P,T<:Integer}
    y = round(x, roundingmode)
    z = BigFloat(y; precision=P + 2)
    return convert(T, z)
end

"""
    BigFloat(::ArbFloat; [precision=workingprecision(x), roundingmode=RoundNearest])

Construct a `BigFloat`from an `ArbFloat`.
"""
function BigFloat(x::ArbFloat; precision::Int=workingprecision(x), roundingmode::RoundingMode=RoundNearest)
    rounding = match_rounding_mode(roundingmode)
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
