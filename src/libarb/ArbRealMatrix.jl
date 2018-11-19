# heavily influenced by and mostly of the Arb C interface used in Nemo.jl
        
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


            
mutable struct ArbRealMatrix{P} <: AbstractArbMatrix{P, ArbReal}
    entries::Ptr{ArbReal{P}}
    nrows::Int
    ncols::Int
    rows::Ptr{Ptr{ArbReal{P}}}

   function ArbRealMatrix{P}(nrows::Int, ncols::Int) where {P}
       nrows, ncols = ncols, nrows
       z = new{P}() # z = new{P}(Ptr{ArbReal{P}}(0), 0, 0, Ptr{Ptr{ArbReal{P}}}(0))
       arb_mat_init(z, nrows, ncols)
       finalizer(arb_mat_clear, z)
       return z
   end

   function ArbRealMatrix(nrows::Int, ncols::Int)
        P = workingprecision(ArbReal)
        return ArbRealMatrix{P}(nrows, ncols)
   end
end

function arb_mat_clear(x::ArbRealMatrix) where {P}
    ccall(@libarb(arb_mat_clear), Cvoid, (Ref{ArbRealMatrix}, ), x)
    return nothing
end

function arb_mat_init(x::ArbRealMatrix{P}, nrows::Int, ncols::Int) where {P}
    ccall(@libarb(arb_mat_init), Cvoid, (Ref{ArbRealMatrix}, Cint, Cint), x, nrows, ncols)
    return nothing
end

Base.size(x::ArbRealMatrix{P}) where {P} = (x.ncols, x.rows)

@inline function checkbounds(x::ArbRealMatrix{P}, r::Int, c::Int) where {P}
    ok = 0 < r <= x.nrows && 0 < c <= x.ncols
    if !ok
        throw(BoundsError("($r, $c) not in 1:$(x.nrows), 1:$(x.ncols)"))
    end
    return nothing
end

@inline function checkbounds(x::ArbRealMatrix{P}, rc::Int) where {P}
    ok = 0 < rc <= x.nrows * x.ncols
    if !ok
        throw(BoundsError("($rc) not in 1:$(x.nrows * x.ncols)"))
    end
    return nothing
end

@inline function Base.getindex(x::ArbRealMatrix{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)

   z = ArbReal{P}()
   GC.@preserve x begin
       v = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal},
                 (Ref{ArbRealMatrix}, Int, Int), x, rowidx - 1, colidx - 1)
       ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ptr{ArbReal}), z, v)
   end
   return z
end

@inline function Base.getindex(x::ArbRealMatrix{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    return getindex(x, rowidx, colidx)
end

function Base.getindex(x::ArbRealMatrix{P}, linearidxs::Array{Int,1}) where {P}
    nrows = x.nrows
    values = Vector{ArbReal{P}}(undef, length(linearidxs))
    valueidx = 1
    for idx in linearidx
        rowidx, colidx = linear_to_cartesian(nrows, idx)
        values[valueidx] = getindex(x, rowidx, colidx)
        valueidx += 1
    end
    return values
end


function Base.setindex!(x::ArbRealMatrix{P}, z::ArbReal{P}, linearidx::Int) where {P}
    rowidx, colidx = linear_to_cartesian(x.nrows, linearidx)
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
   
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal}, (Ref{ArbRealMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, z)
        end
    return z
end

function Base.setindex!(x::ArbRealMatrix{P}, z::ArbReal{P}, rowidx::Int, colidx::Int) where {P}
    rowidx, colidx = colidx, rowidx
    checkbounds(x, rowidx, colidx)
    
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal}, (Ref{ArbRealMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, z)
        end
    return z
end

function Base.setindex!(x::ArbRealMatrix{P}, z::Array{ArbReal{P},1}, linearidx::Array{Int,1}) where {P}
    for (az, alinearidx) in (z, linearidx)
        setindex!(x, ax, alinearidx)
    end
    return x
end

# constructors

function ArbRealMatrix{P}(x::M) where {P, T<:AbstractFloat, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbRealMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           afloat = x[row,col]
           arm[row,col]  = ArbReal{P}(afloat)
       end
    end
    return arm
end

function ArbRealMatrix{P}(x::M) where {P, T<:Integer, M<:AbstractMatrix{T}}
   nrows, ncols = size(x)
   arm = ArbRealMatrix{P}(nrows, ncols)
   for row in 1:nrows
       for col in 1:ncols
           anint = x[row,col]
           arm[row,col]  = ArbReal{P}(anint)
       end
    end
    return arm
end

function ArbRealMatrix(x::M) where {P, T<:AbstractFloat, M<:AbstractMatrix{T}}
    P = workingprecision(ArbReal)
    return ArbRealMatrix{P}(x)
end

function ArbRealMatrix(x::M) where {P, T<:Integer, M<:AbstractMatrix{T}}
    P = workingprecision(ArbReal)
    return ArbRealMatrix{P}(x)
end

function Matrix{T}(x::A) where {P, T<:AbstractFloat, A<:ArbRealMatrix{P}}
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

function Matrix{T}(x::A) where {P, T<:Integer, A<:ArbRealMatrix{P}}
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


function det(x::ArbRealMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_det), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, x, P)
    return z
end

function tr(x::ArbRealMatrix{P}) where {P}
    x.nrows === x.ncols || throw(DimensionMismatch("matrix is not square ($x.cols , $x.rows)"))
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_trace), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, x, P)
    return z
end


function transpose!(dest::ArbRealMatrix{P}, src::ArbRealMatrix{P}) where {P}
    (src.nrows === dest.ncols && src.ncols === dest.nrows) ||
    throw(DimensionMismatch("src($(src.ncols), $(src.nrows)) and dest($(dest.nrows), $(dest.ncols))"))
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), dest, src)
    return dest
end

function transpose!(m::ArbRealMatrix{P}) where {P}
    m.nrows === m.ncols ||
    throw(DimensionMismatch("matrix($(m.ncols) != $(m.nrows))"))
    ccall(@libarb(arb_mat_transpose), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}),m ,m)
    return m
end

function transpose(m::ArbRealMatrix{P}) where {P}
    dest = ArbRealMatrix{P}(m.ncols, m.nrows)
    transpose!(dest, m)
    return dest
end
        
function norm(m::ArbRealMatrix{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_mat_frobenius_norm), Cvoid, (Ref{ArbReal}, Ref{ArbRealMatrix}, Cint), z, m, P)
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
function Base.:(*)(x::ArbRealMatrix{P}, y::ArbRealMatrix{P}) where {P}
    if x.ncols !== y.nrows
        throw(ErrorException("Dimension Mismatach: x($(x.nrows), $(x.ncols)) y($(y.nrows), $(y.ncols))"))
    end
    z = ArbRealMatrix{P}(x.nrows, y.ncols)
    ccall(@libarb(arb_mat_mul), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Ref{ArbRealMatrix}, Cint), z, x, y, P)
    return z
end




function Base.show(io::IO, ::MIME"text/plain", a::ArbRealMatrix{P}) where {P}
    c = a.nrows
    r = a.ncols
    println(io, string(r,"x",c," Array{ArbReal{",P,"},2}"))
    for i = 1:r
        print("\t")
        for j = 1:c
           print(io, a[i, j])
           if j != c
               print(io, "\t")
           end
        end
        if i != r
           println(io, "")
        end
    end
end


function (==)(a::ArbRealMatrix{P}, b::ArbRealMatrix{P}) where {P}
    result = ccall(@libarb(arb_mat_eq), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), a, b)
    return !iszero(result)
end

function (!=)(a::ArbRealMatrix{P}, b::ArbRealMatrix{P}) where {P}
    result = ccall(@libarb(arb_mat_ne), Cint, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), a, b)
    return !iszero(result)
end

#=
function ArbFloatMatrix{P}(x::ArbRealMatrix{P}) where {P}
     w = ArbRealMatrix{P}(x.nrows, x.ncols)
     ccall(@libarb(arb_mat_get_mid), Cvoid, (Ref{ArbRealMatrix}, Ref{ArbRealMatrix}), w, x)
     z = ArbFloatMatrix{P}(x.nrows, x.ncols)
     for col in 1:z.ncols
         for row in 1:z.nrows
             z[row,col] = ArbFloat{P}(w[row,col])
         end
     end
     return z
end

function ArbRealMatrix{P}(x::ArbFloatMatrix{P}) where {P}
     z = ArbRealMatrix{P}(x.nrows, x.ncols)
     for col in 1:z.ncols
         for row in 1:z.nrows
             z[row,col] = ArbReal{P}(x[row,col])
         end
     end
     return z
end
=#
