#>  (==)(x::T,y::T), (!=)(x::T, y::T)

function (==)(x::Mag, y::Mag)
    0 != ccall(@libarb(mag_equal), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end
function (!=)(x::Mag, y::Mag)
    0 == ccall(@libarb(mag_equal), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end

function (==)(x::Arf{P}, y::Arf{P})  where {P}
    0 != ccall(@libarb(arf_equal), Cint, (Ref{Arf}, Ref{Arf}), x, y)
end
function (!=)(x::Arf{P}, y::Arf{P})  where {P}
    0 == ccall(@libarb(arf_equal), Cint, (Ref{Arf}, Ref{Arf}), x, y)
end

function (==)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_eq), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end
function (!=)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_ne), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end

function (==)(x::Acb{P}, y::Acb{P})  where {P}
    0 != ccall(@libarb(acb_eq), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end
function (!=)(x::Acb{P}, y::Acb{P})  where {P}
    0 != ccall(@libarb(acb_ne), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end


#>  F(x::T,y::T), for F as {<, >, <=, >=}

#=
        x < y     x == y     x > y
          -         0          +
=#
function cmp(x::Mag, y::Mag)
    ccall(@libarb(mag_cmp), Cint, (Ref{Mag}, Ref{Mag}), x, y)
end
function cmp(x::Arf{P}, y::Arf{P})  where {P}
    ccall(@libarb(arf_cmp), Cint, (Ref{Arf}, Ref{Arf}), x, y)
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

function (<)(x::Arf{P}, y::Arf{P})  where {P}
    signbit(cmp(x, y))
end
function (>)(x::Arf{P}, y::Arf{P})  where {P}
    signbit(cmp(y, x))
end
function (<=)(x::Arf{P}, y::Arf{P})  where {P}
    (x < y) || (x == y)
end
function (=>)(x::Arf{P}, y::Arf{P})  where {P}
    (x > y) || (x == y)
end

function (<)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_lt), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end
function (>)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_lt), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end
function (<=)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_le), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end
function (>=)(x::Arb{P}, y::Arb{P})  where {P}
    0 != ccall(@libarb(arb_ge), Cint, (Ref{Arb}, Ref{Arb}), x, y)
end

# Acb comparisons < > <= >=


for F in (:(==), :(!=), :(<), :(<=), :(>=), :(>), :isequal, :isless)
    @eval begin
        $F(x::Arf{P}, y::T) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::T, y::Arf{P}) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::Arb{P}, y::T) where {P, T<:Union{Integer, Base.IEEEFloat}} =
            $F(promote(x, y)...,)
        $F(x::T, y::Arb{P}) where {P, T<:Union{Integer, Base.IEEEFloat}} =
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
function cmp2pow(x::Arf{P}, y::Signed) where {P}
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

function min(x::Arf{P}, y::Arf{P}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_min), Cvoid, (Ref{Arf}, Ref{Arf}, Ref{Arf}), z, x, y)
    return z
end

function max(x::Arf{P}, y::Arf{P}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_max), Cvoid, (Ref{Arf}, Ref{Arf}, Ref{Arf}), z, x, y)
    return z
end

minmax(x::Arf{P}, y::Arf{P}) where {P} = (x <= y ? (x, y) : (y, x))

function min(x::Arb{P}, y::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_min), Cvoid, (Ref{Arb}, Ref{Arb}, Ref{Arb}), z, x, y)
    return z
end

function max(x::Arb{P}, y::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_max), Cvoid, (Ref{Arb}, Ref{Arb}, Ref{Arb}), z, x, y)
    return z
end

minmax(x::Arb{P}, y::Arb{P}) where {P} = (x <= y ? (x, y) : (y, x))

function min(x::Acb{P}, y::Acb{P}, noNaNs::Bool=false) where {P}
    z = Acb{P}()
    analytic = noNaNs ? 0 : 1
    ccall(@libarb(acb_real_min), Cvoid, (Ref{Acb}, Ref{Acb}, Ref{Acb}, Cint, Clong), z, x, y, analytic, P)
    return z
end

function max(x::Acb{P}, y::Acb{P}; noNaNs::Bool=true) where {P}
    z = Acb{P}()
    analytic = noNaNs ? 0 : 1
    ccall(@libarb(acb_real_max), Cvoid, (Ref{Acb}, Ref{Acb}, Ref{Acb}, Cint, Clong), z, x, y, analytic, P)
    return z
end

minmax(x::Acb{P}, y::Acb{P}) where {P} = min(x, y), max(x, y)
