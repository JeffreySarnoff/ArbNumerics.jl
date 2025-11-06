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

"""
    hypergeometric_gamma_lower(s, z)

lower incomplete gamma function, ``small_gamma(s, z) = (z^s / s) * ₁F₁(s, s+1, -z)``
"""
function hypergeometric_gamma_lower(s::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(0)
    ccall(@libarb(arb_hypgeom_gamma_lower), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, s, z, regularized, P)
    return result
end

"""
    regular_hypergeometric_gamma_lower(s, z)

regularized lower incomplete gamma function, ``P(s, z) = small_gamma(s, z) / gamma(s)``
"""
function regular_hypergeometric_gamma_lower(s::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(1)
    ccall(@libarb(arb_hypgeom_gamma_lower), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, s, z, regularized, P)
    return result
end

"""
    further_regular_hypergeometric_gamma_lower(s, z)

'further' regularized lower incomplete gamma function, ``small_gamma_star(s, z) = z^-s * P(s, z)``
"""
function further_regular_hypergeometric_gamma_lower(s::ArbReal{P}, z::ArbReal{P}) where {P}
    result = ArbReal{P}()
    regularized = Cint(2)
    ccall(@libarb(arb_hypgeom_gamma_lower), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Cint, Clong),
         result, s, z, regularized, P)
    return result
end




# ArbFloat

hypergeometric_0F1(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_0F1(ArbReal{P}(a), ArbReal{P}(z)))

hypergeometric_0F1_regularized(a::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_0F1_regularized(ArbReal{P}(a), ArbReal{P}(z)))

hypergeometric_U(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_U(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypergeometric_1F1(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_1F1(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypergeometric_1F1_regularized(a::ArbFloat{P}, b::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_1F1_regularized(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(z)))

hypergeometric_1F2(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_1F2(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))

hypergeometric_1F2_regularized(a::ArbFloat{P}, b::ArbFloat{P}, c::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_1F2_regularized(ArbReal{P}(a), ArbReal{P}(b), ArbReal{P}(c), ArbReal{P}(z)))

hypergeometric_gamma_lower(s::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_gamma_lower(ArbReal{P}(s), ArbReal{P}(z)))

regular_hypergeometric_gamma_lower(s::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(hypergeometric_gamma_lower(ArbReal{P}(s), ArbReal{P}(z)))

further_regular_hypergeometric_gamma_lower(s::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    ArbFloat{P}(further_hypergeometric_gamma_lower(ArbReal{P}(s), ArbReal{P}(z)))
