
# heavily influenced by and mostly of the Arb C interface used in Nemo.jl
#=
    There is no direct support for matricies of ArbFloats.
    We partially overload ArbRealMatrix to zero the radii.
    And provide conversion from Array{ArbFloat{P},2}.
=#        

            
mutable struct ArbFloatMatrix{P} <: AbstractArbMatrix{P, ArbFloat}
    entries::Ptr{ArbReal{P}}
    nrows::Int
    ncols::Int
    rows::Ptr{Ptr{ArbReal{P}}}

   function ArbFloatMatrix{P}(nrows::Int, ncols::Int) where {P}
       nrows, ncols = ncols, nrows
       z = new{P}()
       arb_mat_init(z, nrows, ncols)
       finalizer(arb_mat_clear, z)
       return z
   end

   function ArbFloatMatrix(nrows::Int, ncols::Int)
        P = workingprecision(ArbFloat)
        return ArbFloatMatrix{P}(nrows, ncols)
   end
end

Base.isempty(x::ArbFloatMatrix{P}) where {P} = x.nrows == 0 || x.ncols == 0

Base.size(x::ArbFloatMatrix{P}) where {P} = (x.ncols, x.nrows)

@inline function checkbounds(x::ArbFloatMatrix{P}, r::Int, c::Int) where {P}
    ok = 0 < r <= x.nrows && 0 < c <= x.ncols
    if !ok
        throw(BoundsError("($r, $c) not in 1:$(x.nrows), 1:$(x.ncols)"))
    end
    return nothing
end

@inline function checkbounds(x::ArbFloatMatrix{P}, rc::Int) where {P}
    ok = 0 < rc <= x.nrows * x.ncols
    if !ok
        throw(BoundsError("($rc) not in 1:$(x.nrows * x.ncols)"))
    end
    return nothing
end

@inline function Base.getindex(x::ArbFloatMatrix{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
    
    w = ArbFloat{P}()
    z = ArbReal{P}()
    GC.@preserve x begin
        v = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal},
                  (Ref{ArbRealMatrix}, Int, Int), x, rowidx - 1, colidx - 1)
        ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ptr{ArbReal}), z, v)
    end
    w = ArbFloat{P}(z)
    return w
end

@inline function Base.getindex(x::ArbFloatMatrix{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    return getindex(x, rowidx, colidx)
end

function Base.getindex(x::ArbFloatMatrix{P}, linearidxs::Array{Int,1}) where {P}
    nrows = x.nrows
    values = Vector{ArbFloat{P}}(undef, length(linearidxs))
    valueidx = 1
    for idx in linearidx
        rowidx, colidx = linear_to_cartesian(nrows, idx)
        values[valueidx] = getindex(x, rowidx, colidx)
        valueidx += 1
    end
    return values
end


function Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
    
    w = ArbReal{P}(z)
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal}, 
                        (Ref{ArbRealMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, w)
        end
    return z
end

function Base.setindex!(x::ArbFloatMatrix{P}, z::ArbFloat{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
    
    w = ArbReal{P}(z)
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal},
                        (Ref{ArbRealMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, w)
        end
    return z
end

function Base.setindex!(x::ArbFloatMatrix{P}, z::Array{ArbFloat{P},1}, linearidx::Array{Int,1}) where {P}
    for (az, alinearidx) in (z, linearidx)
        setindex!(x, ax, alinearidx)
    end
    return x
end

# constructors

ArbFloatMatrix{P}(x::ArbFloatMatrix{P}) where {P} = x

function ArbFloatMatrix{P}(x::ArbFloatMatrix{Q}) where {P, Q}
   nrows, ncols = size(x)
   arm = ArbFloatMatrix{P}(nrows, ncols)
   for col in 1:ncols
       for row in 1:nrows
           arm[row,col]  = ArbFloat{P}(x[row,col])
       end
    end
    return arm
end

ArbFloatMatrix(x::ArbRealMatrix{Q}) where {Q} = ArbFloatMatrix{workingprecision(ArbReal)}(x)

ArbFloatMatrix{P}(x::ArbRealMatrix{Q}) where {P,Q} = ArbFloatMatrix{P}(ArbRealMatrix{P}(x))
ArbRealMatrix{P}(x::ArbFloatMatrix{Q}) where {P,Q} = ArbRealMatrix{P}(ArbFloatMatrix{P}(x))

function ArbFloatMatrix{P}(x::M) where {P, T<:AbstractFloat, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbFloatMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbFloat{P}(x[row,col])
       end
    end
    return arm
end

function ArbFloatMatrix{P}(x::M) where {P, T<:Integer, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbFloatMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           arm[row,col]  = ArbFloat{P}(x[row,col])
       end
    end
    return arm
end

function ArbFloatMatrix(x::M) where {T<:AbstractFloat, M<:AbstractMatrix{T}}
    P = workingprecision(ArbFloat)
    return ArbFloatMatrix{P}(x)
end

function ArbFloatMatrix(x::M) where {T<:Integer, M<:AbstractMatrix{T}}
    P = workingprecision(ArbFloat)
    return ArbFloatMatrix{P}(x)
end

function Matrix{T}(x::A) where {P, T<:AbstractFloat, A<:ArbFloatMatrix{P}}
   nrows, ncols = x.ncols, x.nrows
   fpm = reshape(zeros(nrows*ncols), (nrows, ncols))
   for row in 1:nrows
       for col in 1:ncols
           aarb = x[row,col]
           fpm[row,col]  = T(aarb)
       end
    end
    return fpm
end

function Matrix{T}(x::A) where {P, T<:Integer, A<:ArbFloatMatrix{P}}
   nrows, ncols = x.ncols, x.nrows
   intm = reshape(zeros(nrows*ncols), (nrows, ncols))
   for row in 1:nrows
       for col in 1:ncols
           aarb = x[row,col]
           intm[row,col]  = T(aarb)
       end
    end
    return intm
end


function det(x::ArbFloatMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_det), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, x, P)
    w = ArbFloat{P}(z)
    return w
end

function determinant(x::ArbFloatMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    Q = 2*P
    z = ArbReal{Q}()
    m = ArbFloatMatrix{2*P}(x)
    ccall(@libarb(arb_mat_det_precond), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, m, Q)    
    w = ArbFloat{P}(z)
    return w
end


function tr(x::ArbFloatMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_trace), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, x, P)
    w = ArbFloat{P}(z)
    return w
end


function transpose!(dest::ArbFloatMatrix{P}, src::ArbFloatMatrix{P}) where {P}
    (src.nrows === dest.ncols && src.ncols === dest.nrows) ||
    throw(DimensionMismatch("src($(src.ncols), $(src.nrows)) and dest($(dest.nrows), $(dest.ncols))"))
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), dest, src)
    return dest
end

function transpose!(m::ArbFloatMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}),m ,m)
    return m
end

function transpose(m::ArbFloatMatrix{P}) where {P}
    dest = ArbFloatMatrix{P}(m.ncols, m.nrows)
    transpose!(dest, m)
    return dest
end
        
function norm(m::ArbFloatMatrix{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_frobenius_norm), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, m, P)
    w = ArbFloat{P}(z)
    return w
end

function inv(m::ArbFloatMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))       
    z = ArbFloatMatrix{P}(m.nrows, m.ncols)
    ok = ccall(@libarb(arb_mat_inv), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z,m, P)
    ok == 0 && throw(ErrorException("cannot invert $(m)"))
    return z
end

function inverse(m::ArbFloatMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))
    Q = 2*P
    z = ArbFloatMatrix{Q}(m.nrows, m.ncols)
    ok = ccall(@libarb(arb_mat_inv), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z, m, Q)
    ok == 0 && throw(ErrorException("cannot invert $(m)"))
    return z
end

#  lu, ldlt, cholesky, tril, triu


# int arb_mat_lu(slong * perm, arb_mat_t LU, const arb_mat_t A, slong prec)
#   Given an n×n matrix A, computes an LU decomposition PLU=A
# using Gaussian elimination with partial pivoting. The input and output matrices can be the same, performing the decomposition in-place.

# void arb_mat_solve_triu(arb_mat_t X, const arb_mat_t U, const arb_mat_t B, int unit, slong prec)
# Solves the lower triangular system LX=B or the upper triangular system UX=B, respectively.


# int arb_mat_cho(arb_mat_t L, const arb_mat_t A, slong prec)
#   Computes the Cholesky decomposition of A, returning nonzero iff the symmetric matrix defined by the lower triangular part of A is certainly positive definite.
#   If a nonzero value is returned, then L is set to the lower triangular matrix such that A=L∗LT

# int arb_mat_ldl(arb_mat_t res, const arb_mat_t A, slong prec)
#   Computes the LDLT decomposition of A, returning nonzero iff the symmetric matrix defined by the lower triangular part of A is certainly positive definite.

#=
void arb_mat_approx_mul(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec)
    Approximate matrix multiplication. 
    The input radii are ignored and the output matrix is set to an approximate floating-point result. 
    The radii in the output matrix will not necessarily be zeroed.
void arb_mat_approx_solve_triu(arb_mat_t X, const arb_mat_t U, const arb_mat_t B, int unit, slong prec)
void arb_mat_approx_solve_tril(arb_mat_t X, const arb_mat_t L, const arb_mat_t B, int unit, slong prec)
int arb_mat_approx_lu(slong * P, arb_mat_t LU, const arb_mat_t A, slong prec)
void arb_mat_approx_solve_lu_precomp(arb_mat_t X, const slong * perm, const arb_mat_t A, const arb_mat_t B, slong prec)
int arb_mat_approx_solve(arb_mat_t X, const arb_mat_t A, const arb_mat_t B, slong prec)
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

# void arb_mat_mul(arb_mat_t res, const arb_mat_t mat1, const arb_mat_t mat2, slong prec)
function Base.:(*)(x::ArbFloatMatrix{P}, y::ArbFloatMatrix{P}) where {P}
    if x.ncols !== y.nrows
        throw(ErrorException("Dimension Mismatach: x($(x.nrows), $(x.ncols)) y($(y.nrows), $(y.ncols))"))
    end
    z = ArbFloatMatrix{P}(x.nrows, y.ncols)
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z, x, y, P)
    return z
end

function Base.:(*)(x::ArbFloatMatrix{P}, y::ArbRealMatrix{P}) where {P}
   if x.ncols !== y.nrows
        throw(ErrorException("Dimension Mismatach: x($(x.nrows), $(x.ncols)) y($(y.nrows), $(y.ncols))"))
    end
    z = ArbRealMatrix{P}(x.nrows, y.ncols)
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z, x, y, P)
    return z
end

function Base.:(*)(x::ArbRealMatrix{P}, y::ArbFloatMatrix{P}) where {P}
   if x.ncols !== y.nrows
        throw(ErrorException("Dimension Mismatach: x($(x.nrows), $(x.ncols)) y($(y.nrows), $(y.ncols))"))
    end
    z = ArbRealMatrix{P}(x.nrows, y.ncols)
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z, x, y, P)
    return z
end



function (==)(a::ArbFloatMatrix{P}, b::ArbFloatMatrix{P}) where {P}
    result = ccall(@libarb(arb_mat_eq), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), a, b)
    return !iszero(result)
end

function (!=)(a::ArbFloatMatrix{P}, b::ArbFloatMatrix{P}) where {P}
    result = ccall(@libarb(arb_mat_ne), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), a, b)
    return !iszero(result)
end
