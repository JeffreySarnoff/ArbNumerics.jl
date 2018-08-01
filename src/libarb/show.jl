function show(io::IO, x::Mag)
    str = string(x)
    print(io, str)
end


function show(io::IO, x::ArbFloat{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = radius ? ARB_STR_NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end

function show(io::IO, x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = radius ? ARB_STR_NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end

function show(io::IO, x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = radius ? ARB_STR_NO_RADIUS : ARB_STR_RADIUS
    str = string(x, prec, flags=flags)
    print(io, str)
end
