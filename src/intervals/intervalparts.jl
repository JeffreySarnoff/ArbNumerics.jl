function setinterval(lo::ArbFloat{P}, hi::ArbFloat{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    z = ArbBall{P}()
    ccall(@libarb(arb_set_interval_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}, Ref{ArbFloat}, Clong), z, lo, hi, P)
    return z
end

function setinterval(lo::ArbBall{P}, hi::ArbBall{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    setinterval(lowerbound(lo, ArbFloat), upperbound(hi, ArbFloat))
end

function getinterval(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    ArbFloat{P}(lowerbound(x)), ArbFloat{P}(upperbound(x))
end

function getinterval(x::ArbBall{P}) where {P}
   lowerbound(x), upperbound(x)
end

function setball(mid::ArbFloat{P}, rad::ArbFloat{P}) where {P}
    signbit(rad) && throw(ErrorException("nonnegative radius required ($rad)"))
    lbound = mid - rad
    ubound = mid + rad
    setinterval(lbound, ubound)
end

function setball(mid::ArbBall{P}, rad::ArbBall{P}) where {P}
    signbit(rad) && throw(ErrorException("nonnegative radius required ($rad)"))
    setball(ArbFloat{P}(mid), ArbFloat{P}(rad))
end

function getball(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    ArbFloat{P}(midpoint(x)), ArbFloat{P}(radius(x))
end

function getball(x::ArbBall{P}) where {P}
    midpoint(x), radius(x)
end

function getball(x::ArbFloat{P}) where {P}
    x, zero(typeof(x))
end


@inline function upperbound(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbBall}, Clong), w, x, P)
    return w
end

function upperbound(x::ArbBall{P}) where {P}
    w = upperbound(x, ArbFloat)
    z = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), z, w)
    return z
end

@inline function lowerbound(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbBall}, Clong), w, x, P)
    return w
end

function lowerbound(x::ArbBall{P}) where {P}
    w = lowerbound(x, ArbFloat)
    z = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), z, w)
    return z
end

function bounds(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    lowerbound(x, ArbFloat), upperbound(x, ArbFloat)
end

function bounds(x::ArbBall{P}) where {P}
    lowerbound(x), upperbound(x)
end


@inline function upperbound_abs(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbBall}, Clong), w, x, P)
    return w
end

function upperbound_abs(x::ArbBall{P}) where {P}
    w = upperbound_abs(x, ArbFloat)
    z = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), z, w)
    return z
end

@inline function lowerbound_abs(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    w = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbBall}, Clong), w, x, P)
    return w
end

function lowerbound_abs(x::ArbBall{P}) where {P}
    w = lowerbound(x, ArbFloat)
    z = ArbBall{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), z, w)
    return z
end

function bounds_abs(x::ArbBall{P}, ::Type{ArbFloat}) where {P}
    lowerbound_abs(x, ArbFloat), upperbound_abs(x, ArbFloat)
end

function bounds_abs(x::ArbBall{P}) where {P}
    lowerbound_abs(x), upperbound_abs(x)
end


function increase_radius(x::ArbBall{P}, err::ArbFloat{P}) where {P}
    err >= 0 || throw(ErrorException("nonnegative err required ($err)"))
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), x, err)
    return x
end

function increase_radius(x::ArbBall{P}, err::ArbBall{P}) where {P}
    err >= 0 || throw(ErrorException("nonnegative err required ($err)"))
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), x, err)
    return x
end

increase_radius(x::ArbBall{P}) where {P} = increase_radius(x, ulp(x))

function decrease_radius(x::ArbBall{P}, err::ArbFloat{P}) where {P}
    err = -abs(err)
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{ArbBall}, Ref{ArbFloat}), x, err)
    return x
end

function decrease_radius(x::ArbBall{P}, err::ArbBall{P}) where {P}
    err = -abs(err)
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), x, err)
    return x
end

decrease_radius(x::ArbBall{P}) where {P} = decrease_radius(x, ulp(x))
