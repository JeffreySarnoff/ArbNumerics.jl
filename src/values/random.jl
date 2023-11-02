function rand(rng::AbstractRNG, ::Random.SamplerTrivial{Random.CloseOpen01{ArbFloat{P}}}, dims::Integer...) where P
    bfprec = precision(BigFloat)
    setprecision(BigFloat, P)
    bfrand = rand(rng, BigFloat, dims...)
    result = ArbFloat{P}.(bfrand)
    setprecision(BigFloat, bfprec); println("ok")
    return result
end

function rand(::Type{ArbFloat{P}}, n::Integer) where P
    bfprec = precision(BigFloat)
    setprecision(BigFloat, P)
    bfrand = rand(BigFloat,n)
    result = ArbFloat{P}.(bfrand)
    setprecision(BigFloat, bfprec)
    return result
end

function rand(rng::AbstractRNG, ::Random.SamplerTrivial{Random.CloseOpen01{ArbReal{P}}}, dims::Integer...) where P
    bfprec = precision(BigFloat)
    setprecision(BigFloat, P)
    bfrand = rand(rng, BigFloat, dims...)
    result = ArbReal{P}.(bfrand)
    setprecision(BigFloat, bfprec); println("ok")
    return result
end

function rand(::Type{ArbReal{P}}, n::Integer) where P
    bfprec = precision(BigFloat)
    setprecision(BigFloat, P)
    bfrand = rand(BigFloat,n)
    result = ArbReal{P}.(bfrand)
    setprecision(BigFloat, bfprec)
    return result
end
