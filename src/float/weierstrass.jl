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

function weierstrass_p(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_p), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

function weierstrass_invp(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_inv_p), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

function weierstrass_zeta(z::ArbComplex{P}, tau::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    flag = 0
    ccall(@libarb(acb_elliptic_zeta), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), 
          result, z, tau, P)
    return result
end

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
