"""
from Arb docs:

An arb_t represents a ball over the real numbers, that is, an interval [m±r]≡[m−r,m+r]
where the midpoint m and the radius r are (extended) real numbers and r is nonnegative (possibly infinite).
The result of an (approximate) operation done on arb_t variables is a ball which contains
the result of the (mathematically exact) operation applied to any choice of points in the input balls.
In general, the output ball is not the smallest possible.

The precision parameter passed to each function roughly indicates the precision to which calculations
on the midpoint are carried out (operations on the radius are always done using a fixed, small precision.)
""" Arb

# Arb structs hold balls given as midpoint, radius

mutable struct Arb{P}     # P is the precision in bits
                    #      midpoint
    mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                    #      radius
    rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    rad_man::UInt   # mp_limb_t  radius, unsigned by definition

    function Arb{P}() where {P}
        z = new{P}()
        ccall(@libarb(arb_init), Cvoid, (Ref{Arb},), z)
        finalizer(arb_clear, z)
        return z
    end
end

arb_clear(x::Arb{P}) where {P} = ccall(@libarb(arb_clear), Cvoid, (Ref{Arb},), x)

Arb{P}(x::Arb{P}) where {P} = x
Arb(x::Arb{P}) where {P} = x

@inline sign_bit(x::Arb{P}) where {P} = isodd(x.mid_size)

Arb(x, prec::Int) = prec>=MINIMUM_PRECISION ? Arb{workingbits(prec)}(x) : throw(DomainError("bit precision ($prec) is too low"))


swap(x::Arb{P}, y::Arb{P}) where {P} = ccall(@libarb(arb_swap), Cvoid, (Ref{Arb}, Ref{Arb}), x, y)

function copy(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end


function Arb{P}(x::Int64) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_si), Cvoid, (Ref{Arb}, Clong), z, x)
    return z
end
Arb{P}(x::T) where {P, T<:Union{Int8, Int16, Int32}} = Arb{P}(Int64(x))

function Arb{P}(x::UInt64) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_ui), Cvoid, (Ref{Arb}, Culong), z, x)
    return z
end
Arb{P}(x::T) where {P, T<:Union{UInt8, UInt16, UInt32}} = Arb{P}(UInt64(x))

function Arb{P}(x::Float64) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_d), Cvoid, (Ref{Arb}, Cdouble), z, x)
    return z
end
Arb{P}(x::T) where {P, T<:Union{Float16, Float32}} = Arb{P}(Float64(x))

function Arb{P}(x::BigFloat) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_mpfr), Cvoid, (Ref{Arb}, Ref{BigFloat}), z, x)
    return z
end
Arb{P}(x::BigInt) where {P} = Arb{P}(BigFloat(x))
Arb{P}(x::Rational{T}) where {P, T<:Signed} = Arb{P}(BigFloat(x))


function Arb{P}(x::Irrational{S}) where {P,S}
    y = Arf{P}(x)
    z = Arb{P}(y)
    return z
end

function Arb{P}(x::Arf{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, x)
    return z
end

function midpoint(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end

function radius(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end

function midpoint_byref(x::Arb{P}) where {P}
    z = Arf{P}()
    z.exp = x.mid_exp
    z.size = x.mid_size
    z.d1  = x.mid_d1
    z.d2  = x.mid_d2
    return z
end

function radius_byref(x::Arb{P}) where {P}
    z = Mag()
    z.exp = x.rad_exp
    z.man = x.rad_man
    return z
end

midpoint(x::Arb{P}, ::Type{Arf{P}}) where {P} = midpoint_byref(x)
radius(x::Arb{P}, ::Type{Mag}) where {P} = radius_byref(x)

function radius(x::Arb{P}, ::Type{Arf{P}}) where {P}
    z = Arf{P}()
    mag = radius_byref(x)
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{Arf}, Ref{Mag}), z, mag)
    return z
end

