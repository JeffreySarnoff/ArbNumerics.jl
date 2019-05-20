function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{T}}) where {P, T<:ArbFloat{P}}
    oldprec = precision(BigFloat)
    setprecision(BigFloat, P+9)
    denom = BigInt(2)^P
    bigfloat = BigFloat(rand(BigInt(0):denom))
    bigfloat = bigfloat / BigFloat(denom)
    result = ArbFloat{P}(bigfloat)
    setprecision(BigFloat, oldprec)
    return result
end

@inline function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{ArbFloat}})
    P = workingprecision(ArbFloat)
    return rand(ArbFloat{P})
end

function rand(::AbstractRNG, ::SamplerType{T}) where {P, T<:ArbReal{P}}
    arbfloat = rand(ArbFloat{P})
    return ArbReal{P}(arbfloat)
end

@inline function rand(::AbstractRNG, ::SamplerType{ArbReal})
    P = workingprecision(ArbReal)
    return rand(ArbReal{P})
end

function rand(::AbstractRNG, ::SamplerType{T}) where {P, T<:ArbComplex{P}}
    re = ArbReal{P}(rand(ArbFloat{P}))
    im = ArbReal{P}(rand(ArbFloat{P}))
    return ArbComplex{P}(re, im)
end

@inline function rand(::AbstractRNG, ::SamplerType{ArbComplex})
    P = workingprecision(ArbFloat)
    return rand(ArbComplex{P})
end

function randn(rng::AbstractRNG, ::Type{ArbFloat{N}}) where {N}
    urand1, urand2 = rand(ArbFloat{N}, 2)
    urand1 = urand1 + urand1 - 1
    urand2 = urand2 + urand2 - 1
    s = urand1*urand1 + urand2*urand2
    
    while s >= 1 || s === 0
        urand1, urand2 = rand(ArbFloat{N}, 2)
        urand1 = urand1 + urand1 - 1
        urand2 = urand2 + urand2 - 1
        s = urand1*urand1 + urand2*urand2
    end
    
    s = sqrt( -log(s) / s )
    return (urand1 + urand2) * s
end

randn(rng::AbstractRNG, ::Type{ArbFloat})  = randn(rng, ArbFloat{workingprecision(ArbFloat)})

function randn(rng::AbstractRNG, ::Type{ArbReal{N}}) where {N}
    urand1, urand2 = rand(ArbReal{N}, 2)
    urand1 = urand1 + urand1 - 1
    urand2 = urand2 + urand2 - 1
    s = urand1*urand1 + urand2*urand2
    
    while s >= 1 || s === 0
        urand1, urand2 = rand(ArbReal{N}, 2)
        urand1 = urand1 + urand1 - 1
        urand2 = urand2 + urand2 - 1
        s = urand1*urand1 + urand2*urand2
    end
    
    s = sqrt( -log(s) / s )
    return (urand1 + urand2) * s
end

randn(rng::AbstractRNG, ::Type{ArbReal})  = randn(rng, ArbReal{workingprecision(ArbReal)})
