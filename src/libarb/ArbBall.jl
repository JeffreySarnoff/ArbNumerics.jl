"""
from ArbBall docs:

An arb_t represents a ball over the real numbers, that is, an interval [m±r]≡[m−r,m+r]
where the midpoint m and the radius r are (extended) real numbers and r is nonnegative (possibly infinite).
The result of an (approximate) operation done on arb_t variables is a ball which contains
the result of the (mathematically exact) operation applied to any choice of points in the input balls.
In general, the output ball is not the smallest possible.

The precision parameter passed to each function roughly indicates the precision to which calculations
on the midpoint are carried out (operations on the radius are always done using a fixed, small precision.)
""" ArbBall

# ArbBall structs hold balls given as midpoint, radius

mutable struct ArbBall{P}     # P is the precision in bits
                    #      midpoint
    mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                    #      radius
    rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    rad_man::UInt   # mp_limb_t  radius, unsigned by definition

    function ArbBall{P}() where {P}
        z = new{P}()
        ccall(@libarb(arb_init), Cvoid, (Ref{ArbBall},), z)
        finalizer(arb_clear, z)
        return z
    end
end

arb_clear(x::ArbBall{P}) where {P} = ccall(@libarb(arb_clear), Cvoid, (Ref{ArbBall},), x)

ArbBall{P}(x::ArbBall{P}) where {P} = x
ArbBall(x::ArbBall{P}) where {P} = x

@inline sign_bit(x::ArbBall{P}) where {P} = isodd(x.mid_size)

ArbBall(x, prec::Int) = prec>=MINIMUM_PRECISION ? ArbBall{workingbits(prec)}(x) : throw(DomainError("bit precision ($prec) is too low"))


swap(x::ArbBall{P}, y::ArbBall{P}) where {P} = ccall(@libarb(arb_swap), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), x, y)

function copy(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end


function ArbBall{P}(x::Int64) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_si), Cvoid, (Ref{ArbBall}, Clong), z, x)
    return z
end
ArbBall{P}(x::T) where {P, T<:Union{Int8, Int16, Int32}} = ArbBall{P}(Int64(x))

function ArbBall{P}(x::UInt64) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_ui), Cvoid, (Ref{ArbBall}, Culong), z, x)
    return z
end
ArbBall{P}(x::T) where {P, T<:Union{UInt8, UInt16, UInt32}} = ArbBall{P}(UInt64(x))

function ArbBall{P}(x::Float64) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_d), Cvoid, (Ref{ArbBall}, Cdouble), z, x)
    return z
end
ArbBall{P}(x::T) where {P, T<:Union{Float16, Float32}} = ArbBall{P}(Float64(x))

function ArbBall{P}(x::BigFloat) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_interval_mpfr), Cvoid, (Ref{ArbBall}, Ref{BigFloat}, Ref{BigFloat}, Clong), z, x, x, P)
    return z
end
ArbBall{P}(x::BigInt) where {P} = ArbBall{P}(BigFloat(x))
ArbBall{P}(x::Rational{T}) where {P, T<:Signed} = ArbBall{P}(BigFloat(x))


function ArbBall{P}(x::Irrational{S}) where {P,S}
    y = ArbFloat{P}(x)
    z = ArbBall{P}(y)
    return z
end

function ArbBall{P}(x::ArbFloat{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), z, x)
    return z
end

function midpoint(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end

function radius(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end

function midpoint_byref(x::ArbBall{P}) where {P}
    z = ArbFloat{P}()
    z.exp = x.mid_exp
    z.size = x.mid_size
    z.d1  = x.mid_d1
    z.d2  = x.mid_d2
    return z
end

function radius_byref(x::ArbBall{P}) where {P}
    z = Mag()
    z.exp = x.rad_exp
    z.man = x.rad_man
    return z
end

midpoint(x::ArbBall{P}, ::Type{ArbFloat{P}}) where {P} = midpoint_byref(x)
radius(x::ArbBall{P}, ::Type{Mag}) where {P} = radius_byref(x)

function radius(x::ArbBall{P}, ::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    mag = radius_byref(x)
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{ArbFloat}, Ref{Mag}), z, mag)
    return z
end

