const ST = Union{Int32, Int64, Float32, Float64}

for (A,F) in ((:besselj, :arb_hypgeom_bessel_j), (:bessely, :arb_hypgeom_bessel_y),
              (:besseli, :arb_hypgeom_bessel_i), (:besselk, :arb_hypgeom_bessel_k))
    @eval begin
        function ($A)(nu::ArbReal{P}, x::ArbReal{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong),
                                      z, nu, x, prec)
        return z
        end
    end
end

for (A,F) in ((:besselj, :acb_hypgeom_bessel_j), (:bessely, :acb_hypgeom_bessel_y),
              (:besseli, :acb_hypgeom_bessel_i), (:besselk, :acb_hypgeom_bessel_k))
    @eval begin
        function ($A)(nu::ArbComplex{P}, x::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
                                      z, nu, x, prec)
            return z
        end
    end
end     

besselj(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat{P}(besselj(ArbReal{P}(nu), ArbReal{P}(x)), prec)
bessely(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat{P}(bessely(ArbReal{P}(nu), ArbReal{P}(x)), prec)
besseli(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat{P}(besseli(ArbReal{P}(nu), ArbReal{P}(x)), prec)
besselk(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat{P}(besselk(ArbReal{P}(nu), ArbReal{P}(x)), prec)

besselj(nu::S, x::ArbFloat{P}, prec::Int=P) where {P, S<:ST} = ArbFloat{P}(besselj(ArbReal{P}(nu), ArbReal{P}(x)), prec)
bessely(nu::S, x::ArbFloat{P}, prec::Int=P) where {P, S<:ST} = ArbFloat{P}(bessely(ArbReal{P}(nu), ArbReal{P}(x)), prec)
besseli(nu::S, x::ArbFloat{P}, prec::Int=P) where {P, S<:ST} = ArbFloat{P}(besseli(ArbReal{P}(nu), ArbReal{P}(x)), prec)
besselk(nu::S, x::ArbFloat{P}, prec::Int=P) where {P, S<:ST} = ArbFloat{P}(besselk(ArbReal{P}(nu), ArbReal{P}(x)), prec)

besselj(nu::S, x::ArbReal{P}, prec::Int=P) where {P, S<:ST} = besselj(ArbReal{P}(nu), x, prec)
bessely(nu::S, x::ArbReal{P}, prec::Int=P) where {P, S<:ST} = bessely(ArbReal{P}(nu), x, prec)
besseli(nu::S, x::ArbReal{P}, prec::Int=P) where {P, S<:ST} = besseli(ArbReal{P}(nu), x, prec)
besselk(nu::S, x::ArbReal{P}, prec::Int=P) where {P, S<:ST} = besselk(ArbReal{P}(nu), x, prec)

besselj0(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(zero(ArbReal{P}), ArbReal{P}(x), prec)
besselj1(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(one(ArbReal{P}), ArbReal{P}(x), prec)
bessely0(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(zero(ArbReal{P}), ArbReal{P}(x), prec)
bessely1(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(one(ArbReal{P}), ArbReal{P}(x), prec)

besselj0(x::ArbReal{P}, prec::Int=P) where {P} = besselj(zero(ArbReal{P}), x, prec)
besselj1(x::ArbReal{P}, prec::Int=P) where {P} = besselj(one(ArbReal{P}), x, prec)
bessely0(x::ArbReal{P}, prec::Int=P) where {P} = bessely(zero(ArbReal{P}), x, prec)
bessely1(x::ArbReal{P}, prec::Int=P) where {P} = bessely(one(ArbReal{P}), x, prec)

besselj0(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(zero(ArbComplex{P}), x, prec)
besselj1(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(one(ArbComplex{P}), x, prec)
bessely0(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(zero(ArbComplex{P}), x, prec)
bessely1(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(one(ArbComplex{P}), x, prec)

besselj(nu::S, x::ArbComplex{P}, prec::Int=P) where {P, S<:ST} = besselj(ArbComplex{P}(nu), x, prec)
bessely(nu::S, x::ArbComplex{P}, prec::Int=P) where {P, S<:ST} = bessely(ArbComplex{P}(nu), x, prec)
besseli(nu::S, x::ArbComplex{P}, prec::Int=P) where {P, S<:ST} = besseli(ArbComplex{P}(nu), x, prec)
besselk(nu::S, x::ArbComplex{P}, prec::Int=P) where {P, S<:ST} = besselk(ArbComplex{P}(nu), x, prec)
