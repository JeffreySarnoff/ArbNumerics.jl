
for (A,F) in ((:log, :arb_log), (:log1p, :arb_log1p), (:exp, :arb_exp), (:expm1, :arb_expm1),
              (:sin, :arb_sin), (:cos, :arb_cos), (:tan, :arb_tan),
              (:csc, :arb_csc), (:sec, :arb_sec), (:cot, :arb_cot),
              (:sinpi, :arb_sin_pi), (:cospi, :arb_cos_pi), (:sinc, :arb_sinc),
              (:tanpi, :arb_tan_pi), (:cotpi, :arb_cot_pi), (:sincpi, :arb_sinc_pi),
              (:asin, :arb_asin), (:acos, :arb_acos), (:atan, :arb_atan),
              (:sinh, :arb_sinh), (:cosh, :arb_cosh), (:tanh, :arb_tanh),
              (:csch, :arb_csch), (:sech, :arb_sech), (:coth, :arb_coth),
              (:asinh, :arb_asinh), (:acosh, :arb_acosh), (:atanh, :arb_atanh),

              (:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbBall{P}, prec::Int) where P
            z = ArbBall{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, prec)
            return z
         end
         ($A)(x::ArbBall{P}) where {P} = ($A)(x, P)
    end
end

atan(y::ArbBall{P}, x::ArbBall{P}) where {P} = atan2(y, x)

for (A,F) in ((:log, :acb_log), (:log1p, :acb_log1p), (:exp, :acb_exp), (:expm1, :acb_expm1),
              (:sin, :acb_sin), (:cos, :acb_cos), (:tan, :acb_tan),
              (:csc, :acb_csc), (:sec, :acb_sec), (:cot, :acb_cot),
              (:sinpi, :acb_sin_pi), (:cospi, :acb_cos_pi), (:sinc, :acb_sinc),
              (:tanpi, :acb_tan_pi), (:cotpi, :acb_cot_pi), (:sincpi, :acb_sinc_pi),
              (:asin, :acb_asin), (:acos, :acb_acos), (:atan, :acb_atan),
              (:sinh, :acb_sinh), (:cosh, :acb_cosh), (:tanh, :acb_tanh),
              (:csch, :acb_csch), (:sech, :acb_sech), (:coth, :acb_coth),
              (:asinh, :acb_asinh), (:acosh, :acb_acosh), (:atanh, :acb_atanh),

              (:gamma, :acb_gamma),
              (:lgamma, :acb_lgamma),(:rgamma, :acb_rgamma), (:digamma, :acb_digamma),

              (:logsinpi, :acb_log_sin_pi), (:barnesg, :acb_barnes_g), (:logbarnesg, :acb_log_barnes_g),
              (:agm1, :acb_agm1),

              (:erf, :acb_hypgeom_erf), (:erfc, :acb_hypgeom_erfc), (:erfi, :acb_hypgeom_erfi),
              (:ei, :acb_hypgeom_ei), (:si, :acb_hypgeom_si), (:ci, :acb_hypgeom_ci),
              (:shi, :acb_hypgeom_shi), (:chi, :acb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, prec::Int) where P
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, prec)
            return z
         end
         ($A)(x::ArbComplex{P}) where {P} = ($A)(x, P)
    end
end

for (A,F) in ((:ellipticK, :acb_elliptic_k), (:ellipticE, :acb_elliptic_e),
              (:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi)
             )
    @eval begin
        function ($A)(x::ArbBall{P}, prec::Int) where {P}
            z = ArbComplex{P}()
            xc = ArbComplex{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, xc, prec)
            rea = real(z)
            return rea
         end
         ($A)(x::ArbBall{P}) where {P} = ($A)(x, P)
    end
end


for (A,F) in ((:loghypot, :arb_log_hypot), (:atan2, :arb_atan2))
    @eval begin
        function ($A)(x::ArbFloat{P}, y::ArbFloat{P}, prec::Int) where P
            z = ArbBall{P}()
            xb = ArbBall{P}(x)
            yb = ArbBall{P}(y)
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
         ($A)(x::ArbFloat{P}, y::ArbFloat{P}) where {P} = ($A)(x, y, P)
    end
end

for (A,F) in ((:loghypot, :arb_log_hypot),
              (:atan2, :arb_atan2), (:agm, :arb_agm) )
    @eval begin
        function ($A)(x::ArbBall{P}, y::ArbBall{P}, prec::Int) where {P}
            z = ArbBall{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, prec)
            return z
         end
         ($A)(x::ArbBall{P}, y::ArbBall{P}) where {P} = ($A)(x, y, P)
    end
end


for (A,F) in ((:loghypot, :acb_log_hypot), (:atan2, :acb_atan2),
              (:ellipticP, :acb_elliptic_p), (:ellipticPi, :acb_elliptic_pi),
              (:ellipticZeta, :acb_elliptic_zeta), (:ellipticSigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, y::ArbComplex{P}, prec::Int) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, y, prec)
            return z
         end
         ($A)(x::ArbComplex{P}, y::ArbComplex{P}) where {P} = ($A)(x, y, P)
    end
end

for (A,F) in ((:ellipticPi, :acb_elliptic_pi), (:ellipticP, :acb_elliptic_p),
              (:ellipticZeta, :acb_elliptic_zeta), (:ellipticSigma, :acb_elliptic_sigma),
             )
    @eval begin
        function ($A)(x::ArbBall{P}, y::ArbBall{P}, prec::Int) where {P}
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




for (A,F) in ((:log, :arb_log), (:log1p, :arb_log1p), (:exp, :arb_exp), (:expm1, :arb_expm1),
              (:sin, :arb_sin), (:cos, :arb_cos), (:tan, :arb_tan),
              (:csc, :arb_csc), (:sec, :arb_sec), (:cot, :arb_cot),
              (:sinpi, :arb_sin_pi), (:cospi, :arb_cos_pi), (:sinc, :arb_sinc),
              (:tanpi, :arb_tan_pi), (:cotpi, :arb_cot_pi), (:sincpi, :arb_sinc_pi),
              (:asin, :arb_asin), (:acos, :arb_acos), (:atan, :arb_atan),
              (:sinh, :arb_sinh), (:cosh, :arb_cosh), (:tanh, :arb_tanh),
              (:csch, :arb_csch), (:sech, :arb_sech), (:coth, :arb_coth),
              (:asinh, :arb_asinh), (:acosh, :arb_acosh), (:atanh, :arb_atanh),

              (:gamma, :arb_gamma),
              (:lgamma, :arb_lgamma),(:rgamma, :arb_rgamma), (:digamma, :arb_digamma),
              (:zeta, :arb_zeta),

              (:erf, :arb_hypgeom_erf), (:erfc, :arb_hypgeom_erfc), (:erfi, :arb_hypgeom_erfi),
              (:ei, :arb_hypgeom_ei), (:si, :arb_hypgeom_si), (:ci, :arb_hypgeom_ci),
              (:shi, :arb_hypgeom_shi), (:chi, :arb_hypgeom_chi),
             )
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int) where P
            z = ArbBall{P}()
            xb = ArbBall{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
         ($A)(x::ArbFloat{P}) where {P} = ($A)(x, P)
    end
end

for (A,F) in ((:ellipticK, :acb_elliptic_k), (:ellipticE, :acb_elliptic_e),
              (:eta, :acb_dirichlet_eta), (:xi, :acb_dirichlet_xi))
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int) where P
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
