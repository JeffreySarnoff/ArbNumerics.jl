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

"""
    hypgeom0f1(a, z)

confluent hypergeometric function ₀f₁  ₁f₁  ₂f₁
"""
function hypgeom0f1(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

"""
    hypgeom0f1reg(a, z)

regularized confluent hypergeometric function, inv(gamma(a)) * ₀f₁
"""
function hypgeom0f1reg(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

"""
    hypgeomu(a, b, z)

confluent hypergeometric function U
"""
function hypgeomu(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbReal{P}()
    ccall(@libarb(acb_hypgeom_u), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
         result, a, b, z, P)
    return result
end

"""
    hypgeom1f1(a, b, z)

confluent hypergeometric function ₁f₁  ₂f₁
"""
function hypgeom1f1(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

"""
    hypgeom1f1reg(a, b, z)

regularized confluent hypergeometric function, inv(gamma(a)) * ₁f₁
"""
function hypgeom1f1reg(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

"""
    hypgeom2f1(a, b, c, z)

confluent hypergeometric function ₂f₁
"""
function hypgeom2f1(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

"""
    hypgeom2f1reg(a, b, c, z)

regularized confluent hypergeometric function, inv(gamma(a)) * ₂f₁
"""
function hypgeom2f1reg(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

function hypgeom0f1(a::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_0f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypgeom0f1reg(a::ArbReal{P}, z::ArbReal{P}) where {P}
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

function hypgeom1f1reg(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
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

function hypgeom2f1reg(a::ArbReal{P}, b::ArbReal{P}, c::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_2f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

# ArbFloat

hypgeom0f1(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1(ArbReal{P}(a), ArbReal{P}(z)))

hypgeom0f1reg(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1reg(ArbReal{P}(a), ArbReal{P}(z)))

hypgeomu(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeomu(ArbReal{P}(a), ArbReal{P}(z)))

hypgeom1f1(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypgeom1f1reg(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1reg(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypgeom1f2(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))

hypgeom1f2reg(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2reg(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))
