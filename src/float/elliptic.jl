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

# the complete elliptic integral of the second kind  E(m)

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
# void acb_elliptic_pi(acb_t res, const acb_t n, const acb_t m, slong prec)

function ellipticpi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint),
          result, nu, modulus, P)
    return result
end

function ellipticpi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = real(cresult)
    return result
end

function ellipticpi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end


# Legendre incomplete elliptic integral of the first kind F(phi, m)

function ellipticf(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_f), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, phi, modulus, P)
    return result
end

elliptick(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus)

function ellipticf(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptick(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus)

function ellipticf(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptick(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus)

# void acb_elliptic_e_inc(acb_t res, const acb_t phi, const acb_t m, int pi, slong prec)
# Legendre incomplete elliptic integral of the second kind E(phi, m)

function elliptice(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_e_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, phi, modulus, P)
    return result
end

function elliptice(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = real(cresult)
    return result
end

function elliptice(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end


# void acb_elliptic_pi_inc(acb_t res, const acb_t n, const acb_t phi, const acb_t m, int pi, slong prec)
# the Legendre incomplete elliptic integral of the third kind, given by

function ellipticpi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, nu, phi, modulus, P)
    return result
end

function ellipticpi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = real(cresult)
    return result
end

function ellipticpi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end
