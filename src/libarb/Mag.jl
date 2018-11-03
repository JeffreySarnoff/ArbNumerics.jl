"""
From Arb docs:

The mag_t type holds an unsigned floating-point number with a fixed-precision mantissa (30 bits)
and an arbitrary-precision exponent (represented as an fmpz_t), suited for representing magnitude bounds.
The special values zero and positive infinity are supported, but not NaN.

Operations that involve rounding will always produce a valid upper bound, or a lower bound if
the function name has the suffix lower. For performance reasons, no attempt is made to compute
the best possible bounds: in general, a bound may be several ulps larger/smaller than the optimal bound.
Some functions such as mag_set() and mag_mul_2exp_si() are always exact and therefore do not require
separate lower versions.
""" Mag

# using the same field names that Nemo.jl uses

mutable struct Mag
    exp::Int        # fmpz       radius, exponent of 2 (2^exp)
    man::UInt       # mp_limb_t  radius, unsigned by definition

    function Mag()
        z = new(0,0)
        ccall(@libarb(mag_init), Cvoid, (Ref{Mag},), z)
        finalizer(mag_clear, z)
        return z
    end
end

mag_clear(x::Mag) = ccall(@libarb(mag_clear), Cvoid, (Ref{Mag},), x)

Mag(x::Mag) = x


swap(x::Mag, y::Mag) where {P} = ccall(@libarb(mag_swap), Cvoid, (Ref{Mag}, Ref{Mag}), x, y)

function copy(x::Mag)
    z = Mag()
    ccall(@libarb(mag_set), Cvoid, (Ref{Mag}, Ref{Mag}), z, x)
    return z
end



function Mag(x::Float64)
    z = Mag()
    ccall(@libarb(mag_set_d), Cvoid, (Ref{Mag}, Cdouble), z, x)
    return z
end

# Mag(-1.0, RoundFromZero)
function Mag(x::Base.IEEEFloat, ::Type{RoundingMode{:FromZero}})
    z = Mag()
    ccall(@libarb(mag_set_d), Cvoid, (Ref{Mag}, Cdouble), z, x)
    return z
end
Mag(x::Base.IEEEFloat, rounding::RoundingMode{:FromZero}) = Mag(x, RoundingMode{:FromZero})
# Mag(-1.0, RoundToZero)
function Mag(x::Base.IEEEFloat, ::Type{RoundingMode{:ToZero}})
    z = Mag()
    ccall(@libarb(mag_set_d_lower), Cvoid, (Ref{Mag}, Cdouble), z, x)
    return z
end
Mag(x::Base.IEEEFloat, rounding::RoundingMode{:ToZero}) = Mag(x, RoundingMode{:ToZero})
# Mag(-1.0)
Mag(x::Base.IEEEFloat) = Mag(x, RoundingMode{:FromZero})

function Mag(x::Int64)
    unsd = UInt64(x)
    z = Mag()
    ccall(@libarb(mag_set_ui), Cvoid, (Ref{Mag}, Culong), z, unsd)
    return z
end

function Mag(x::UInt64)
    z = Mag()
    ccall(@libarb(mag_set_ui), Cvoid, (Ref{Mag}, Culong), z, x)
    return z
end

# Mag(2, RoundFromZero)
function Mag(x::Unsigned, ::Type{RoundingMode{:FromZero}})
    z = Mag()
    ccall(@libarb(mag_set_ui), Cvoid, (Ref{Mag}, Culong), z, x)
    return z
end
Mag(x::Unsigned, rounding::RoundingMode{:FromZero}) = Mag(x, RoundingMode{:FromZero})
# Mag(2, RoundToZero)
function Mag(x::Unsigned, ::Type{RoundingMode{:ToZero}})
    z = Mag()
    ccall(@libarb(mag_set_ui_lower), Cvoid, (Ref{Mag}, Culong), z, x)
    return z
end
Mag(x::Unsigned, rounding::RoundingMode{:ToZero}) = Mag(x, RoundingMode{:ToZero})
# Mag(2)
Mag(x::Unsigned) = Mag(x, RoundingMode{:ToZero})

Mag(x::Signed, ::Type{RoundingMode{:FromZero}}) = Mag(Unsigned(x), RoundingMode{:FromZero})
Mag(x::Signed, rounding::RoundingMode{:FromZero}) = Mag(Unsigned(x), RoundingMode{:FromZero})
Mag(x::Signed, ::Type{RoundingMode{:ToZero}}) = Mag(Unsigned(x), RoundingMode{:ToZero})
Mag(x::Signed, rounding::RoundingMode{:ToZero}) = Mag(Unsigned(x), RoundingMode{:ToZero})
Mag(x::Signed) = Mag(Unsigned(x), RoundingMode{:FromZero})

Float32(x::Mag) = Float32(Float64(x))
Float16(x::Mag) = Float16(Float64(x))

const hash_arbmag = (UInt === UInt64) ? 0x29f934c433d9a758 : 0x2578e2ce
Base.hash(z::Mag) = xor(hash(z.exp, z.man), hash_arbmag)
Base.hash(z::Mag, u::UInt) = hash(hash(z), u)
