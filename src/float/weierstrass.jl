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
    weierstrass_p_prime(z, tau)

- weierstrass_p_prime(z, tau) == derivative of weierstrass_p(z, tau)
"""
function weierstrass_p_prime(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_p_prime), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

"""
    weierstrass_p_jet(z, tau)

- weierstrass_p_jet(z, tau, len=2) == first len derivatives of weierstrass_p(z, tau)
"""
function weierstrass_p_jet(z::ArbComplex{P}, tau::ArbComplex{P}, len::Int = 2) where {P}
    result = ArblibVector(ArbComplex{P},len)
    flag = 0
    ccall(@libarb(acb_elliptic_p_jet), Cvoid, (Ptr{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Cint), 
          result.ptr, z, tau, len, P)
    return result
end

"""
void acb_elliptic_p_series(acb_poly_t res, const acb_poly_t z, const acb_t tau, slong len, slong prec)
"""

"""
   weierstrass_invariants(tau)

- (g2, g3) the invariants such that (℘')^2 = 4℘^3 - g2*℘ - g3
"""
function weierstrass_invariants(tau::ArbComplex{P}) where {P}
    g2 = ArbComplex{P}()
    g3 = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_invariants), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          g2, g3, tau, P)
    return (g2, g3)
end

"""
  weierstrass_roots(tau)

- (e1,e2,e3) the roots of 4z^3 - g2*z - g3
"""
function weierstrass_roots(tau::ArbComplex{P}) where {P}
    e1 = ArbComplex{P}()
    e2 = ArbComplex{P}()
    e3 = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_roots), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          e1, e2, e3, tau, P)
    return (e1, e2, e3)
end

"""
    weierstrass_invp(z, tau)

- weierstrass_p(weierstrass_invp(z, tau), tau) == z
"""
function weierstrass_inv_p(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
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


weierstrass_p(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_p(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_p(z, tau1, tau2) = weierstrass_p(z/tau1, tau2/tau1)/tau1^2

weierstrass_p_prime(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_p_prime(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_p_prime(z, tau1, tau2) = weierstrass_p_prime(z/tau1, tau2/tau1)/tau1^3

weierstrass_p_jet(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, len::Int = 2) where {P} =
    weierstrass_p_jet(ArbComplex{P}(z), ArbComplex{P}(tau), len)
function weierstrass_p_jet(z, tau1, tau2, len::Int = 2)
    tauinv = 1/tau1
    jet = weierstrass_p_jet(z*tauinv, tau2*tauinv, len)
    scale = tauinv
    for i=1:len
        scale *= tauinv
        unsafe_store!(jet.ptr, jet[i]*scale, i) # ArbVector has no store method
    end
    jet
end
                                                  
weierstrass_invariants(tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_invariants(ArbComplex{P}(tau))
weierstrass_invariants(tau1, tau2) = (i = weierstrass_invariants(tau2/tau1); (i[1]/tau1^4, i[2]/tau1^6))
    
weierstrass_roots(tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_roots(ArbComplex{P}(tau))
weierstrass_roots(tau1, tau2) = weierstrass_roots(tau2/tau1)./tau1^2

weierstrass_inv_p(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_inv_p(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_inv_p(z, tau1, tau2) = weierstrass_inv_p(z*tau1^2, tau2/tau1)*tau1

weierstrass_zeta(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_zeta(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_zeta(z, tau1, tau2) = weierstrass_zeta(z/tau1, tau2/tau1)/tau1

weierstrass_sigma(z::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}, tau::Union{ArbReal{P},ArbFloat{P},ArbComplex{P}}) where {P} =
    weierstrass_sigma(ArbComplex{P}(z), ArbComplex{P}(tau))
weierstrass_sigma(z, tau1, tau2) = weierstrass_sigma(z/tau1, tau2/tau1)*tau1
