# cstructs

function Arf{P}(x::Mag) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{Arf}, Ref{Mag},), z, x)
    return z
end

Arb{P}(x::Mag) where {P} = Arb{P}(Arf{P}(x))


function Acb{P}(rea::Mag) where {P}
    a = Arf{P}(rea)
    return Acb{P}(a)
end

function Acb{P}(rea::Arf{P}, ima::Arf{P}) where {P}
    realpart = Arb{P}(rea)
    imagpart = Arb{P}(ima)
    result = Acb{P}(realpart, imagpart)
    return result
end
convert(::Type{Acb{P}}, rea::Arf{P}, ima::Arf{P}) where {P} = Acb{P}(rea, ima)

function Acb{P}(rea::Arb{P}, ima::Arb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_set_arb_arb), Cvoid,
          (Ref{Acb}, Ref{Arb}, Ref{Arb}), z, rea, ima)
    return z
end
convert(::Type{Acb{P}}, rea::Arb{P}, ima::Arb{P}) where {P} = Acb{P}(rea, ima)

function Acb{P}(rea::Mag, ima::Mag) where {P}
    realpart = Arb{P}(rea)
    imagpart = Arb{P}(ima)
    result = Acb{P}(realpart, imagpart)
    return result
end
convert(::Type{Acb{P}}, rea::Mag, ima::Mag) where {P} = Acb{P}(rea, ima)

function Mag(x::Arf{P}) where {P}
    z = Mag()
    ccall(@libarb(arf_get_mag), Cvoid, (Ref{Mag}, Ref{Arf}), z, x)
    return z
end

function Mag(x::Arb{P}) where {P}
    z = Mag()
    ccall(@libarb(arb_get_mag), Cvoid, (Ref{Mag}, Ref{Arb}), z, x)
    return z
end

function Mags(x::Acb{P}) where {P}
    rea = Mag(real(x))
    ima = Mag(imag(x))
    return (rea, ima)
end

convert(::Type{Tuple{Mag,Mag}}, x::Acb{P}) where {P} = Mag(real(x)), Mag(imag(y))
convert(::Type{Tuple{Arf{P}, Arf{P}}}, x::Acb{P}) where {P} = (Arf{P}(real(x)), Arf{P}(imag(x)))


function Mag(x::Arf{P}, ::Type{UpperBound}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_get_ubound_mag), Cvoid,
          (Ref{Arf}, Ref{Mag}), z, x)
    return z
end

function Mag(x::Arf{P}, ::Type{LowerBound}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_get_lbound_mag), Cvoid,
          (Ref{Arf}, Ref{Mag}), z, x)
    return z
end

Arf{P}(x::Arb{P}) where {P} = Arf{P}(x, UpperBound)

function Arf{P}(x::Arb{P}, ::Type{UpperBound}) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid,
          (Ref{Arf}, Ref{Arb}, Clong), z, x, P)
    return z
end
convert(::Type{Arf{P}}, x::Arb{P}, ::Type{UpperBound}) where {P} = Arf{P}(x)

function Arf{P}(x::Arb{P}, ::Type{LowerBound}) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid,
          (Ref{Arf}, Ref{Arb}, Clong), z, x, P)
    return z
end
convert(::Type{Arf{P}}, x::Arb{P}, ::Type{LowerBound}) where {P} = Arf{P}(x)

Arf{P}(x::Acb{P}) where {P} = Arf{P}(x, UpperBound)

function Arf{P}(x::Acb{P}, ::Type{UpperBound}, ) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_ubound_arf), Cvoid,
          (Ref{Arf}, Ref{Acb}, Clong), z, x, P)
    return z
end

function Arf{P}(x::Acb{P}, ::Type{LowerBound}) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_lbound_arf), Cvoid,
          (Ref{Arf}, Ref{Acb}, Clong), z, x, P)
    return z
end

Arf{P}(x::Acb{P}, ::Type{Radius}) where {P} = Arf{P}(x, UpperBound, Radius)
convert(::Type{Arf{P}}, x::Acb{P}, ::Type{Radius}) where {P} = Arf{P}(x, Radius)

function Arf{P}(x::Acb{P}, ::Type{UpperBound}, ::Type{Radius}) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_rad_ubound_arf), Cvoid,
          (Ref{Arf}, Ref{Acb}, Clong), z, x, P)
    return z
end

function Arf{P}(x::Acb{P}, ::Type{LowerBound}, ::Type{Radius}) where {P}
    z = Arf{P}()
    ccall(@libarb(arb_get_rad_lbound_arf), Cvoid,
          (Ref{Arf}, Ref{Acb}, Clong), z, x, P)
    return z
end

Mag(x::Acb{P}) where {P} = Mag(x, UpperBound)

function Mag(x::Acb{P}, ::Type{UpperBound}) where {P}
    z = Mag()
    ccall(@libarb(acb_get_mag), Cvoid,
          (Ref{Mag}, Ref{Acb}, Clong), z, x, P)
    return z
end

function Mag(x::Acb{P}, ::Type{LowerBound}) where {P}
    z = Mag()
    ccall(@libarb(acb_get_mag_lower), Cvoid,
          (Ref{Mag}, Ref{Arb}, Clong), z, x, P)
    return z
end
