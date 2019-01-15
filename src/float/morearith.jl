function square(x::ArbFloat{P}; roundingmode::RoundingMode=RoundNearest) where {P}
    z = ArbFloat{P}()
    rounding = match_rounding_mode(roundingmode)
    ccall(@libarb(arf_mul_rnd_any), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, x, P, rounding)
    return z
end

function square(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, P)
    return z
end

function square(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_sqr), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end


function cube(x::ArbFloat{P}) where {P}
    x1 = ArbReal{P}(x)
    w = square(x1)
    w *= x1
    z = midpoint_byref(w)
    return z
end

function cube(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, P)
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

function sqrt(x::ArbReal{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbReal{P}()
    ccall(@libarb(arb_sqrt), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong, Cint), z, x, P, rounding)
    return z
end

function sqrt(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_sqrt), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end


function rsqrt(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_rsqrt), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::ArbReal{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ArbReal{P}()
    ccall(@libarb(arb_rsqrt), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_rsqrt), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

cbrt(x::ArbFloat{P}) where {P} = root(x, 3)
cbrt(x::ArbReal{P}) where {P} = root(x, 3)
cbrt(x::ArbComplex{P}) where {P} = root(x, 3)

rcbrt(x::ArbFloat{P}) where {P} = root(1/x, 3)
rcbrt(x::ArbReal{P}) where {P} = root(1/x, 3)
rcbrt(x::ArbComplex{P}) where {P} = root(1/x, 3)

function hypot(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    w = hypot(x1, y1)
    z = midpoint_byref(w)
    return z
end

function hypot(x::ArbReal{P}, y::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_hypot), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, P)
    return z
end

function hypot(x::ArbComplex{P}, y::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypot), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, y, P)
    return z
end
        
function pow(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    w = pow(x1, y1)
    z = midpoint_byref(w)
    return z
end

function pow(x::ArbReal{P}, y::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_pow), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, P)
    return z
end

function pow(x::ArbComplex{P}, y::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_pow), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, y, P)
    return z
end

function pow(x::ArbFloat{P}, y::T) where {P, T<:Integer}
    x1 = ArbReal{P}(x)
    w = pow(x1, y)
    z = midpoint_byref(w)
    return z
end

function pow(x::ArbReal{P}, y::T) where {P, T<:Integer}
    z = ArbReal{P}()
    u = Culong(y)
    ccall(@libarb(arb_pow_ui), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Culong, Clong), z, x, u, P)
    return z
end

function pow(x::ArbComplex{P}, y::T) where {P, T<:Integer}
    z = ArbComplex{P}()
    u = Culong(y)
    ccall(@libarb(acb_pow_ui), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Culong, Clong), z, x, u, P)
    return z
end

pow(x::ArbFloat{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbFloat{P}(y))
pow(x::ArbReal{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbReal{P}(y))
pow(x::ArbComplex{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, ArbComplex{P}(y))

function root(x::ArbFloat{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    x1 = ArbReal{P}(x)
    w = root(x1, y)
    z = midpoint_byref(w)
    return z
end
root(x::ArbFloat{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)

function root(x::ArbReal{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    z = ArbReal{P}()
    u = Culong(y)
    ccall(@libarb(arb_root_ui), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Culong, Clong), z, x, u, P)
    return z
end
root(x::ArbReal{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)

function root(x::ArbComplex{P}, y::T) where {P, T<:Integer}
    y < 0 && return pow(x, abs(y))
    z = ArbComplex{P}()
    u = Culong(y)
    ccall(@libarb(acb_root_ui), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Culong, Clong), z, x, u, P)
    return z
end
root(x::ArbComplex{P}, y::T) where {P, T<:AbstractFloat} = pow(x, -y)



function factorial(x::Signed) where {P}
    z = ArbReal{P}()
    u = Culong(x)
    ccall(@libarb(arb_fac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return z
end

function factorial(x::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    u = Culong(Clong(x))
    ccall(@libarb(arb_fac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return midpoint_byref(z)
end

function factorial(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    u = Culong(Clong(x))
    ccall(@libarb(arb_fac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return z
end

function doublefactorial(x::Signed) where {P}
    z = ArbReal{P}()
    u = Culong(x)
    ccall(@libarb(arb_doublefac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return z
end

function doublefactorial(x::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    u = Culong(Clong(x))
    ccall(@libarb(arb_doublefac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return midpoint_byref(z)
end

function doublefactorial(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    u = Culong(Clong(x))
    ccall(@libarb(arb_doublefac_ui), Cvoid, (Ref{ArbReal}, Culong, Clong), z, u, P)
    return z
end


function risingfactorial(x::Signed, n::Signed) where {P}
    z = ArbReal{P}()
    ux = Culong(x)
    un = Culong(n)        
    ccall(@libarb(arb_rising_ui), Cvoid, (Ref{ArbReal}, Culong, Culong, Clong), z, ux, un, P)
    return z
end

function risingfactorial(x::ArbFloat{P}, n::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    ux = Culong(Clong(x))
    un = Culong(Clong(n))
    ccall(@libarb(arb_rising_ui), Cvoid, (Ref{ArbReal}, Culong, Culong, Clong), z, ux, un, P)
    return midpoint_byref(z)
end

function risingfactorial(x::ArbReal{P}, n::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    u = Culong(Clong(x))
    ccall(@libarb(arb_fac_ui), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, n, P)
    return z
end
    

function binomial(n::ArbFloat{P}, k::ArbFloat{P}) where {P}
    z = ArbReal{P}()
    un = Culong(Clong(n))
    uk = Culong(Clong(k))
    ccall(@libarb(arb_bin_uiui), Cvoid, (Ref{ArbReal}, Culong, Culong, Clong), z, ux, un, P)
    return midpoint_byref(z)
end 

function binomial(n::ArbReal{P}, k::ArbReal{P}) where {P}
    z = ArbReal{P}()
    un = Culong(Clong(n))
    uk = Culong(Clong(k))
    ccall(@libarb(arb_bin_uiui), Cvoid, (Ref{ArbReal}, Culong, Culong, Clong), z, ux, un, P)
    return z
end
