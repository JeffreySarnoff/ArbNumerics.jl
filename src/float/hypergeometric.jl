#= 
void acb_hypgeom_u(acb_t res, const acb_t a, const acb_t b, const acb_t z, slong prec)¶
Computes U(a,b,z) using an automatic algorithm choice.

void acb_hypgeom_0f1(acb_t res, const acb_t a, const acb_t z, int regularized, slong prec)¶
Computes the confluent hypergeometric function 0F1(a,z), or inv(Γ(a))0F1(a,z) if regularized is set,

void acb_hypgeom_1f1(acb_t res, const acb_t a, const acb_t b, const acb_t z, int regularized, slong prec)¶
Computes the confluent hypergeometric function M(a,b,z)=1F1(a,b,z), or M(a,b,z)=inv(Γ(b))1F1(a,b,z) if regularized is set.

acb_hypgeom_2f1(acb_t res, const acb_t a, const acb_t b,
        const acb_t c, const acb_t z, int flags, slong prec)

void acb_hypgeom_pfq(acb_poly_t res, acb_srcptr a, slong p, acb_srcptr b, slong q, const acb_t z, int regularized, slong prec)
Computes the generalized hypergeometric function pFq(z), or the regularized version if regularized is set. =#

"""
    hypergeometric_0F1(a, z)

confluent hypergeometric function ``₀F₁``
"""
function hypergeometric_0F1(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

const F₀₁ = hypergeometric_0F1

"""
    regular_hypergeometric_0F1(a, z)

regularized confluent hypergeometric function, ``₀F₁ / gamma(a)``
"""
function regular_hypergeometric_0F1(a::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_0f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

const regularF₀₁ = regular_hypergeometric_0F1

"""
    hypergeometric_U(a, b, z)

confluent hypergeometric function of the second kind
"""
function hypergeometric_U(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbReal{P}()
    ccall(@libarb(acb_hypgeom_u), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
         result, a, b, z, P)
    return result
end

"""
    hypergeometric_1F1(a, b, z)

confluent hypergeometric function ``₁F₁``
"""
function hypergeometric_1F1(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

const F₁₁ = hypergeometric_1F1

"""
    regular_hypergeometric_1F1(a, b, z)

regularized confluent hypergeometric function, ``₁F₁ / gamma(a)``
"""
function regular_hypergeometric_1F1(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_1f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

const regularF₁₁ = regular_hypergeometric_1F1

"""
    hypergeometric_2F1(a, b, c, z)

confluent hypergeometric function ``₂F₁``
"""
function hypergeometric_2F1(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

const F₂₁ = hypergeometric_2F1

"""
    regular_hypergeometric_2F1_regularized(a, b, c, z)

regularized confluent hypergeometric function, ``₂F₁ / gamma(a)``
"""
function regular_hypergeometric_2F1(a::ArbComplex{P}, b::ArbComplex{P}, c::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    ccall(@libarb(acb_hypgeom_2f1), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

const regularF₂₁ = regular_hypergeometric_2F1

"""
    hypergeometric_1F2(a, b, z)

generalized hypergeometric function ``₁F₂``
"""
function hypergeometric_1F2(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(0)
    p = Clong(1)
    q = Clong(2)
    ccall(@libarb(acb_hypgeom_pfq), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Ref{ArbComplex}, Clong, Ref{ArbComplex}, Cint, Clong),
         result, a, p, b, q, z, regularized, P)
    return result
end

const F₁₂ = hypergeometric_1F2

"""
regular_hypergeometric_1F2(a, b, z)

regularized generalized hypergeometric function ``₁F₂ / gamma(a)``
"""
function regular_hypergeometric_1F2(a::ArbComplex{P}, b::ArbComplex{P}, z::ArbComplex{P}) where {P}
    result = ArbComplex{P}()
    regularized = Cint(1)
    p = Clong(1)
    q = Clong(2)
    ccall(@libarb(acb_hypgeom_pfq), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Ref{ArbComplex}, Clong, Ref{ArbComplex}, Cint, Clong),
         result, a, p, b, q, z, regularized, P)
    return result
end

const regularF₁₂ = regular_hypergeometric_1F2

function hypergeometric_0F1(a::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_0f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function regular_hypergeometric_0F1(a::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_0f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, z, regularized, P)
    return result
end

function hypergeometric_U(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    ccall(@libarb(arb_hypgeom_u), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong),
         result, a, b, z, P)
    return result
end

function hypergeometric_1F1(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_1f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function regular_hypergeometric_1F1(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_1f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, z, regularized, P)
    return result
end

function hypergeometric_2F1(a::ArbReal{P}, b::ArbReal{P}, c::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_2f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

function regular_hypergeometric_2F1(a::ArbReal{P}, b::ArbReal{P}, c::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_2f1), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, a, b, c, z, regularized, P)
    return result
end

function hypergeometric_1F2(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    p = Clong(1)
    q = Clong(2)
    ccall(@libarb(arb_hypgeom_pfq), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong, Ref{ArbReal}, Clong, Ref{ArbReal}, Cint, Clong),
         result, a, p, b, q, z, regularized, P)
    return result
end

function regular_hypergeometric_1F2(a::ArbReal{P}, b::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    p = Clong(1)
    q = Clong(2)
    ccall(@libarb(arb_hypgeom_pfq), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong, Ref{ArbReal}, Clong, Ref{ArbReal}, Cint, Clong),
         result, a, p, b, q, z, regularized, P)
    return result
end

hypergeometric_0F1(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1(ArbReal{P}(a), ArbReal{P}(z)))

hypergeometric_0F1_regularized(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom0f1reg(ArbReal{P}(a), ArbReal{P}(z)))

hypergeometric_U(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeomu(ArbReal{P}(a), ArbReal{P}(z)))

hypergeometric_1F1(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypergeometric_1F1_regularized(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f1reg(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypergeometric_1F2(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))

hypergeometric_1F2_regularized(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypgeom1f2reg(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))
