@inline function upperbound(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    xreal = real(x)
    ximag = imag(x)
    wreal = ArbFloat{P}()
    wimag = ArbFloat{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wreal, xreal, P)
    ccall(@libarb(arb_get_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wimag, ximag, P)
    return ArbComplex{P}(wreal, wimag)
end

@inline function lowerbound(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    xreal = real(x)
    ximag = imag(x)
    wreal = ArbFloat{P}()
    wimag = ArbFloat{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wreal, xreal, P)
    ccall(@libarb(arb_get_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wimag, ximag, P)
    return ArbComplex{P}(wreal, wimag)
end


upperbound(x::ArbComplex{P}) where {P} = upperbound(x, ArbFloat)
lowerbound(x::ArbComplex{P}) where {P} = lowerbound(x, ArbFloat)

function interval(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    lowerbound(x), upperbound(x)
end

interval(x::ArbComplex{P}) where {P} = interval(x, ArbFloat)


@inline function upperbound_abs(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    xreal = real(x)
    ximag = imag(x)
    wreal = ArbFloat{P}()
    wimag = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wreal, xreal, P)
    ccall(@libarb(arb_get_abs_ubound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wimag, ximag, P)
    return ArbComplex{P}(wreal, wimag)
end

@inline function lowerbound_abs(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    xreal = real(x)
    ximag = imag(x)
    wreal = ArbFloat{P}()
    wimag = ArbFloat{P}()
    ccall(@libarb(arb_get_abs_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wreal, xreal, P)
    ccall(@libarb(arb_get_abs_lbound_arf), Cvoid, (Ref{ArbFloat}, Ref{ArbReal}, Clong), wimag, ximag, P)
    return ArbComplex{P}(wreal, wimag)
end

upperbound_abs(x::ArbComplex{P}) where {P} = upperbound_abs(x, ArbFloat)
lowerbound_abs(x::ArbComplex{P}) where {P} = lowerbound_abs(x, ArbFloat)

function interval_abs(x::ArbComplex{P}, ::Type{ArbFloat}) where {P}
    lowerbound_abs(x), upperbound_abs(x)
end

interval_abs(x::ArbComplex{P}) where {P} = interval_abs(x, ArbFloat)

function ball(x::ArbComplex{P}) where {P}
    mid = midpoint(x)
    rad = radius(x)
    return mid, rad
end
