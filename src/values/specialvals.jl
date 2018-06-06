function zero!(x::Mag)
    ccall(@libarb(mag_zero), Cvoid, (Ref{Mag},), x)
    return x
end

function one!(x::Mag)
    ccall(@libarb(mag_one), Cvoid, (Ref{Mag},), x)
    return x
end

function inf!(x::Mag)
    ccall(@libarb(mag_inf), Cvoid, (Ref{Mag},), x)
    return x
end

function zero!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_zero), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function one!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_one), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function inf!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_pos_inf), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function posinf!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_pos_inf), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function neginf!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_neg_inf), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function nan!(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_nan), Cvoid, (Ref{ArbFloat},), x)
    return x
end

function zero!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_zero), Cvoid, (Ref{ArbBall},), x)
    return x
end

function one!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_one), Cvoid, (Ref{ArbBall},), x)
    return x
end

function inf!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{ArbBall},), x)
    return x
end

function posinf!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{ArbBall},), x)
    return x
end

function neginf!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_neg_inf), Cvoid, (Ref{ArbBall},), x)
    return x
end

function pminf!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_zero_pm_inf), Cvoid, (Ref{ArbBall},), x)
    return x
end

function indeterminate!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_indeterminate), Cvoid, (Ref{ArbBall},), x)
    return x
end

function nan!(x::ArbBall{P}) where {P}
    ccall(@libarb(arb_nan), Cvoid, (Ref{ArbBall},), x)
    return x
end


function zero!(x::ArbComplex{P}) where {P}
    ccall(@libarb(acb_zero), Cvoid, (Ref{ArbComplex},), x)
    return x
end

function one!(x::ArbComplex{P}) where {P}
    ccall(@libarb(acb_one), Cvoid, (Ref{ArbComplex},), x)
    return x
end

function inf!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = inf!(rea)
    ima = inf!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function posinf!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = posinf!(rea)
    ima = zero!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function neginf!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = neginf!(rea)
    ima = zero!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function pminf!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = pminf!(rea)
    ima = pminf!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function indeterminate!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = indeterminate!(rea)
    ima = indeterminate!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function nan!(x::ArbComplex{P}) where {P}
    rea = ArbBall{P}()
    ima = ArbBall{P}()
    rea = nan!(rea)
    ima = nan!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end


zero(::Type{Mag}) = Mag()
zero(::Type{ArbFloat{P}}) where {P} = ArbFloat{P}()
zero(::Type{ArbBall{P}}) where {P} = ArbBall{P}()
zero(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}()
zero(x::Mag) = zero(typeof(x))
zero(x::ArbFloat{P}) where {P} = zero(typeof(x))
zero(x::ArbBall{P}) where {P} = zero(typeof(x))
zero(x::ArbComplex{P}) where {P} = zero(typeof(x))
zero(::Type{ArbFloat}) = zero(ArbFloat{DEFAULT_PRECISION[1]})
zero(::Type{ArbBall}) = zero(ArbBall{DEFAULT_PRECISION[1]})
zero(::Type{ArbComplex}) = zero(ArbComplex{DEFAULT_PRECISION[1]})

function one(::Type{Mag})
    z = Mag()
    one!(z)
    return z
end
function one(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    one!(z)
    return z
end
function one(::Type{ArbBall{P}}) where {P}
    z = ArbBall{P}()
    one!(z)
    return z
end
function one(::Type{ArbComplex{P}}) where {P}
    z = ArbComplex{P}()
    one!(z)
    return z
end

one(x::Mag) = zero(typeof(x))
one(x::ArbFloat{P}) where {P} = one(typeof(x))
one(x::ArbBall{P}) where {P} = one(typeof(x))
one(x::ArbComplex{P}) where {P} = one(typeof(x))
one(::Type{ArbFloat}) = one(ArbFloat{DEFAULT_PRECISION[1]})
one(::Type{ArbBall}) = one(ArbBall{DEFAULT_PRECISION[1]})
one(::Type{ArbComplex}) = one(ArbComplex{DEFAULT_PRECISION[1]})

function inf(::Type{Mag})
    z = Mag()
    inf!(z)
    return z
end
function inf(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    inf!(z)
    return z
end
function inf(::Type{ArbBall{P}}) where {P}
    z = ArbBall{P}()
    inf!(z)
    return z
end
function inf(::Type{ArbComplex{P}}) where {P}
    z = ArbComplex{P}()
    inf!(z)
    return z
end

inf(x::Mag) = inf(typeof(x))
inf(x::ArbFloat{P}) where {P} = inf(typeof(x))
inf(x::ArbBall{P}) where {P} = inf(typeof(x))
inf(x::ArbComplex{P}) where {P} = inf(typeof(x))
inf(::Type{ArbFloat}) = inf(ArbFloat{DEFAULT_PRECISION[1]})
inf(::Type{ArbBall}) = inf(ArbBall{DEFAULT_PRECISION[1]})
inf(::Type{ArbComplex}) = inf(ArbComplex{DEFAULT_PRECISION[1]})

posinf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function posinf(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    posinf!(z)
    return z
end
function posinf(::Type{ArbBall{P}}) where {P}
    z = ArbBall{P}()
    posinf!(z)
    return z
end
function posinf(::Type{ArbComplex{P}}) where {P}
    z = ArbComplex{P}()
    posinf!(z)
    return z
end

posinf(x::Mag) = posinf(typeof(x))
posinf(x::ArbFloat{P}) where {P} = posinf(typeof(x))
posinf(x::ArbBall{P}) where {P} = posinf(typeof(x))
posinf(x::ArbComplex{P}) where {P} = posinf(typeof(x))
posinf(::Type{ArbFloat}) = posinf(ArbFloat{DEFAULT_PRECISION[1]})
posinf(::Type{ArbBall}) = posinf(ArbBall{DEFAULT_PRECISION[1]})
posinf(::Type{ArbComplex}) = posinf(ArbComplex{DEFAULT_PRECISION[1]})

neginf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function neginf(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    neginf!(z)
    return z
end
function neginf(::Type{ArbBall{P}}) where {P}
    z = ArbBall{P}()
    neginf!(z)
    return z
end
function neginf(::Type{ArbComplex{P}}) where {P}
    z = ArbComplex{P}()
    neginf!(z)
    return z
end

neginf(x::Mag) = neginf(typeof(x))
neginf(x::ArbFloat{P}) where {P} = neginf(typeof(x))
neginf(x::ArbBall{P}) where {P} = neginf(typeof(x))
neginf(x::ArbComplex{P}) where {P} = neginf(typeof(x))
neginf(::Type{ArbFloat}) = neginf(ArbFloat{DEFAULT_PRECISION[1]})
neginf(::Type{ArbBall}) = neginf(ArbBall{DEFAULT_PRECISION[1]})
neginf(::Type{ArbComplex}) = neginf(ArbComplex{DEFAULT_PRECISION[1]})

allextendedreals(::Type{ArbBall{P}}) where {P} = pminf!(zero(ArbBall{P}))
allextendedreals(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(allextendedreals(ArbBall{P}), zero(ArbBall{P}))
allextendedimags(::Type{ArbBall{P}}) where {P} = ArbComplex{P}(zero(ArbBall{P}), allextendedreals(ArbBall{P}))
allextendedcomplex(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(allextendedreals(ArbBall{P}), allextendedreals(ArbBall{P}))
allextendedreals(::Type{ArbBall}) = allextendedreals(ArbBall{DEFAULT_PRECISION[1]})
allextendedreals(::Type{ArbComplex}) = ArbComplex{DEFAULT_PRECISION[1]}(allextendedreals(ArbBall), zero(ArbBall))
allextendedimags(::Type{ArbComplex}) = ArbComplex{DEFAULT_PRECISION[1]}(zero(ArbBall), allextendedreals(ArbBall))

NaN(::Type{Mag}) = throw(DomainError("nan(Mag) does not exist"))
function NaN(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    nan!(z)
    return z
end
function NaN(::Type{ArbBall{P}}) where {P}
    z = ArbBall{P}()
    nan!(z)
    return z
end
NaN(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(NaN(ArbBall{P}), NaN(ArbBall{P}))

NaN(x::Mag) = NaN(typeof(x))
NaN(x::ArbFloat{P}) where {P} = NaN(typeof(x))
NaN(x::ArbBall{P}) where {P} = NaN(typeof(x))
NaN(x::ArbComplex{P}) where {P} = NaN(typeof(x))
NaN(::Type{ArbFloat}) = NaN(ArbFloat{DEFAULT_PRECISION[1]})
NaN(::Type{ArbBall}) = NaN(ArbBall{DEFAULT_PRECISION[1]})
NaN(::Type{ArbComplex}) = NaN(ArbComplex{DEFAULT_PRECISION[1]})



function isspecial(x::Mag)
    0 != ccall(@libarb(mag_is_special), Cint, (Ref{Mag},), x)
end

function isnormal(x::Mag)
    0 == ccall(@libarb(mag_is_special), Cint, (Ref{Mag},), x)
end

function isfinite(x::Mag)
    0 != ccall(@libarb(mag_is_finite), Cint, (Ref{Mag},), x)
end

function isnonfinite(x::Mag)
    0 == ccall(@libarb(mag_is_finite), Cint, (Ref{Mag},), x)
end

function iszero(x::Mag)
    0 != ccall(@libarb(mag_is_zero), Cint, (Ref{Mag},), x)
end

function isnonzero(x::Mag)
    0 == ccall(@libarb(mag_is_zero), Cint, (Ref{Mag},), x)
end

function isinf(x::Mag)
    0 != ccall(@libarb(mag_is_inf), Cint, (Ref{Mag},), x)
end

function isposinf(x::Mag)
    0 != ccall(@libarb(mag_is_inf), Cint, (Ref{Mag},), x)
end

function isneginf(x::Mag)
    false
end

function isspecial(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_special), Cint, (Ref{ArbFloat},), x)
end

function isnormal(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_normal), Cint, (Ref{ArbFloat},), x)
end

function isfinite(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_finite), Cint, (Ref{ArbFloat},), x)
end

function isnonfinite(x::ArbFloat{P}) where {P}
    0 == ccall(@libarb(arf_is_finite), Cint, (Ref{ArbFloat},), x)
end

function iszero(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_zero), Cint, (Ref{ArbFloat},), x)
end

function isone(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_one), Cint, (Ref{ArbFloat},), x)
end

function isnonzero(x::ArbFloat{P}) where {P}
    0 == ccall(@libarb(arf_is_zero), Cint, (Ref{ArbFloat},), x)
end

function isinf(x::ArbFloat{P}) where {P}
    z = abs(x)
    0 != ccall(@libarb(arf_is_inf), Cint, (Ref{ArbFloat},), x)
end

function isposinf(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_pos_inf), Cint, (Ref{ArbFloat},), x)
end

function isneginf(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_neg_inf), Cint, (Ref{ArbFloat},), x)
end

function isnan(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_nan), Cint, (Ref{ArbFloat},), x)
end


function isspecial(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_special), Cint, (Ref{ArbBall},), x)
end

function isnormal(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_normal), Cint, (Ref{ArbBall},), x)
end

function isfinite(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_finite), Cint, (Ref{ArbBall},), x)
end

function isnonfinite(x::ArbBall{P}) where {P}
    0 == ccall(@libarb(arb_is_finite), Cint, (Ref{ArbBall},), x)
end

function iszero(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_zero), Cint, (Ref{ArbBall},), x)
end

function isone(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_one), Cint, (Ref{ArbBall},), x)
end

function isnonzero(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_nonzero), Cint, (Ref{ArbBall},), x)
end

function isexact(x::ArbBall{P}) where {P}
    0 != ccall(@libarb(arb_is_exact), Cint, (Ref{ArbBall},), x)
end

function isinexact(x::ArbBall{P}) where {P}
    0 == ccall(@libarb(arb_is_exact), Cint, (Ref{ArbBall},), x)
end

function isinf(x::ArbBall{P}) where {P}
    isinf(ArbFloat{P}(x))
end

function isposinf(x::ArbBall{P}) where {P}
    isposinf(ArbFloat{P}(x))
end

function isneginf(x::ArbBall{P}) where {P}
    isneginf(ArbFloat{P}(x))
end

function isnan(x::ArbBall{P}) where {P}
    isnan(ArbFloat{P}(x))
end




function iszero(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(acb_is_zero), Cint, (Ref{ArbComplex},), x)
end

function isnonzero(x::ArbComplex{P}) where {P}
    0 == ccall(@libarb(acb_is_zero), Cint, (Ref{ArbComplex},), x)
end

function isone(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(acb_is_one), Cint, (Ref{ArbComplex},), x)
end

function isexact(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(acb_is_exact), Cint, (Ref{ArbComplex},), x)
end

function isinexact(x::ArbComplex{P}) where {P}
    0 == ccall(@libarb(acb_is_exact), Cint, (Ref{ArbComplex},), x)
end

function isfinite(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_finite), Cint, (Ref{ArbComplex},), x)
end

function isnonfinite(x::ArbComplex{P}) where {P}
    0 == ccall(@libarb(arb_is_finite), Cint, (Ref{ArbComplex},), x)
end

function isinf(x::ArbComplex{P}) where {P}
    !isfinite(x) && !isnan(x)
end

function isposinf(x::ArbComplex{P}) where {P}
    isposinf(real(x))
end

function isneginf(x::ArbComplex{P}) where {P}
    isneginf(real(x))
end

function isnan(x::ArbComplex{P}) where {P}
    isnan(real(x)) || isnan(imag(x))
end
