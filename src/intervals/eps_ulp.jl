function significand_bits(x::Arf{P}) where {P}
    # returns the number of bits needed to represent the absolute value of the significand of x,
    # i.e. the minimum precision sufficient to represent x exactly. Returns 0 if x is a special value.
    nbits = ccall(@libarb(arf_bits), Clong, (Ref{Arf},), x)
    return nbits
end

function significand_bits(x::Arb{P}) where {P}
    # returns the number of bits needed to represent the absolute value of the significand of midpoint(x),
    # i.e. the minimum precision sufficient to represent x exactly. Returns 0 if x is a special value.
    nbits = ccall(@libarb(arb_bits), Clong, (Ref{Arb},), x)
    return nbits
end

function significand_bits(x::Acb{P}) where {P}
    # returns the number of bits needed to represent the maximum of bits(real(x)), bits(imag(x)).
    nbits = ccall(@libarb(acb_bits), Clong, (Ref{Acb},), x)
    return nbits
end


#= 
    arb_rel_error_bits
    
    Returns the effective relative error of x measured in bits, 
    defined as the difference between
    the position of the top bit in the radius
    and the top bit in the midpoint, plus one.
    The result is clamped between plus/minus ARF_PREC_EXACT.
    
    acb_rel_error_bits
    
    Returns the effective relative error of x measured in bits.
    This is computed as if calling arb_rel_error_bits() on the real ball
    whose midpoint is the larger out of the real and imaginary midpoints of x,
    and whose radius is the larger out of the real and imaginary radiuses of x.
=#

function relerr_bits(x::Arb{P}) where {P}
    nbits = ccall(@libarb(arb_rel_error_bits), Clong, (Ref{Arb},), x)
    return nbits
end

function relerr_bits(x::Acb{P}) where {P}
    nbits = ccall(@libarb(crb_rel_error_bits), Clong, (Ref{Acb},), x)
    return nbits
end


function ulp(x::Arf{P}) where {P}
    w = Mag()
    #   Sets z to the magnitude of the unit in the last place (ulp) of x at precision P.
    ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{Arf}, Clong), z, w, P)
    z = Arf{P}(w)
    return z
end

function eps(x::Arf{P}) where {P}
    w = Mag()
    #   Sets z to twice the magnitude of the unit in the last place (ulp) of x at precision P.
    ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{Arf}, Clong), z, w, P)
    z = Arf{P}(w)
    z += z
    return z
end

function ulp(x::Arf{P}, prec::Int) where {P}
    prec < MINIMUM_PRECISION && throw(DomainError("bit precision ($prec) is too low"))
    w = Mag()
    #   Sets z to the magnitude of the unit in the last place (ulp) of x at precision prec.
    ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{Arf}, Clong), z, w, prec)
    z = Arf{P}(w)
    return z
end

function eps(x::Arf{P}, prec::Int) where {P}
    prec < MINIMUM_PRECISION && throw(DomainError("bit precision ($prec) is too low"))
    w = Mag()
    #   Sets z to twice the magnitude of the unit in the last place (ulp) of x at precision prec.
    ccall(@libarb(arf_mag_set_ulp), Cvoid, (Ref{Mag}, Ref{Arf}, Clong), z, w, prec)
    z = Arf{P}(w)
    z += z
    return z
end

ulp(x::Arb{P}) where {P} = ulp(midpoint_byref(x))
eps(x::Arb{P}) where {P} = eps(midpoint_byref(x))

ulp(x::Acb{P}) where {P} = ulp(midpoint_byref(real(x)))
eps(x::Acb{P}) where {P} = eps(midpoint_byref(real(x)))

ulps(x::Acb{P}) where {P} = ulp(midpoint_byref(real(x))), ulp(midpoint_byref(imag(x)))
epss(x::Acb{P}) where {P} = eps(midpoint_byref(real(x))), eps(midpoint_byref(imag(x)))

function increase_radius(x::Arb{P}, err::Arf{P})
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function increase_radius(x::Arb{P}, err::Arb{P})
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function reduce_radius(x::Arb{P}, err::Arf{P})
    err = -err
    ccall(@libarb(arb_add_error_arf), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end

function reduce_radius(x::Arb{P}, err::Arb{P})
    err = -err
    ccall(@libarb(arb_add_error_arb), Cvoid, (Ref{Arb}, Ref{Arf}), x, err)
    return x
end
