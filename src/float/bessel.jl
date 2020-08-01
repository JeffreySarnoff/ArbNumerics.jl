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

besselj(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselj(ArbReal(nu), ArbReal(x), prec))
bessely(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besseli(ArbReal(nu), ArbReal(x), prec))
besseli(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(bessely(ArbReal(nu), ArbReal(x), prec))
besselk(nu::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselk(ArbReal(nu), ArbReal(x), prec))

besselj(nu::Integer, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselj(ArbReal(nu), ArbReal(x), prec))
bessely(nu::Integer, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besseli(ArbReal(nu), ArbReal(x), prec))
besseli(nu::Integer, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(bessely(ArbReal(nu), ArbReal(x), prec))
besselk(nu::Integer, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselk(ArbReal(nu), ArbReal(x), prec))

besselj(nu::Base.IEEEFloat, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselj(ArbReal(nu), ArbReal(x), prec))
bessely(nu::Base.IEEEFloat, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besseli(ArbReal(nu), ArbReal(x), prec))
besseli(nu::Base.IEEEFloat, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(bessely(ArbReal(nu), ArbReal(x), prec))
besselk(nu::Base.IEEEFloat, x::ArbFloat{P}, prec::Int=P) where {P} = ArbFloat(besselk(ArbReal(nu), ArbReal(x), prec))

besselj(nu::Integer, x::ArbComplex{P}, prec::Int=P) where {P} = besselj(ArbComplex(nu), x, prec)
bessely(nu::Integer, x::ArbComplex{P}, prec::Int=P) where {P} = bessely(ArbComplex(nu), x, prec)
besseli(nu::Integer, x::ArbComplex{P}, prec::Int=P) where {P} = besseli(ArbComplex(nu), x, prec)
besselk(nu::Integer, x::ArbComplex{P}, prec::Int=P) where {P} = besselk(ArbComplex(nu), x, prec)

besselj(nu::Base.IEEEFloat, x::ArbComplex{P}, prec::Int=P) where {P} = besselj(ArbComplex(nu), x, prec)
bessely(nu::Base.IEEEFloat, x::ArbComplex{P}, prec::Int=P) where {P} = bessely(ArbComplex(nu), x, prec)
besseli(nu::Base.IEEEFloat, x::ArbComplex{P}, prec::Int=P) where {P} = besseli(ArbComplex(nu), x, prec)
besselk(nu::Base.IEEEFloat, x::ArbComplex{P}, prec::Int=P) where {P} = besselk(ArbComplex(nu), x, prec)

besselj0(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(zero(ArbReal{P}), ArbReal{P}(x), bits=prec)
besselj1(x::ArbFloat{P}, prec::Int=P) where {P} = besselj(one(ArbReal{P}), ArbReal{P}(x), bits=prec)
bessely0(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(zero(ArbReal{P}), ArbReal{P}(x), bits=prec)
bessely1(x::ArbFloat{P}, prec::Int=P) where {P} = bessely(one(ArbReal{P}), ArbReal{P}(x), bits=prec)

besselj0(x::ArbReal{P}, prec::Int=P) where {P} = besselj(zero(ArbReal{P}), x, bits=prec)
besselj1(x::ArbReal{P}, prec::Int=P) where {P} = besselj(one(ArbReal{P}), x, bits=prec)
bessely0(x::ArbReal{P}, prec::Int=P) where {P} = bessely(zero(ArbReal{P}), x, bits=prec)
bessely1(x::ArbReal{P}, prec::Int=P) where {P} = bessely(one(ArbReal{P}), x, bits=prec)

besselj0(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(zero(ArbComplex{P}), x, bits=prec)
besselj1(x::ArbComplex{P}, prec::Int=P) where {P} = besselj(one(ArbComplex{P}), x, bits=prec)
bessely0(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(zero(ArbComplex{P}), x, bits=prec)
bessely1(x::ArbComplex{P}, prec::Int=P) where {P} = bessely(one(ArbComplex{P}), x, bits=prec)
