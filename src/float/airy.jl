function airyai(x::ArbReal{P}, prec::Int=P) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{ArbReal}, Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbReal}, Clong),
              z, C_NULL, C_NULL, C_NULL, x, prec)
    return z
end

function airyaiprime(x::ArbReal{P}, prec::Int=P) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{ArbReal}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbReal}, Clong),
              C_NULL, z, C_NULL, C_NULL, x, prec)
    return z
end

function airybi(x::ArbReal{P}, prec::Int=P) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{ArbReal}, Ref{Cvoid}, Ref{ArbReal}, Clong),
              C_NULL, C_NULL, z, C_NULL, x, prec)
    return z
end

function airybiprime(x::ArbReal{P}, prec::Int=P) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbReal}, Ref{ArbReal}, Clong),
              C_NULL, C_NULL, C_NULL, z, x, prec)
    return z
end

for F in (:airyai, :airyaiprime, :airybi, :airybiprime)
    @eval begin
        function $F(x::ArbFloat{P}, prec::Int=P) where {P}
            r = ArbReal{P}(x)
            r = $F(r, prec)
            z = ArbFloat{P}(r)
            return r
        end
    end
end


function airyai(x::ArbComplex{P}, prec::Int=P) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{ArbComplex}, Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbComplex}, Clong),
              z, C_NULL, C_NULL, C_NULL, x, prec)
    return z
end

function airyaiprime(x::ArbComplex{P}, prec::Int=P) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{ArbComplex}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbComplex}, Clong),
              C_NULL, z, C_NULL, C_NULL, x, prec)
    return z
end

function airybi(x::ArbComplex{P}, prec::Int=P) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{ArbComplex}, Ref{Cvoid}, Ref{ArbComplex}, Clong),
              C_NULL, C_NULL, z, C_NULL, x, prec)
    return z
end

function airybiprime(x::ArbComplex{P}, prec::Int=P) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_hypgeom_airy), Cvoid, 
              (Ref{Cvoid}, Ref{Cvoid}, Ref{Cvoid}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
              C_NULL, C_NULL, C_NULL, z, x, prec)
    return z
end
