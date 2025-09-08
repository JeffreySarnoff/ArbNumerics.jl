#>  (==)(x::T,y::T), (!=)(x::T, y::T)

function (==)(x::Mag, y::Mag)
    0 != ccall(@libarb(mag_equal), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end

function (==)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    0 != ccall(@libarb(arf_equal), Cint, (Ref{ArbFloat}, Ref{ArbFloat}), x, y)
end

function (==)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    0 != ccall(@libarb(arb_equal), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

function (==)(x::ArbComplex{P}, y::ArbComplex{P})  where {P}
    0 != ccall(@libarb(acb_equal), Cint, (Ref{ArbComplex}, Ref{ArbComplex}), x, y)
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
function (<=)(x::Mag, y::Mag)
    (x < y) || (x == y)
end

function (<)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    signbit(cmp(x, y))
end
function (<=)(x::ArbFloat{P}, y::ArbFloat{P})  where {P}
    (x < y) || (x == y)
end

function (<)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    x = upperbound(x)
    y = lowerbound(y)
    0 != ccall(@libarb(arb_lt), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

function (<=)(x::ArbReal{P}, y::ArbReal{P})  where {P}
    x < y ||
    0 != ccall(@libarb(arb_contains), Cint, (Ref{ArbReal}, Ref{ArbReal}), x, y)
end

# ArbComplex comparisons < > <= >=


for F in (:(==), :(<), :(<=), :isequal, :isless)
    @eval begin
        $F(x::ArbFloat{P}, y::T) where {P, T<:Integer} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbFloat{P}) where {P, T<:Integer} =
            $F(promote(x, y)...,)
        $F(x::ArbReal{P}, y::T) where {P, T<:Integer} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbReal{P}) where {P, T<:Integer} =
            $F(promote(x, y)...,)

        $F(x::ArbFloat{P}, y::T) where {P, T<:IEEEFloat} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbFloat{P}) where {P, T<:IEEEFloat} =
            $F(promote(x, y)...,)
        $F(x::ArbReal{P}, y::T) where {P, T<:IEEEFloat} =
            $F(promote(x, y)...,)
        $F(x::T, y::ArbReal{P}) where {P, T<:IEEEFloat} =
            $F(promote(x, y)...,)

        $F(x::ArbFloat{P}, y::Rational) where {P} =
            $F(promote(x, y)...,)
        $F(x::Rational, y::ArbFloat{P}) where {P} =
            $F(promote(x, y)...,)
        $F(x::ArbReal{P}, y::Rational) where {P} =
            $F(promote(x, y)...,)
        $F(x::Rational, y::ArbReal{P}) where {P} =
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

isapprox(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = isapprox(x, y, rtol=√eps(max(abs(x),abs(y))))
isapprox(x::ArbReal{P}, y::ArbReal{P}) where {P} = isapprox(midpoint_byref(x), midpoint_byref(y))
isapprox(x::ArbComplex{P}, y::ArbComplex{P}) where {P} = isapprox(midpoint_byref(real(x)), midpoint_byref(real(y))) && isapprox(midpoint_byref(imag(x)), midpoint_byref(imag(y)))

isapprox(x::ArbFloat{P}, y::ArbReal{P})  where {P} = isapprox(x, midpoint_byref(y))
isapprox(x::ArbReal{P}, y::ArbFloat{P})  where {P} = isapprox(midpoint_byref(x), y)
isapprox(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = isapprox(x, midpoint_byref(real(y))) && isapprox(zero(ArbFloat{P}), midpoint_byref(imag(y)))
isapprox(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = isapprox(midpoint_byref(real(x)), y) && isapprox(zero(ArbFloat{P}), midpoint_byref(imag(x)))
isapprox(x::ArbReal{P}, y::ArbComplex{P}) where {P} = isapprox(midpoint_byref(x), midpoint_byref(real(y))) && isapprox(zero(ArbFloat{P}), midpoint_byref(imag(y)))
isapprox(x::ArbComplex{P}, y::ArbReal{P}) where {P} = isapprox(midpoint_byref(real(x)), midpoint_byref(y)) && isapprox(zero(ArbFloat{P}), midpoint_byref(imag(x)))

isapprox(x::ArbFloat{P}, y::F) where {P, F<:IEEEFloat} = isapprox(F(x), y)
isapprox(x::F, y::ArbFloat{P}) where {P, F<:IEEEFloat} = isapprox(x, F(y))
isapprox(x::ArbReal{P}, y::F) where {P, F<:IEEEFloat} = isapprox(F(x), y)
isapprox(x::F, y::ArbReal{P}) where {P, F<:IEEEFloat} = isapprox(x, F(y))
isapprox(x::ArbComplex{P}, y::F) where {P, F<:IEEEFloat} = isapprox(F(real(x)), y)
isapprox(x::F, y::ArbComplex{P}) where {P, F<:IEEEFloat} = isapprox(x, F(real(y)))
