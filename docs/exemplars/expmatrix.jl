#=
These examples use ArbNumerics v0.4.4, no earlier version supports `exp(matrix)`. 
So, either first do `pkg> up` or do `pkg> rm ArbNumerics` then `pkg> add ArbNumerics`.
Sometimes, rebuilding with `pkg> build ArbNumerics` cleans up after itself.

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
=#

setextrabits(0)  #  obtain the raw results
setextrabits(32) #  see less precision to be shown more accuracy
                 #  there are 24 extra bits at start

                                    # use one of these perspectives on counting bits
setworkingprecision(ArbFloat, 125)  # here use ArbFloat or ArbReal, the setting is shared 
setprecision(ArbReal, 100) # or set it this way, if that is where the import is greatest
                           # the most recent `set_` determines the default state of play

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

#=
#   Obtaining the exponential of a matrix
#
#     (a) provision a square matrix
#     (b) generate a similar matrix of eltype ArbReal 
#     (c) recieve each of (b) carried from (a)
#     (d) request exp(c) of ArbNumerics                (faster than exp(Matrix{ArbFloat}))
#     (e) generate a similar matrix given (a)
#     (f) recieve each of (e) carried from (d)
=#

function expmatrix(::Type{T}, m::Array{F,2}) where {P, T<:Union{ArbFloat{P}, ArbReal{P}}, F<:Real}
    a = Array{ArbReal,2}(undef, size(m))
    a[:] = m[:]
    z = exp(a)
    result = similar(m)
    result[:] = z[:]
    return result
end
