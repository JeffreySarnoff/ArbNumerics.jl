using Random
using Random: SamplerTrivial, CloseOpen01
import Random: rand

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

function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{T}}) where {P, T<:ArbReal{P}}
    arbfloat = rand(ArbFloat{P})
    return ArbReal{P}(arbfloat)
end

@inline function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{ArbReal}})
    P = workingprecision(ArbReal)
    return rand(ArbReal{P})
end

function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{T}}) where {P, T<:ArbComplex{P}}
    re = ArbReal{P}(rand(ArbFloat{P}))
    im = ArbReal{P}(rand(ArbFloat{P}))
    return ArbComplex{P}(re, im)
end

@inline function rand(::AbstractRNG, ::SamplerTrivial{CloseOpen01{ArbComplex}})
    P = workingprecision(ArbFloat)
    return rand(ArbComplex{P})
end
