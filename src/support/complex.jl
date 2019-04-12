float(::Type{ArbFloat})   = ArbFloat
float(::Type{ArbReal})    = ArbFloat
float(::Type{ArbComplex}) = ArbFloat

float(::Type{ArbFloat{P}})   where {P} = ArbFloat{P}
float(::Type{ArbReal{P}})    where {P} = ArbFloat{P}
float(::Type{ArbComplex{P}}) where {P} = ArbFloat{P}

float(x::ArbFloat{P})   where {P} = x
float(x::ArbReal{P})    where {P} = ArbFloat{P}(x)
float(z::ArbComplex{P}) where {P} = ArbFloat{P}(real(z))


real(::Type{ArbFloat})   = ArbFloat
real(::Type{ArbReal})    = ArbReal
real(::Type{ArbComplex}) = ArbReal

real(::Type{ArbFloat{P}})   where {P} = ArbFloat{P}
real(::Type{ArbReal{P}})    where {P} = ArbReal{P}
real(::Type{ArbComplex{P}}) where {P} = ArbReal{P}

real(x::ArbFloat{P})   where {P} = x
real(x::ArbReal{P})    where {P} = x
function real(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end


imag(::Type{ArbFloat})   = ArbFloat
imag(::Type{ArbReal})    = ArbReal
imag(::Type{ArbComplex}) = ArbReal

imag(::Type{ArbFloat{P}})   where {P} = ArbFloat{P}
imag(::Type{ArbReal{P}})    where {P} = ArbReal{P}
imag(::Type{ArbComplex{P}}) where {P} = ArbReal{P}

imag(x::ArbFloat{P})   where {P} = x
imag(x::ArbReal{P})    where {P} = x
function imag(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
    return z
end


complex(::Type{ArbFloat})   = ArbComplex
complex(::Type{ArbReal})    = ArbComplex
complex(::Type{ArbComplex}) = ArbComplex

complex(::Type{ArbFloat{P}})   where {P} = ArbComplex{P}
complex(::Type{ArbReal{P}})    where {P} = ArbComplex{P}
complex(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}

complex(x::ArbFloat{P})   where {P} = ArbComplex{P}(x)
complex(x::ArbReal{P})    where {P} = ArbComplex{P}(x)
complex(z::ArbComplex{P}) where {P} = z


# other parts

angle(x::ArbFloat{P}) where {P} = zero(ArbFloat{P})
angle(x::ArbReal{P})  where {P} = zero(ArbReal{P})
function angle(x::ArbComplex{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(acb_arg), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

magnitude(x::T) where {T<:Complex} where {P} = hypot(reim(x)...)

magnitude(x::ArbFloat{P})   where {P} = x
magnitude(x::ArbReal{P})    where {P} = x
magnitude(x::ArbComplex{P}) where {P} = hypot(real(x), imag(x))

