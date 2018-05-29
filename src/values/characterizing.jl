#=
    Returns the number of bits needed to represent
    the absolute value of the significand of an
    Arf{P} value, directly or as an Arb{P} midpoint.
    This is the minimum precision in bits that
    allows an exact representation of that value.
    Returns 0 if x is a special value.
=#

function significand_bits(x::Arf{P}) where {P}
    return ccall(@libarb(arf_bits), Clong, (Ref{Arf},), x)
end
function significand_bits(x::Arb{P}) where {P}
    return ccall(@libarb(arb_bits), Clong, (Ref{Arb},), x)
end

#=
    rel_error_bits
    Returns the effective relative error intrinsic to a ball, measured in bits.
    This is defined as the difference between the position
    of the top bit in the radius and the top bit in the midpoint, plus one.
    The result is clamped between plus/minus ARF_PREC_EXACT
    (ARF_PREC_EXACT == ±(2^{63}-1) inclusive on a 64-bit machine).

    rel_accuracy_bits
    Returns the effective relative accuracy intrinsic to a ball, measured in bits.
    This is equal to -rel_error_bits.
=#

rel_error_bits(x::Arf{P}) where {P} = 0
function rel_error_bits(x::Arb{P}) where {P}
    return ccall(@libarb(arb_rel_error_bits), Clong, (Ref{Arb},), x)
end
function rel_error_bits(x::Acb{P}) where {P}
    return ccall(@libarb(acb_rel_error_bits), Clong, (Ref{Acb},), x)
end

rel_accuracy_bits(x::Arf{P}) where {P} = 0
function rel_accuracy_bits(x::Arb{P}) where {P}
    return ccall(@libarb(arb_rel_accuracy_bits), Clong, (Ref{Arb},), x)
end
function rel_accuracy_bits(x::Acb{P}) where {P}
    return ccall(@libarb(acb_rel_accuracy_bits), Clong, (Ref{Acb},), x)
end




#=
    Rounds the significand of a value to the number of bits
    equal to the accuracy of x (as indicated by its radius),
    plus a few guard bits so enclosure is maintained.
=#

trim_bits(x::Mag) = x
function trim_bits(x::Arf{P}, roundingmode::RoundingMode=RoundFromZero) where {P}
    nbits = significand_bits(x)
    nbits == P && return x
    rounding = match_rounding_mode(roundingmode)
    z = Arf{nbits}
    res = ccall(@libarb(arf_set_round), Cint, (Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, nbits, rounding)
    return res
end
function trim_bits(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_trim), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end
function trim_bits(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_trim), Cvoid, (Ref{Acb}, Ref{Acb}), z, x)
    return z
end


