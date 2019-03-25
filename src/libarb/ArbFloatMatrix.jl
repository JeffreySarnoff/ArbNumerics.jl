
# heavily influenced by and mostly of the Arb C interface used in Nemo.jl
#=
    There is no direct support for matricies of ArbFloats.
    We partially overload ArbRealMatrix to zero the radii.
    And provide conversion from Array{ArbFloat{P},2}.
=#


mutable struct ArbFloatMatrix{P} <: AbstractArbMatrix{P, ArbFloat}
    eachcell::Ptr{ArbReal{P}}
    rowcount::Int
    colcount::Int
    eachrow::Ptr{Ptr{ArbReal{P}}}

    function ArbFloatMatrix{P}(rowcount::Int, colcount::Int) where {P}
        z = new{P}() # z = new{P}(Ptr{ArbReal{P}}(0), 0, 0, Ptr{Ptr{ArbReal{P}}}(0))
        arb_mat_init(z, rowcount, colcount)
        finalizer(arb_mat_clear, z)
        return z
    end
end

ArbFloatMatrix(x::ArbFloatMatrix{P}) where {P} = x
ArbFloatMatrix{P}(x::ArbFloatMatrix{P}) where {P} = x


@inline function ArbFloatMatrix(nrows::Int, ncols::Int)
    P = workingprecision(ArbFloat)
	return ArbFloatMatrix{P}(nrows, ncols)
end

function ArbFloatMatrix(fpm::Array{ArbFloat, 2})
    P = workingprecision(ArbFloat)
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbFloatMatrix(fpm::Array{ArbFloat{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbFloatMatrix{P}(fpm::Array{ArbFloat{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbFloatMatrix{P}(fpm::Array{ArbFloat,2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbFloat{P}(fpm[r,c])
	    end
	end
	return arm
end


function ArbFloatMatrix(fpm::Array{ArbFloat{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbFloat{P}(fpm[r,c])
	    end
	end
	return arm
end

function ArbFloatMatrix(fpm::Array{F,2}) where {F<:Union{Integer,AbstractFloat}}
    P = workingprecision(ArbFloat)
    nrows, ncols = size(fpm)
    arm = ArbFloatMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbFloat{P}(fpm[r,c])
	    end
	end
	return arm
end

function Matrix(arm::ArbFloatMatrix{P}) where {P}
    nrows, ncols = arm.rowcount, arm.colcount
    m = zeros(ArbFloat{P}, nrows, ncols)
    for r = 1:nrows
        for c = 1:ncols
            m[r,c] = arm[r,c]
        end
    end
    return m
end

@inline rowcount(x::ArbFloatMatrix{P}) where {P} = getfield(x, :rowcount)
@inline colcount(x::ArbFloatMatrix{P}) where {P} = getfield(x, :colcount)
@inline eachcell(x::ArbFloatMatrix{P}) where {P} = getfield(x, :eachcell)
@inline eachrow(x::ArbFloatMatrix{P}) where {P} = getfield(x, :eachrow)

@inline rowcount(x::Array{T,2}) where {T} = size(x)[1]
@inline colcount(x::Array{T,2}) where {T} = size(x)[2]

@inline cellvalue(x::ArbFloatMatrix{P}, row::Int, col::Int) where {P} = eachrow(x)[row][col-1]

arbzeros(::Type{ArbFloat{P}},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbFloatMatrix{P}(rowcount, colcount)

arbzeros(::Type{ArbFloat},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbFloatMatrix(rowcount, colcount)

@inline Base.isempty(x::ArbFloatMatrix{P}) where {P} =
    rowcount(x) === ArbMatIdx0 || colcount(x) === ArbMatIdx0

@inline Base.size(x::ArbFloatMatrix{P}) where {P} = (rowcount(x), colcount(x))

@inline function issquare(x::ArbFloatMatrix{P}) where {P}
	return rowcount(x) === colcount(x)
end

@inline function Base.getindex(x::ArbFloatMatrix{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return getindex(x, rowidx, colidx)
end

@inline function Base.getindex(x::ArbFloatMatrix{P}, rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return getindexˌ(x, rowidx, colidx)
end

@inline function getindexˌ(x::ArbFloatMatrix{P}, rowidx::Int, colidx::Int) where {P}
    z = ArbFloat{P}()
    GC.@preserve x begin
        v = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbFloat},
                  (Ref{ArbFloatMatrix}, Int, Int), x, rowidx - 1, colidx - 1)
        ccall(@libarb(arb_set), Cvoid, (Ref{ArbFloat}, Ptr{ArbFloat}), z, v)
    end
    return z
end


function Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return setindex!(x, z, rowidx, colidx)
end

Base.setindex!(x::ArbFloatMatrix{P1}, z::ArbFloat{P2}, linearidx::Int) where {P1,P2} =
    setindex!(x, ArbFloat{P1}(z), linearidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P}, linearidx::Int) where {P} =
    setindex!(x, ArbFloat{P}(z), linearidx)

Base.setindex!(x::ArbFloatMatrix{P1}, z::ArbFloat{P2}, linearidx::Int) where {P1,P2} =
    setindex!(x, ArbFloat{P1}(ArbFloat{P1}(z)), linearidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::F, linearidx::Int) where {P, F<:Union{Signed,IEEEFloat}} =
    setindex!(x, ArbFloat{P}(z), linearidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::R, linearidx::Int) where {P, R<:Real} =
    setindex!(x, ArbFloat{P}(BigFloat(z)), linearidx)


function Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P},
                        rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return setindexˌ!(x, z, rowidx, colidx)
end

Base.setindex!(x::ArbFloatMatrix{P1}, z::ArbFloat{P2}, rowidx::Int, colidx::Int) where {P1,P2} =
    setindex!(x, ArbFloat{P1}(z), rowidx, colidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P}, rowidx::Int, colidx::Int) where {P} =
    setindex!(x, ArbFloat{P}(z), rowidx, colidx)

Base.setindex!(x::ArbFloatMatrix{P1}, z::ArbFloat{P2}, rowidx::Int, colidx::Int) where {P1,P2} =
    setindex!(x, ArbFloat{P1}(ArbFloat{P1}(z)), rowidx, colidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::F, rowidx::Int, colidx::Int) where {P, F<:Union{Signed,IEEEFloat}} =
    setindex!(x, ArbFloat{P}(z), rowidx, colidx)

Base.setindex!(x::ArbFloatMatrix{P}, z::R, rowidx::Int, colidx::Int) where {P, R<:Real} =
    setindex!(x, ArbFloat{P}(BigFloat(z)), rowidx, colidx)


@inline function setindexˌ!(x::ArbFloatMatrix{P}, z::ArbFloat{P},
                            rowidx::Int, colidx::Int) where {P}
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbFloat},
        	        (Ref{ArbFloatMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbFloat}, Ref{ArbFloat}), ptr, z)
    end
    return z
end


# matrix multiply

function mul!(z::ArbFloatMatrix{P}, x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Cint), z, x, y, P)
    return nothing
end

function rmul!(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Cint), x, x, y, P)
    return nothing
end

function lmul!(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Cint), y, x, y, P)
    return nothing
end

function matmul(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    z = ArbFloatMatrix{P}(rowcount(x), colcount(y))
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Ref{ArbFloatMatrix}, Cint), z, x, y, P)
    return Matrix(z)
end	

function matmul(x::Array{ArbFloat, 2}, y::Array{ArbFloat, 2})
    xx = ArbFloatMatrix(x)
    yy = ArbFloatMatrix(x)
    xy = *(xx, yy)
    return Matrix(xy)
end

function matmul(x::Array{ArbFloat{P}, 2}, y::Array{ArbFloat{P},2}) where {P}
    xx = ArbFloatMatrix{P}(x)
    yy = ArbFloatMatrix{P}(x)
    xy = *(xx, yy)
    return Matrix(xy)
end

function Base.:(*)(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    checkmulable(x, y)
    return matmul(x, y)
end

@inline function Base.:(*)(x::Array{ArbFloat{P},2}, y::Array{ArbFloat{P},2}) where {P}
    checkmulable(x, y)
    return matmul(ArbFloatMatrix{P}(x). ArbFloatMatrix{P}(y))
end

@inline function Base.:(*)(x::Array{ArbFloat,2}, y::Array{ArbFloat,2})
    checkmulable(x, y)
    P = workingprecision(ArbFloat)	
    return matmul(ArbFloatMatrix{P}(x), ArbFloatMatrix{P}(y))
end

# checks for validity

@inline function checkbounds(x::ArbFloatMatrix{P}, r::Int, c::Int) where {P}
    withinbounds = 0 < r <= rowcount(x) && 0 < c <= colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($r, $c) not in 1:$(rowcount(x)), 1:$(colcount(x))"))
end

@inline function checkbounds(x::ArbFloatMatrix{P}, linear_rc::Int) where {P}
    withinbounds = 0 < linear_rc <= rowcount(x) * colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($rc) not in 1:$(rowcount(x) * colcount(x))"))
end

@inline function checksquare(x::ArbFloatMatrix{P}) where {P}
    issquare(x) && return nothing
    throw(DomainError("matrix is not square ($rowcount(x), $colcount(x))"))
end

@inline function checkcompat(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    compat = (rowcount(x) === colcount(y) && rowcount(y) === colcount(x))
    compat && return nothing
    throw(DomainError("incompatible matrices: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end

@inline function checkmulable(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    mulable = colcount(x) === rowcount(y)
    mulable && return nothing
    throw(ErrorException("Dimension Mismatach: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end

@inline function checkmulable(x::Array{T,2}, y::Array{T,2}) where {T}
    mulable = colcount(x) === rowcount(y)
    mulable && return nothing
    throw(ErrorException("Dimension Mismatach: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end
