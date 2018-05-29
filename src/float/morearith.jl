function sqrt(x::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Arf{P}()
    rnd = ccall(@libarb(arf_sqrt), Cint, (Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, P, rounding)
    return z
end

function sqrt(x::Arb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Arb{P}()
    ccall(@libarb(arb_sqrt), Cvoid, (Ref{Arb}, Ref{Arb}, Clong, Cint), z, x, P, rounding)
    return z
end

const Analytic = Cint(1)

function sqrt(x::Acb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Acb{P}()
    ccall(@libarb(acb_sqrt_analytic), Cvoid, (Ref{Acb}, Ref{Acb}, Cint, Clong, Cint), z, x, Analytic, P, rounding)
    return z
end

function rsqrt(x::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Arf{P}()
    rnd = ccall(@libarb(arf_rsqrt), Cint, (Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::Arb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Arb{P}()
    ccall(@libarb(arb_rsqrt), Cvoid, (Ref{Arb}, Ref{Arb}, Clong, Cint), z, x, P, rounding)
    return z
end

function rsqrt(x::Acb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = Acb{P}()
    ccall(@libarb(acb_rsqrt_analytic), Cvoid, (Ref{Acb}, Ref{Acb}, Cint, Clong, Cint), z, x, Analytic, P, rounding)
    return z
end



function square(x::Arf{P}) where {P}
    x1 = Arb{P}(x)
    w = square(x1)
    z = midpoint_byref(w)
    return z
end

function square(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{Arb}, Ref{Arb}, Clong), z, x, P)
    return z
end

function square(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_sqr), Cvoid, (Ref{Acb}, Ref{Acb}, Clong), z, x, P)
    return z
end


function cube(x::Arf{P}) where {P}
    x1 = Arb{P}(x)
    w = square(x1)
    w *= x1
    z = midpoint_byref(w)
    return z
end

function cube(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_sqr), Cvoid, (Ref{Arb}, Ref{Arb}, Clong), z, x, P)
    z *= x
    return z
end

function cube(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_cube), Cvoid, (Ref{Acb}, Ref{Acb}, Clong), z, x, P)
    return z
end


function hypot(x::Arf{P}, y::Arf{P}) where {P}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    w = hypot(x1, y1)
    z = midpoint_byref(w)
    return z
end

function hypot(x::Arb{P}, y::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_hypot), Cvoid, (Ref{Arb}, Ref{Arb}, Ref{Arb}, Clong), z, x, y, P)
    return z
end

function hypot(x::Acb{P}, y::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_hypot), Cvoid, (Ref{Acb}, Ref{Acb}, Ref{Acb}, Clong), z, x, y, P)
    return z
end


function pow(x::Arf{P}, y::Arf{P}) where {P}
    x1 = Arb{P}(x)
    y1 = Arb{P}(y)
    w = pow(x1, y1)
    z = midpoint_byref(w)
    return z
end

function pow(x::Arb{P}, y::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_pow), Cvoid, (Ref{Arb}, Ref{Arb}, Ref{Arb}, Clong), z, x, y, P)
    return z
end

function pow(x::Acb{P}, y::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_pow), Cvoid, (Ref{Acb}, Ref{Acb}, Ref{Acb}, Clong), z, x, y, P)
    return z
end

function pow(x::Arf{P}, y::T) where {P, T<:Integer}
    x1 = Arb{P}(x)
    w = pow(x1, y)
    z = midpoint_byref(w)
    return z
end

function pow(x::Arb{P}, y::T) where {P, T<:Integer}
    z = Arb{P}()
    u = Culong(y)
    ccall(@libarb(arb_pow_ui), Cvoid, (Ref{Arb}, Ref{Arb}, Culong, Clong), z, x, u, P)
    return z
end

function pow(x::Acb{P}, y::T) where {P, T<:Integer}
    z = Acb{P}()
    u = Culong(y)
    ccall(@libarb(acb_pow_ui), Cvoid, (Ref{Acb}, Ref{Acb}, Culong, Clong), z, x, u, P)
    return z
end

pow(x::Arf{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, Arf{P}(y))
pow(x::Arb{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, Arb{P}(y))
pow(x::Acb{P}, y::T) where {P, T<:Union{Integer,AbstractFloat}} = pow(x, Acb{P}(y))

function root(x::Arf{P}, y::T) where {P, T<:Integer}
    x1 = Arb{P}(x)
    w = root(x1, y)
    z = midpoint_byref(w)
    return z
end

function root(x::Arb{P}, y::T) where {P, T<:Integer}
    z = Arb{P}()
    u = Culong(y)
    ccall(@libarb(arb_root_ui), Cvoid, (Ref{Arb}, Ref{Arb}, Culong, Clong), z, x, u, P)
    return z
end

function root(x::Acb{P}, y::T) where {P, T<:Integer}
    z = Acb{P}()
    u = Culong(y)
    ccall(@libarb(acb_root_ui), Cvoid, (Ref{Arb}, Ref{Arb}, Culong, Clong), z, x, u, P)
    return z
end
