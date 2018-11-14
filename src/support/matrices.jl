@inline nrows(v::V) where {T, V<:AbstractVector{T}} = length(v)
@inline ncols(v::V) where {T, V<:AbstractVector{T}} = 1

@inline nrows(m::M) where {T, M<:AbstractMatrix{T}} = size(m)[1]
@inline ncols(m::M) where {T, M<:AbstractMatrix{T}} = size(m)[2]

@inline nrows(a::A) where {T, N, A<:AbstractArray{T,N}} = size(m)[1]
@inline ncols(a::A) where {T, N, A<:AbstractArray{T,N}} = N > 1 ? size(m)[2] : throw(BoundsError("$(size(a))[2]"))
@inline nstrata(a::A) where {T, N, A<:AbstractArray{T,N}} = N > 2 ? size(m)[3] : throw(BoundsError("$(size(a))[3]"))



#=
     these benchmark favorably relative to these canoncial formulations
     
@inline linear_to_cartesian(m::Array{T,N}, linearidx::Int) where {N, T} =
    Tuple(CartesianIndices(m)[linearidx])

@inline cartesian_to_linear(m::Array{T,N}, cartesianidx::C) where {T,N, C<:Tuple} =
     (LinearIndices(m))[cartesianidx...,]

@inline cartesian_to_linear(m::Array{T,N}, cartesianidx::C) where {N, T, C<:Vector{T}} =
     (LinearIndices(m))[cartesianidx...,]
=#


@inline cartesian_to_linear(nrows::Int, row::Int, col::Int) = row + (col-1)*nrows

@inline cartesian_to_linear(m::M, row::Int, col::Int) where {T,M<:AbstractMatrix{T}} =
    row + (col-1)*size(m)[1]

@inline linear_to_cartesian(m::M, linearidx::Int) where {T,M<:AbstractMatrix{T}} =
    linear_to_cartesian(size(m)[1], linearidx)

@inline function linear_to_cartesian(nrows::Int, linearidx::Int)
    row = rem(linearidx, nrows)
    row = ifelse(row === 0, nrows, row)
    col = div(linearidx-row, nrows) + 1
    return row,col
end

