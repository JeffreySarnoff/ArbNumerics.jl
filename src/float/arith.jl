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
        function ($A)(x::ArbBall{P}, y::ArbBall{P}) where {P}
            z = ArbBall{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, P)
            return z
         end
    end
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

(+)(x::ArbComplex{P}, y::ArbBall{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbComplex{P}, y::ArbBall{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbComplex{P}, y::ArbBall{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbComplex{P}, y::ArbBall{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbComplex{P}, y::ArbBall{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::ArbBall{P}, y::ArbComplex{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbBall{P}, y::ArbComplex{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbBall{P}, y::ArbComplex{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbBall{P}, y::ArbComplex{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbBall{P}, y::ArbComplex{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbComplex{P}, y::ArbFloat{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbFloat{P}, y::ArbComplex{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::ArbBall{P}, y::ArbFloat{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbBall{P}, y::ArbFloat{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbBall{P}, y::ArbFloat{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbBall{P}, y::ArbFloat{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbBall{P}, y::ArbFloat{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::ArbFloat{P}, y::ArbBall{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbFloat{P}, y::ArbBall{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbFloat{P}, y::ArbBall{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbFloat{P}, y::ArbBall{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbFloat{P}, y::ArbBall{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::Mag, y::ArbFloat{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Mag, y::ArbFloat{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Mag, y::ArbFloat{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Mag, y::ArbFloat{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Mag, y::ArbFloat{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::ArbFloat{P}, y::Mag) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbFloat{P}, y::Mag) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbFloat{P}, y::Mag) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbFloat{P}, y::Mag) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbFloat{P}, y::Mag) where {P} = (^)(promote(x, y)...,)

(+)(x::Mag, y::ArbBall{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Mag, y::ArbBall{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Mag, y::ArbBall{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Mag, y::ArbBall{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Mag, y::ArbBall{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::ArbBall{P}, y::Mag) where {P} = (+)(promote(x, y)...,)
(-)(x::ArbBall{P}, y::Mag) where {P} = (-)(promote(x, y)...,)
(*)(x::ArbBall{P}, y::Mag) where {P} = (*)(promote(x, y)...,)
(/)(x::ArbBall{P}, y::Mag) where {P} = (/)(promote(x, y)...,)
(^)(x::ArbBall{P}, y::Mag) where {P} = (^)(promote(x, y)...,)

for F in (:(+), :(-), :(*), :(/), :(^))
  @eval begin
    ($F)(x::ArbFloat{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbBall{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbComplex{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbFloat{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbBall{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbComplex{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::ArbComplex{P}, y::Complex) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::ArbFloat{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::ArbBall{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::ArbComplex{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::ArbFloat{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::ArbBall{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::ArbComplex{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Complex, y::ArbComplex{P}) where {P} = ($F)(promote(x, y)...,)
  end
end
