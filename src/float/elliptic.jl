# these are complex functions (acb_)
# the corresponding real function values are obtained with a zeroed imaginary part

# void acb_elliptic_k(acb_t res, const acb_t m, slong prec)
# Computes the complete elliptic integral of the first kind  K(m)

function elliptick(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_k), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

function elliptick(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = real(cresult)
    return result
end

function elliptick(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

s the complete elliptic integral of the second kind  E(m)

function elliptice(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_e), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

function elliptice(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = real(cresult)
    return result
end

function elliptice(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

# the complete elliptic integral of the third kind  Π(m)

function ellipticpi(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

function ellipticpi(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cmodulus)
    result   = real(cresult)
    return result
end

function ellipticpi(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

