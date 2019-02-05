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

function zero!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_zero), Cvoid, (Ref{ArbReal},), x)
    return x
end

function one!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_one), Cvoid, (Ref{ArbReal},), x)
    return x
end

function inf!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{ArbReal},), x)
    return x
end

function posinf!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{ArbReal},), x)
    return x
end

function neginf!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_neg_inf), Cvoid, (Ref{ArbReal},), x)
    return x
end

function pminf!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_zero_pm_inf), Cvoid, (Ref{ArbReal},), x)
    return x
end

function indeterminate!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_indeterminate), Cvoid, (Ref{ArbReal},), x)
    return x
end

function nan!(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_nan), Cvoid, (Ref{ArbReal},), x)
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
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = inf!(rea)
    ima = inf!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function posinf!(x::ArbComplex{P}) where {P}
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = posinf!(rea)
    ima = zero!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function neginf!(x::ArbComplex{P}) where {P}
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = neginf!(rea)
    ima = zero!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function pminf!(x::ArbComplex{P}) where {P}
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = pminf!(rea)
    ima = pminf!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function indeterminate!(x::ArbComplex{P}) where {P}
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = indeterminate!(rea)
    ima = indeterminate!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end

function nan!(x::ArbComplex{P}) where {P}
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    rea = nan!(rea)
    ima = nan!(ima)
    z = ArbComplex{P}(rea, ima)
    return z
end


zero(::Type{Mag}) = Mag()
zero(::Type{ArbFloat{P}}) where {P} = ArbFloat{P}()
zero(::Type{ArbReal{P}}) where {P} = ArbReal{P}()
zero(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}()
zero(x::Mag) = zero(typeof(x))
zero(x::ArbFloat{P}) where {P} = zero(typeof(x))
zero(x::ArbReal{P}) where {P} = zero(typeof(x))
zero(x::ArbComplex{P}) where {P} = zero(typeof(x))
zero(::Type{ArbFloat}) = zero(ArbFloat{DEFAULT_PRECISION.x})
zero(::Type{ArbReal}) = zero(ArbReal{DEFAULT_PRECISION.x})
zero(::Type{ArbComplex}) = zero(ArbComplex{DEFAULT_PRECISION.x})

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
function one(::Type{ArbReal{P}}) where {P}
    z = ArbReal{P}()
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
one(x::ArbReal{P}) where {P} = one(typeof(x))
one(x::ArbComplex{P}) where {P} = one(typeof(x))
one(::Type{ArbFloat}) = one(ArbFloat{DEFAULT_PRECISION.x})
one(::Type{ArbReal}) = one(ArbReal{DEFAULT_PRECISION.x})
one(::Type{ArbComplex}) = one(ArbComplex{DEFAULT_PRECISION.x})

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
function inf(::Type{ArbReal{P}}) where {P}
    z = ArbReal{P}()
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
inf(x::ArbReal{P}) where {P} = inf(typeof(x))
inf(x::ArbComplex{P}) where {P} = inf(typeof(x))
inf(::Type{ArbFloat}) = inf(ArbFloat{DEFAULT_PRECISION.x})
inf(::Type{ArbReal}) = inf(ArbReal{DEFAULT_PRECISION.x})
inf(::Type{ArbComplex}) = inf(ArbComplex{DEFAULT_PRECISION.x})

posinf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function posinf(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    posinf!(z)
    return z
end
function posinf(::Type{ArbReal{P}}) where {P}
    z = ArbReal{P}()
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
posinf(x::ArbReal{P}) where {P} = posinf(typeof(x))
posinf(x::ArbComplex{P}) where {P} = posinf(typeof(x))
posinf(::Type{ArbFloat}) = posinf(ArbFloat{DEFAULT_PRECISION.x})
posinf(::Type{ArbReal}) = posinf(ArbReal{DEFAULT_PRECISION.x})
posinf(::Type{ArbComplex}) = posinf(ArbComplex{DEFAULT_PRECISION.x})

neginf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function neginf(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    neginf!(z)
    return z
end
function neginf(::Type{ArbReal{P}}) where {P}
    z = ArbReal{P}()
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
neginf(x::ArbReal{P}) where {P} = neginf(typeof(x))
neginf(x::ArbComplex{P}) where {P} = neginf(typeof(x))
neginf(::Type{ArbFloat}) = neginf(ArbFloat{DEFAULT_PRECISION.x})
neginf(::Type{ArbReal}) = neginf(ArbReal{DEFAULT_PRECISION.x})
neginf(::Type{ArbComplex}) = neginf(ArbComplex{DEFAULT_PRECISION.x})

allextendedreals(::Type{ArbReal{P}}) where {P} = pminf!(zero(ArbReal{P}))
allextendedreals(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(allextendedreals(ArbReal{P}), zero(ArbReal{P}))
allextendedimags(::Type{ArbReal{P}}) where {P} = ArbComplex{P}(zero(ArbReal{P}), allextendedreals(ArbReal{P}))
allextendedcomplex(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(allextendedreals(ArbReal{P}), allextendedreals(ArbReal{P}))
allextendedreals(::Type{ArbReal}) = allextendedreals(ArbReal{DEFAULT_PRECISION.x})
allextendedreals(::Type{ArbComplex}) = ArbComplex{DEFAULT_PRECISION.x}(allextendedreals(ArbReal), zero(ArbReal))
allextendedimags(::Type{ArbComplex}) = ArbComplex{DEFAULT_PRECISION.x}(zero(ArbReal), allextendedreals(ArbReal))

NaN(::Type{Mag}) = throw(DomainError("nan(Mag) does not exist"))
function NaN(::Type{ArbFloat{P}}) where {P}
    z = ArbFloat{P}()
    nan!(z)
    return z
end
function NaN(::Type{ArbReal{P}}) where {P}
    z = ArbReal{P}()
    nan!(z)
    return z
end
NaN(::Type{ArbComplex{P}}) where {P} = ArbComplex{P}(NaN(ArbReal{P}), NaN(ArbReal{P}))

NaN(x::Mag) = NaN(typeof(x))
NaN(x::ArbFloat{P}) where {P} = NaN(typeof(x))
NaN(x::ArbReal{P}) where {P} = NaN(typeof(x))
NaN(x::ArbComplex{P}) where {P} = NaN(typeof(x))
NaN(::Type{ArbFloat}) = NaN(ArbFloat{DEFAULT_PRECISION.x})
NaN(::Type{ArbReal}) = NaN(ArbReal{DEFAULT_PRECISION.x})
NaN(::Type{ArbComplex}) = NaN(ArbComplex{DEFAULT_PRECISION.x})



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

function ispositive(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_positive), Cint, (Ref{ArbFloat},), x)
end

function isnonpositive(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_nonpositive), Cint, (Ref{ArbFloat},), x)
end

function isnegative(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_negative), Cint, (Ref{ArbFloat},), x)
end

function isnonnegative(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_nonnegative), Cint, (Ref{ArbFloat},), x)
end

function isinteger(x::ArbFloat{P}) where {P}
    0 != ccall(@libarb(arf_is_int), Cint, (Ref{ArbFloat},), x)
end

function isnoninteger(x::ArbFloat{P}) where {P}
    0 == ccall(@libarb(arf_is_int), Cint, (Ref{ArbFloat},), x)
end


function isspecial(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_special), Cint, (Ref{ArbReal},), x)
end

function isnormal(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_normal), Cint, (Ref{ArbReal},), x)
end

function isfinite(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_finite), Cint, (Ref{ArbReal},), x)
end

function isnonfinite(x::ArbReal{P}) where {P}
    0 == ccall(@libarb(arb_is_finite), Cint, (Ref{ArbReal},), x)
end

function iszero(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_zero), Cint, (Ref{ArbReal},), x)
end

function isone(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_one), Cint, (Ref{ArbReal},), x)
end

function isnonzero(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_nonzero), Cint, (Ref{ArbReal},), x)
end

function isexact(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_exact), Cint, (Ref{ArbReal},), x)
end

function isinexact(x::ArbReal{P}) where {P}
    0 == ccall(@libarb(arb_is_exact), Cint, (Ref{ArbReal},), x)
end

function isinf(x::ArbReal{P}) where {P}
    isinf(ArbFloat{P}(x))
end

function isposinf(x::ArbReal{P}) where {P}
    isposinf(ArbFloat{P}(x))
end

function isneginf(x::ArbReal{P}) where {P}
    isneginf(ArbFloat{P}(x))
end

function isnan(x::ArbReal{P}) where {P}
    isnan(ArbFloat{P}(x))
end

function ispositive(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_positive), Cint, (Ref{ArbReal},), x)
end

function isnonpositive(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_nonpositive), Cint, (Ref{ArbReal},), x)
end

function isnegative(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_negative), Cint, (Ref{ArbReal},), x)
end

function isnonnegative(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_nonnegative), Cint, (Ref{ArbReal},), x)
end

function isinteger(x::ArbReal{P}) where {P}
    0 != ccall(@libarb(arb_is_int), Cint, (Ref{ArbReal},), x)
end

function isnoninteger(x::ArbReal{P}) where {P}
    0 == ccall(@libarb(arb_is_int), Cint, (Ref{ArbReal},), x)
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

function ispositive(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_positive), Cint, (Ref{ArbComplex},), x)
end

function isnonpositive(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_nonpositive), Cint, (Ref{ArbComplex},), x)
end

function isnegative(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_negative), Cint, (Ref{ArbComplex},), x)
end

function isnonnegative(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_nonnegative), Cint, (Ref{ArbComplex},), x)
end

function isinteger(x::ArbComplex{P}) where {P}
    0 != ccall(@libarb(arb_is_int), Cint, (Ref{ArbComplex},), x)
end

function isnoninteger(x::ArbComplex{P}) where {P}
    0 == ccall(@libarb(arb_is_int), Cint, (Ref{ArbComplex},), x)
end



typemax(::Type{ArbFloat{P}}) where {P} = posinf(ArbFloat{P})
typemin(::Type{ArbFloat{P}}) where {P} = neginf(ArbFloat{P})

typemax(::Type{ArbReal{P}}) where {P} = posinf(ArbReal{P})
typemin(::Type{ArbReal{P}}) where {P} = neginf(ArbReal{P})

floatmax(::Type{ArbFloat{P}}) where {P} = pow(ArbFloat{P}(P), square(ArbFloat{P}(P)))
floatmin(::Type{ArbFloat{P}}) where {P} = inv(floatmax(ArbFloat{P}))

floatmax(::Type{ArbReal{P}}) where {P} = ArbReal{P}(floatmax(ArbFloat{P}))
floatmin(::Type{ArbReal{P}}) where {P} = ArbReal{P}(inv(floatmax(ArbFloat{P})))

floatmin2(::Type{T}) where {P,T<:ArbFloat{P}} = (twopar = 2one(T); T(twopar^trunc(BigInt,log(floatmin(T)/eps(T))/log(twopar)/twopar)))
floatmin2(::Type{T}) where {P,T<:ArbReal{P}} = T(floatmin2(ArbFloat{P}))
