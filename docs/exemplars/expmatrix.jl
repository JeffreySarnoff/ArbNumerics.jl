#=
These examples use ArbNumerics v0.4.4, no earlier version supports `exp(matrix)`. 
So, either first do `pkg> up` or do `pkg> rm ArbNumerics` then `pkg> add ArbNumerics`.
Sometimes, rebuilding with `pkg> build ArbNumerics` cleans up after itself.
All the matrix handling is new code, the examples here are working as of now.
If you find anything unclear or something awry, post an issue and
please use slack's direct message to draw my attention.
=#

#=
Using Float64 matrices with entries from `rand` in 0.0..1.0:
with a   250x250 matrix of Float64s, working with 350 bits used  10 seconds, trace ~ 1.0e+53
with a   500x500 matrix of Float64s, working with 350 bits used  50 seconds, trace ~ 1.0e+108
with a   750x750 matrix of Float64s, working with 350 bits used 140 seconds, trace ~ 1.0e+162
with a 1000x1000 matrix of Float64s, working with 350 bits used 380 seconds, trace ~ 1.0e+215
with a   250x250 matrix of Float64s, working with 700 bits used  25 seconds
with a   500x500 matrix of Float64s, working with 350 bits used  25 seconds
with a   750x750 matrix of Float64s, working with 175 bits used  25 seconds
=#

using ArbNumerics # GenericSVD, LinearAlgebra, Readables

#=
ArbNumerics' interactive users see the "viewable precision"; computations utilize "working precision".
By definition, _viewable precision <= working_precision_. They may share the same number; then the
results shown are precisely the computed numerical results. Should they differ, there are "extra bits".
Julia should be restarted just before these precisions are altered.  When the precision is being altered
in the course of iterative refinement, it is the precision of successive values which moves, not their
bedrock relationship.  Individual values may be constructed more or less precisely than their sources.
Arithmetic over values of differing precision yields a result that adopts the lesser precision.
When the precision is lower than that which permits crisp numerical results, the interval known
to contain the actual result eclipses the magnitude of that value.  It appears so: `[+/- 12.1]`.
=#

setextrabits(0)  #  obtain the raw results
setextrabits(24) #  more accurately, less precision is observed
#  This is not a means of protection from numerical misadventure.
#  This may be adaptive accomodation to the partially [un]known.

                                    # Use one of these perspectives on bits that count.
setworkingprecision(ArbFloat, 125)  # This focus is on available computational precision.
setprecision(ArbReal, 100)          # Or prefer less precision with more accuracy. 

                                    # the most recent `set_` gives the operative precision 
                                    # for constructing new Arb values using type name only
                                    # the setting is shared by all of the Arb types
                                    # and that makes it easier to characterize accuracy

#= 
#   During the course of computation, ArbFloat, ArbReal, ArbComplex values
#   may be constructed at various precisions.  Once given, precision stays.
#   Change of precision occurs through construction of that changed value. 
=#

a₂  = ArbFloat(1, digits=100, base=2);
a₁₀ = ArbFloat(1, digits=29, base=10);
workingprecision.((a₂, a₁₀))
(100, 98)

b₂  = ArbFloat(1, digits=3000, base=2);
b₁₀ = ArbFloat(1, digits=902, base=10);
workingprecision.((b₂, b₁₀))
(3000, 2999)

workingprecision(ArbReal(1)) == 128
workingprecision(ArbFloat(1, bits=1024) + ArbFloat(1, bits=256)) == 256

#>  ... ... ... ... ... ... ... ... ... ... ... ... ... ... ... ... ...  <#

#=
    To regard a matrix of extended precision ArbFloats or ArbReals,
    where the elements are in the Float64 domain: `Float64.(matrix)`.
    To characterize or classify a large matrix of the same nature:
    `approx = Float64.(matrix); result = describe(process(approx))`
#
const Arb{P} = Union{ArbFloat{P}, ArbReal{P}} where {P}
#=
#   Obtaining the exponential of a matrix
#
#     (a) provision a square matrix
#     (b) generate a similar matrix of eltype ArbReal 
#     (c) receive each of (b) carried from (a)
#     (d) request exp(c) of ArbNumerics                (faster than exp(Matrix{ArbFloat}))
#     (e) generate a similar matrix given (a)
#     (f) receive each of (e) carried from (d)
=#
function expmatrix(m::Array{T,2}) where {T<:Real}
    a = Array{ArbReal,2}(undef, size(m))
    a[:] = m[:]
    z = exp(a)
    result = similar(m)
    result[:] = z[:]
    return result
end
