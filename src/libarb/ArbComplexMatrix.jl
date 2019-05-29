
const ArbMatIdx0 = zero(Int32)

mutable struct ArbComplexMatrix{P} <: AbstractArbMatrix{P, ArbComplex}
    eachcell::Ptr{ArbComplex{P}}
    rowcount::Int
    colcount::Int
    eachrow::Ptr{Ptr{ArbComplex{P}}}

    function ArbComplexMatrix{P}(rowcount::Int, colcount::Int) where {P}
        z = new{P}() # z = new{P}(Ptr{ArbComplex{P}}(0), 0, 0, Ptr{Ptr{ArbComplex{P}}}(0))
        acb_mat_init(z, rowcount, colcount)
        finalizer(acb_mat_clear, z)
        return z
    end
end

#ArbComplexMatrix(x::ArbComplexMatrix) = x
ArbComplexMatrix(x::ArbComplexMatrix{P}) where {P} = x
ArbComplexMatrix{P}(x::ArbComplexMatrix{P}) where {P} = x


@inline function acb_mat_clear(x::ArbComplexMatrix{P}) where {P}
    ccall(@libarb(acb_mat_clear), Cvoid, (Ref{ArbComplexMatrix}, ), x)
end

@inline function acb_mat_init(x::ArbComplexMatrix{P}, rowcount::I, colcount::I) where {P, I<:Signed}
    ccall(@libarb(acb_mat_init), Cvoid, (Ref{ArbComplexMatrix}, Cint, Cint),
                                         x, rowcount, colcount)
end

@inline function ArbComplexMatrix(nrows::Int, ncols::Int)
    P = workingprecision(ArbComplex)
	return ArbComplexMatrix{P}(nrows, ncols)
end

function ArbComplexMatrix(fpm::Array{ArbComplex, 2})
    P = workingprecision(ArbComplex)
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbComplexMatrix(fpm::Array{ArbComplex{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbComplexMatrix{P}(fpm::Array{ArbComplex{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = fpm[r,c]
	    end
	end
	return arm
end

function ArbComplexMatrix{P}(fpm::Array{ArbComplex,2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbComplex{P}(fpm[r,c])
	    end
	end
	return arm
end


function ArbComplexMatrix(fpm::Array{ArbFloat{P},2}) where {P}
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbComplex{P}(fpm[r,c])
	    end
	end
	return arm
end

function ArbComplexMatrix(fpm::Array{F,2}) where {F<:Union{Integer,AbstractFloat}}
    P = workingprecision(ArbComplex)
    nrows, ncols = size(fpm)
    arm = ArbComplexMatrix{P}(nrows, ncols)
    for r = 1:nrows
		for c = 1:ncols
			arm[r,c] = ArbComplex{P}(fpm[r,c])
	    end
	end
	return arm
end

function Matrix(arm::ArbComplexMatrix{P}) where {P}
    nrows, ncols = arm.rowcount, arm.colcount
    m = zeros(ArbComplex{P}, nrows, ncols)
    for r = 1:nrows
        for c = 1:ncols
            m[r,c] = arm[r,c]
        end
    end
    return m
end

Matrix(x::Array{ArbComplex, 2}) = x
Matrix(x::Array{ArbComplex{P}, 2}) where {P} = x


@inline rowcount(x::ArbComplexMatrix{P}) where {P} = getfield(x, :rowcount)
@inline colcount(x::ArbComplexMatrix{P}) where {P} = getfield(x, :colcount)
@inline eachcell(x::ArbComplexMatrix{P}) where {P} = getfield(x, :eachcell)
@inline eachrow(x::ArbComplexMatrix{P}) where {P} = getfield(x, :eachrow)

@inline cellvalue(x::ArbComplexMatrix{P}, row::Int, col::Int) where {P} = eachrow(x)[row][col-1]

arbzeros(::Type{ArbComplex{P}},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbComplexMatrix{P}(rowcount, colcount)

arbzeros(::Type{ArbComplex},rowcount::SI, colcount::SI) where {P, SI<:Signed} =
    ArbComplexMatrix(rowcount, colcount)

@inline Base.isempty(x::ArbComplexMatrix{P}) where {P} =
    rowcount(x) === ArbMatIdx0 || colcount(x) === ArbMatIdx0

@inline Base.size(x::ArbComplexMatrix{P}) where {P} = (rowcount(x), colcount(x))

@inline function issquare(x::ArbComplexMatrix{P}) where {P}
	return rowcount(x) === colcount(x)
end

@inline function Base.getindex(x::ArbComplexMatrix{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return getindex(x, rowidx, colidx)
end

@inline function Base.getindex(x::ArbComplexMatrix{P}, rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return getindexˌ(x, rowidx, colidx)
end

@inline function getindexˌ(x::ArbComplexMatrix{P}, rowidx::Int, colidx::Int) where {P}
    z = ArbComplex{P}()
    GC.@preserve x begin
        v = ccall(@libarb(acb_mat_entry_ptr), Ptr{ArbComplex},
                  (Ref{ArbComplexMatrix}, Int, Int), x, rowidx - 1, colidx - 1)
        ccall(@libarb(acb_set), Cvoid, (Ref{ArbComplex}, Ptr{ArbComplex}), z, v)
    end
    return z
end


function Base.setindex!(x::ArbComplexMatrix{P}, z::ArbComplex{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(rowcount(x), linearidx)
    return setindex!(x, z, rowidx, colidx)
end

Base.setindex!(x::ArbComplexMatrix{P1}, z::ArbComplex{P2}, linearidx::Int) where {P1,P2} =
    setindex!(x, ArbComplex{P1}(z), linearidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::ArbFloat{P}, linearidx::Int) where {P} =
    setindex!(x, ArbComplex{P}(z), linearidx)

Base.setindex!(x::ArbComplexMatrix{P1}, z::ArbFloat{P2}, linearidx::Int) where {P1,P2} =
    setindex!(x, ArbComplex{P1}(ArbFloat{P1}(z)), linearidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::F, linearidx::Int) where {P, F<:Union{Signed,IEEEFloat}} =
    setindex!(x, ArbComplex{P}(z), linearidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::R, linearidx::Int) where {P, R<:Real} =
    setindex!(x, ArbComplex{P}(BigFloat(z)), linearidx)


function Base.setindex!(x::ArbComplexMatrix{P}, z::ArbComplex{P},
                        rowidx::Int, colidx::Int) where {P}
    checkbounds(x, rowidx, colidx)
    return setindexˌ!(x, z, rowidx, colidx)
end

Base.setindex!(x::ArbComplexMatrix{P1}, z::ArbComplex{P2}, rowidx::Int, colidx::Int) where {P1,P2} =
    setindex!(x, ArbComplex{P1}(z), rowidx, colidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::ArbFloat{P}, rowidx::Int, colidx::Int) where {P} =
    setindex!(x, ArbComplex{P}(z), rowidx, colidx)

Base.setindex!(x::ArbComplexMatrix{P1}, z::ArbFloat{P2}, rowidx::Int, colidx::Int) where {P1,P2} =
    setindex!(x, ArbComplex{P1}(ArbFloat{P1}(z)), rowidx, colidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::F, rowidx::Int, colidx::Int) where {P, F<:Union{Signed,IEEEFloat}} =
    setindex!(x, ArbComplex{P}(z), rowidx, colidx)

Base.setindex!(x::ArbComplexMatrix{P}, z::R, rowidx::Int, colidx::Int) where {P, R<:Real} =
    setindex!(x, ArbComplex{P}(BigFloat(z)), rowidx, colidx)


@inline function setindexˌ!(x::ArbComplexMatrix{P}, z::ArbComplex{P},
                            rowidx::Int, colidx::Int) where {P}
    GC.@preserve x begin
        ptr = ccall(@libarb(acb_mat_entry_ptr), Ptr{ArbComplex},
        	        (Ref{ArbComplexMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(acb_set), Cvoid, (Ptr{ArbComplex}, Ref{ArbComplex}), ptr, z)
    end
    return z
end


# matrix multiply

function mul!(z::ArbComplexMatrix{P}, x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    ccall(@libarb(acb_mat_mul), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, y, P)
    return nothing
end

function matmul(x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    z = ArbComplexMatrix{P}(rowcount(x), colcount(y))
    ccall(@libarb(acb_mat_mul), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, y, P)
    return Matrix(z)
end	

function matmul(x::Array{ArbComplex, 2}, y::Array{ArbComplex, 2})
    xx = ArbComplexMatrix(x)
    yy = ArbComplexMatrix(x)
    xy = *(xx, yy)
    return Matrix(xy)
end

function matmul(x::Array{ArbComplex{P}, 2}, y::Array{ArbComplex{P},2}) where {P}
    xx = ArbComplexMatrix{P}(x)
    yy = ArbComplexMatrix{P}(x)
    xy = *(xx, yy)
    return Matrix(xy)
end

function Base.:(*)(x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    checkmulable(x, y)
    return matmul(x, y)
end

@inline function Base.:(*)(x::Array{ArbComplex{P},2}, y::Array{ArbComplex{P},2}) where {P}
    checkmulable(x, y)
    return matmul(ArbComplexMatrix{P}(x), ArbComplexMatrix{P}(y))
end

@inline function Base.:(*)(x::Array{ArbComplex,2}, y::Array{ArbComplex,2})
    checkmulable(x, y)
    P = workingprecision(ArbComplex)	
    return matmul(ArbComplexMatrix{P}(x), ArbComplexMatrix{P}(y))
end

# checks for validity

@inline function checkbounds(x::ArbComplexMatrix{P}, r::Int, c::Int) where {P}
    withinbounds = 0 < r <= rowcount(x) && 0 < c <= colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($r, $c) not in 1:$(rowcount(x)), 1:$(colcount(x))"))
end

@inline function checkbounds(x::ArbComplexMatrix{P}, linear_rc::Int) where {P}
    withinbounds = 0 < linear_rc <= rowcount(x) * colcount(x)
    withinbounds && return nothing
    throw(BoundsError("($rc) not in 1:$(rowcount(x) * colcount(x))"))
end

@inline function checksquare(x::ArbComplexMatrix{P}) where {P}
    issquare(x) && return nothing
    throw(DomainError("matrix is not square ($rowcount(x), $colcount(x))"))
end

@inline function checkcompat(x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    compat = (rowcount(x) === colcount(y) && rowcount(y) === colcount(x))
    compat && return nothing
    throw(DomainError("incompatible matrices: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end

@inline function checkmulable(x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    mulable = colcount(x) === rowcount(y)
    mulable && return nothing
    throw(ErrorException("Dimension Mismatach: ($rowcount(x), $colcount(x)), ($rowcount(y), $colcount(y))"))
end

#=
(::Type{Array{ArbComplex{P},2}})(::UndefInitializer, nrows::Int, ncols::Int) where {P} =
ArbComplexMatrix{P}(nrows, ncols)
Base.Matrix{ArbComplex{P}}(undef::UndefInitializer, r::I, c::I) where {P, I<:Integer} = ArbComplexMatrix{P}(m, n)
Base.zeros(::Type{ArbComplex{P}}, r::I, c::I) where {P, I<:Integer} = ArbComplexMatrix{P}(m,n)
=#


# operators over a matrix

function conj(src::ArbComplexMatrix{P}) where {P}
    dest = ArbComplexMatrix(rowcount(src), colcount(src))
    ccall(@libarb(acb_mat_conjugate), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), dest, src)
	return dest
end

function conj(src::Array{ArbComplex{P},2}) where {P}
    return conj(ArbComplexMatrix{P}(src))
end


function transpose(src::ArbComplexMatrix{P}) where {P}
    if issquare(src)
    	dest = copy(src)
    else
    	dest = ArbComplexMatrix{P}(colcount(src), rowcount(src))
    end

    ccall(@libarb(acb_mat_transpose), Cvoid,
          (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), dest, src)
    return dest
end


function transpose(src::Array{ArbComplex{P}, 2}) where {P}
    result = transpose(ArbComplexMatrix{P}(src))
    return Matrix(result)
end

function transpose!(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    y = copy(x)
    ccall(@libarb(acb_mat_transpose), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), x, y)
    return x
end

function transpose!(src::Array{ArbComplex{P}, 2}) where {P}
    result = transpose(ArbComplexMatrix{P}(src))
    src[:] = Matrix(result)[:]
    return src
end

function transpose!(dest::ArbComplexMatrix{P}, src::ArbComplexMatrix{P}) where {P}
    checkcompat(dest, src)
    ccall(@libarb(acb_mat_transpose), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), dest, src)
    return dest
end

function transpose!(dest::Array{ArbComplex{P},2}, src::Array{ArbComplex{P},2}) where {P}
    result = transpose!(ArbComplexMatrix{P}(dest), ArbComplexMatrix{P}(src))
    dest[:] = Matrix(result)[:]
    return(dest)
end

function norm(m::ArbComplexMatrix{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_frobenius_norm), Cvoid,
    	  (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, m, P)
    return z
end

function norm(m::Array{ArbComplex{P},2}) where {P}
    return Matrix(norm(ArbComplexMatrix{P}(m)))
end

function tr(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    return trˌ(x)
end

function trˌ(x::ArbComplexMatrix{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_trace), Cvoid,
    	  (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    return z
end

function tr(m::Array{ArbComplex{P},2}) where {P}
    return Matrix(tr(ArbComplexMatrix{P}(m)))
end

function det(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    return detˌ(x)
end

function detˌ(x::ArbComplexMatrix{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_det), Cvoid,
          (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    return z
end

function det(m::Array{ArbComplex{P},2}) where {P}
    return Matrix(det(ArbComplexMatrix{P}(m)))
end

"""
    determinant(<:ArbMatrix)
Computes the determinant using a more stable, albeit slower
algorithm than that used for `det`.
"""
function determinant(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    P2 = P + P>>1
    z = ArbComplex{P2}()
    ccall(@libarb(acb_mat_det_precond), Cvoid,
          (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, x, P2)
    return ArbComplex{P}(z)
end

determinant(x::Array{ArbComplex{P},2}) where {P} = Matrix(determinant(ArbComplexMatrix{P}(x)))

function inv(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    return invˌ(x)
end

function invˌ(x::ArbComplexMatrix{P}) where {P}
    z = ArbComplexMatrix{P}(rowcount(x), colcount(x))
    ok = ccall(@libarb(acb_mat_inv), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    ok !== Cint(0) && return z
    throw(ErrorException("cannot invert $(x)"))
end

inv(x::Array{ArbComplex{P},2}) where {P} = Matrix(inv(ArbComplexMatrix{P}(x)))

"""
    inverse(ArbMatrix)WARNING: Method definition transpose(ArbNumerics.ArbRealMatrix{P} where P) in module ArbNumerics at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbRealMatrix.jl:326 overwritten at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbRealMatrix.jl:338.
WARNING: Method definition rowcount(Array{T, 2}) where {T} in module ArbNumerics at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbRealMatrix.jl:138 overwritten at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbComplexMatrix.jl:127.
WARNING: Method definition colcount(Array{T, 2}) where {T} in module ArbNumerics at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbRealMatrix.jl:139 overwritten at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbComplexMatrix.jl:128.
WARNING: Method definition checkmulable(Array{T, 2}, Array{T, 2}) where {T} in module ArbNumerics at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbRealMatrix.jl:308 overwritten at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbComplexMatrix.jl:297.
WARNING: Method definition transpose(ArbNumerics.ArbComplexMatrix{P} where P) in module ArbNumerics at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbComplexMatrix.jl:314 overwritten at /home/jas/.julia/packages/ArbNumerics/HCeSA/src/libarb/ArbComplexMatrix.jl:326.

A version of `inv` with greater accuracy.
"""
function inverse(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)
    P2 = P + P>>1
    z = ArbComplexMatrix{P2}(rowcount(x), colcount(x))
    ok = ccall(@libarb(acb_mat_inv), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, P2)
    ok !== Cint(0) && return z
    throw(ErrorException("cannot invert $(x)"))
end

inverse(x::Array{ArbComplex{P},2}) where {P} = Matrix(inverse(ArbComplexMatrix{P}(x)))

# matrix functions: exp

function exp(x::Array{ArbComplex, 2})
    checksquare(x)
    P = workingprecision(ArbComplex)
    y = ArbComplexMatrix(x)
    z = ArbComplexMatrix{P}(rowcount(x), colcount(x))
    ccall(@libarb(acb_mat_exp), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, y, P)
    return Matrix(z)
end

function exp(x::Array{ArbComplex{P}, 2}) where {P}
    checksquare(x)	
    y = ArbComplexMatrix(x)
    z = ArbComplexMatrix{P}(rowcount(x), colcount(x))
    ccall(@libarb(acb_mat_exp), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, y, P)
    return Matrix(z)
end

function exp(x::ArbComplexMatrix{P}) where {P}
    checksquare(x)	
    z = ArbComplexMatrix{P}(rowcount(x), colcount(x))
    ccall(@libarb(acb_mat_exp), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    return Matrix(z)
end

## eigenvalues and eigenvectors

# sort complex values
complex_lt = (a,b)->(real(a) < real(b)) || (real(a) == real(b) && imag(a) < imag(b))

#=
int acb_mat_approx_eig_qr(acb_ptr E, acb_mat_t L, acb_mat_t R, const acb_mat_t A, const mag_t tol, slong maxiter, slong prec)

            acb_mat_t C, R;
            acb_ptr E;

            acb_mat_init(R, n, n);
            acb_mat_init(C, n, n);
            E = _acb_vec_init(n);

            acb_mat_set_arb_mat(C, A);
            acb_mat_approx_eig_qr(E, NULL, R, C, NULL, 0, prec)

Computes floating-point approximations of all the n eigenvalues (and optionally eigenvectors) of the given n by n matrix A.
The approximations of the eigenvalues are written to the vector E, in no particular order. 
If L is not NULL, approximations of the corresponding left eigenvectors are written to the rows of L. 
If R is not NULL, approximations of the corresponding right eigenvectors are written to the columns of R.

The parameters tol and maxiter can be used to control the target numerical error and the maximum number of iterations allowed
before giving up. Passing NULL and 0 respectively results in default values being used.

Uses the implicitly shifted QR algorithm with reduction to Hessenberg form. 
No guarantees are made about the accuracy of the output. 
A nonzero return value indicates that the QR iteration converged numerically, 
but this is only a heuristic termination test and does not imply any statement whatsoever about error bounds. 

The output may also be accurate even if this function returns zero.
=#
#=

function LinearAlgebra.eigvals(m::ArbComplexMatrix{P}) where {P}
    checksquare(m)
    n = rowcount(m)
    eigvalues = ccall(@libarb(_acb_vec_init), Ptr{ArbComplex}, (Cint,), n)
    eigvectors = ArbComplexMatrix(rowcount(m), colcount(m))	
    eigvectors2 = copy(m)	
    tol = Base.C_NULL
    maxiter = 0
    result = ccall(@libarb(acb_mat_approx_eig_qr), Cint, 
		  (Ptr{ArbComplex}, Ptr{Nothing}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ptr{Nothing}, Clong, Clong),
		  eigvalues, Base.C_NULL, eigvectors, eigvectors2, Base.C_NULL, maxiter, P)
    eigvalues = sort(eigvalues, lt=complex_lt)
    return eigvalues
end

function LinearAlgebra.eigvecs(m::ArbComplexMatrix{P}) where {P}
    checksquare(m)
    eigvalues = zeros(ArbComplex, rowcount(m))
    eigvectors = ArbComplexMatrix(rowcount(m), colcount(m))	
    tol = Base.C_NULL
    maxiter = 0
    result = ccall(@libarb(acb_mat_approx_eig_qr), Cint, 
		  (Ref{Vector{ArbComplex}}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ptr{Nothing}, Clong, Clong),
		  eigvalues, Base.C_NULL, eigvectors, m, tol, maxiter, P)
    return eigvectors			
end

function LinearAlgebra.eigen(m::ArbComplexMatrix{P}) where {P}
    checksquare(m)
    eigvalues = zeros(ArbComplex, rowcount(m))
    eigvectors = ArbComplexMatrix(rowcount(m), colcount(m))	
    tol = Base.C_NULL
    maxiter = 0
    result = ccall(@libarb(acb_mat_approx_eig_qr), Cint, 
		  (Ref{Vector{ArbComplex}}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ptr{Nothing}, Clong, Clong),
		  eigvalues, Base.C_NULL, eigvectors, m, tol, maxiter, P)
    eigvalues = sort(eigvalues, lt=complex_lt)
    return eigvalues, eigvectors			
end

LinearAlgebra.eigvals(m::Array{ArbComplex{P},2}) where {P} = eigvals(ArbComplexMatrix(m))
LinearAlgebra.eigvecs(m::Array{ArbComplex{P},2}) where {P} = eigvecs(ArbComplexMatrix(m))
LinearAlgebra.eigen(m::Array{ArbComplex{P},2}) where {P} = eigs(ArbComplexMatrix(m))
=#
	
