# these are complex functions (acb_)
# the corresponding real function values are obtained with a zeroed imaginary part


# void acb_elliptic_k(acb_t res, const acb_t m, slong prec)

"""
    elliptic_k(modulus)

Computes the complete elliptic integral of the first kind  K(m)
"""
function elliptic_k(modulus::ArbComplex{P}) where {P}
    isone(modulus) && return ArbComplex{P}(Inf,0)
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_k), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

"""
    elliptic_k2(modulus)

Computes the complete elliptic integral of the first kind  K(m^2)
"""
elliptic_k2(modulus::ArbComplex{P}) where {P} = elliptic_k(modulus * modulus)

function elliptic_k(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_k(cmodulus)
    result   = real(cresult)
    return result
end

elliptic_k2(modulus::ArbReal{P}) where {P} = elliptic_k(modulus * modulus)

function elliptic_k(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_k(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_k2(modulus::ArbFloat{P}) where {P} = elliptic_k(modulus * modulus)

# the complete elliptic integral of the second kind  E(m)

function elliptic_e(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_e), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

elliptic_e2(modulus::ArbComplex{P}) where {P} = elliptic_e(modulus * modulus)

function elliptic_e(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_e(cmodulus)
    result   = real(cresult)
    return result
end

elliptic_e2(modulus::ArbReal{P}) where {P} = elliptic_e(modulus * modulus)

function elliptic_e(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_e(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_e2(modulus::ArbFloat{P}) where {P} = elliptic_e(modulus * modulus)

# the complete elliptic integral of the third kind  Π(m)
# void acb_elliptic_pi(acb_t res, const acb_t n, const acb_t m, slong prec)

function elliptic_pi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint),
          result, nu, modulus, P)
    return result
end

elliptic_pi2(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptic_pi(nu, modulus * modulus)

function elliptic_pi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_pi(cnu, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_pi2(nu::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_pi(nu, modulus * modulus)

function elliptic_pi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_pi(cnu, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_pi2(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_pi(nu, modulus * modulus)

# Legendre incomplete elliptic integral of the first kind F(phi, m)

function elliptic_f(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_f), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

elliptic_f2(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptic_f(phi, modulus * modulus)

elliptic_k(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptic_f(phi, modulus)

elliptic_k2(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptic_f(phi, modulus * modulus)

function elliptic_f(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_f2(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_f(phi, modulus * modulus)

elliptic_k(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_f(phi, modulus)

elliptic_k2(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_f(phi, modulus * modulus)

function elliptic_f(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_f(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_f2(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_f(phi, modulus * modulus)

elliptic_k(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_f(phi, modulus)

elliptic_k2(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_f(phi, modulus * modulus)

# void acb_elliptic_e_inc(acb_t res, const acb_t phi, const acb_t m, int pi, slong prec)
# Legendre incomplete elliptic integral of the second kind E(phi, m)

function elliptic_e(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_e_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

elliptic_e2(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptice(phi, modulus * modulus)

function elliptic_e(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_e(cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_e2(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_e_incomplete(phi, modulus * modulus)

function elliptic_e(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_e(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_e2(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_e(phi, modulus * modulus)

# void acb_elliptic_pi_inc(acb_t res, const acb_t n, const acb_t phi, const acb_t m, int pi, slong prec)
# the Legendre incomplete elliptic integral of the third kind, given by

function elliptic_pi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_pi_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, nu, phi, modulus, flag, P)
    return result
end

elliptic_pi2(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} =
    elliptic_pi(nu, phi, modulus * modulus)

function elliptic_pi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_pi(cnu, cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_pi2(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptic_pi_incomplete(nu, phi, modulus * modulus)

function elliptic_pi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptic_pi(cnu, cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_pi2(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptic_pi_incomplete(nu, phi, modulus * modulus)


#=
# Carleson Symmetric Elliptic Integrals

first kind
void acb_elliptic_rf(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
second kind
void acb_elliptic_rg(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
third kind
void acb_elliptic_rj(acb_t res, const acb_t x, const acb_t y, const acb_t z, const acb_t p, int flags, slong prec)
=#

function elliptic_rf(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function elliptic_rg(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rg), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function elliptic_rj(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}, p::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, p, flags, P)
    return result
end

function elliptic_rf(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(elliptic_rf(xx, yy, zz)))
    return result
end

function elliptic_rg(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(elliptic_rg(xx, yy, zz)))
    return result
end

function elliptic_rj(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}, p::ArbReal{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbReal{P}(real(elliptic_rj(xx, yy, zz, pp)))
    return result
end

function elliptic_rf(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(elliptic_rf(xx, yy, zz)))
    return result
end

function elliptic_rg(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(elliptic_rg(xx, yy, zz)))
    return result
end

function elliptic_rj(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}, p::ArbFloat{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbFloat{P}(real(elliptic_rj(xx, yy, zz, pp)))
    return result
end
