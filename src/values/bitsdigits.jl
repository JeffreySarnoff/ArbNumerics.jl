# this many digits[bits] (are given by) that many bits[digits]
# sum([abs(i-maximin_digits(maximin_bits(i))) for i=24:4000])

const log10of2 = log10(2)
const log2of10 = log2(10)

@inline digits2bits(x::Int) = floor(Int, log2of10*x)
@inline bits2digits(x::Int) = ceil(Int, log10of2*x)

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
const BitsOfStability  =  9

# additional accuracy (more bits of the significand)
#    may compensate for 1,2,3 ulp enclosure widenings
const BitsOfAbsorption = 15

const ExtraBits = Ref(BitsOfStability + BitsOfAbsorption)

@inline workingbits(evincedbits) = evincedbits + ExtraBits.x
@inline evincedbits(workingbits) = workingbits - ExtraBits.x


# preset precisions
const MINIMUM_PRECISION_BASE2 = 24
const MINIMUM_PRECISION_BASE10 = 8
const MINIMUM_PRECISION = MINIMUM_PRECISION_BASE2

const DEFAULT_PRECISION = Ref(workingbits(128 - ExtraBits.x))

# these typed significands have this many signficant bits

workingprecision(::Type{Mag}) = 30 # bits of significand

workingprecision(::Type{ArbFloat}) = DEFAULT_PRECISION.x
workingprecision(::Type{ArbReal}) = DEFAULT_PRECISION.x
workingprecision(::Type{ArbComplex}) = DEFAULT_PRECISION.x

workingprecision(::Type{ArbFloat{P}}) where {P} = P
workingprecision(::Type{ArbReal{P}}) where {P} = P
workingprecision(::Type{ArbComplex{P}}) where {P} = P

workingprecision(x::ArbFloat{P}) where {P} = P
workingprecision(x::ArbReal{P}) where {P} = P
workingprecision(x::ArbComplex{P}) where {P} = P

# these typed significands have this many signficant bits shown

precision(::Type{Mag}) = 30 # bits of significand
precision(::Type{ArbFloat}) = evincedbits(DEFAULT_PRECISION.x)
precision(::Type{ArbReal}) = evincedbits(DEFAULT_PRECISION.x)
precision(::Type{ArbComplex}) = evincedbits(DEFAULT_PRECISION.x)

precision(::Type{ArbFloat{P}}) where {P} = evincedbits(P)
precision(::Type{ArbReal{P}}) where {P} = evincedbits(P)
precision(::Type{ArbComplex{P}}) where {P} = evincedbits(P)

precision(x::ArbFloat{P}) where {P} = evincedbits(P)
precision(x::ArbReal{P}) where {P} = evincedbits(P)
precision(x::ArbComplex{P}) where {P} = evincedbits(P)

function setprecision(::Type{T}; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:ArbNumber}
    if base === 10
        digits = digits > 0 ? bits4digits(digits) : (bits > 0 ? bits : DEFAULT_PRECISION.x)
    elseif base === 2
        digits = bits > 0 ? bits : (digits > 0 ? digits : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    setprecision(T, digits)
end

function setprecision(::Type{T}, n::Int) where {T<:ArbNumber}
    n < MINIMUM_PRECISION && throw(DomainError("bit precision must be >= $MINIMUM_PRECISION"))
    DEFAULT_PRECISION.x = workingbits(n)
    return n
end

function setworkingprecision(::Type{T}; bits::Int=0, digits::Int=0, base::Int=iszero(bits) ? 10 : 2) where {T<:ArbNumber}
    if base === 10
        digits = digits > 0 ? bits4digits(digits) : (bits > 0 ? bits : DEFAULT_PRECISION.x)
    elseif base === 2
        digits = bits > 0 ? bits : (digits > 0 ? digits : DEFAULT_PRECISION.x)
    else
        throw(ErrorException("base expects 2 or 10"))
    end
    setworkingprecision(T, digits)
end

function setworkingprecision(::Type{T}, n::Int) where {T<:ArbNumber}
    n < workingbits(MINIMUM_PRECISION) && throw(DomainError("working bit precision must be >= $(workingbits(MINIMUM_PRECISION))"))
    DEFAULT_PRECISION.x = n
    return n
end

extrabits() = ExtraBits.x

extrabits(::Type{ArbFloat}) = ExtraBits.x
extrabits(::Type{ArbReal}) = ExtraBits.x
extrabits(::Type{ArbComplex}) = ExtraBits.x

extrabits(::Type{ArbFloat{P}}) where {P} = extrabits(ArbFloat)
extrabits(::Type{ArbReal{P}}) where {P} = extrabits(ArbReal)
extrabits(::Type{ArbComplex{P}}) where {P} = extrabits(ArbComplex)

extrabits(x::ArbFloat{P}) where {P} = extrabits(ArbFloat)
extrabits(x::ArbReal{P}) where {P} = extrabits(ArbReal)
extrabits(x::ArbComplex{P}) where {P} = extrabits(ArbComplex)

function setextrabits(n::Int)
    n >=0 || throw(DomainError("extrabits must be >= 0"))
    priorextra = extrabits()
    priorworking = workingprecision(ArbFloat)
    newextra = n
    newworking = priorworking + (newextra - priorextra)
    ExtraBits.x = newextra
    DEFAULT_PRECISION.x = newworking
    return ExtraBits.x
end

setextrabits(::Type{T}, n::Int) where {T<:ArbNumber} = setextrabits(n)
