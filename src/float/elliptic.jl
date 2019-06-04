# these are complex functions (acb_)
# the corresponding real function values are obtained with a zeroed imaginary part


# void acb_elliptic_k(acb_t res, const acb_t m, slong prec)
# Computes the complete elliptic integral of the first kind  K(m)

function elliptick(modulus::ArbComplex{P}) where {P}
    modulus == one(ArbComplex{P}) && return ArbComplex{P}(Inf,0)
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_k), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

elliptic_k(modulus::ArbComplex{P}) where {P} = elliptick(modulus * modulus)

function elliptick(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = real(cresult)
    return result
end

elliptic_k(modulus::ArbReal{P}) where {P} = elliptick(modulus * modulus)

function elliptick(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptick(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_k(modulus::ArbFloat{P}) where {P} = elliptick(modulus * modulus)

# the complete elliptic integral of the second kind  E(m)

function elliptice(modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_e), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Cint), result, modulus, P)
    return result
end

elliptic_e(modulus::ArbComplex{P}) where {P} = elliptice(modulus * modulus)

function elliptice(modulus::ArbReal{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = real(cresult)
    return result
end

elliptic_e(modulus::ArbReal{P}) where {P} = elliptice(modulus * modulus)

function elliptice(modulus::ArbFloat{P}) where {P}
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_e(modulus::ArbFloat{P}) where {P} = elliptice(modulus * modulus)

# the complete elliptic integral of the third kind  Π(m)
# void acb_elliptic_pi(acb_t res, const acb_t n, const acb_t m, slong prec)

function ellipticpi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    ccall(@libarb(acb_elliptic_pi), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint),
          result, nu, modulus, P)
    return result
end

elliptic_pi(nu::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticpi(nu, modulus * modulus)

function ellipticpi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_pi(nu::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticpi(nu, modulus * modulus)

function ellipticpi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_pi(nu::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticpi(nu, modulus * modulus)

# Legendre incomplete elliptic integral of the first kind F(phi, m)

function ellipticf(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_f), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

elliptic_f(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus)

elliptic_k(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticf(phi, modulus * modulus)

function ellipticf(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_f(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus)

elliptic_k(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticf(phi, modulus * modulus)

function ellipticf(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticf(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_f(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus * modulus)

elliptick(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus)

elliptic_k(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticf(phi, modulus * modulus)

# void acb_elliptic_e_inc(acb_t res, const acb_t phi, const acb_t m, int pi, slong prec)
# Legendre incomplete elliptic integral of the second kind E(phi, m)

function elliptice(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_e_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, phi, modulus, flag, P)
    return result
end

elliptic_e(phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = elliptice(phi, modulus * modulus)

function elliptice(phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_e(phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = elliptice(phi, modulus * modulus)

function elliptice(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = elliptice(cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_e(phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = elliptice(phi, modulus * modulus)

# void acb_elliptic_pi_inc(acb_t res, const acb_t n, const acb_t phi, const acb_t m, int pi, slong prec)
# the Legendre incomplete elliptic integral of the third kind, given by

function ellipticpi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_pi_inc), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, nu, phi, modulus, flag, P)
    return result
end

elliptic_pi(nu::ArbComplex{P}, phi::ArbComplex{P}, modulus::ArbComplex{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)

function ellipticpi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = real(cresult)
    return result
end

elliptic_pi(nu::ArbReal{P}, phi::ArbReal{P}, modulus::ArbReal{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)

function ellipticpi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P}
    cnu      = ArbComplex(nu, 0)
    cphi     = ArbComplex(phi, 0)
    cmodulus = ArbComplex(modulus, 0)
    cresult  = ellipticpi(cnu, cphi, cmodulus)
    result   = ArbFloat{P}(real(cresult))
    return result
end

elliptic_pi(nu::ArbFloat{P}, phi::ArbFloat{P}, modulus::ArbFloat{P}) where {P} = ellipticpi(nu, phi, modulus * modulus)


#=
# Carleson Symmetric Elliptic Integrals

first kind
void acb_elliptic_rf(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
second kind
void acb_elliptic_rg(acb_t res, const acb_t x, const acb_t y, const acb_t z, int flags, slong prec)
third kind
void acb_elliptic_rj(acb_t res, const acb_t x, const acb_t y, const acb_t z, const acb_t p, int flags, slong prec)
=#

function ellipticrf(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function ellipticrg(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rg), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, flags, P)
    return result
end

function ellipticrj(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}, p::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flags = 0
    ccall(@libarb(acb_elliptic_rf), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result, x, y, z, p, flags, P)
    return result
end

function ellipticrf(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(ellipticrf(xx, yy, zz)))
    return result
end

function ellipticrg(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbReal{P}(real(ellipticrg(xx, yy, zz)))
    return result
end

function ellipticrj(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}, p::ArbReal{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbReal{P}(real(ellipticrj(xx, yy, zz, pp)))
    return result
end

function ellipticrf(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(ellipticrf(xx, yy, zz)))
    return result
end

function ellipticrg(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P}
    xx, yy, zz = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z)
    result = ArbFloat{P}(real(ellipticrg(xx, yy, zz)))
    return result
end

function ellipticrj(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}, p::ArbFloat{P}) where {P}
    xx, yy, zz, pp = ArbComplex{P}(x), ArbComplex{P}(y), ArbComplex{P}(z), ArbComplex{P}(p)
    result = ArbFloat{P}(real(ellipticrj(xx, yy, zz, pp)))
    return result
end



#= 

void acb_elliptic_p(acb_t res, const acb_t z, const acb_t tau, slong prec)¶
Computes Weierstrass’s elliptic function

void acb_elliptic_inv_p(acb_t res, const acb_t z, const acb_t tau, slong prec)¶
Computes the inverse of the Weierstrass elliptic function

void acb_elliptic_zeta(acb_t res, const acb_t z, const acb_t tau, slong prec)¶
Computes the Weierstrass zeta function

void acb_elliptic_sigma(acb_t res, const acb_t z, const acb_t tau, slong prec)¶
Computes the Weierstrass sigma function
=#

