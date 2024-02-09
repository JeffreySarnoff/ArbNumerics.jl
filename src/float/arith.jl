for (A,F) in ((:(+), :mag_add), (:(-), :mag_sub), (:(*), :mag_mul), (:(/), :mag_div))
    @eval begin
        function ($A)(x::Mag, y::Mag)
            z = Mag()
            ccall(@libarb($F), Cvoid, (Ref{Mag}, Ref{Mag}, Ref{Mag}), z, x, y)
            return z
         end
    end
end

for (A,F) in ((:(+), :arf_add), (:(-), :arf_sub), (:(*), :arf_mul_rnd_any), (:(/), :arf_div))
    @eval begin
        function ($A)(x::ArbFloat{P}, y::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P}
            z = ArbFloat{P}()
            rounding = match_rounding_mode(roundingmode)
            rounddir = ccall(@libarb($F), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, y, P, rounding)
            return z
         end
    end
end

for (A,F) in ((:(+), :arb_add), (:(-), :arb_sub), (:(*), :arb_mul), (:(/), :arb_div), (:(^), :arb_pow))
    @eval begin
        function ($A)(x::ArbReal{P}, y::ArbReal{P}) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, P)
            return z
         end
    end
end

function (^)(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    rx = ArbReal{P}(x)
    ry = ArbReal{P}(y)
    r = rx^ry
    return ArbFloat{P}(r)
end

for (A,F) in ((:(+), :acb_add), (:(-), :acb_sub), (:(*), :acb_mul), (:(/), :acb_div), (:(^), :acb_pow))
    @eval begin
        function ($A)(x::ArbComplex{P}, y::ArbComplex{P}) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, y, P)
            return z
         end
    end
end

function (^)(a::ArbNumber, b::Integer)
    x = Base.power_by_squaring(a, abs(b))
    b < 0 ? inv(x) : x
end


# interact with Bool

@inline ArbFloat{P}(b::Bool) where {P} = b ? one(ArbFloat{P}) : zero(ArbFloat{P})
@inline Base.Bool(x::ArbFloat{P}) where {P} = iszero(x) ? false : (isone(x) ? true : throw(InexactError(:Bool, Bool, x)))
@inline ArbReal{P}(b::Bool) where {P} = b ? one(ArbReal{P}) : zero(ArbReal{P})
@inline Base.Bool(x::ArbReal{P}) where {P} = iszero(x) ? false : (isone(x) ? true : throw(InexactError(:Bool, Bool, x)))
@inline ArbComplex{P}(b::Bool) where {P} = b ? one(ArbComplex{P}) : zero(ArbComplex{P})
@inline Base.Bool(x::ArbComplex{P}) where {P} = iszero(x) ? false : (isone(x) ? true : throw(InexactError(:Bool, Bool, x)))

(+)(x::ArbFloat{P}, b::Bool) where {P} = b ? one(ArbFloat{P}) + x : zero(ArbFloat{P})
(+)(b::Bool, x::ArbFloat{P}) where {P} = b ? x + one(ArbFloat{P}) : zero(ArbFloat{P})

(+)(x::ArbReal{P}, b::Bool) where {P} = b ? one(ArbReal{P}) + x : zero(ArbReal{P})
(+)(b::Bool, x::ArbReal{P}) where {P} = b ? x + one(ArbReal){P} : zero(ArbReal{P})

(+)(x::ArbComplex{P}, b::Bool) where {P} = b ? one(ArbComplex{P}) + x : zero(ArbComplex{P})
(+)(b::Bool, x::ArbComplex{P}) where {P} = b ? x + one(ArbComplex){P} : zero(ArbComplex{P})

(-)(x::ArbFloat{P}, b::Bool) where {P} = b ? one(ArbFloat{P}) - x : zero(ArbFloat{P})
(-)(b::Bool, x::ArbFloat{P}) where {P} = b ? x - one(ArbFloat{P}) : zero(ArbFloat{P})

(-)(x::ArbReal{P}, b::Bool) where {P} = b ? one(ArbReal{P}) - x : zero(ArbReal{P})
(-)(b::Bool, x::ArbReal{P}) where {P} = b ? x - one(ArbReal){P} : zero(ArbReal{P})

(-)(x::ArbComplex{P}, b::Bool) where {P} = b ? one(ArbComplex{P}) - x : zero(ArbComplex{P})
(-)(b::Bool, x::ArbComplex{P}) where {P} = b ? x - one(ArbComplex){P} : zero(ArbComplex{P})


(*)(x::ArbFloat{P}, b::Bool) where {P} = b ? x : zero(ArbFloat{P})
(*)(b::Bool, x::ArbFloat{P}) where {P} = b ? x : zero(ArbFloat{P})

(*)(x::ArbReal{P}, b::Bool) where {P} = b ? x : zero(ArbReal{P})
(*)(b::Bool, x::ArbReal{P}) where {P} = b ? x : zero(ArbReal{P})

(*)(x::ArbComplex{P}, b::Bool) where {P} = b ? x : zero(ArbComplex{P})
(*)(b::Bool, x::ArbComplex{P}) where {P} = b ? x : zero(ArbComplex{P})


(\)(x::ArbFloat{P}, b::Bool) where {P} = b ? x : inf(ArbFloat{P})
(\)(b::Bool, x::ArbFloat{P}) where {P} = b ? inv(x) : zero(ArbFloat{P})

(\)(x::ArbReal{P}, b::Bool) where {P} = b ? x : inf(ArbReal{P})
(\)(b::Bool, x::ArbReal{P}) where {P} = b ? inv(x) : zero(ArbReal{P})

(\)(x::ArbComplex{P}, b::Bool) where {P} = b ? x : inf(ArbComplex{P})
(\)(b::Bool, x::ArbComplex{P}) where {P} = b ? inv(x) : zero(ArbComplex{P})
