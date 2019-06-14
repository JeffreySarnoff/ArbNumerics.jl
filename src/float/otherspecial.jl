
for (A,F) in ((:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbReal{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, prec)
            return z
         end
    end
end


const Cint0 = zero(Cint)
const FmpzZero = Fmpz(0)

function lambertw(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_lambertw), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Cint, Clong), z, x, Cint0, P)
    return z
end

lambertw(x::ArbFloat{P}) where {P} = ArbFloat{P}(lambertw(ArbReal{P}(x)))

function lambertw(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_lambertw), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{Fmpz}, Cint, Clong), z, x, FmpzZero, 0, 128)
    return z
end

for (A,F) in ((:gamma, :acb_gamma),
              (:lgamma, :acb_lgamma),(:rgamma, :acb_rgamma), (:digamma, :acb_digamma),

              (:logsinpi, :acb_log_sin_pi), (:barnesg, :acb_barnes_g), (:logbarnesg, :acb_log_barnes_g),
              (:agm1, :acb_agm1),

              (:erf, :acb_hypgeom_erf), (:erfc, :acb_hypgeom_erfc), (:erfi, :acb_hypgeom_erfi),
              (:ei, :acb_hypgeom_ei), (:si, :acb_hypgeom_si), (:ci, :acb_hypgeom_ci),
              (:shi, :acb_hypgeom_shi), (:chi, :acb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, prec::Int=P) where P
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, prec)
            return z
         end
    end
end

for (A,F) in (
              (:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi)
             )
    @eval begin
        function ($A)(x::ArbReal{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, prec)
            rea = real(z)
            return rea
         end
    end
end
#=
for (A,F) in ((:elliptick, :elliptic_k), (:elliptice, :elliptic_e))
    @eval begin
        function ($A)(k::ArbReal{P}, prec::Int=P) where {P}
           m = square(k)
           return ($F)(m, prec)
        end
    end
end
=#
for (A,F) in ((:agm, :arb_agm), )
    @eval begin
        function ($A)(x::ArbReal{P}, y::ArbReal{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, prec)
            return z
         end
    end
end

#=
for (A,F) in ((:ellipticp, :acb_elliptic_p), (:ellipticpi, :acb_elliptic_pi),
              (:ellipticzeta, :acb_elliptic_zeta), (:ellipticsigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, y::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, prec)
            return z
         end
    end
end

for (A,F) in ((:ellipticpi, :acb_elliptic_pi), (:ellipticp, :acb_elliptic_p),
              (:ellipticzeta, :acb_elliptic_zeta), (:ellipticsigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbReal{P}, y::ArbReal{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            yc = ArbComplex{P}(y)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, yc, prec)
            rea = real(z)
            return rea
         end
    end
end
=#
#=
function ellipticpi(n::ArbComplex{P}, k::ArbComplex{P}, prec::Int=P) where {P}
    m = square(k)
    return elliptic_pi(n, m, prec)
end
=#


for (A,F) in ((:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            xb = ArbReal{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
    end
end


for (A,F) in ((:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi))
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, prec)
            return midpoint_byref(real(z))
         end
    end
end

function agm1(x::ArbReal{P}) where {P}
    x1 = ArbComplex{P}(x)
    w  = agm1(x1)
    z = real(w)
    return z
end

function agm1(x::ArbFloat{P}) where {P}
    x1 = ArbReal{P}(x)
    w  = agm1(x1)
    z = midpoint_byref(w)
    return z
end

function agm(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbReal{P}(x)
    y1 = ArbReal{P}(y)
    w  = agm(x1, y1)
    z = midpoint_byref(w)
    return z
end
