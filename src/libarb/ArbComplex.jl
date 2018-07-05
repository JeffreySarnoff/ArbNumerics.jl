# ArbComplex structs hold complex balls given as ArbBall pairs

mutable struct ArbComplex{P}  <: Complex  # P is the precision in bits
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


    function ArbComplex{P}() where {P}
        z = new{P}()
        ccall(@libarb(acb_init), Cvoid, (Ref{ArbComplex},), z)
        finalizer(clear_acb, z)
        return z
    end
end

clear_acb(x::ArbComplex{P}) where {P} = ccall(@libarb(acb_clear), Cvoid, (Ref{ArbComplex},), x)

ArbComplex{P}(x::ArbComplex{P}) where {P} = x
ArbComplex(x::ArbComplex{P}) where {P} = x

ArbComplex{P}(x::Missing) where {P} = missing
ArbComplex(x::Missing) = missing

ArbComplex(x, prec::Int) = prec>=MINIMUM_PRECISION ? ArbComplex{workingbits(prec)}(x) : throw(DomainError("bit precision ($prec) is too low"))
ArbComplex(x, y, prec::Int) = prec>=MINIMUM_PRECISION ? ArbComplex{workingbits(prec)}(x, y) : throw(DomainError("bit precision ($prec) is too low"))

@inline sign_bit(x::ArbComplex{P}) where {P} = isodd(x.real_mid_size)
@inline sign_bits(x::ArbComplex{P}) where {P} = isodd(x.real_mid_size), isodd(x.imag_mid_size)
@inline sign_bit(x::ArbComplex{P}, ::Type{RealPart}) where {P} = isodd(x.real_mid_size)
@inline sign_bit(x::ArbComplex{P}, ::Type{ImagPart}) where {P} = isodd(x.imag_mid_size)

# ArbComplex{P}(sqrt(2.0))
function ArbComplex{P}(rea::Float64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d), Cvoid, (Ref{ArbComplex}, Float64), z, rea)
    return z
end

function ArbComplex{P}(rea::Cint) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si), Cvoid, (Ref{ArbComplex}, Cint), z, rea)
    return z
end


function ArbComplex{P}(rea::ArbFloat{P}) where {P}
    x = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), x, rea)
    y = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), y, x)
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{ArbComplex}, Ref{ArbBall}), z, y)
    return z
end

function ArbComplex{P}(rea::ArbBall{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb), Cvoid, (Ref{ArbComplex}, Ref{ArbBall}), z, rea)
    return z
end

# ArbComplex{P}(sqrt(2.0), inv(17.0))
function ArbComplex{P}(re::Float64, im::Float64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_d_d), Cvoid, (Ref{ArbComplex}, Float64, Float64), z, re, im)
    return z
end

function ArbComplex{P}(x::Int64, y::Int64) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_si_si), Cvoid, (Ref{ArbComplex}, Cint, Cint, Clong), z, x, y, P)
    return z
end


function copy(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end

deepcopy(x::ArbComplex{P}) where {P} = copy(x)


function ArbComplex{P}(x::ArbComplex{Q}, roundingmode::RoundingMode) where {P,Q}
    z = ArbComplex{P}()
    rounding = match_rounding_mode(roundingmode)
    res = ccall(@libarb(acb_set_round), Cint,
                (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Cint), z, x, P, rounding)
    return z
end

ArbComplex(x::ArbFloat{P}) where {P} = ArbComplex{P}(x)
ArbComplex(x::ArbBall{P}) where {P} = ArbComplex{P}(x)
ArbComplex(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = ArbComplex{P}(x,y)
ArbComplex(x::ArbBall{P}, y::ArbBall{P}) where {P} = ArbComplex{P}(x,y)
ArbComplex(x::ArbFloat{P}, y::ArbBall{P}) where {P} = ArbComplex{P}(ArbBall{P}(x),y)
ArbComplex(x::ArbBall{P}, y::ArbFloat{P}) where {P} = ArbComplex{P}(x,ArbBall{P}(y))


function ArbComplex{P}(x::T) where {P,T<:Integer}
    y = ArbBall{P}(x)
    z = ArbComplex{P}(y)
    return z
end


function ArbComplex{P}(x::T1, y::T2) where {P,T1<:Union{Integer,AbstractFloat},T2<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z  = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::Irrational{S}) where {P,S}
    y = ArbBall{P}(x)
    z = ArbComplex{P}(y)
    return z
end

function ArbComplex{P}(x::Irrational{S1}, y::Irrational{S2}) where {P,S1,S2}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z  = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::Irrational{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::Irrational{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbFloat{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbBall{P}) where {P,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    z = ArbComplex{P}(x1, y)
    return z
end
function ArbComplex{P}(x::ArbBall{P}, y::T) where {P,T<:Union{Integer,AbstractFloat}}
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x, y1)
    return z
end

function ArbComplex{P}(x::ArbFloat{P}, y::ArbBall{P}) where {P}
    x1 = ArbBall{P}(x)
    z = ArbComplex{P}(x1, y)
    return z
end
function ArbComplex{P}(x::ArbBall{P}, y::ArbFloat{P}) where {P}
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x, y1)
    return z
end

function ArbComplex{P}(x::T, y::ArbFloat{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::T, y::ArbBall{S}) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbBall{S}, y::T) where {P,S,T<:Union{Integer,AbstractFloat}}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S1}, y::ArbFloat{S2}) where {P,S1,S2}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbBall{S1}, y::ArbBall{S2}) where {P,S1,S2}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbFloat{S1}, y::ArbBall{S2}) where {P,S1,S2}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end
function ArbComplex{P}(x::ArbBall{S1}, y::ArbFloat{S2}) where {P,S1,S2}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    z = ArbComplex{P}(x1, y1)
    return z
end


function midpoint(x::ArbComplex{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = ArbBall{P}()
    zimag = ArbBall{P}()
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), zreal, xreal)
    ccall(@libarb(arb_get_mid_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), zimag, ximag)
    return ArbComplex{P}(zreal, zimag)
end

function radius(x::ArbComplex{P}) where {P}
    xreal = real(x)
    ximag = imag(x)
    zreal = ArbBall{P}()
    zimag = ArbBall{P}()
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), zreal, xreal)
    ccall(@libarb(arb_get_rad_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), zimag, ximag)
    return ArbComplex{P}(zreal, zimag)
end
