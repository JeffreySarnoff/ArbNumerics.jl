
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

function polylog(s::ArbComplex{P}, z::ArbComplex{P}, prec::Int=P) where {P}
    w = ArbComplex{P}()
    ccall(@libarb(acb_polylog), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint), w, s, z, P)
    return w
end

function polylog(s::ArbReal{P}, z::ArbReal{P}, prec::Int=P) where {P}
    sc = ArbComplex(s)
    zc = ArbComplex(z)
    wc = polylog(sc, zc, prec)
    return wc
end

function polylog(s::ArbFloat{P}, z::ArbFloat{P}, prec::Int=P) where {P}
    sc = ArbComplex(s)
    zc = ArbComplex(z)
    wc = polylog(sc, zc, prec)
    return wc
end

function polylog(s::Int, z::ArbComplex{P}, prec::Int=P) where {P}
    w = ArbComplex{P}()
    ccall(@libarb(acb_polylog_si), Cvoid, (Ref{ArbComplex}, Cint, Ref{ArbComplex}, Cint), w, s, z, P)
    return w
end

function polylog(s::Int, z::ArbReal{P}, prec::Int=P) where {P}
    zc = ArbComplex(z)
    wc = polylog(s, zc, prec)
    return wc
end

function polylog(s::Int, z::ArbFloat{P}, prec::Int=P) where {P}
    zc = ArbComplex(z)
    wc = polylog(s, zc, prec)
    return wc
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


#=
function erfcx(z::ArbComplex{P}) where {P}
    hiprec = round(Int, P*1.25)
    setprecision(ArbComplex, hiprec)
    w = ArbComplex(real(z), imag(z), bits=hiprec)
    ww = w*w
    a  = exp(ww)
    b  = erfc(w)
    res  = a * b
    setprecision(ArbComplex, P)
    return ArbComplex(real(res), imag(res), bits=P-extrabits())
end

function erfcx(x::ArbReal{P}) where {P}
    hiprec = round(Int, P*1.25)
    setprecision(ArbReal, hiprec)
    w = ArbReal(x, bits=hiprec)
    ww = w*w
    a  = exp(ww)
    b  = erfc(w)
    res  = a * b
    setprecision(ArbReal, P)
    return ArbReal(res, bits=P-extrabits())
end

function erfcx(x::ArbFloat{P}) where {P}
    res = erfcx(ArbReal(x))
    return ArbFloat(res)
end
=#

function erfcx(z::ArbComplex{P}; magnify=2.125) where {P}
    external_precision = P
    external_extrabits = extrabits()
    internal_precision = round(Int, P*magnify)
    internal_extrabits = 0
    setextrabits(internal_extrabits)
    setworkingprecision(ArbReal, internal_precision)

    re = round(real(z), sigdigits=internal_precision, base=2)
    im = round(imag(z), sigdigits=internal_precision, base=2)
    w  = ArbComplex(re, im)
    ww = w*w
    a  = exp(ww)
    b  = erfc(w)
    ab = a * b
    abre = round(real(ab), sigdigits=external_precision, base=2)
    abim = round(imag(ab), sigdigits=external_precision, base=2)
    re = ArbReal{P}(abre)
    im = ArbReal{P}(abim)
    z  = ArbComplex{P}(re, im)
    setextrabits(external_extrabits)
    setworkingprecision(ArbReal, external_precision)
    return z
end

function erfcx(x::ArbReal{P}; magnify=2.125) where {P}
    external_precision = P
    external_extrabits = extrabits()
    internal_precision = round(Int, P*magnify)
    internal_extrabits = 0
    setextrabits(internal_extrabits)
    setworkingprecision(ArbReal, internal_precision)

    w = round(x, sigdigits=internal_precision, base=2)
    ww = w*w
    a  = exp(ww)
    b  = erfc(w)
    ab = a * b
    abre = round(real(ab), sigdigits=external_precision, base=2)
    z = ArbReal{P}(abre)
    setextrabits(external_extrabits)
    setworkingprecision(ArbReal, external_precision)
    return z
end

function erfcx(x::ArbFloat{P}; magnify=2.125) where {P}
    res = erfcx(ArbReal(x); magnify=magnify)
    return ArbFloat(res)
end

"""
    struve(α, z)

The Struve Functions, Hₐ(z), calculated from the generalized hypergeometric function, ₁F₂
"""
function struve(α::ArbComplex{P}, z::ArbComplex{P}) where {P}
    return z^(α + 1) / (2^α * sqrt(ArbReal(pi) * gamma(α + 3/2))) *
        hypergeometric_1F2(ArbComplex(1), α + 3/2, -z^2 / 4)
end
