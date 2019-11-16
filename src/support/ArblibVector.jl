for (TT,init_f,clear_f) in [(:ArbReal,@libarb(_arb_vec_init),@libarb(_arb_vec_clear)),
                            (:ArbComplex,@libarb(_acb_vec_init),@libarb(_acb_vec_clear))]
    @eval begin
        init(::Type{T}, len::Integer) where {T<:$TT} =
            ccall($init_f, Ptr{T}, (Int32,), len)

        clear!(ptr::Ptr{T}, len::Integer) where {T<:$TT} =
            ccall($clear_f, Cvoid, (Ref{T}, Cint), ptr, len)
    end
end

"""
    ArblibVector{T}(ptr, len)

Vector of length `len` containing elements of type `T` with memory
handled by libarb.
"""
mutable struct ArblibVector{T} <: AbstractVector{T}
    ptr::Ptr{T}
    len::Int32

    """
    ArblibVector(::Type{T}, len)

Allocate uninitialized vector of length `len` containing elements of type `T`.
"""
    ArblibVector(::Type{T}, len::Int) where T = new{T}(init(T, len), len)
end

const ArbVector{P} = ArblibVector{ArbReal{P}}
const AcbVector{P} = ArblibVector{ArbComplex{P}}

Base.eltype(v::ArblibVector{T}) where T = T
Base.length(v::ArblibVector) = v.len
Base.size(v::ArblibVector) = (v.len,)

function Base.getindex(v::ArblibVector{T}, i::Integer) where T
    i ∈ 1:v.len || throw(BoundsError(v, i))
    unsafe_load(v.ptr, i)
end

"""
    ArblibVector(v::AbstractVector{T})

Construct `ArblibVector` and fill with data from `v`.
"""
function ArblibVector(v::AbstractVector{T}) where T
    vv = ArblibVector(T, length(v))
    @inbounds for (i,e) in enumerate(v)
        unsafe_store!(vv.ptr, e, i)
    end
    vv
end

# ArblibVectors of ArbFloats are stored as ArbReals, since there is no
# arf_ptr available.
ArblibVector(v::AbstractVector{ArbFloat{P}}) where P =
    ArblibVector(ArbReal.(v))

"""
    Vector(v::ArblibVector{T})

Construct new `Vector` with elements copied from `v`.
"""
function Base.Vector(v::ArblibVector{T}) where T
    vv = Vector{T}(undef, v.len)
    @inbounds for i = 1:v.len
        vv[i] = unsafe_load(v.ptr, i)
    end
    vv
end

"""
    free!(v::ArblibVector{T})

Free the memory allocated for `v` and null the pointer and length to
prevent future accesses to released memory.
"""
function free!(v::ArblibVector{T}) where T
    clear!(v.ptr, v.len)
    v.ptr = C_NULL
    v.len = 0
end

"""
    take!(v::ArblibVector)

Copy the data of `v` to a [`Vector`](@ref) and release the memory.
"""
function Base.take!(v::ArblibVector)
    vv = Vector(v)
    free!(v)
    vv
end
