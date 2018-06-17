const Analytic = Cint(1)


function square(x::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    w = square(x1)
    z = midpoint_byref(w)
    return z
end

function square(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, P)
    return z
end

function square(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_sqr), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end


function cube(x::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    w = square(x1)
    w *= x1
    z = midpoint_byref(w)
    return z
end

function cube(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, P)
    z *= x
    return z
end

function cube(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_cube), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

function sqrt(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_sqrt), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end

function sqrt(x::ArbBall{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbBall{P}()
    ccall(@libarb(arb_sqrt), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong, Cint), z, x, P, rounding)
    return z
end

function sqrt(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_sqrt_analytic), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong), z, x, Analytic, P)
    return z
end


function rsqrt(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_rsqrt), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::ArbBall{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbBall{P}()
    ccall(@libarb(arb_rsqrt), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_rsqrt_analytic), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong), z, x, Analytic, P)
    return z
end

cbrt(x::ArbFloat{P}) where {P} = root(x, 3)
cbrt(x::ArbBall{P}) where {P} = root(x, 3)
cbrt(x::ArbComplex{P}) where {P} = root(x, 3)

rcbrt(x::ArbFloat{P}) where {P} = root(1/x, 3)
rcbrt(x::ArbBall{P}) where {P} = root(1/x, 3)
rcbrt(x::ArbComplex{P}) where {P} = root(1/x, 3)




function hypot(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    w = hypot(x1, y1)
    z = midpoint_byref(w)
    return z
end

function hypot(x::ArbBall{P}, y::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_hypot), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, P)
    return z
end

function hypot(x::ArbComplex{P}, y::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypot), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, y, P)
    return z
end

"""
    addmul(x, y, z)

x + (y * z)
"""
addmul(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} = muladd(y, z, x)

"""
    submul(x, y, z)

x - (y * z)
"""
submul(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} = -muladd(y, z, -x)

"""
    mulsub(x, y, z)

(x * y) - z
"""
addmul(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} = muladd(x, y, -z)

fma((x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} = muladd(x, y, z)


        
function pow(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    w = pow(x1, y1)
    z = midpoint_byref(w)
    return z
end

function pow(x::ArbBall{P}, y::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_pow), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, P)
    return z
end

function pow(x::ArbComplex{P}, y::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_pow), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, y, P)
    return z
end

function pow(x::ArbFloat{P}, y::T) where {P, T<:Integer}
    x1 = ArbBall{P}(x)
    w = pow(x1, y)
    z = midpoint_byref(w)
    return z
end

function pow(x::ArbBall{P}, y::T) where {P, T<:Integer}
    z = ArbBall{P}()
    u = Culong(y)
    ccall(@libarb(arb_pow_ui), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Culong, Clong), z, x, u, P)
    return z
end

function pow(x::ArbComplex{P}, y::T) where {P, T<:Integer}
    z = ArbComplex{P}()
    u = Culong(y)
    ccall(@libarb(acb_pow_ui), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Culong, Clong), z, x, u, P)
    return z
end

pow(x::ArbFloat{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbFloat{P}(y))
pow(x::ArbBall{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbBall{P}(y))
pow(x::ArbComplex{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbComplex{P}(y))

function root(x::ArbFloat{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    x1 = ArbBall{P}(x)
    w = root(x1, y)
    z = midpoint_byref(w)
    return z
end
root(x::ArbFloat{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)

function root(x::ArbBall{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    z = ArbBall{P}()
    u = Culong(y)
    ccall(@libarb(arb_root_ui), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Culong, Clong), z, x, u, P)
    return z
end
root(x::ArbBall{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)

function root(x::ArbComplex{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    z = ArbComplex{P}()
    u = Culong(y)
    ccall(@libarb(acb_root_ui), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Culong, Clong), z, x, u, P)
    return z
end
root(x::ArbComplex{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)
