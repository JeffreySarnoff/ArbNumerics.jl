# this many digits[bits] (are given by) that many bits[digits]
# sum([abs(i-maximin_digits(maximin_bits(i))) for i=24:4000])

const log10of2 = log10(2)
const log2of10 = log2(10)

@inline maximin_digits(nbits) = floor(Int, log10of2*nbits + 0.125)   # match on round trip
@inline maximin_bits(ndigits) = floor(Int, log2of10*ndigits + 2.625) # at least enough, at most 3 more on round trip

@inline function digits4bits(nbits)
    bits = log10of2 * nbits
    bits += 0.125
    floor(Int, bits)
end    
    
@inline function bits4digits(ndigits)
    digs = log2of10 * ndigits
    digs += 2.625
    floor(Int, digs)
end

#     working_precision exceeds evinced_precision

# additional precision (more of the significant bits)
#    absorbs some kinds of numerical jitter
#    before any undesired resonance occurs
const BitsOfStability  = 9

# additional accuracy (more bits of the significand)
#    may compensate for 1,2, or 3 ulp enclosure widenings
const BitsOfAbsorbtion = 15

const ExtraBits = BitsOfStability + BitsOfAbsorbtion

@inline workingbits(evincedbits) = evincedbits + ExtraBits
@inline evincedbits(workingbits) = workingbits - ExtraBits

# characteristics

# these typed significands have this many signficant bits

precision(::Type{Mag}) = 30 # bits of significand
precision(::Type{Arf{P}}) where {P} = P
precision(::Type{Arb{P}}) where {P} = P
precision(::Type{Acb{P}}) where {P} = P

precision(x::Arf{P}) where {P} = P
precision(x::Arb{P}) where {P} = P
precision(x::Acb{P}) where {P} = P

# these typed significands have this many signficant bits shown

precision_shown(::Type{Mag}) = 30 # bits of significand
precision_shown(::Type{Arf{P}}) where {P} = evincedbits(P)
precision_shown(::Type{Arb{P}}) where {P} = evincedbits(P)
precision_shown(::Type{Acb{P}}) where {P} = evincedbits(P)

precision_shown(x::Arf{P}) where {P} = evincedbits(P)
precision_shown(x::Arb{P}) where {P} = evincedbits(P)
precision_shown(x::Acb{P}) where {P} = evincedbits(P)

# default precision
const MINIMUM_PRECISION = 11
const DEFAULT_PRECISION = [workingbits(128 - ExtraBits)]
const BIGFLOAT_FUZZ = 64

function getprecision(::Type{BigFloat})
    prec = DEFAULT_PRECISION[1] + BIGFLOAT_FUZZ
    return prec
end

function resetprecision(::Type{BigFloat})
    prec = getprecision(BigFloat)
    setprecision(BigFloat, prec)
end
    
precision(::Type{Arf}) = evincedbits(DEFAULT_PRECISION[1])
precision(::Type{Arb}) = evincedbits(DEFAULT_PRECISION[1])
precision(::Type{Acb}) = evincedbits(DEFAULT_PRECISION[1])

function setprecision(::Type{T}, n::Int) where {T<:Union{Arf,Arb,Acb}}
    global DEFAULT_PRECISION
    n <= MINIMUM_PRECISION && throw(DomainError("precision must be >= $MINIMUM_PRECISION"))
    newprecision = workingbits(n)
    newbfprecision = max(newprecision + BigFloatFuzz, precision(BigFloat))
    setprecision(BigFloat, newbfprecision)
    DEFAULT_PRECISION[1] = workingbits(n)
    return n
end

function Arf(x)
    prec = DEFAULT_PRECISION[1]
    res  = Arf{prec}(x)
    return res
end

@inline function Arb(x)
    prec = DEFAULT_PRECISION[1]
    res  = Arb{prec}(x)
    return res
end

@inline function Acb(x)
    prec = DEFAULT_PRECISION[1]
    res  = Acb{prec}(x)
    return res
end


@inline function Acb(x, y)
    prec = DEFAULT_PRECISION[1]
    res  = Acb{prec}(x, y)
    return res
end

@inline function Acb(x, y::T) where {T<:AbstractFloat}
    prec = DEFAULT_PRECISION[1]
    res  = Acb{prec}(x, y)
    return res
end
