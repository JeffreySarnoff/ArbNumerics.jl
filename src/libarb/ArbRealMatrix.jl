# heavily influenced by and mostly of the Arb C interface used in Nemo.jl

linearindex_from_rowcol(nrows::Int, row::Int, col::Int) = row + (col-1)*nrows

linearindex_from_rowcol(m::M, row::Int, col::Int) where {T,M<:AbstractMatrix{T}} =
    row + (col-1)*size(m)[1]

rowcol_from_linearindex(m::M, linearidx::Int) where {T,M<:AbstractMatrix{T}} =
    rowcol_from_linearindex(size(m)[1], linearidx)

function rowcol_from_linearindex(nrows::Int, linearidx::Int)
    row = rem(linearidx, nrows)
    row = ifelse(row === 0, nrows, row)
    col = div(linearidx-row, nrows) + 1
    return row,col
end

        
        
        
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

mutable struct ArbRealMatrix{P} <: AbstractMatrix{ArbReal{P}}
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
    rowidx, colidx = rowcol_from_linearindex(linearidx)
    return getindex(x, rowidx, colidx)
end

function Base.getindex(x::ArbRealMatrix{P}, linearidxs::Array{Int,1}) where {P}
    values = Vector{ArbReal{P}}(undef, length(linearidxs))
    valueidx = 1
    for idx in linearidx
        rowidx, colidx = rowcol_from_linearindex(idx)
        values[valueidx] = getindex(x, rowidx, colidx)
        valueidx += 1
    end
    return values
end


function Base.setindex!(x::ArbRealMatrix{P}, z::ArbReal{P}, linearidx::Int) where {P}
    rowidx, colidx = rowcol_from_linearindex(x.nrows, linearidx)
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

function Base.setindex!(x::ArbRealMatrix{P}, z::Array{ArbReal{P},1}, linearidx::Array{Int,1})
    for (az, alinearidx) in (z, linearidx)
        setindex!(x, ax, alinearidx)
    end
    return x
end


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
        for j = 1:c
           print(io, a[i, j])
           if j != c
               print(io, " ")
           end
        end
        if i != r
           println(io, "")
        end
    end
 end
