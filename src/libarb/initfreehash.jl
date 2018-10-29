# Arb C Library Types

#=

Arb Fmpz Type

mutable struct Fmpz <: Signed
    d::Int
    
    function Fmpz()
        z = new(0)
        finalizer(fmpz_clear, z)
        return z
    end
end

Fmpz(x::Fmpz) = x  #  "to redo is to do"

zero(Fmpz) == Fmpz(0)


@inline fmpz_clear(a::Fmpz)
    ccall(@libflint(fmpz_clear), Cvoid, (Ref{Fmpz},), a)
end
#   a very large snake tree-dweller is banished


@inline function fmpz_clear(x::Fmpz)
    ccall(@libarb(mag_clear), Cvoid, (Ref{ArbMag},), x)
    return nothing
end

fmpz_clear(a::Fmpz) = ccall(@libflint(fmpz_clear), Cvoid, (Ref{Fmpz},), a)


#=

Arb Mag Type

typedef struct
{
    fmpz exp;
    mp_limb_t man;
}
mag_struct;

MAG_INLINE void
mag_init(mag_t x)
{
    fmpz_init(MAG_EXPREF(x));
    MAG_MAN(x) = 0;
}

void mag_clear(mag_t x);

=#


# using the same field names that Nemo.jl uses

mutable struct ArbMag
    exp::Int        # fmpz       radius, exponent of 2 (2^exp)
    man::UInt       # mp_limb_t  radius, unsigned by definition
end

#=
    release the elapsed number
    free an elapsed or otherwise inaccesible number
       to Julia's garbage collector and from C memory
=#


fmpz_clear(a::Fmpz) = ccall(@libflint(fmpz_clear), Cvoid, (Ref{Fmpz},), a)
@inline function fmpz_clear(x::Fmpz)
    ccall(@libarb(mag_clear), Cvoid, (Ref{ArbMag},), x)
    return nothing
end

@inline function mag_clear(x::ArbMag)
    ccall(@libarb(mag_clear), Cvoid, (Ref{ArbMag},), x)
    return nothing
end

@inline function arf_clear(x::ArbFloat{P}) where {P}
    call(@libarb(arf_clear), Cvoid, (Ref{ArbFloat},), x)
    return nothing
end

@inline function arb_clear(x::ArbReal{P}) where {P}
    call(@libarb(arb_clear), Cvoid, (Ref{ArbReal},), x)
    return nothing
end

@inline function acb_clear(x::ArbComplex{P}) where {P}
    call(@libarb(acb_clear), Cvoid, (Ref{ArbComplex},), x)
    return nothing
end





mutable struct Fmpz <: Signed
    d::Int
    
    function Fmpz()
        z = new(0)
        finalizer(fmpz_clear, z)
        return z
    end
    
    function Fmpz(x::Int)
        z = new(x)
        finalizer(fmpz_clear, z)
        return z
    end
end

Fmpz(x::Fmpz) = x

fmpz_clear(a::Fmpz) = ccall(@libflint(fmpz_clear), Cvoid, (Ref{Fmpz},), a)








function ArbMag()
    z = ArbMag(zero(Int), zero(UInt))
    ccall(@libarb(mag_init), Cvoid, (Ref{ArbMag},), z)
    finalizer(mag_clear, z)
    return z
end


Mag(x::Mag) = x
