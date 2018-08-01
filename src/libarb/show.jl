function show(io::IO, x::Mag)
    str = string(x)
    print(io, str)
end


function show(io::IO, x::ArbFloat{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = !radius ? NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end
show(x::ArbFloat{P}; midpoint::Bool=false, radius::Bool=false) where {P} =
    show(Base.stdout, x, midpoint=midpoint, radius=radius)

function show(io::IO, x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = !radius ? NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end
show(x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P} =
    show(Base.stdout, x, midpoint=midpoint,radius=radius)

function show(io::IO, x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = !radius ? NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end
show(x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P} =
    show(Base.stdout, x, midpoint=midpoint,radius=radius)
