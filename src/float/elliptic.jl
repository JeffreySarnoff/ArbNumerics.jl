# these are complex functions (acb_)
# the corresponding real function values are obtained with a zeroed imaginary part


# void acb_elliptic_k(acb_t res, const acb_t m, slong prec)
# Computes the complete elliptic integral of the first kind  K(m)

function ellipk(modulus::ArbComplex{P}) where {P}
    isone(modulus) && return ArbComplex{P}(Inf,0)
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_k), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

ellip_k(modulus::ArbComplex{P}) where {P} = elliptick(modulus * modulus)

function ellipk(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = real(cresult)
    return result
end

ellip_k(modulus::ArbReal{P}) where {P} = elliptick(modulus * modulus)

function ellipk(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_k(modulus::ArbFloat{P}) where {P} = elliptick(modulus * modulus)

# the complete elliptic integral of the second kind  E(m)

function ellipe(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_e), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

ellip_e(modulus::ArbComplex{P}) where {P} = elliptice(modulus * modulus)

function ellipe(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = real(cresult)
    return result
end

ellip_e(modulus::ArbReal{P}) where {P} = elliptice(modulus * modulus)

function ellipe(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_e(modulus::ArbFloat{P}) where {P} = elliptice(modulus * modulus)

# the complete elliptic integral of the third kind  Π(m)
# void acb_elliptic_pi(acb_t res, const acb_t n, const acb_t m, slong prec)

function ellippi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint),
          result, nu, modulus, P)
    return result
end

ellip_pi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticpi(nu, modulus * modulus)

function ellippi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = real(cresult)
    return result
end

ellip_pi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticpi(nu, modulus * modulus)

function ellippi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_pi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticpi(nu, modulus * modulus)

# Legendre incomplete elliptic integral of the first kind F(phi, m)

function ellipf(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_f), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

ellip_f(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus)

ellip_k(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus * modulus)

function ellipf(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = real(cresult)
    return result
end

ellip_f(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus)

ellip_k(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus * modulus)

function ellipf(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_f(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus)

ellip_k(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus * modulus)

# void acb_elliptic_e_inc(acb_t res, const acb_t phi, const acb_t m, int pi, slong prec)
# Legendre incomplete elliptic integral of the second kind E(phi, m)

function ellipe(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_e_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

ellip_e(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptice(phi, modulus * modulus)

function ellipe(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = real(cresult)
    return result
end

ellip_e(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptice(phi, modulus * modulus)

function ellipe(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_e(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptice(phi, modulus * modulus)

# void acb_elliptic_pi_inc(acb_t res, const acb_t n, const acb_t phi, const acb_t m, int pi, slong prec)
# the Legendre incomplete elliptic integral of the third kind, given by

function ellippi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_pi_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, nu, phi, modulus, flag, P)
    return result
end

ellip_pi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)

function ellippi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = real(cresult)
    return result
end

ellip_pi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)

function ellippi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

ellip_pi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)


#=
# Carleson Symmetric Elliptic Integrals

first kind
void acb_elliptic_rf(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
second kind
void acb_elliptic_rg(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
third kind
void acb_elliptic_rj(acb_t res, const acb_t x, const acb_t y, const acb_t z, const acb_t p, int flags, slong prec)
=#

function elliprf(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function elliprg(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rg), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function elliprj(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}, p::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, p, flags, P)
    return result
end

function elliprf(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(ellipticrf(xx, yy, zz)))
    return result
end

function elliprg(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(ellipticrg(xx, yy, zz)))
    return result
end

function elliprj(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}, p::ArbReal{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbReal{P}(real(ellipticrj(xx, yy, zz, pp)))
    return result
end

function elliprf(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(ellipticrf(xx, yy, zz)))
    return result
end

function elliprg(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(ellipticrg(xx, yy, zz)))
    return result
end

function elliprj(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}, p::ArbFloat{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbFloat{P}(real(ellipticrj(xx, yy, zz, pp)))
    return result
end
