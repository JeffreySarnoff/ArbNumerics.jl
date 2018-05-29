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

function zero!(x::Arf{P}) where {P}
    ccall(@libarb(arf_zero), Cvoid, (Ref{Arf},), x)
    return x
end

function one!(x::Arf{P}) where {P}
    ccall(@libarb(arf_one), Cvoid, (Ref{Arf},), x)
    return x
end

function inf!(x::Arf{P}) where {P}
    ccall(@libarb(arf_pos_inf), Cvoid, (Ref{Arf},), x)
    return x
end

function posinf!(x::Arf{P}) where {P}
    ccall(@libarb(arf_pos_inf), Cvoid, (Ref{Arf},), x)
    return x
end

function neginf!(x::Arf{P}) where {P}
    ccall(@libarb(arf_neg_inf), Cvoid, (Ref{Arf},), x)
    return x
end

function nan!(x::Arf{P}) where {P}
    ccall(@libarb(arf_nan), Cvoid, (Ref{Arf},), x)
    return x
end

function zero!(x::Arb{P}) where {P}
    ccall(@libarb(arb_zero), Cvoid, (Ref{Arb},), x)
    return x
end

function one!(x::Arb{P}) where {P}
    ccall(@libarb(arb_one), Cvoid, (Ref{Arb},), x)
    return x
end

function inf!(x::Arb{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{Arb},), x)
    return x
end

function posinf!(x::Arb{P}) where {P}
    ccall(@libarb(arb_pos_inf), Cvoid, (Ref{Arb},), x)
    return x
end

function neginf!(x::Arb{P}) where {P}
    ccall(@libarb(arb_neg_inf), Cvoid, (Ref{Arb},), x)
    return x
end

function pminf!(x::Arb{P}) where {P}
    ccall(@libarb(arb_zero_pm_inf), Cvoid, (Ref{Arb},), x)
    return x
end

function indeterminate!(x::Arb{P}) where {P}
    ccall(@libarb(arb_indeterminate), Cvoid, (Ref{Arb},), x)
    return x
end

function nan!(x::Arb{P}) where {P}
    ccall(@libarb(arb_nan), Cvoid, (Ref{Arb},), x)
    return x
end


function zero!(x::Acb{P}) where {P}
    ccall(@libarb(acb_zero), Cvoid, (Ref{Acb},), x)
    return x
end

function one!(x::Acb{P}) where {P}
    ccall(@libarb(acb_one), Cvoid, (Ref{Acb},), x)
    return x
end

function inf!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = inf!(rea)
    ima = inf!(ima)
    z = Acb{P}(rea, ima)
    return z
end

function posinf!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = posinf!(rea)
    ima = zero!(ima)
    z = Acb{P}(rea, ima)
    return z
end

function neginf!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = neginf!(rea)
    ima = zero!(ima)
    z = Acb{P}(rea, ima)
    return z
end

function pminf!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = pminf!(rea)
    ima = pminf!(ima)
    z = Acb{P}(rea, ima)
    return z
end

function indeterminate!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = indeterminate!(rea)
    ima = indeterminate!(ima)
    z = Acb{P}(rea, ima)
    return z
end

function nan!(x::Acb{P}) where {P}
    rea = Arb{P}()
    ima = Arb{P}()
    rea = nan!(rea)
    ima = nan!(ima)
    z = Acb{P}(rea, ima)
    return z
end


zero(::Type{Mag}) = Mag()
zero(::Type{Arf{P}}) where {P} = Arf{P}()
zero(::Type{Arb{P}}) where {P} = Arb{P}()
zero(::Type{Acb{P}}) where {P} = Acb{P}()
zero(x::Mag) = zero(typeof(x))
zero(x::Arf{P}) where {P} = zero(typeof(x))
zero(x::Arb{P}) where {P} = zero(typeof(x))
zero(x::Acb{P}) where {P} = zero(typeof(x))
zero(::Type{Arf}) = zero(Arf{DEFAULT_PRECISION[1]})
zero(::Type{Arb}) = zero(Arb{DEFAULT_PRECISION[1]})
zero(::Type{Acb}) = zero(Acb{DEFAULT_PRECISION[1]})

function one(::Type{Mag})
    z = Mag()
    one!(z)
    return z
end
function one(::Type{Arf{P}}) where {P}
    z = Arf{P}()
    one!(z)
    return z
end
function one(::Type{Arb{P}}) where {P}
    z = Arb{P}()
    one!(z)
    return z
end
function one(::Type{Acb{P}}) where {P}
    z = Acb{P}()
    one!(z)
    return z
end

one(x::Mag) = zero(typeof(x))
one(x::Arf{P}) where {P} = one(typeof(x))
one(x::Arb{P}) where {P} = one(typeof(x))
one(x::Acb{P}) where {P} = one(typeof(x))
one(::Type{Arf}) = one(Arf{DEFAULT_PRECISION[1]})
one(::Type{Arb}) = one(Arb{DEFAULT_PRECISION[1]})
one(::Type{Acb}) = one(Acb{DEFAULT_PRECISION[1]})

function inf(::Type{Mag})
    z = Mag()
    inf!(z)
    return z
end
function inf(::Type{Arf{P}}) where {P}
    z = Arf{P}()
    inf!(z)
    return z
end
function inf(::Type{Arb{P}}) where {P}
    z = Arb{P}()
    inf!(z)
    return z
end
function inf(::Type{Acb{P}}) where {P}
    z = Acb{P}()
    inf!(z)
    return z
end

inf(x::Mag) = inf(typeof(x))
inf(x::Arf{P}) where {P} = inf(typeof(x))
inf(x::Arb{P}) where {P} = inf(typeof(x))
inf(x::Acb{P}) where {P} = inf(typeof(x))
inf(::Type{Arf}) = inf(Arf{DEFAULT_PRECISION[1]})
inf(::Type{Arb}) = inf(Arb{DEFAULT_PRECISION[1]})
inf(::Type{Acb}) = inf(Acb{DEFAULT_PRECISION[1]})

posinf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function posinf(::Type{Arf{P}}) where {P}
    z = Arf{P}()
    posinf!(z)
    return z
end
function posinf(::Type{Arb{P}}) where {P}
    z = Arb{P}()
    posinf!(z)
    return z
end
function posinf(::Type{Acb{P}}) where {P}
    z = Acb{P}()
    posinf!(z)
    return z
end

posinf(x::Mag) = posinf(typeof(x))
posinf(x::Arf{P}) where {P} = posinf(typeof(x))
posinf(x::Arb{P}) where {P} = posinf(typeof(x))
posinf(x::Acb{P}) where {P} = posinf(typeof(x))
posinf(::Type{Arf}) = posinf(Arf{DEFAULT_PRECISION[1]})
posinf(::Type{Arb}) = posinf(Arb{DEFAULT_PRECISION[1]})
posinf(::Type{Acb}) = posinf(Acb{DEFAULT_PRECISION[1]})

neginf(::Type{Mag}) = throw(DomainError("use `inf(Mag)`."))
function neginf(::Type{Arf{P}}) where {P}
    z = Arf{P}()
    neginf!(z)
    return z
end
function neginf(::Type{Arb{P}}) where {P}
    z = Arb{P}()
    neginf!(z)
    return z
end
function neginf(::Type{Acb{P}}) where {P}
    z = Acb{P}()
    neginf!(z)
    return z
end

neginf(x::Mag) = neginf(typeof(x))
neginf(x::Arf{P}) where {P} = neginf(typeof(x))
neginf(x::Arb{P}) where {P} = neginf(typeof(x))
neginf(x::Acb{P}) where {P} = neginf(typeof(x))
neginf(::Type{Arf}) = neginf(Arf{DEFAULT_PRECISION[1]})
neginf(::Type{Arb}) = neginf(Arb{DEFAULT_PRECISION[1]})
neginf(::Type{Acb}) = neginf(Acb{DEFAULT_PRECISION[1]})

allextendedreals(::Type{Arb{P}}) where {P} = pminf!(zero(Arb{P}))
allextendedreals(::Type{Acb{P}}) where {P} = Acb{P}(allextendedreals(Arb{P}), zero(Arb{P}))
allextendedimags(::Type{Arb{P}}) where {P} = Acb{P}(zero(Arb{P}), allextendedreals(Arb{P}))
allextendedcomplex(::Type{Acb{P}}) where {P} = Acb{P}(allextendedreals(Arb{P}), allextendedreals(Arb{P}))
allextendedreals(::Type{Arb}) = allextendedreals(Arb{DEFAULT_PRECISION[1]})
allextendedreals(::Type{Acb}) = Acb{DEFAULT_PRECISION[1]}(allextendedreals(Arb), zero(Arb))
allextendedimags(::Type{Acb}) = Acb{DEFAULT_PRECISION[1]}(zero(Arb), allextendedreals(Arb))

NaN(::Type{Mag}) = throw(DomainError("nan(Mag) does not exist"))
function NaN(::Type{Arf{P}}) where {P}
    z = Arf{P}()
    nan!(z)
    return z
end
function NaN(::Type{Arb{P}}) where {P}
    z = Arb{P}()
    nan!(z)
    return z
end
NaN(::Type{Acb{P}}) where {P} = Acb{P}(NaN(Arb{P}), NaN(Arb{P}))

NaN(x::Mag) = NaN(typeof(x))
NaN(x::Arf{P}) where {P} = NaN(typeof(x))
NaN(x::Arb{P}) where {P} = NaN(typeof(x))
NaN(x::Acb{P}) where {P} = NaN(typeof(x))
NaN(::Type{Arf}) = NaN(Arf{DEFAULT_PRECISION[1]})
NaN(::Type{Arb}) = NaN(Arb{DEFAULT_PRECISION[1]})
NaN(::Type{Acb}) = NaN(Acb{DEFAULT_PRECISION[1]})



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

function isspecial(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_special), Cint, (Ref{Arf},), x)
end

function isnormal(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_normal), Cint, (Ref{Arf},), x)
end

function isfinite(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_finite), Cint, (Ref{Arf},), x)
end

function isnonfinite(x::Arf{P}) where {P}
    0 == ccall(@libarb(arf_is_finite), Cint, (Ref{Arf},), x)
end

function iszero(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_zero), Cint, (Ref{Arf},), x)
end

function isone(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_one), Cint, (Ref{Arf},), x)
end

function isnonzero(x::Arf{P}) where {P}
    0 == ccall(@libarb(arf_is_zero), Cint, (Ref{Arf},), x)
end

function isinf(x::Arf{P}) where {P}
    z = abs(x)
    0 != ccall(@libarb(arf_is_inf), Cint, (Ref{Arf},), x)
end

function isposinf(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_pos_inf), Cint, (Ref{Arf},), x)
end

function isneginf(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_neg_inf), Cint, (Ref{Arf},), x)
end

function isnan(x::Arf{P}) where {P}
    0 != ccall(@libarb(arf_is_nan), Cint, (Ref{Arf},), x)
end


function isspecial(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_special), Cint, (Ref{Arb},), x)
end

function isnormal(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_normal), Cint, (Ref{Arb},), x)
end

function isfinite(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_finite), Cint, (Ref{Arb},), x)
end

function isnonfinite(x::Arb{P}) where {P}
    0 == ccall(@libarb(arb_is_finite), Cint, (Ref{Arb},), x)
end

function iszero(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_zero), Cint, (Ref{Arb},), x)
end

function isone(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_one), Cint, (Ref{Arb},), x)
end

function isnonzero(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_nonzero), Cint, (Ref{Arb},), x)
end

function isexact(x::Arb{P}) where {P}
    0 != ccall(@libarb(arb_is_exact), Cint, (Ref{Arb},), x)
end

function isinexact(x::Arb{P}) where {P}
    0 == ccall(@libarb(arb_is_exact), Cint, (Ref{Arb},), x)
end

function isinf(x::Arb{P}) where {P}
    isinf(Arf{P}(x))
end

function isposinf(x::Arb{P}) where {P}
    isposinf(Arf{P}(x))
end

function isneginf(x::Arb{P}) where {P}
    isneginf(Arf{P}(x))
end

function isnan(x::Arb{P}) where {P}
    isnan(Arf{P}(x))
end




function iszero(x::Acb{P}) where {P}
    0 != ccall(@libarb(acb_is_zero), Cint, (Ref{Acb},), x)
end

function isnonzero(x::Acb{P}) where {P}
    0 == ccall(@libarb(acb_is_zero), Cint, (Ref{Acb},), x)
end

function isone(x::Acb{P}) where {P}
    0 != ccall(@libarb(acb_is_one), Cint, (Ref{Acb},), x)
end

function isexact(x::Acb{P}) where {P}
    0 != ccall(@libarb(acb_is_exact), Cint, (Ref{Acb},), x)
end

function isinexact(x::Acb{P}) where {P}
    0 == ccall(@libarb(acb_is_exact), Cint, (Ref{Acb},), x)
end

function isfinite(x::Acb{P}) where {P}
    0 != ccall(@libarb(arb_is_finite), Cint, (Ref{Acb},), x)
end

function isnonfinite(x::Acb{P}) where {P}
    0 == ccall(@libarb(arb_is_finite), Cint, (Ref{Acb},), x)
end

function isinf(x::Acb{P}) where {P}
    !isfinite(x) && !isnan(x)
end

function isposinf(x::Acb{P}) where {P}
    isposinf(real(x))
end

function isneginf(x::Acb{P}) where {P}
    isneginf(real(x))
end

function isnan(x::Acb{P}) where {P}
    isnan(real(x)) || isnan(imag(x))
end
