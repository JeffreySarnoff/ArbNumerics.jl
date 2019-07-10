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
""" ArbFloat

mutable struct ArbFloat{P} <: AbstractFloat    # P is the precision in bits
    exp::Int        # fmpz         exponent of 2 (2^exp)
    size::UInt      # mp_size_t    nwords and sign (lsb holds sign of significand)
    d1::UInt        # significand  unsigned, immediate value or the initial span
    d2::UInt        #   (d1, d2)   the final part indicating the significand, or 0

    function ArbFloat{P}() where {P}
        z = new{P}(0,0,0,0)
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

ArbFloat{P}(x::Missing) where {P} = missing
ArbFloat(x::Missing) = missing

@inline sign_bit(x::ArbFloat{P}) where {P} = isodd(x.size)


function ArbFloat(x::T; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:Number}
    bits > 0 && bits < MINIMUM_PRECISION_BASE2 && throw(DomainError("bit precision $bits < $MINIMUM_PRECISION_BASE2"))
    digits > 0 && digits < MINIMUM_PRECISION_BASE10 && throw(DomainError("digit precision $digits < $MINIMUM_PRECISION_BASE10"))
    if base === 10
        bits = digits > 0 ? bits4digits(digits)+extrabits() : (bits > 0 ? bits+extrabits() : DEFAULT_PRECISION.x)
    elseif base === 2
        bits = bits > 0 ? bits+extrabits() : (digits > 0 ? digits+extrabits() : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    ArbFloat{bits}(x)
end

swap(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = ccall(@libarb(arf_swap), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)

function copy(x::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
    return z
end

function copy(x::ArbFloat{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    z = ArbFloat{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

copy(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = copy(x, P, roundingmode)
copy(x::ArbFloat{P}, bitprecision::Int) where {P} = copy(x, bitprecision, RoundNearest)


function ArbFloat{P}(x::Int32) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_si), Cvoid, (Ref{ArbFloat}, Clong), z, x)
    return z
end
ArbFloat{P}(x::T) where {P, T<:Union{Int8, Int16}} = ArbFloat{P}(Int32(x))
ArbFloat{P}(x::T) where {P, T<:Union{Int64, Int128}} = ArbFloat{P}(BigInt(x))

function ArbFloat{P}(x::UInt32) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_ui), Cvoid, (Ref{ArbFloat}, Culong), z, x)
    return z
end
ArbFloat{P}(x::T) where {P, T<:Union{UInt8, UInt16}} = ArbFloat{P}(UInt32(x))
ArbFloat{P}(x::T) where {P, T<:Union{UInt64, UInt128}} = ArbFloat{P}(BigInt(x))

function ArbFloat{P}(x::Float64) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_d), Cvoid, (Ref{ArbFloat}, Cdouble), z, x)
    return z
end
ArbFloat{P}(x::T) where {P, T<:Union{Float16, Float32}} = ArbFloat{P}(Float64(x))

function ArbFloat{P}(x::BigFloat) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_mpfr), Cvoid, (Ref{ArbFloat}, Ref{BigFloat}), z, x)
    return z
end
ArbFloat{P}(x::BigInt) where {P} = ArbFloat{P}(BigFloat(x))
ArbFloat{P}(x::Rational{T}) where {P, T<:Signed} = ArbFloat{P}(BigFloat(x))

function ArbFloat{P}(x::Irrational{S}) where {P,S}
    prec = precision(BigFloat)
    newprec = max(prec, P + 32)
    setprecision(BigFloat, newprec)
    y = BigFloat(x)
    z = ArbFloat{P}(y)
    setprecision(BigFloat, prec)
    return z
end

function Int64(x::ArbFloat{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_si), Clong, (Ref{ArbFloat}, Cint), x, rounding)
    return z
end
Int32(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = Int32(Int64(x), roundingmode)
Int16(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = Int16(Int64(x), roundingmode)

BigFloat(x::ArbFloat{P}) where {P} = BigFloat(x, RoundNearest)
function BigFloat(x::ArbFloat{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = BigFloat(0, workingprecision(x))
    roundingdir = ccall(@libarb(arf_get_mpfr), Cint, (Ref{BigFloat}, Ref{ArbFloat}, Cint), z, x, rounding)
    return z
end
BigFloat(x::ArbFloat{P}, bitprecision::Int) where {P} = BigFloat(x, bitprecision, RoundNearest)
function BigFloat(x::ArbFloat{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = BigFloat(0, bitprecision)
    roundingdir = ccall(@libarb(arf_get_mpfr), Cint, (Ref{BigFloat}, Ref{ArbFloat}, Cint), z, x, rounding)
    return z
end

BigInt(x::ArbFloat{P}) where {P} = BigInt(trunc(BigFloat(x)))

function Base.Integer(x::ArbFloat{P}) where {P}
    if isinteger(x)
       abs(x) <= typemax(Int64) ? Int64(x) : BigInt(x)
    else
       throw(InexactError("$x"))
    end
end

for (F,A) in ((:floor, :arf_floor), (:ceil, :arf_ceil))
    @eval begin
        function $F(x::ArbFloat{P}) where {P}
            z = ArbFloat{P}()
            ccall(@libarb($A), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
            return z
        end
        $F(::Type{T}, x::ArbFloat{P}) where {P, T<:Integer} = T($F(x))
    end
end

trunc(x::ArbFloat{P}) where {P} = signbit(x) ? ceil(x) : floor(x)
trunc(::Type{T}, x::ArbFloat{P}) where {P, T} = T(trunc(x))

midpoint(x::ArbFloat{P}) where {P} = x
radius(x::ArbFloat{P}) where {P} = zero(ArbFloat{P})

function modf(x::ArbFloat{P}) where {P}
    ipart = trunc(x)
    fpart = x - ipart
    return (fpart, ipart)
end

fmod(fpartipart::Tuple{ArbFloat{P}, ArbFloat{P}}) where {P} =
    fpartipart[1] + fpartipart[2]
fmod(fpart::ArbFloat{P}, ipart::ArbFloat{P}) where {P} =
    fpart + ipart

div(x::ArbFloat{P}, y::ArbFloat{P}) where {P} =
    trunc(x / y)

rem(x::ArbFloat{P}, y::ArbFloat{P}) where {P} =
    x - (div(x,y) * y)

function divrem(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    dv = div(x,y)
    rm = x - (dv * y)
    return (dv, rm)
end

fld(x::ArbFloat{P}, y::ArbFloat{P}) where {P} =
    floor(x / y)    

mod(x::ArbFloat{P}, y::ArbFloat{P}) where {P} =
    x - (fld(x,y) * y)

function fldmod(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    fd = fld(x,y)
    md = x - (fd * y)
    return (fd, md)
end

cld(x::ArbFloat{P}, y::ArbFloat{P}) where {P} =
    ceil(x / y)    

    
# a type specific hash function helps the type to 'just work'
const hash_arbfloat_lo = (UInt === UInt64) ? 0x37e642589da3416a : 0x5d46a6b4
const hash_0_arbfloat_lo = hash(zero(UInt), hash_arbfloat_lo)
hash(z::ArbFloat{P}, h::UInt) where {P} =
    hash(reinterpret(UInt,z.d1) ⊻ z.exp,
         (h ⊻ hash(z.d2 ⊻ (~reinterpret(UInt,P)), hash_arbfloat_lo) ⊻ hash_0_arbfloat_lo))
