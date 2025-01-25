
# used in bitsdigits.jl

#     working_precision exceeds evinced_precision
#
# additional precision (more of the significant bits)
#    absorbs some kinds of numerical jitter
#    before any undesired resonance occurs
const BitsOfStability  =  9
#
# additional accuracy (more bits of the significand)
#    may compensate for 1,2,3 ulp enclosure widenings
const BitsOfAbsorption = 15
#
#
const BitsForRobustness = BitsOfStability + BitsOfAbsorption
const ExtraBits = Ref(BitsForRobustness)

@inline workingbits(evincedbits) = evincedbits + ExtraBits.x
@inline evincedbits(workingbits) = workingbits - ExtraBits.x

# preset precisions
const MINIMUM_PRECISION_BASE2 = 24
const MINIMUM_PRECISION_BASE10 = 8
const MINIMUM_PRECISION = MINIMUM_PRECISION_BASE2

const DEFAULT_PRECISION = Ref(workingbits(128 - ExtraBits.x))
