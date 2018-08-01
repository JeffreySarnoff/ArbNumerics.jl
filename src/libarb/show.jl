function show(io::IO, x::Mag)
    str = string(x)
    print(io, str)
end


function show(io::IO, x::ArbFloat{P}; midpoint::Bool=false) where {P}
    str = string(x, midpoint=midpoint)
    print(io, str)
end

function show(io::IO, x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    str = string(x, midpoint=midpoint, radius=radius)
    print(io, str)
end

function show(io::IO, x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    str = string(x, midpoint=midpoint, radius=radius)
    print(io, str)
end


function show(io::IO, x::ArbFloat{P}; midpoint::Bool=false) where {P}
    str = string(x, midpoint=midpoint)
    print(Base.stdout, str)
end

function show(x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    str = string(x, midpoint=midpoint, radius=radius)
    print(Base.stdout, str)
end

function show(x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    str = string(x, midpoint=midpoint, radius=radius)
    print(Base.stdout, str)
end

