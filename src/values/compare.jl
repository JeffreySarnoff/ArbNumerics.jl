#>  (==)(x::T,y::T), (!=)(x::T, y::T)

function (==)(x::Mag, y::Mag)
    0 != ccall(@libarb(mag_equal), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end
function (!=)(x::Mag, y::Mag)
    0 == ccall(@libarb(mag_equal), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end

function (==)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    0 != ccall(@libarb(arf_equal), Cint, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)
end
function (!=)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    0 == ccall(@libarb(arf_equal), Cint, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)
end

function (==)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    0 != ccall(@libarb(arb_equal), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end
function (!=)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    0 == ccall(@libarb(arb_equal), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

function (==)(x::ArbComplex{P}, y::ArbComplex{P})  where {P}
    0 != ccall(@libarb(acb_equal), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end
function (!=)(x::ArbComplex{P}, y::ArbComplex{P})  where {P}
    0 == ccall(@libarb(acb_equal), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end


#>  F(x::T,y::T), for F as {<, >, <=, >=}

#=
        x < y     x == y     x > y
          -         0          +
=#
function cmp(x::Mag, y::Mag)
    ccall(@libarb(mag_cmp), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end
function cmp(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    ccall(@libarb(arf_cmp), Cint, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)
end

function (<)(x::Mag, y::Mag)
    signbit(cmp(x, y))
end
function (>)(x::Mag, y::Mag)
    signbit(cmp(y, x))
end
function (<=)(x::Mag, y::Mag)
    (x < y) || (x == y)
end
function (>=)(x::Mag, y::Mag)
    (x > y) || (x == y)
end

function (<)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    signbit(cmp(x, y))
end
function (>)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    signbit(cmp(y, x))
end
function (<=)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    (x < y) || (x == y)
end
function (=>)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    (x > y) || (x == y)
end

function (<)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    upperbound(x) < lowerbound(y)
end
function (>)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    lowerbound(x) > upperbound(y)
end
function (<=)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    upperbound(x) < lowerbound(y) ||  
    0 != ccall(@libarb(arb_contains), Cint, (Ref{ArbReal}, Ref{ArbReal}), y, x)
end
function (>=)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    upperbound(y) < lowerbound(x) ||  
    0 != ccall(@libarb(arb_contains), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

# ArbComplex comparisons < > <= >=


for F in (:(==), :(!=), :(<), :(<=), :(>=), :(>), :isequal, :isless)
    @eval begin
        $F(x::ArbFloat{P}, y::T) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbFloat{P}) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::ArbReal{P}, y::T) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbReal{P}) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
    end
end


#=
       x < 2^y   x == 2^y   x > 2^y
          -         0          +
=#
function cmp2pow(x::Mag, y::Signed)
    ccall(@libarb(mag_cmp_2exp_si), Cint, (Ref{Mag}, Clong), x, y)
end
function cmp2pow(x::ArbFloat{P}, y::Signed) where {P}
    ccall(@libarb(mag_cmp_2exp_si), Cint, (Ref{Mag}, Clong), x, y)
end


#>  min(x::T,y::T), max(x::T, y::T)

function min(x::Mag, y::Mag)
    z = Mag()
    ccall(@libarb(mag_min), Cvoid, (Ref{Mag}, Ref{Mag}, Ref{Mag}), z, x, y)
    return z
end

function max(x::Mag, y::Mag)
    z = Mag()
    ccall(@libarb(mag_max), Cvoid, (Ref{Mag}, Ref{Mag}, Ref{Mag}), z, x, y)
    return z
end

minmax(x::Mag, y::Mag) = (x <= y ? (x, y) : (y, x))

function min(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_min), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}), z, x, y)
    return z
end

function max(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_max), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}), z, x, y)
    return z
end

minmax(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = (x <= y ? (x, y) : (y, x))

function min(x::ArbReal{P}, y::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_min), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}), z, x, y)
    return z
end

function max(x::ArbReal{P}, y::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_max), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}), z, x, y)
    return z
end

minmax(x::ArbReal{P}, y::ArbReal{P}) where {P} = (x <= y ? (x, y) : (y, x))

function min(x::ArbComplex{P}, y::ArbComplex{P}, noNaNs::Bool=false) where {P}
    z = ArbComplex{P}()
    analytic = noNaNs ? 0 : 1
    ccall(@libarb(acb_real_min), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong), z, x, y, analytic, P)
    return z
end

function max(x::ArbComplex{P}, y::ArbComplex{P}; noNaNs::Bool=true) where {P}
    z = ArbComplex{P}()
    analytic = noNaNs ? 0 : 1
    ccall(@libarb(acb_real_max), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong), z, x, y, analytic, P)
    return z
end

minmax(x::ArbComplex{P}, y::ArbComplex{P}) where {P} = min(x, y), max(x, y)
