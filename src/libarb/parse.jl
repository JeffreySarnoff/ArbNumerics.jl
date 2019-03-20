
#= from Nemo.jl
function show(io::IO, x::arb)
  d = ceil(parent(x).prec * 0.30102999566398119521)
  cstr = ccall((:arb_get_str, :libarb), Ptr{UInt8}, (Ref{arb}, Int, UInt),
                                                  x, Int(d), UInt(0))
  print(io, unsafe_string(cstr))
  ccall((:flint_free, :libflint), Void, (Ptr{UInt8},), cstr)
end
=#

function ArbFloat{P}(s::AbstractString) where {P}
    return ArbFloat{P}(BigFloat(s))
end

function ArbReal{P}(s::AbstractString) where {P}
    return ArbReal{P}(BigFloat(s))
end

function ArbFloat(s::AbstractString)
    P = DEFAULT_PRECISION[]
    return ArbFloat{P}(s)
end

function ArbReal(s::AbstractString)
    P = DEFAULT_PRECISION[]
    return ArbReal{P}(s)
end

function ArbComplex(s::AbstractString)
    P = DEFAULT_PRECISION[]
    x = parse(Complex{BigFloat}, s)
    return ArbComplex{P}(x)
end

function ArbComplex{P}(s::AbstractString) where {P}
    x = parse(Complex{BigFloat}, s)
    return ArbComplex{P}(x)
end

function Base.tryparse(::Type{ArbFloat}, s::S; base::Int=10) where {S<:AbstractString}
    x = tryparse(BigFloat, s, base=base)
    P = DEFAULT_PRECISION[]
    return ifelse(isnothing(x), nothing, ArbFloat{P}(x))
end

function Base.tryparse(::Type{ArbFloat{P}}, s::S; base::Int=10) where {P, S<:AbstractString}
    x = tryparse(BigFloat, s, base=base)
    return ifelse(isnothing(x), nothing, ArbFloat{P}(x))
end

function Base.tryparse(::Type{ArbReal}, s::S; base::Int=10) where {S<:AbstractString}
    x = tryparse(BigFloat, s, base=base)
    P = DEFAULT_PRECISION[]
    return ifelse(isnothing(x), nothing, ArbReal{P}(x))
end

function Base.tryparse(::Type{ArbReal{P}}, s::S; base::Int=10) where {P, S<:AbstractString}
    x = tryparse(BigFloat, s, base=base)
    return ifelse(isnothing(x), nothing, ArbReal{P}(x))
end

function Base.tryparse(::Type{ArbComplex}, s::S; base::Int=10) where {S<:AbstractString}
    x = tryparse(Complex{BigFloat}, s, base=base)
    P = DEFAULT_PRECISION[]
    return ifelse(isnothing(x), nothing, ArbComplex{P}(x))
end

function Base.tryparse(::Type{ArbComplex{P}}, s::S; base::Int=10) where {P, S<:AbstractString}
    x = tryparse(Complex{BigFloat}, s, base=base)
    return ifelse(isnothing(x), nothing, ArbComplex{P}(x))
end

