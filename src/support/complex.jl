float(::Type{T}) where {T<:ArbNumber1} = ArbFloat
float(::Type{T}) where {P,T<:ArbNumber1{P}} = ArbFloat{P}

float(x::ArbNumber1{P}) where {P} = convert(ArbFloat{P}, x) # TODO senseless for Complex?

real(::Type{ArbFloat}) = ArbFloat
real(::Type{T}) where {T<:ArbNumber1} = ArbReal

real(::Type{ArbFloat{P}}) where {P} = ArbFloat{P}
real(::Type{T}) where {P,T<:ArbNumber1{P}} = ArbReal{P}

real(x::ArbNumber1) = x
function real(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end

imag(::Type{T}) where {T<:ArbNumber1} = real(T)

imag(::T) where {T<:ArbNumber1} = zero(T)
function imag(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end

# other parts

angle(x::T) where {T<:ArbNumber1} = signbit(x) ? T(pi) : zero(T)
function angle(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_arg), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}, Slong), z, x, P)
    return z
end

magnitude(x::Number) = abs(x)
