#=
void acb_hypgeom_u(acb_t res, const acb_t a, const acb_t b, const acb_t z, slong prec)¶
Computes U(a,b,z) using an automatic algorithm choice.

void acb_hypgeom_0f1(acb_t res, const acb_t a, const acb_t z, int regularized, slong prec)¶
Computes the confluent hypergeometric function 0F1(a,z), or inv(Γ(a))0F1(a,z) if regularized is set,

void acb_hypgeom_1f1(acb_t res, const acb_t a, const acb_t b, const acb_t z, int regularized, slong prec)¶
Computes the confluent hypergeometric function M(a,b,z)=1F1(a,b,z), or M(a,b,z)=inv(Γ(b))1F1(a,b,z) if regularized is set.

acb_hypgeom_2f1(acb_t res, const acb_t a, const acb_t b,
        const acb_t c, const acb_t z, int flags, slong prec)
=#

function hypgeom0f1(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypgeom0f1regularized(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypgeomu(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbReal{P}()
    ccall(@libarb(acb_hypgeom_u), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
         result, a, b, z, P)
    return result
end

function hypgeom1f1(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function hypgeom1f1regularized(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function hypgeom2f1(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

function hypgeom2f1regularized(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

#=
oid arb_hypgeom_0f1(arb_t res, const arb_t a, const arb_t z, int regularized, slong prec)
Computes the confluent hypergeometric limit function 0F1(a,z), or 1Γ(a)0F1(a,z) if regularized is set.

void arb_hypgeom_m(arb_t res, const arb_t a, const arb_t b, const arb_t z, int regularized, slong prec)
Computes the confluent hypergeometric function M(a,b,z)=1F1(a,b,z), or M(a,b,z)=1Γ(b)1F1(a,b,z) if regularized is set.

void arb_hypgeom_1f1(arb_t res, const arb_t a, const arb_t b, const arb_t z, int regularized, slong prec)
Alias for arb_hypgeom_m().

void arb_hypgeom_u(arb_t res, const arb_t a, const arb_t b, const arb_t z, slong prec)
Computes the confluent hypergeometric function U(a,b,z).

Gauss hypergeometric function
void arb_hypgeom_2f1(arb_t res, const arb_t a, const arb_t b, const arb_t c, const arb_t z, int regularized, slong prec)
Computes the Gauss hypergeometric function 2F1(a,b,c,z), or F(a,b,c,z)=1Γ(c)2F1(a,b,c,z) if regularized is set.
=#
function hypgeom0f1(a::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_0f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypgeom0f1regularized(a::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_0f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypgeomu(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_u), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong),
         result, a, b, z, P)
    return result
end

function hypgeom1f1(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_1f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function hypgeom1f1regularized(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_1f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function hypgeom2f1(a::ArbReal{P}, b::ArbReal{P}, c::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_2f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

function hypgeom2f1regularized(a::ArbReal{P}, b::ArbReal{P}, c::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_2f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

# ArbFloat

hypgeom0f1(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1(ArbReal{P}(a), ArbReal{P}(z)))

hypgeom0f1regularized(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1regularized(ArbReal{P}(a), ArbReal{P}(z)))

hypgeomu(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeomu(ArbReal{P}(a), ArbReal{P}(z)))

hypgeom1f1(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypgeom1f1regularized(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1regularized(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypgeom1f2(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))

hypgeom1f2(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2regularized(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))
