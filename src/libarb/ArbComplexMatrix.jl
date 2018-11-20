# heavily influenced by and mostly of the Arb C interface used in Nemo.jl
        
#=
typedef struct
{
    acb_ptr entries;
    slong r;
    slong c;
    acb_ptr * rows;
}
acb_mat_struct;
=#

            
mutable struct ArbComplexMatrix{P} <: AbstractArbMatrix{P, ArbComplex}
    entries::Ptr{ArbComplex{P}}
    nrows::Int
    ncols::Int
    rows::Ptr{Ptr{ArbComplex{P}}}

   function ArbComplexMatrix{P}(nrows::Int, ncols::Int) where {P}
       nrows, ncols = ncols, nrows
       z = new{P}() # z = new{P}(Ptr{ArbComplex{P}}(0), 0, 0, Ptr{Ptr{ArbComplex{P}}}(0))
       acb_mat_init(z, nrows, ncols)
       finalizer(acb_mat_clear, z)
       return z
   end

   function ArbComplexMatrix(nrows::Int, ncols::Int)
        P = workingprecision(ArbComplex)
        return ArbComplexMatrix{P}(nrows, ncols)
   end
end

Base.isempty(x::ArbComplexMatrix{P}) where {P} = x.nrows == 0 || x.ncols == 0

function acb_mat_clear(x::ArbComplexMatrix{P}) where {P}
    ccall(@libarb(acb_mat_clear), Cvoid, (Ref{ArbComplexMatrix}, ), x)
    return nothing
end

function acb_mat_init(x::ArbComplexMatrix{P}, nrows::Int, ncols::Int) where {P}
    ccall(@libarb(acb_mat_init), Cvoid, (Ref{ArbComplexMatrix}, Cint, Cint), x, nrows, ncols)
    return nothing
end

Base.size(x::ArbComplexMatrix{P}) where {P} = (x.ncols, x.nrows)

@inline function checkbounds(x::ArbComplexMatrix{P}, r::Int, c::Int) where {P}
    ok = 0 < r <= x.nrows && 0 < c <= x.ncols
    if !ok
        throw(BoundsError("($r, $c) not in 1:$(x.nrows), 1:$(x.ncols)"))
    end
    return nothing
end

@inline function checkbounds(x::ArbComplexMatrix{P}, rc::Int) where {P}
    ok = 0 < rc <= x.nrows * x.ncols
    if !ok
        throw(BoundsError("($rc) not in 1:$(x.nrows * x.ncols)"))
    end
    return nothing
end

@inline function Base.getindex(x::ArbComplexMatrix{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)

   z = ArbComplex{P}()
   GC.@preserve x begin
       v = ccall(@libarb(acb_mat_entry_ptr), Ptr{ArbComplex},
                 (Ref{ArbComplexMatrix}, Int, Int), x, rowidx - 1, colidx - 1)
       ccall(@libarb(acb_set), Cvoid, (Ref{ArbComplex}, Ptr{ArbComplex}), z, v)
   end
   return z
end

@inline function Base.getindex(x::ArbComplexMatrix{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    return getindex(x, rowidx, colidx)
end

function Base.getindex(x::ArbComplexMatrix{P}, linearidxs::Array{Int,1}) where {P}
    nrows = x.nrows
    values = Vector{ArbComplex{P}}(undef, length(linearidxs))
    valueidx = 1
    for idx in linearidx
        rowidx, colidx = linear_to_cartesian(nrows, idx)
        values[valueidx] = getindex(x, rowidx, colidx)
        valueidx += 1
    end
    return values
end


function Base.setindex!(x::ArbComplexMatrix{P}, z::ArbComplex{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
   
    GC.@preserve x begin
        ptr = ccall(@libarb(acb_mat_entry_ptr), Ptr{ArbComplex}, (Ref{ArbComplexMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(acb_set), Cvoid, (Ptr{ArbComplex}, Ref{ArbComplex}), ptr, z)
        end
    return z
end

function Base.setindex!(x::ArbComplexMatrix{P}, z::ArbComplex{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
    
    GC.@preserve x begin
        ptr = ccall(@libarb(acb_mat_entry_ptr), Ptr{ArbComplex}, (Ref{ArbComplexMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(acb_set), Cvoid, (Ptr{ArbComplex}, Ref{ArbComplex}), ptr, z)
        end
    return z
end

function Base.setindex!(x::ArbComplexMatrix{P}, z::Array{ArbComplex{P},1}, linearidx::Array{Int,1}) where {P}
    for (az, alinearidx) in (z, linearidx)
        setindex!(x, ax, alinearidx)
    end
    return x
end

# constructors

ArbComplexMatrix{P}(x::ArbComplexMatrix{P}) where {P} = x

function ArbComplexMatrix{P}(x::ArbComplexMatrix{Q}) where {P, Q}
   nrows, ncols = size(x)
   arm = ArbComplexMatrix{P}(nrows, ncols)
   for col in 1:ncols
       for row in 1:nrows
           arm[row,col]  = ArbComplex{P}(x[row,col])
       end
    end
    return arm
end

ArbComplexMatrix(x::ArbComplexMatrix{Q}) where {Q} = ArbComplexMatrix{workingprecision(ArbComplex)}(x)

function ArbComplexMatrix{P}(x::ArbRealMatrix{P}) where {P}
   nrows, ncols = size(x)
   arm = ArbComplexMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbComplex{P}(x[row,col])
       end
    end
    return arm
end

function ArbComplexMatrix{P}(x::ArbFloatMatrix{P}) where {P}
   nrows, ncols = size(x)
   arm = ArbComplexMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbComplex{P}(x[row,col])
       end
    end
    return arm
end

function ArbRealMatrix{P}(x::ArbComplexMatrix{P}) where {P}
   nrows, ncols = size(x)
   arm = ArbFloatMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbReal{P}(x[row,col])
       end
    end
    return arm
end

function ArbFloatMatrix{P}(x::ArbComplexMatrix{P}) where {P}
   nrows, ncols = size(x)
   arm = ArbFloatMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbFloat{P}(x[row,col])
       end
    end
    return arm
end

ArbComplexMatrix{P}(x::ArbRealMatrix{Q}) where {P,Q} = ArbComplexMatrix{P}(ArbRealMatrix{P}(x))
ArbComplexMatrix{P}(x::ArbFloatMatrix{Q}) where {P,Q} = ArbComplexMatrix{P}(ArbFloatMatrix{P}(x))

ArbRealMatrix{P}(x::ArbComplexMatrix{Q}) where {P,Q} = ArbRealMatrix{P}(ArbComplexMatrix{P}(x))
ArbFloatMatrix{P}(x::ArbComplexMatrix{Q}) where {P,Q} = ArbFloatMatrix{P}(ArbComplexMatrix{P}(x))

function ArbComplexMatrix{P}(x::M) where {P, T<:AbstractFloat, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbComplexMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbComplex{P}(x[row,col])
       end
    end
    return arm
end

function ArbComplexMatrix{P}(x::M) where {P, T<:Integer, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbComplexMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbComplex{P}(x[row,col])
       end
    end
    return arm
end

function ArbComplexMatrix(x::M) where {T<:AbstractFloat, M<:AbstractMatrix{T}}
    P = workingprecision(ArbComplex)
    return ArbComplexMatrix{P}(x)
end

function ArbComplexMatrix(x::M) where {T<:Integer, M<:AbstractMatrix{T}}
    P = workingprecision(ArbComplex)
    return ArbComplexMatrix{P}(x)
end

function Matrix{T}(x::A) where {P, T<:AbstractFloat, A<:ArbComplexMatrix{P}}
   nrows, ncols = x.ncols, x.nrows
   fpm = reshape(zeros(nrows*ncols), (nrows, ncols))
   for row in 1:nrows
       for col in 1:ncols
           aacb = x[row,col]
           fpm[row,col]  = T(aacb)
       end
    end
    return fpm
end

function Matrix{T}(x::A) where {P, T<:Integer, A<:ArbComplexMatrix{P}}
   nrows, ncols = x.ncols, x.nrows
   intm = reshape(zeros(nrows*ncols), (nrows, ncols))
   for row in 1:nrows
       for col in 1:ncols
           aacb = x[row,col]
           intm[row,col]  = T(aacb)
       end
    end
    return intm
end


function det(x::ArbComplexMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_det), Cvoid, (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    return z
end

function determinant(x::ArbComplexMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    Q = 2*P
    z = ArbComplex{Q}()
    m = ArbComplexMatrix{2*P}(x)
    ccall(@libarb(acb_mat_det_precond), Cvoid, (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, m, Q)    
    return z
end


function tr(x::ArbComplexMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_trace), Cvoid, (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, x, P)
    return z
end


function transpose!(dest::ArbComplexMatrix{P}, src::ArbComplexMatrix{P}) where {P}
    (src.nrows === dest.ncols && src.ncols === dest.nrows) ||
    throw(DimensionMismatch("src($(src.ncols), $(src.nrows)) and dest($(dest.nrows), $(dest.ncols))"))
    ccall(@libarb(acb_mat_transpose), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), dest, src)
    return dest
end

function transpose!(m::ArbComplexMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))
    ccall(@libarb(acb_mat_transpose), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}),m ,m)
    return m
end

function transpose(m::ArbComplexMatrix{P}) where {P}
    dest = ArbComplexMatrix{P}(m.ncols, m.nrows)
    transpose!(dest, m)
    return dest
end
        
function norm(m::ArbComplexMatrix{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_mat_frobenius_norm), Cvoid, (Ref{ArbComplex}, Ref{ArbComplexMatrix}, Cint), z, m, P)
    return z
end

function inv(m::ArbComplexMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))       
    z = ArbComplexMatrix{P}(m.nrows, m.ncols)
    ok = ccall(@libarb(acb_mat_inv), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z,m, P)
    ok == 0 && throw(ErrorException("cannot invert $(m)"))
    return z
end

function inverse(m::ArbComplexMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))
    Q = 2*P
    z = ArbComplexMatrix{Q}(m.nrows, m.ncols)
    ok = ccall(@libarb(acb_mat_inv), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, m, Q)
    ok == 0 && throw(ErrorException("cannot invert $(m)"))
    return z
end

#  lu, ldlt, cholesky, tril, triu


# int acb_mat_lu(slong * perm, acb_mat_t LU, const acb_mat_t A, slong prec)
#   Given an n×n matrix A, computes an LU decomposition PLU=A
# using Gaussian elimination with partial pivoting. The input and output matrices can be the same, performing the decomposition in-place.

# void acb_mat_solve_triu(acb_mat_t X, const acb_mat_t U, const acb_mat_t B, int unit, slong prec)
# Solves the lower triangular system LX=B or the upper triangular system UX=B, respectively.


# int acb_mat_cho(acb_mat_t L, const acb_mat_t A, slong prec)
#   Computes the Cholesky decomposition of A, returning nonzero iff the symmetric matrix defined by the lower triangular part of A is certainly positive definite.
#   If a nonzero value is returned, then L is set to the lower triangular matrix such that A=L∗LT

# int acb_mat_ldl(acb_mat_t res, const acb_mat_t A, slong prec)
#   Computes the LDLT decomposition of A, returning nonzero iff the symmetric matrix defined by the lower triangular part of A is certainly positive definite.

#=

void acb_mat_approx_mul(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, slong prec)

    Approximate matrix multiplication. 
    The input radii are ignored and the output matrix is set to an approximate floating-point result. 
    The radii in the output matrix will not necessarily be zeroed.

void acb_mat_approx_solve_triu(acb_mat_t X, const acb_mat_t U, const acb_mat_t B, int unit, slong prec)

void acb_mat_approx_solve_tril(acb_mat_t X, const acb_mat_t L, const acb_mat_t B, int unit, slong prec)

int acb_mat_approx_lu(slong * P, acb_mat_t LU, const acb_mat_t A, slong prec)

void acb_mat_approx_solve_lu_precomp(acb_mat_t X, const slong * perm, const acb_mat_t A, const acb_mat_t B, slong prec)

int acb_mat_approx_solve(acb_mat_t X, const acb_mat_t A, const acb_mat_t B, slong prec)

    These methods perform approximate solving without any error control.
    The radii in the input matrices are ignored, 
        the computations are done numerically with floating-point arithmetic
         (using ordinary Gaussian elimination and triangular solving,
          accelerated through the use of block recursive strategies for large matrices),
        and the output matrices are set to the approximate floating-point results with zeroed error bounds.

    Approximate solutions are useful for computing preconditioning matrices for certified solutions. 
    Some users may also find these methods useful for doing ordinary numerical linear algebra
        in applications where error bounds are not needed.
=#

# void acb_mat_mul(acb_mat_t res, const acb_mat_t mat1, const acb_mat_t mat2, slong prec)
function Base.:(*)(x::ArbComplexMatrix{P}, y::ArbComplexMatrix{P}) where {P}
    if x.ncols !== y.nrows
        throw(ErrorException("Dimension Mismatach: x($(x.nrows), $(x.ncols)) y($(y.nrows), $(y.ncols))"))
    end
    z = ArbComplexMatrix{P}(x.nrows, y.ncols)
    ccall(@libarb(acb_mat_mul), Cvoid, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}, Cint), z, x, y, P)
    return z
end


function (==)(a::ArbComplexMatrix{P}, b::ArbComplexMatrix{P}) where {P}
    result = ccall(@libarb(acb_mat_eq), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), a, b)
    return !iszero(result)
end

function (!=)(a::ArbComplexMatrix{P}, b::ArbComplexMatrix{P}) where {P}
    result = ccall(@libarb(acb_mat_ne), Cint, (Ref{ArbComplexMatrix}, Ref{ArbComplexMatrix}), a, b)
    return !iszero(result)
end
