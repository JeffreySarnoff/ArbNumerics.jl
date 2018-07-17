
for (A,F) in ((:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbBall{P}, prec::Int=P) where P
            z = ArbBall{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, prec)
            return z
         end
         ($A)(x::ArbBall{P}) where {P} = ($A)(x, P)
    end
end


const Cint0 = zero(Cint)
const FmpzZero = Fmpz(0)

function lambertw(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_lambertw), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Cint, Clong), z, x, Cint0, P)
    return z
end

lambertw(x::ArbFloat{P}) where {P} = ArbFloat{P}(lambertw(ArbBall{P}(x)))

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
         ($A)(x::ArbComplex{P}) where {P} = ($A)(x, P)
    end
end

for (A,F) in ((:elliptick, :acb_elliptic_k), (:elliptice, :acb_elliptic_e),
              (:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi)
             )
    @eval begin
        function ($A)(x::ArbBall{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, prec)
            rea = real(z)
            return rea
         end
         ($A)(x::ArbBall{P}) where {P} = ($A)(x, P)
    end
end

for (A,F) in ((:agm, :arb_agm), )
    @eval begin
        function ($A)(x::ArbBall{P}, y::ArbBall{P}, prec::Int=P) where {P}
            z = ArbBall{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, prec)
            return z
         end
         ($A)(x::ArbBall{P}, y::ArbBall{P}) where {P} = ($A)(x, y, P)
    end
end


for (A,F) in ((:ellipticp, :acb_elliptic_p), (:ellipticpi, :acb_elliptic_pi),
              (:ellipticzeta, :acb_elliptic_zeta), (:ellipticsigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, y::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, prec)
            return z
         end
         ($A)(x::ArbComplex{P}, y::ArbComplex{P}) where {P} = ($A)(x, y, P)
    end
end

for (A,F) in ((:ellipticpi, :acb_elliptic_pi), (:ellipticp, :acb_elliptic_p),
              (:ellipticzeta, :acb_elliptic_zeta), (:ellipticsigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbBall{P}, y::ArbBall{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            yc = ArbComplex{P}(y)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, yc, prec)
            rea = real(z)
            return rea
         end
         ($A)(x::ArbBall{P}, y::ArbBall{P}) where {P} = ($A)(x, y, P)
    end
end




for (A,F) in ((:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int=P) where P
            z = ArbBall{P}()
            xb = ArbBall{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
         ($A)(x::ArbFloat{P}) where {P} = ($A)(x, P)
    end
end

for (A,F) in ((:elliptick, :acb_elliptic_k), (:elliptice, :acb_elliptic_e),
              (:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi))
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int=P) where P
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, prec)
            return midpoint_byref(real(z))
         end
         ($A)(x::ArbFloat{P}) where {P} = ($A)(x, P)
    end
end

function agm1(x::ArbBall{P}) where {P}
    x1 = ArbComplex{P}(x)
    w  = agm1(x1)
    z = real(w)
    return z
end

function agm1(x::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    w  = agm1(x1)
    z = midpoint_byref(w)
    return z
end

function agm(x::ArbFloat{P}, y::ArbFloat{P}) where {P}
    x1 = ArbBall{P}(x)
    y1 = ArbBall{P}(y)
    w  = agm(x1, y1)
    z = midpoint_byref(w)
    return z
end
