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

"""
    weierstrass_p(z, tau)

- weierstrass_p(z, tau) == weierstrass_p(z+1, tau) == weierstrass_p(z+tau, tau)
"""
function weierstrass_p(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_p), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

"""
    weierstrass_invp(z, tau)

- weierstrass_p(weierstrass_invp(z, tau), tau) == z
"""
function weierstrass_invp(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_inv_p), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

"""
    weierstrass_zeta(z, tau)

- weierstrass_zeta(z+1, tau) == weierstrass_zeta(z, tau) + weierstrass_zeta(1/2, tau)
- weierstrass_zeta(z+tau, tau) == weierstrass_zeta(z, tau) + weierstrass_zeta(tau/2, tau)
"""
function weierstrass_zeta(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_zeta), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

"""
    weierstrass_sigma(z, tau)

- weierstrass_sigma(z+1, tau) == −exp(2*(z+τ/2)*weierstrass_zeta(τ/2,τ)) * weierstrass_sigma(z, tau)
"""
function weierstrass_sigma(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_sigma), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end


weierstrass_p(z::ArbReal{P}, tau::ArbReal{P}) where {P} =
    weierstrass_p(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_p(z::ArbFloat{P}, tau::ArbFloat{P}) where {P} =
    weierstrass_p(ArbComplex{P}(z), ArbComplex{P}(tau))

weierstrass_pinv(z::ArbReal{P}, tau::ArbReal{P}) where {P} =
    weierstrass_pinv(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_pinv(z::ArbFloat{P}, tau::ArbFloat{P}) where {P} =
    weierstrass_pinv(ArbComplex{P}(z), ArbComplex{P}(tau))
    
weierstrass_zeta(z::ArbReal{P}, tau::ArbReal{P}) where {P} =
    weierstrass_zeta(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_zeta(z::ArbFloat{P}, tau::ArbFloat{P}) where {P} =
    weierstrass_zeta(ArbComplex{P}(z), ArbComplex{P}(tau))
    
weierstrass_sigma(z::ArbReal{P}, tau::ArbReal{P}) where {P} =
    weierstrass_sigma(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_sigma(z::ArbFloat{P}, tau::ArbFloat{P}) where {P} =
    weierstrass_sigma(ArbComplex{P}(z), ArbComplex{P}(tau))
