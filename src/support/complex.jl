float(::Type{T}) where {T<:ArbNumber} = ArbFloat
float(::Type{T}) where {P,T<:ArbNumber{P}} = ArbFloat{P}

float(x::ArbNumber{P}) where {P} = convert(ArbFloat{P}, x) # TODO senseless for Complex?

real(::Type{ArbFloat}) = ArbFloat
real(::Type{T}) where {T<:ArbNumber} = ArbReal

real(::Type{ArbFloat{P}}) where {P} = ArbFloat{P}
real(::Type{T}) where {P,T<:ArbNumber{P}} = ArbReal{P}

real(x::ArbNumber) = x
function real(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end

imag(::Type{T}) where {T<:ArbNumber} = real(T)

imag(::T) where {T<:ArbNumber} = zero(T)
function imag(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end

function isreal(x::ArbComplex)
    iszero(imag(x))
end

# other parts

angle(x::T) where {T<:ArbNumber} = signbit(x) ? T(pi) : zero(T)
function angle(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_arg), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}, Slong), z, x, P)
    return z
end

magnitude(x::Number) = abs(x)
