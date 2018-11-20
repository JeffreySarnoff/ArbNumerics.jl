function setinterval(lo::ArbFloat{P}, hi::ArbFloat{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_interval_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}, Ref{ArbFloat}, Clong), z, lo, hi, P)
    return z
end

function setinterval(lo::ArbReal{P}, hi::ArbReal{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    setinterval(lowerbound(lo, ArbFloat), upperbound(hi, ArbFloat))
end

function interval(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    ArbFloat{P}(lowerbound(x)), ArbFloat{P}(upperbound(x))
end

function interval(x::ArbReal{P}) where {P}
    lowerbound(x), upperbound(x)
end

function setball(mid::ArbFloat{P}, rad::ArbFloat{P}) where {P}
    signbit(rad) && throw(ErrorException("nonnegative radius required ($rad)"))
    lbound = mid - rad
    ubound = mid + rad
    setinterval(lbound, ubound)
end

function setball(mid::ArbReal{P}, rad::ArbReal{P}) where {P}
    signbit(rad) && throw(ErrorException("nonnegative radius required ($rad)"))
    setball(ArbFloat{P}(mid), ArbFloat{P}(rad))
end

function ball(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    ArbFloat{P}(midpoint(x)), ArbFloat{P}(radius(x))
end

function ball(x::ArbReal{P}) where {P}
    midpoint(x), radius(x)
end

function ball(x::ArbFloat{P}) where {P}
    x, zero(typeof(x))
end


@inline function upperbound(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), w, x, P)
    return w
end

function upperbound(x::ArbReal{P}) where {P}
    w = upperbound(x, ArbFloat)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, w)
    return z
end

@inline function lowerbound(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), w, x, P)
    return w
end

function lowerbound(x::ArbReal{P}) where {P}
    w = lowerbound(x, ArbFloat)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, w)
    return z
end


@inline function upperbound_abs(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), w, x, P)
    return w
end

function upperbound_abs(x::ArbReal{P}) where {P}
    w = upperbound_abs(x, ArbFloat)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, w)
    return z
end

@inline function lowerbound_abs(x::ArbReal{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), w, x, P)
    return w
end

function lowerbound_abs(x::ArbReal{P}) where {P}
    w = lowerbound(x, ArbFloat)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, w)
    return z
end

function interval_abs(x::ArbReal{P}) where {P}
    lo = lowerbound_abs(x)
    hi = upperbound_abs(x)
    return lo, hi
end



function increase_radius(x::ArbReal{P}, err::ArbFloat{P}) where {P}
    err >= 0 || throw(ErrorException("nonnegative err required ($err)"))
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), x, err)
    return x
end

function increase_radius(x::ArbReal{P}, err::ArbReal{P}) where {P}
    err >= 0 || throw(ErrorException("nonnegative err required ($err)"))
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), x, err)
    return x
end

increase_radius(x::ArbReal{P}) where {P} = increase_radius(x, ulp(x))

function decrease_radius(x::ArbReal{P}, err::ArbFloat{P}) where {P}
    err = -abs(err)
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), x, err)
    return x
end

function decrease_radius(x::ArbReal{P}, err::ArbReal{P}) where {P}
    err = -abs(err)
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), x, err)
    return x
end

decrease_radius(x::ArbReal{P}) where {P} = decrease_radius(x, ulp(x))
