
#=
	typedef struct
	{
	    arb_ptr entries;
	    slong r;
	    slong c;
	    arb_ptr * rows;
	}
	arb_mat_struct;
=#

const ArbMatIdx0 = zero(Int32)

mutable struct ArbRealMat{P} <: AbstractMatrix{ArbReal{P}}
    eachcell::Ptr{ArbReal{P}}
    rowcount::Int
    colcount::Int
    eachrow::Ptr{Ptr{ArbReal{P}}}

    function ArbRealMat{P}(rowcount::Int, colcount::Int) where {P}
        z = new{P}() # z = new{P}(Ptr{ArbReal{P}}(0), 0, 0, Ptr{Ptr{ArbReal{P}}}(0))
        arb_mat_init(z, rowcount, colcount)
        finalizer(arb_mat_clear, z)
        return z
    end
end


@inline function arb_mat_clear(x::ArbRealMat{P}) where {P}
    ccall(@libarb(arb_mat_clear), Cvoid, (Ref{ArbRealMat}, ), x)
end

@inline function arb_mat_init(x::ArbRealMat{P}, rowcount::I, colcount::I) where {P, I<:Signed}
    ccall(@libarb(arb_mat_init), Cvoid, (Ref{ArbRealMat}, Cint, Cint),
                                         x, rowcount, colcount)
end

@inline function ArbRealMat(rowcount::I, colcount::I) where {I<:Signed}
	P = workingprecision(ArbReal)
	return ArbRealMat{P}(rowcount, colcount)
end

ArbRealMat{P}(x::ArbRealMat{P}) where {P} = x

@inline rowcount(x::ArbRealMat{P}) where {P} = getfield(x, :rowcount)
@inline colcount(x::ArbRealMat{P}) where {P} = getfield(x, :colcount)
@inline eachcell(x::ArbRealMat{P}) where {P} = getfield(x, :eachcell)
@inline eachrow(x::ArbRealMat{P}) where {P} = getfield(x, :eachrow)


@inline cellvalue(x::ArbRealMat{P}, row::Int, col::Int) where {P} = eachrow(x)[row][col-1]

Base.zeros(::Type{ArbReal{P}},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbRealMat{P}(rowcount, colcount)

Base.zeros(::Type{ArbReal},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbRealMat(rowcount, colcount)

function Base.reshape(x::Vector{ArbReal{P}}, rc::Tuple{Int, Int}) where {P}
   n = length(x)
   nrows, ncols = rc
   n === nrows*ncols || throw(ErrorException("length($n) != rows*cols($rc[1] * $rc[2])"))

    m = ArbRealMat{P}(nrows, ncols)
    m[:] = x

    return m
end

@inline Base.isempty(x::ArbRealMat{P}) where {P} =
    rowcount(x) === ArbMatIdx0 || colcount(x) === ArbMatIdx0

@inline Base.size(x::ArbRealMat{P}) where {P} = (rowcount(x), colcount(x))

@inline function issquare(x::ArbRealMat{P}) where {P}
	return rowcount(x) === colcount(x)
end


@inline function Base.getindex(x::ArbRealMat{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return getindex(x, rowidx, colidx)
end

@inline function Base.getindex(x::ArbRealMat{P}, rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return getindexˌ(x, rowidx, colidx)
end

@inline function getindexˌ(x::ArbRealMat{P}, rowidx::Int, colidx::Int) where {P}
    z = ArbReal{P}()
    GC.@preserve x begin
        v = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal},
                  (Ref{ArbRealMat}, Int, Int), x, rowidx - 1, colidx - 1)
        ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ptr{ArbReal}), z, v)
    end
    return z
end


function Base.setindex!(x::ArbRealMat{P}, z::ArbReal{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return setindex!(x, z, rowidx, colidx)
end

function Base.setindex!(x::ArbRealMat{P}, z::ArbReal{P},
                        rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return setindexˌ!(x, z, rowidx, colidx)
end

@inline function setindexˌ!(x::ArbRealMat{P}, z::ArbReal{P},
                            rowidx::Int, colidx::Int) where {P}
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal}, 
        	        (Ref{ArbRealMat}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, z)
    end
    return z
end



#=
    Matrix{::ArbT{ArbPrecision}}(rowcount, colcount)

=#

Base.Matrix{ArbReal{P}}(undef::UndefInitializer, r::I, c::I) where {P, I<:Integer} = ArbRealMatrix{P}(m, n)	
Base.zeros(::Type{ArbReal{P}}, r::I, c::I) where {P, I<:Integer} = ArbRealMatrix{P}(m,n)



# operators over a matrix


function transpose(src::ArbRealMat{P}) where {P}    
    if issquare(src)
    	dest = copy(src)
    else
    	dest = ArbRealMat{P}(colcount(src), rowcount(src))
    end

    ccall(@libarb(arb_mat_transpose), Cvoid,
          (Ref{ArbRealMat}, Ref{ArbRealMat}), dest, src)
    return dest
end

function transpose!(x::ArbRealMat{P}) where {P}
    checksquare(x)
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMat}, Ref{ArbRealMat}), x, x)
    return x
end

function transpose!(dest::ArbRealMat{P}, src::ArbRealMat{P}) where {P}
    checkcompat(dest, src)
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMat}, Ref{ArbRealMat}), dest, src)
    return dest
end



function norm(m::ArbRealMat{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_frobenius_norm), Cvoid,
    	  (Ref{ArbReal}, Ref{ArbRealMat}, Cint), z, m, P)
    return z
end


function tr(x::ArbRealMat{P}) where {P}
    checksquare(x)
    return trˌ(x)
end

function trˌ(x::ArbRealMat{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_trace), Cvoid, 
    	  (Ref{ArbReal}, Ref{ArbRealMat}, Cint), z, x, P)
    return z
end


function det(x::ArbRealMat{P}) where {P}
    checksquare(x)
    return detˌ
end

function detˌ(x::ArbRealMat{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_det), Cvoid,
          (Ref{ArbReal}, Ref{ArbRealMat}, Cint), z, x, P)
    return z
end

"""
    determinant(<:ArbMatrix)


Computes the determinant using a more stable, albeit slower
algorithm than that used for `det`.
"""
function determinant(x::ArbRealMat{P}) where {P}
    checksquare(x)
    P2 = P + P>>1
    z = ArbReal{P2}()
    ccall(@libarb(arb_mat_det_precond), Cvoid,
          (Ref{ArbReal}, Ref{ArbRealMat}, Cint), z, x, P2)    
    return z
end


function inv(x::ArbRealMat{P}) where {P}
    checksquare(x)
    return invˌ(x)
end

function invˌ(x::ArbRealMat{P}) where {P}
    z = ArbRealMat{P}(rowcount(x), colcount(x))
    ok = ccall(@libarb(arb_mat_inv), Cint, (Ref{ArbRealMat}, Ref{ArbRealMat}, Cint), z, x, P)
    ok !== Cint(0) && return z
    throw(ErrorException("cannot invert $(x)"))
end

"""
    inverse(ArbMatrix)

A version of `inv` with greater accuracy.
"""
function inverse(x::ArbRealMat{P}) where {P}
    checksquare(x)
    P2 = P + P>>1
    z = ArbRealMat{P2}(rowcount(x), colcount(x))
    ok = ccall(@libarb(arb_mat_inv), Cint, (Ref{ArbRealMat}, Ref{ArbRealMat}, Cint), z, x, P)
    ok !== Cint(0) && return z
    throw(ErrorException("cannot invert $(x)"))
end


# matrix multiply

function Base.:(*)(x::ArbRealMat{P}, y::ArbRealMat{P}) where {P}
    checkmulable(x, y)
    return matmulˌ(x, y)
end

function matmulˌ(x::ArbRealMat{P}, y::ArbRealMat{P}) where {P}
    z = ArbRealMat{P}(rowcount(x), colcount(y))
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbRealMat}, Ref{ArbRealMat}, Ref{ArbRealMat}, Cint), z, x, y, P)
    return z
end



# checks for validity

@inline function checkbounds(x::ArbRealMat{P}, r::Int, c::Int) where {P}
    withinbounds = 0 < r <= rowcount(x) && 0 < c <= colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($r, $c) not in 1:$(rowcount(x)), 1:$(colcount(x))"))
end

@inline function checkbounds(x::ArbRealMat{P}, linear_rc::Int) where {P}
    withinbounds = 0 < linear_rc <= rowcount(x) * colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($rc) not in 1:$(rowcount(x) * colcount(x))"))
end

@inline function checksquare(x::ArbRealMat{P}) where {P}
    issquare(x) && return nothing
    throw(DomainError("matrix is not square ($rowcount(x), $colcount(x))"))
end

@inline function checkcompat(x::ArbRealMat{P}, y::ArbRealMat{P}) where {P}
    compat = (rowcount(x) === colcount(y) && rowcount(y) === colcount(x))
    compat && return nothing
    throw(DomainError("incompatible matrices: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end

@inline function checkmulable(x::ArbRealMat{P}, y::ArbRealMat{P}) where {P}
    mulable = colcount(x) === rowcount(y)
    mulable && return nothing
    throw(ErrorException("Dimension Mismatach: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end
