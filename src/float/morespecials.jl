for (A,F) in ((:besselj, :arb_hypgeom_bessel_j), (:bessely, :arb_hypgeom_bessel_y),
              (:besseli, :arb_hypgeom_bessel_i), (:besselk, :arb_hypgeom_bessel_k))
    @eval begin
        function ($A)(nu::ArbBall{P}, x::ArbBall{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
                                      z, nu, x, prec)
            return z
        end
    end
end     

besselj(nu::ArbFloat{P}, x::ArbFloat{P}) where {P} = ArbFloat{P}(besselj(ArbBall{P}(nu), ArbBall{P}(x)))
bessely(nu::ArbFloat{P}, x::ArbFloat{P}) where {P} = ArbFloat{P}(bessely(ArbBall{P}(nu), ArbBall{P}(x)))
besseli(nu::ArbFloat{P}, x::ArbFloat{P}) where {P} = ArbFloat{P}(besseli(ArbBall{P}(nu), ArbBall{P}(x)))
besselk(nu::ArbFloat{P}, x::ArbFloat{P}) where {P} = ArbFloat{P}(besselk(ArbBall{P}(nu), ArbBall{P}(x)))

for (A,F) in ((:besselj, :acb_hypgeom_bessel_j), (:bessely, :acb_hypgeom_bessel_y),
              (:besseli, :acb_hypgeom_bessel_i), (:besselk, :acb_hypgeom_bessel_k))
    @eval begin
        function ($A)(nu::ArbComplex{P}, x::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Ref{ArbBall}, Clong),
                                      z, nu, x, prec)
            return z
        end
    end
end     

besselj0(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(zero(ArbFloat{P}), x, prec)
besselj1(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(one(ArbFloat{P}), x, prec)
bessely0(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(zero(ArbFloat{P}), x, prec)
bessely1(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(one(ArbFloat{P}), x, prec)

besselj0(x::ArbBall{P}, prec::Int=P) where {P} = besselj(zero(ArbBall{P}), x, prec)
besselj1(x::ArbBall{P}, prec::Int=P) where {P} = besselj(one(ArbBall{P}), x, prec)
bessely0(x::ArbBall{P}, prec::Int=P) where {P} = bessely(zero(ArbBall{P}), x, prec)
bessely1(x::ArbBall{P}, prec::Int=P) where {P} = bessely(one(ArbBall{P}), x, prec)

besselj0(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(zero(ArbComplex{P}), x, prec)
besselj1(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(one(ArbComplex{P}), x, prec)
bessely0(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(zero(ArbComplex{P}), x, prec)
bessely1(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(one(ArbComplex{P}), x, prec)


function airyai(x::ArbBall{P}) where P
    z = ArbBall{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{ArbBall}, Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              z, C_NULL, C_NULL, C_NULL, x, P)
    return z
end

function airyaiprime(x::ArbBall{P}) where P
    z = ArbBall{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{ArbBall}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              C_NULL, z, C_NULL, C_NULL, x, P)
    return z
end

function airybi(x::ArbBall{P}) where P
    z = ArbBall{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              C_NULL, C_NULL, z, C_NULL, x, P)
    return z
end

function airybiprime(x::ArbBall{P}) where P
    z = ArbBall{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Ref{ArbBall}, Clong),
              C_NULL, C_NULL, C_NULL, z, x, P)
    return z
end

airyai(x::ArbFloat{P}) where {P} = ArbFloat{P}(airyai(ArbBall{P}(x)))
airyaiprime(x::ArbFloat{P}) where {P} = ArbFloat{P}(airyaiprime(ArbBall{P}(x)))
airybi(x::ArbFloat{P}) where {P} = ArbFloat{P}(airybi(ArbBall{P}(x)))
airybiprime(x::ArbFloat{P}) where {P} = ArbFloat{P}(airybiprime(ArbBall{P}(x)))

function airyai(x::ArbComplex{P}) where P
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{ArbBall}, Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              z, C_NULL, C_NULL, C_NULL, x, P)
    return z
end

function airyaiprime(x::ArbComplex{P}) where P
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{ArbBall}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              C_NULL, z, C_NULL, C_NULL, x, P)
    return z
end

function airybi(x::ArbComplex{P}) where P
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Ref{Cvoid}, Ref{ArbBall}, Clong),
              C_NULL, C_NULL, z, C_NULL, x, P)
    return z
end

function airybiprime(x::ArbComplex{P}) where P
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbBall}, Ref{ArbBall}, Clong),
              C_NULL, C_NULL, C_NULL, z, x, P)
    return z
end


