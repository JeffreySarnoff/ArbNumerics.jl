# Acb structs hold complex balls given as Arb pairs

mutable struct Acb{P}    # P is the precision in bits
                         #      real midpoint
    real_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    real_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    real_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    real_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                         #      real radius
    real_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    real_rad_man::UInt   # mp_limb_t  radius, unsigned by definition
                         #      imaginary midpoint
    imag_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    imag_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    imag_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    imag_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
                         #      imaginary radius
    imag_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    imag_rad_man::UInt   # mp_limb_t  radius, unsigned by definition


    function Acb{P}() where {P}
        z = new{P}()
        ccall(@libarb(acb_init), Cvoid, (Ref{Acb},), z)
        finalizer(clear_acb, z)
        return z
    end
end

clear_acb(x::Acb{P}) where {P} = ccall(@libarb(acb_clear), Cvoid, (Ref{Acb},), x)

Acb{P}(x::Acb{P}) where {P} = x
Acb(x::Acb{P}) where {P} = x

Acb(x, prec::Int) = prec>=MINIMUM_PRECISION ? Acb{workingbits(prec)}(x) : throw(DomainError("bit precision ($prec) is too low"))
Acb(x, y, prec::Int) = prec>=MINIMUM_PRECISION ? Acb{workingbits(prec)}(x, y) : throw(DomainError("bit precision ($prec) is too low"))

@inline sign_bit(x::Acb{P}) where {P} = isodd(x.real_mid_size)
@inline sign_bits(x::Acb{P}) where {P} = isodd(x.real_mid_size), isodd(x.imag_mid_size)
@inline sign_bit(x::Acb{P}, ::Type{RealPart}) where {P} = isodd(x.real_mid_size)
@inline sign_bit(x::Acb{P}, ::Type{ImagPart}) where {P} = isodd(x.imag_mid_size)

# Acb{P}(sqrt(2.0))
function Acb{P}(rea::Float64) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_d), Cvoid, (Ref{Acb}, Float64), z, rea)
    return z
end

function Acb{P}(rea::Cint) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_si), Cvoid, (Ref{Acb}, Cint), z, rea)
    return z
end


function Acb{P}(rea::Arf{P}) where {P}
    x = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), x, rea)
    y = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), y, x)
    z = Acb{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{Acb}, Ref{Arb}), z, y)
    return z
end

function Acb{P}(rea::Arb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{Acb}, Ref{Arb}), z, rea)
    return z
end

# Acb{P}(sqrt(2.0), inv(17.0))
function Acb{P}(re::Float64, im::Float64) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_d_d), Cvoid, (Ref{Acb}, Float64, Float64), z, re, im)
    return z
end

function Acb{P}(x::Int64, y::Int64) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_si_si), Cvoid, (Ref{Acb}, Cint, Cint, Clong), z, x, y, P)
    return z
end


function copy(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set), Cvoid, (Ref{Acb}, Ref{Acb}), z, x)
    return z
end

deepcopy(x::Acb{P}) where {P} = copy(x)


function Acb{P}(x::Acb{Q}, roundingmode::RoundingMode) where {P,Q}
    z = Acb{P}()
    rounding = match_rounding_mode(roundingmode)
    res = ccall(@libarb(acb_set_round), Cint,
                (Ref{Acb}, Ref{Acb}, Clong, Cint), z, x, P, rounding)
    return z
end

Acb(x::Arf{P}) where {P} = Acb{P}(x)
Acb(x::Arb{P}) where {P} = Acb{P}(x)
Acb(x::Arf{P}, y::Arf{P}) where {P} = Acb{P}(x,y)
Acb(x::Arb{P}, y::Arb{P}) where {P} = Acb{P}(x,y)
Acb(x::Arf{P}, y::Arb{P}) where {P} = Acb{P}(Arb{P}(x),y)
Acb(x::Arb{P}, y::Arf{P}) where {P} = Acb{P}(x,Arb{P}(y))


function Acb{P}(x::T) where {P,T<:Integer}
    y = Arb{P}(x)
    z = Acb{P}(y)
    return z
end


function Acb{P}(x::T1, y::T2) where {P,T1<:Union{Integer,AbstractFloat},T2<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z  = Acb{P}(x1, y1)
    return z
end

function Acb{P}(x::Irrational{S}) where {P,S}
    y = Arb{P}(x)
    z = Acb{P}(y)
    return z
end

function Acb{P}(x::Irrational{S1}, y::Irrational{S2}) where {P,S1,S2}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z  = Acb{P}(x1, y1)
    return z
end

function Acb{P}(x::Irrational{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end

function Acb{P}(x::T, y::Irrational{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end

function Acb{P}(x::T, y::Arf{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arf{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end

function Acb{P}(x::T, y::Arb{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    z = Acb{P}(x1, y)
    return z
end
function Acb{P}(x::Arb{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    y1 = Arb{P}(y)
    z = Acb{P}(x, y1)
    return z
end

function Acb{P}(x::Arf{P}, y::Arb{P}) where {P}
    x1 = Arb{P}(x)
    z = Acb{P}(x1, y)
    return z
end
function Acb{P}(x::Arb{P}, y::Arf{P}) where {P}
    y1 = Arb{P}(y)
    z = Acb{P}(x, y1)
    return z
end

function Acb{P}(x::T, y::Arf{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arf{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::T, y::Arb{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arb{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arf{S1}, y::Arf{S2}) where {P,S1,S2}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arb{S1}, y::Arb{S2}) where {P,S1,S2}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arf{S1}, y::Arb{S2}) where {P,S1,S2}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end
function Acb{P}(x::Arb{S1}, y::Arf{S2}) where {P,S1,S2}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    z = Acb{P}(x1, y1)
    return z
end


function midpoint(x::Acb{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = Arb{P}()
    zimag = Arb{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{Arb}, Ref{Arb}), zreal, xreal)
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{Arb}, Ref{Arb}), zimag, ximag)
    return Acb{P}(zreal, zimag)
end

function radius(x::Acb{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = Arb{P}()
    zimag = Arb{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{Arb}, Ref{Arb}), zreal, xreal)
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{Arb}, Ref{Arb}), zimag, ximag)
    return Acb{P}(zreal, zimag)
end
