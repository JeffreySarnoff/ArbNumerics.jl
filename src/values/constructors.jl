# IEEEFloat

# rounds up (widens)
function (::Type{T})(x::Mag) where {T<:IEEEFloat}
    z = ccall(@libarb(mag_get_d), Float64, (Ref{Mag},), x)
    return convert(T, z)
end

function (::Type{T})(x::ArbFloat{P}, rm::RoundingMode=RoundNearest) where {P,T<:IEEEFloat}
    rounding = match_rounding_mode(rm)
    z = ccall(@libarb(arf_get_d), Float64, (Ref{ArbFloat}, Cint), x, rounding)
    return convert(T, z)
end

function (::Type{T})(x::ArbReal{P}, rm::RoundingMode=RoundNearest) where {P,T<:IEEEFloat}
    T(ArbFloat(midpoint(x)), rm)
end

function (::Type{T})(x::ArbComplex{P}, rm::RoundingMode=RoundNearest) where {P,T<:IEEEFloat}
    isreal(x) || throw(InexactError(nameof(T), T, x))
    T(ArbFloat(midpoint(real(x))), rm)
end

function Complex{T}(x::ArbComplex{P}, rm::RoundingMode=RoundNearest) where {P,T<:Real}
    re = T(real(x), rm)
    im = T(imag(x), rm)
    return Complex{T}(re, im)
end

# integers

function (::Type{T})(x::ArbReal) where {T<:Integer}
    isexact(x) || throw(InexactError(nameof(T), T, x))
    T(ArbFloat(x))
end

function (::Type{T})(x::ArbComplex) where {T<:Integer}
    (isexact(x) && iszero(imag(x))) || throw(InexactError(nameof(T), T, x))
    T(ArbFloat(x))
end

# Rational

#ArbFloat(x::T) where {S, T<:Rational{S}} = ArbFloat(x.num)/ArbFloat(x.den)
#ArbReal(x::T) where {S, T<:Rational{S}} = ArbReal(x.num)/ArbReal(x.den)
#ArbComplex(x::T) where {S, T<:Rational{S}} = ArbComplex(ArbReal(x), ArbReal(0))
#ArbComplex(x::Rational, y::Rational) = ArbComplex(ArbReal(x), ArbReal(y))

# Irrational

function ArbReal{P}(x::Irrational) where {P}
    mid = ArbFloat{P}(x)
    rad = ulp(mid)
    return setball(mid, rad)
end

ArbReal(x::Irrational) = ArbReal{workingprecision(ArbReal)}(x)

# fallback

# ArbFloat{P}(x::T) where {P,T<:Real} = ArbFloat{P}(BigFloat(x))
# ArbFloat(x::T) where {T<:Real} = ArbFloat{workingprecision(ArbFloat)}(BigFloat(x))
ArbFloat{P}(x::T) where {P,T<:Complex} = ArbFloat{P}(BigFloat(real(x)))
ArbFloat(x::T) where {T<:Complex} = ArbFloat{workingprecision(ArbFloat)}(BigFloat(real(x))) # TODO shouldn't that InexactError

#ArbReal{P}(x::T) where {P,T<:Real} = ArbReal{P}(BigFloat(x))
#ArbReal(x::T) where {T<:Real} = ArbReal{workingprecision(ArbReal)}(BigFloat(real(x)))
ArbReal{P}(x::T) where {P,T<:Complex} = ArbReal{P}(BigFloat(x)) # TODO shouldn't that InexactError
ArbReal(x::T) where {T<:Complex} = ArbReal{workingprecision(ArbReal)}(BigFloat(real(x)))

# retype

ArbFloat(x::ArbReal{P}) where {P} = ArbFloat{P}(x)
ArbFloat(x::ArbComplex{P}) where {P} = ArbFloat{P}(real(x)) # TODO shouldn't that InexactError
ArbReal(x::ArbFloat{P}) where {P} = ArbReal{P}(x)
ArbReal(x::ArbComplex{P}) where {P} = ArbReal{P}(real(x)) # TODO shouldn't that InexactError

ArbFloat{Q}(x::ArbReal{P}) where {P,Q} = ArbFloat{Q}(ArbReal{Q}(x))
ArbFloat{Q}(x::ArbComplex{P}) where {P,Q} = ArbFloat{Q}(ArbReal{Q}(real(x)))
ArbReal{Q}(x::ArbFloat{P}) where {P,Q} = ArbReal{Q}(ArbFloat{Q}(x))
ArbReal{Q}(x::ArbComplex{P}) where {P,Q} = ArbReal{Q}(real(x))

# change precision

function ArbFloat{P}(x::ArbFloat{Q}, roundingmode::RoundingMode) where {P,Q}
    minprec(P, ArbFloat)
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_set_round), Cint,
        (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end
ArbFloat{P}(x::ArbFloat{Q}) where {P,Q} = ArbFloat{P}(x, RoundNearest)

function ArbReal{P}(x::ArbReal{Q}) where {P,Q}
    minprec(P, ArbReal)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_round), Cvoid,
        (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, P)
    return z
end

function ArbComplex{P}(x::ArbComplex{Q}) where {P,Q}
    minprec(P, ArbComplex)
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_round), Cvoid,
        (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

# widen

widen(::Type{ArbFloat{P}}) where {P} = ArbFloat{P + P + 4}
widen(::Type{ArbReal{P}}) where {P} = ArbReal{P + P + 4}
widen(::Type{ArbComplex{P}}) where {P} = ArbComplex{P + P + 4}
