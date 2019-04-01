#=
These examples use ArbNumerics v0.4.4, no earlier version supports `exp(matrix)`. 
So, either first do `pkg> up` or do `pkg> rm ArbNumerics` then `pkg> add ArbNumerics`.
Sometimes, rebuilding with `pkg> build ArbNumerics` cleans up after itself.
(and ignore SpecialFunctions, should it complain)

All the matrix handling is new code, the examples here are working as of now.
If you find anything unclear or something awry, post an issue and
please use slack's direct message to draw my attention.
=#

using ArbNumerics, Readables, BenchmarkTools

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
a = 

#=
#   During the algorithmic course, one may provide precision to the determination of values.
#   This manner of working is available to every ArbFloat, ArbReal, ArbComplex, variable.
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

function expmatrix(::Type{T}, m::Array{F,2}) where {P, T<:Arb, F<:Real}
    a = Array{ArbReal,2}(undef, size(m))
    a[:] = m[:]
    z = exp(a)
    result = similar(m)
    result[:] = z[:]
    return result
end
