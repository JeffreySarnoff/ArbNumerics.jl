function setinterval(lo::Arf{P}, hi::Arf{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    z = Arb{P}()
    ccall(@libarb(arb_set_interval_arf), Cvoid, (Ref{Arb}, Ref{Arf}, Ref{Arf}, Clong), z, lo, hi, P)
    return z
end

function setinterval(lo::Arb{P}, hi::Arb{P}) where {P}
    lo > hi && return setinterval(hi, lo)
    setinterval(lowerbound(lo, Arf), upperbound(hi, Arf))
end

function getinterval(x::Arb{P}, ::Type{Arf}) where {P}
    Arf{P}(lowerbound(x)), Arf{P}(upperbound(x))
end

function getinterval(x::Arb{P}) where {P}
   lowerbound(x), upperbound(x)
end

function setball(mid::Arf{P}, rad::Arf{P}) where {P}
    lbound = mid - rad
    ubound = mid + rad
    setinterval(lbound, ubound)
end

function setball(mid::Arb{P}, rad::Arb{P}) where {P}
    setball(Arf{P}(mid), Arf{P}(rad))
end

function getball(x::Arb{P}, ::Type{Arf}) where {P}
    Arf{P}(midpoint(x)), Arf{P}(radius(x))
end

function getball(x::Arb{P}) where {P}
    midpoint(x), radius(x)
end


@inline function upperbound(x::Arb{P}, ::Type{Arf}) where {P}
    w = Arf{P}()  
    ccall(@libarb(arb_get_ubound_arf), Cvoid, (Ref{Arf}, Ref{Arb}, Clong), w, x, P)
    return w
end

function upperbound(x::Arb{P}) where {P}
    w = upperbound(x, Arf)
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, w)
    return z
end

@inline function lowerbound(x::Arb{P}, ::Type{Arf}) where {P}
    w = Arf{P}()  
    ccall(@libarb(arb_get_lbound_arf), Cvoid, (Ref{Arf}, Ref{Arb}, Clong), w, x, P)
    return w
end

function lowerbound(x::Arb{P}) where {P}
    w = lowerbound(x, Arf)
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, w)
    return z
end

function bounds(x::Arb{P}, ::Type{Arf}) where {P}
    lowerbound(x, Arf), upperbound(x, Arf)
end

function bounds(x::Arb{P}) where {P}
    lowerbound(x), upperbound(x)
end


@inline function upperbound_abs(x::Arb{P}, ::Type{Arf}) where {P}
    w = Arf{P}()  
    ccall(@libarb(arb_get_abs_ubound_arf), Cvoid, (Ref{Arf}, Ref{Arb}, Clong), w, x, P)
    return w
end

function upperbound_abs(x::Arb{P}) where {P}
    w = upperbound_abs(x, Arf)
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, w)
    return z
end

@inline function lowerbound_abs(x::Arb{P}, ::Type{Arf}) where {P}
    w = Arf{P}()  
    ccall(@libarb(arb_get_abs_lbound_arf), Cvoid, (Ref{Arf}, Ref{Arb}, Clong), w, x, P)
    return w
end

function lowerbound_abs(x::Arb{P}) where {P}
    w = lowerbound(x, Arf)
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, w)
    return z
end

function bounds_abs(x::Arb{P}, ::Type{Arf}) where {P}
    lowerbound_abs(x, Arf), upperbound_abs(x, Arf)
end

function bounds_abs(x::Arb{P}) where {P}
    lowerbound_abs(x), upperbound_abs(x)
end


function increase_radius(x::Arb{P}, err::Arf{P}) where {P}
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function increase_radius(x::Arb{P}, err::Arb{P}) where {P}
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function decrease_radius(x::Arb{P}, err::Arf{P}) where {P}
    err = -err
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function decrease_radius(x::Arb{P}, err::Arb{P}) where {P}
    err = -err
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end
