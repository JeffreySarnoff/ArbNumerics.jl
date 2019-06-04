#=
    significand_bits
    Returns the number of bits needed to represent
    the absolute value of the significand of an
    ArbFloat{P} value, directly or as an ArbReal{P} midpoint.
    This is the minimum precision in bits that
    allows an exact representation of that value.
    Returns 0 if x is a special value.
=#

function significand_bits(x::ArbFloat{P}) where {P}
    # returns the number of bits needed to represent the absolute value of the significand of x,
    # i.e. the minimum precision sufficient to represent x exactly. Returns 0 if x is a special value.
    nbits = ccall(@libarb(arf_bits), Clong, (Ref{ArbFloat},), x)
    return nbits%Int
end

function significand_bits(x::ArbReal{P}) where {P}
    # returns the number of bits needed to represent the absolute value of the significand of midpoint(x),
    # i.e. the minimum precision sufficient to represent x exactly. Returns 0 if x is a special value.
    nbits = ccall(@libarb(arb_bits), Clong, (Ref{ArbReal},), x)
    return nbits%Int
end

function significand_bits(x::ArbComplex{P}) where {P}
    # returns the number of bits needed to represent the maximum of bits(real(x)), bits(imag(x)).
    nbits = ccall(@libarb(acb_bits), Clong, (Ref{ArbComplex},), x)
    return nbits%Int
end


#=
    arb_rel_error_bits
    Returns the effective relative error of x measured in bits,
    defined as the difference between
    the position of the top bit in the radius
    and the top bit in the midpoint, plus one.
    The result is clamped between plus/minus ARF_PREC_EXACT
    (ARF_PREC_EXACT == ±(2^{63}-1) inclusive on a 64-bit machine).
    acb_rel_error_bits
    Returns the effective relative error of x measured in bits.
    This is computed as if calling arb_rel_error_bits() on the real ball
    whose midpoint is the larger out of the real and imaginary midpoints of x,
    and whose radius is the larger out of the real and imaginary radiuses of x.
=#

relerror_bits(x::ArbFloat{P}) where {P} = 0

function relerror_bits(x::ArbReal{P}) where {P}
    nbits = ccall(@libarb(arb_rel_error_bits), Clong, (Ref{ArbReal},), x)
    return nbits%Int
end

function relerror_bits(x::ArbComplex{P}) where {P}
    nbits = ccall(@libarb(crb_rel_error_bits), Clong, (Ref{ArbComplex},), x)
    return nbits%Int
end

#=
    rel_accuracy_bits
    Returns the effective relative accuracy intrinsic to a ball, measured in bits.
    This is equal to -relerror_bits.
=#


relaccuracy_bits(x::ArbFloat{P}) where {P} = 0

function relaccuracy_bits(x::ArbReal{P}) where {P}
    nbits = ccall(@libarb(arb_rel_accuracy_bits), Clong, (Ref{ArbReal},), x)
    return nbits%Int
end

function relaccuracy_bits(x::ArbComplex{P}) where {P}
    nbits = ccall(@libarb(acb_rel_accuracy_bits), Clong, (Ref{ArbComplex},), x)
    return nbits%Int
end


#=
    Rounds the significand of a value to the number of bits
    equal to the accuracy of x (as indicated by its radius),
    plus a few guard bits so enclosure is maintained.
=#

trim_bits(x::Mag) = x

function trim_bits(x::ArbFloat{P}, roundingmode::RoundingMode=RoundFromZero) where {P}
    nbits = significand_bits(x)
    nbits == P && return x
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{nbits}
    res = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, nbits, rounding)
    return res
end
function trim_bits(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_trim), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end
function trim_bits(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_trim), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end


#=
void arf_mag_set_ulp(mag_t res, const arf_t x, slong prec)
    Sets res to the magnitude of the unit in the last place (ulp) of x at precision prec.
=#
    

function ulp(x::ArbFloat{P}) where {P}
    if isnan(x) || isinf(x)
        return ArbFloat{P}(NaN)
    end    
    if !iszero(x)
        w = Mag()
        #   Sets z to the magnitude of the unit in the last place (ulp) of x at precision P.
        ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{ArbFloat}, Clong), w, x, P)
        z = ArbFloat{P}(w)
    else
        z = ArbFloat{P}(2.0)^(-workingprecision(x))
    end
    return z
end

function eps(x::ArbFloat{P}) where {P}
    if isnan(x) || isinf(x)
        return ArbFloat{P}(NaN)
    end    
    if !iszero(x)
        w = Mag()
        #   Sets z to the magnitude of the unit in the last place (ulp) of x at precision P.
        ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{ArbFloat}, Clong), w, x, P)
        z = ArbFloat{P}(w)
        z += z
    else
        z = ArbFloat{P}(2.0)^(-workingprecision(x))
    end
    return z
end

function ulp(x::ArbFloat{P}, prec::Int) where {P}
    prec < MINIMUM_PRECISION && throw(DomainError("bit precision ($prec) is too low"))
    y = ArbFloat(x, prec)
    z = ulp(y)
    return z
end

function eps(x::ArbFloat{P}, prec::Int) where {P}
    prec < MINIMUM_PRECISION && throw(DomainError("bit precision ($prec) is too low"))
    y = ArbFloat(x, prec)
    z = eps(y)
    return z
end

ulp(x::ArbReal{P}) where {P} = ulp(midpoint_byref(x))
eps(x::ArbReal{P}) where {P} = eps(midpoint_byref(x))

ulp(x::ArbComplex{P}) where {P} = ulp(midpoint_byref(real(x)))
eps(x::ArbComplex{P}) where {P} = eps(midpoint_byref(real(x)))

ulps(x::ArbComplex{P}) where {P} = ulp(midpoint_byref(real(x))), ulp(midpoint_byref(imag(x)))
epss(x::ArbComplex{P}) where {P} = eps(midpoint_byref(real(x))), eps(midpoint_byref(imag(x)))

ulp(::Type{ArbFloat{P}}) where {P} = ulp(one(ArbFloat{P}))
eps(::Type{ArbFloat{P}}) where {P} = eps(one(ArbFloat{P}))

ulp(::Type{ArbReal{P}}) where {P} = ulp(one(ArbReal{P}))
eps(::Type{ArbReal{P}}) where {P} = eps(one(ArbReal{P}))

ulp(::Type{ArbComplex{P}}) where {P} = ulp(one(ArbComplex{P}))
eps(::Type{ArbComplex{P}}) where {P} = eps(one(ArbComplex{P}))

nextfloat(::Type{ArbFloat{P}}) where {P} = one(ArbFloat{P}) + ulp(one(ArbFloat{P}))
nextfloat(::Type{ArbReal{P}}) where {P} = ArbReal{P}(nextfloat(ArbFloat{P}))
prevfloat(::Type{ArbFloat{P}}) where {P} = one(ArbFloat{P}) - ulp(one(ArbFloat{P}))
prevfloat(::Type{ArbReal{P}}) where {P} = ArbReal{P}(prevfloat(ArbFloat{P}))

nextfloat(x::ArbFloat{P}) where {P} = x + ulp(x)
nextfloat(x::ArbReal{P}) where {P} = x + ulp(x)
prevfloat(x::ArbFloat{P}) where {P} = x - ulp(x)
prevfloat(x::ArbReal{P}) where {P} = x - ulp(x)

nextfloat(::Type{ArbFloat{P}}, n::Int) where {P} = one(ArbFloat{P}) + n*ulp(one(ArbFloat{P}))
nextfloat(::Type{ArbReal{P}}, n::Int) where {P} = ArbReal{P}(nextfloat(ArbFloat{P}, n))
prevfloat(::Type{ArbFloat{P}}, n::Int) where {P} = one(ArbFloat{P}) - n*ulp(one(ArbFloat{P}))
prevfloat(::Type{ArbReal{P}}, n::Int) where {P} = ArbReal{P}(prevfloat(ArbFloat{P}, n))

nextfloat(x::ArbFloat{P}, n::Int) where {P} = x + n*ulp(x)
nextfloat(x::ArbReal{P}, n::Int) where {P} = x + n*ulp(x)
prevfloat(x::ArbFloat{P}, n::Int) where {P} = x - n*ulp(x)
prevfloat(x::ArbReal{P}, n::Int) where {P} = x - n*ulp(x)
