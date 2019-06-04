# cstructs

function ArbFloat{P}(x::Mag) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{ArbFloat}, Ref{Mag},), z, x)
    return z
end

ArbReal{P}(x::Mag) where {P} = ArbReal{P}(ArbFloat{P}(x))


function ArbComplex{P}(rea::Mag) where {P}
    a = ArbFloat{P}(rea)
    return ArbComplex{P}(a)
end

function ArbComplex{P}(rea::ArbFloat{P}, ima::ArbFloat{P}) where {P}
    realpart = ArbReal{P}(rea)
    imagpart = ArbReal{P}(ima)
    result = ArbComplex{P}(realpart, imagpart)
    return result
end
convert(::Type{ArbComplex{P}}, rea::ArbFloat{P}, ima::ArbFloat{P}) where {P} = ArbComplex{P}(rea, ima)

function ArbComplex{P}(rea::ArbReal{P}, ima::ArbReal{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_arb_arb), Cvoid,
          (Ref{ArbComplex}, Ref{ArbReal}, Ref{ArbReal}), z, rea, ima)
    return z
end
convert(::Type{ArbComplex{P}}, rea::ArbReal{P}, ima::ArbReal{P}) where {P} = ArbComplex{P}(rea, ima)

function ArbComplex{P}(rea::Mag, ima::Mag) where {P}
    realpart = ArbReal{P}(rea)
    imagpart = ArbReal{P}(ima)
    result = ArbComplex{P}(realpart, imagpart)
    return result
end
convert(::Type{ArbComplex{P}}, rea::Mag, ima::Mag) where {P} = ArbComplex{P}(rea, ima)

function Mag(x::ArbFloat{P}) where {P}
    z = Mag()
    ccall(@libarb(arf_get_mag), Cvoid, (Ref{Mag}, Ref{ArbFloat}), z, x)
    return z
end

function Mag(x::ArbReal{P}) where {P}
    z = Mag()
    ccall(@libarb(arb_get_mag), Cvoid, (Ref{Mag}, Ref{ArbReal}), z, x)
    return z
end

function Mags(x::ArbComplex{P}) where {P}
    rea = Mag(real(x))
    ima = Mag(imag(x))
    return (rea, ima)
end

convert(::Type{Tuple{Mag,Mag}}, x::ArbComplex{P}) where {P} = Mag(real(x)), Mag(imag(y))
convert(::Type{Tuple{ArbFloat{P}, ArbFloat{P}}}, x::ArbComplex{P}) where {P} = (ArbFloat{P}(real(x)), ArbFloat{P}(imag(x)))


function Mag(x::ArbFloat{P}, ::Type{UpperBound}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_get_ubound_mag), Cvoid,
          (Ref{ArbFloat}, Ref{Mag}), z, x)
    return z
end

function Mag(x::ArbFloat{P}, ::Type{LowerBound}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_get_lbound_mag), Cvoid,
          (Ref{ArbFloat}, Ref{Mag}), z, x)
    return z
end

ArbFloat{P}(x::ArbReal{P}) where {P} = ArbFloat{P}(midpoint(x), UpperBound)

function ArbFloat{P}(x::ArbReal{P}, ::Type{UpperBound}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbReal}, Clong), z, x, P)
    return z
end
convert(::Type{ArbFloat{P}}, x::ArbReal{P}, ::Type{UpperBound}) where {P} = ArbFloat{P}(x)

function ArbFloat{P}(x::ArbReal{P}, ::Type{LowerBound}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbReal}, Clong), z, x, P)
    return z
end
convert(::Type{ArbFloat{P}}, x::ArbReal{P}, ::Type{LowerBound}) where {P} = ArbFloat{P}(x)

ArbFloat{P}(x::ArbComplex{P}) where {P} = ArbFloat{P}(x, UpperBound)

function ArbFloat{P}(x::ArbComplex{P}, ::Type{UpperBound}, ) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

function ArbFloat{P}(x::ArbComplex{P}, ::Type{LowerBound}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

ArbFloat{P}(x::ArbComplex{P}, ::Type{Radius}) where {P} = ArbFloat{P}(x, UpperBound, Radius)
convert(::Type{ArbFloat{P}}, x::ArbComplex{P}, ::Type{Radius}) where {P} = ArbFloat{P}(x, Radius)

function ArbFloat{P}(x::ArbComplex{P}, ::Type{UpperBound}, ::Type{Radius}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_rad_ubound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

function ArbFloat{P}(x::ArbComplex{P}, ::Type{LowerBound}, ::Type{Radius}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arb_get_rad_lbound_arf), Cvoid,
          (Ref{ArbFloat}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

Mag(x::ArbComplex{P}) where {P} = Mag(x, UpperBound)

function Mag(x::ArbComplex{P}, ::Type{UpperBound}) where {P}
    z = Mag()
    ccall(@libarb(acb_get_mag), Cvoid,
          (Ref{Mag}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

function Mag(x::ArbComplex{P}, ::Type{LowerBound}) where {P}
    z = Mag()
    ccall(@libarb(acb_get_mag_lower), Cvoid,
          (Ref{Mag}, Ref{ArbReal}, Clong), z, x, P)
    return z
end
