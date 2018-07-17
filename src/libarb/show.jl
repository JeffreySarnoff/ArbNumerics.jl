function show(io::IO, x::Mag)
    str = string(x)
    print(io, str)
end

function show(io::IO, x::ArbFloat{P}, flags::Culong=NO_RADIUS) where {P}
    prec = digit_precision(P)
    str = string(x, prec, flags)
    print(io, str)
end

function show(io::IO, x::ArbReal{P}, flags::Culong=NO_RADIUS) where {P}
    prec = digit_precision(P)
    str = string(x, prec, flags)
    print(io, str)
end

function show(io::IO, x::ArbComplex{P}, flags::Culong=NO_RADIUS) where {P}
    prec = digit_precision(P)
    str = string(x, prec, flags)
    print(io, str)
end
