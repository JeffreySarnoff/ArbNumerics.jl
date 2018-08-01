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
precision(::Type{ArbFloat{P}}) where {P} = P
precision(::Type{ArbReal{P}}) where {P} = P
precision(::Type{ArbComplex{P}}) where {P} = P

precision(x::ArbFloat{P}) where {P} = P
precision(x::ArbReal{P}) where {P} = P
precision(x::ArbComplex{P}) where {P} = P

# these typed significands have this many signficant bits shown

precision_shown(::Type{Mag}) = 30 # bits of significand
precision_shown(::Type{ArbFloat{P}}) where {P} = evincedbits(P)
precision_shown(::Type{ArbReal{P}}) where {P} = evincedbits(P)
precision_shown(::Type{ArbComplex{P}}) where {P} = evincedbits(P)

precision_shown(x::ArbFloat{P}) where {P} = evincedbits(P)
precision_shown(x::ArbReal{P}) where {P} = evincedbits(P)
precision_shown(x::ArbComplex{P}) where {P} = evincedbits(P)

# default precision
const MINIMUM_PRECISION = 24
const DEFAULT_PRECISION = [workingbits(128 - ExtraBits)]

function getprecision(::Type{BigFloat})
    prec = DEFAULT_PRECISION[1] + BIGFLOAT_FUZZ
    return prec
end

function resetprecision(::Type{BigFloat})
    prec = getprecision(BigFloat)
    setprecision(BigFloat, prec)
end

precision(::Type{ArbFloat}) = evincedbits(DEFAULT_PRECISION[1])
precision(::Type{ArbReal}) = evincedbits(DEFAULT_PRECISION[1])
precision(::Type{ArbComplex}) = evincedbits(DEFAULT_PRECISION[1])

function setprecision(::Type{T}, n::Int) where {T<:Union{ArbFloat,ArbReal,ArbComplex}}
    global DEFAULT_PRECISION
    n <= MINIMUM_PRECISION && throw(DomainError("precision must be >= $MINIMUM_PRECISION"))
    DEFAULT_PRECISION[1] = workingbits(n)
    return n
end

function ArbFloat(x)
    prec = DEFAULT_PRECISION[1]
    res  = ArbFloat{prec}(x)
    return res
end

@inline function ArbReal(x)
    prec = DEFAULT_PRECISION[1]
    res  = ArbReal{prec}(x)
    return res
end

@inline function ArbComplex(x)
    prec = DEFAULT_PRECISION[1]
    res  = ArbComplex{prec}(x)
    return res
end


@inline function ArbComplex(x, y)
    prec = DEFAULT_PRECISION[1]
    res  = ArbComplex{prec}(x, y)
    return res
end

@inline function ArbComplex(x, y::T) where {T<:AbstractFloat}
    prec = DEFAULT_PRECISION[1]
    res  = ArbComplex{prec}(x, y)
    return res
end
