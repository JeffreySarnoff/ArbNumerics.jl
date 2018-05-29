"""
from Arb docs:

A variable of type arf_t holds an arbitrary-precision binary floating-point number:
that is, a rational number of the form x⋅2y where x,y∈Z and x is odd, or one of
the special values zero, plus infinity, minus infinity, or NaN (not-a-number).
There is currently no support for negative zero, unsigned infinity, or a NaN with a payload.
""" Arf

mutable struct Arf{P}     # P is the precision in bits
    exp::Int        # fmpz         exponent of 2 (2^exp)
    size::UInt      # mp_size_t    nwords and sign (lsb holds sign of significand)
    d1::UInt        # significand  unsigned, immediate value or the initial span
    d2::UInt        #   (d1, d2)   the final part indicating the significand, or 0

    function Arf{P}() where {P}
        z = new{P}()
        ccall(@libarb(arf_init), Cvoid, (Ref{Arf},), z)
        finalizer(arf_clear, z)
        return z
    end
end

arf_clear(x::Arf{P}) where {P} = ccall(@libarb(arf_clear), Cvoid, (Ref{Arf},), x)

Arf{P}(x::Arf{P}) where {P} = x
Arf(x::Arf{P}) where {P} = x

@inline sign_bit(x::Arf{P}) where {P} = isodd(x.size)

Arf(x, prec::Int) = prec>=MINIMUM_PRECISION ? Arf{workingbits(prec)}(x) : throw(DomainError("bit precision ($prec) is too low"))

swap(x::Arf{P}, y::Arf{P}) where {P} = ccall(@libarb(arf_swap), Cvoid, (Ref{Arf}, Ref{Arf}), x, y)

function copy(x::Arf{P}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set), Cvoid, (Ref{Arf}, Ref{Arf}), z, x)
    return z
end

function copy(x::Arf{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    z = Arf{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

copy(x::Arf{P}, roundingmode::RoundingMode) where {P} = copy(x, P, roundingmode)
copy(x::Arf{P}, bitprecision::Int) where {P} = copy(x, bitprecision, RoundNearest)


function Arf{P}(x::Int64) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set_si), Cvoid, (Ref{Arf}, Clong), z, x)
    return z
end
Arf{P}(x::T) where {P, T<:Union{Int8, Int16, Int32}} = Arf{P}(Int64(x))

function Arf{P}(x::UInt64) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set_ui), Cvoid, (Ref{Arf}, Culong), z, x)
    return z
end
Arf{P}(x::T) where {P, T<:Union{UInt8, UInt16, UInt32}} = Arf{P}(UInt64(x))

function Arf{P}(x::Float64) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set_d), Cvoid, (Ref{Arf}, Cdouble), z, x)
    return z
end
Arf{P}(x::T) where {P, T<:Union{Float16, Float32}} = Arf{P}(Float64(x))

function Arf{P}(x::BigFloat) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set_mpfr), Cvoid, (Ref{Arf}, Ref{BigFloat}), z, x)
    return z
end
Arf{P}(x::BigInt) where {P} = Arf{P}(BigFloat(x))
Arf{P}(x::Rational{T}) where {P, T<:Signed} = Arf{P}(BigFloat(x))

function Arf{P}(x::Irrational{S}) where {P,S}
    prec = precision(BigFloat)
    newprec = max(prec, P + 32)
    setprecision(BigFloat, newprec)
    y = BigFloat(x)
    z = Arf{P}(y)
    setprecision(BigFloat, prec)
    return z
end

Int64(x::Arf{P}) where {P} = Int64(x, RoundNearest)
function Int64(x::Arf{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_si), Clong, (Ref{Arf}, Cint), x, rounding)
    return z
end
Int32(x::Arf{P}) where {P} = Int32(Int64(x))
Int32(x::Arf{P}, roundingmode::RoundingMode) where {P} = Int32(Int64(x), roundingmode)
Int16(x::Arf{P}) where {P} = Int16(Int64(x))
Int16(x::Arf{P}, roundingmode::RoundingMode) where {P} = Int16(Int64(x), roundingmode)

BigFloat(x::Arf{P}) where {P} = BigFloat(x, RoundNearest)
function BigFloat(x::Arf{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = BigFloat(0, nominalprecision(x))
    roundingdir = ccall(@libarb(arf_get_mpfr), Cint, (Ref{BigFloat}, Ref{Arf}, Cint), z, x, rounding)
    return z
end
BigFloat(x::Arf{P}, bitprecision::Int) where {P} = BigFloat(x, bitprecision, RoundNearest)
function BigFloat(x::Arf{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = BigFloat(0, bitprecision)
    roundingdir = ccall(@libarb(arf_get_mpfr), Cint, (Ref{BigFloat}, Ref{Arf}, Cint), z, x, rounding)
    return z
end

for (F,A) in ((:floor, :arf_floor), (:ceil, :arf_ceil))
    @eval begin
        function $F(x::Arf{P}) where {P}
            z = Arf{P}()
            ccall(@libarb($A), Cvoid, (Ref{Arf}, Ref{Arf}), z, x)
            return z
        end
    end
end

trunc(x::Arf{P}) where {P} = signbit(x) ? ceil(x) : floor(x)


midpoint(x::Arf{P}) where {P} = x
radius(x::Arf{P}) where {P} = zero(Arf{P})
