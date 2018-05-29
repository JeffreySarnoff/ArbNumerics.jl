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
        function ($A)(x::Arf{P}, y::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P}
            z = Arf{P}()
            rounding = match_rounding_mode(roundingmode)
            rounddir = ccall(@libarb($F), Cint, (Ref{Arf}, Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, y, P, rounding)
            return z
         end
    end
end

for (A,F) in ((:(+), :arb_add), (:(-), :arb_sub), (:(*), :arb_mul), (:(/), :arb_div), (:(^), :arb_pow))
    @eval begin
        function ($A)(x::Arb{P}, y::Arb{P}) where {P}
            z = Arb{P}()
            ccall(@libarb($F), Cvoid, (Ref{Arb}, Ref{Arb}, Ref{Arb}, Clong), z, x, y, P)
            return z
         end
    end
end

for (A,F) in ((:(+), :acb_add), (:(-), :acb_sub), (:(*), :acb_mul), (:(/), :acb_div), (:(^), :acb_pow))
    @eval begin
        function ($A)(x::Acb{P}, y::Acb{P}) where {P}
            z = Acb{P}()
            ccall(@libarb($F), Cvoid, (Ref{Acb}, Ref{Acb}, Ref{Acb}, Clong), z, x, y, P)
            return z
         end
    end
end

(+)(x::Acb{P}, y::Arb{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Acb{P}, y::Arb{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Acb{P}, y::Arb{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Acb{P}, y::Arb{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Acb{P}, y::Arb{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::Arb{P}, y::Acb{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Arb{P}, y::Acb{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Arb{P}, y::Acb{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Arb{P}, y::Acb{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Arb{P}, y::Acb{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::Acb{P}, y::Arf{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Acb{P}, y::Arf{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Acb{P}, y::Arf{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Acb{P}, y::Arf{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Acb{P}, y::Arf{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::Arf{P}, y::Acb{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Arf{P}, y::Acb{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Arf{P}, y::Acb{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Arf{P}, y::Acb{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Arf{P}, y::Acb{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::Arb{P}, y::Arf{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Arb{P}, y::Arf{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Arb{P}, y::Arf{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Arb{P}, y::Arf{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Arb{P}, y::Arf{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::Arf{P}, y::Arb{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Arf{P}, y::Arb{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Arf{P}, y::Arb{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Arf{P}, y::Arb{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Arf{P}, y::Arb{P}) where {P} = (^)(promote(x, y)...,)

(+)(x::Mag, y::Arf{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Mag, y::Arf{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Mag, y::Arf{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Mag, y::Arf{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Mag, y::Arf{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::Arf{P}, y::Mag) where {P} = (+)(promote(x, y)...,)
(-)(x::Arf{P}, y::Mag) where {P} = (-)(promote(x, y)...,)
(*)(x::Arf{P}, y::Mag) where {P} = (*)(promote(x, y)...,)
(/)(x::Arf{P}, y::Mag) where {P} = (/)(promote(x, y)...,)
(^)(x::Arf{P}, y::Mag) where {P} = (^)(promote(x, y)...,)

(+)(x::Mag, y::Arb{P}) where {P} = (+)(promote(x, y)...,)
(-)(x::Mag, y::Arb{P}) where {P} = (-)(promote(x, y)...,)
(*)(x::Mag, y::Arb{P}) where {P} = (*)(promote(x, y)...,)
(/)(x::Mag, y::Arb{P}) where {P} = (/)(promote(x, y)...,)
(^)(x::Mag, y::Arb{P}) where {P} = (^)(promote(x, y)...,)
(+)(x::Arb{P}, y::Mag) where {P} = (+)(promote(x, y)...,)
(-)(x::Arb{P}, y::Mag) where {P} = (-)(promote(x, y)...,)
(*)(x::Arb{P}, y::Mag) where {P} = (*)(promote(x, y)...,)
(/)(x::Arb{P}, y::Mag) where {P} = (/)(promote(x, y)...,)
(^)(x::Arb{P}, y::Mag) where {P} = (^)(promote(x, y)...,)

for F in (:(+), :(-), :(*), :(/), :(^))
  @eval begin
    ($F)(x::Arf{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Arb{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Acb{P}, y::Integer) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Arf{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Arb{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Acb{P}, y::AbstractFloat) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Acb{P}, y::Complex) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::Arf{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::Arb{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Integer, y::Acb{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::Arf{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::Arb{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::AbstractFloat, y::Acb{P}) where {P} = ($F)(promote(x, y)...,)
    ($F)(x::Complex, y::Acb{P}) where {P} = ($F)(promote(x, y)...,)
  end
end
