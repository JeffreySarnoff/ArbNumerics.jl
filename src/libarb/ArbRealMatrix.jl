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

@inline function Base.getindex(x::ArbRealMatrix{P}, r::Int, c::Int) where {P}
   checkbounds(x, r, c)

  z = ArbReal{P}()
  GC.@preserve x begin
     v = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal},
                 (Ref{ArbRealMatrix}, Int, Int), x, r - 1, c - 1)
     ccall(@libarb(arb_set), Cvoid, (Ref{ArbReal}, Ptr{ArbReal}), z, v)
  end
  return z
end

Base.size(x::ArbRealMatrix{P}) where {P} = (x.nrows, x.ncols)


function Base.setindex!(x::ArbRealMatrix{P}, z::ArbReal{P}, linearidx::Int) where {P}
    checkbounds(x, linearindex)
    rowidx, colidx = rowcol_from_linearindex(x.nrows, linearidx)
    z = ArbReal{P}()
    GC.@preserve x begin
        ptr = ccall(@libarb(arb_mat_entry_ptr), Ptr{ArbReal}, (Ref{ArbRealMatrix}, Cint, Cint), x, rowidx-1, colidx-1)
        ccall(@libarb(arb_set), Cvoid, (Ptr{ArbReal}, Ref{ArbReal}), ptr, z)
        end
    return z
end


#=
julia> a
5×5 ArbNumerics.ArbRealMatrix{100}:
 0  0  0  0  0
 0  0  0  0  0
 0  0  0  0  0
 0  0  0  0  0
 0  0  0  0  0

julia> a.rows
Ptr{Ptr{ArbReal{100}}} @0x0000000002d264d0

julia> a.rows[2]
ERROR: MethodError: no method matching getindex(::Ptr{Ptr{ArbReal{100}}}, ::Int64)
Stacktrace:
 [1] top-level scope at none:0

julia> a.entries[2]
ERROR: MethodError: no method matching getindex(::Ptr{ArbReal{100}}, ::Int64)
Stacktrace:
 [1] top-level scope at none:0

julia> a.entries
Ptr{ArbReal{100}} @0x00000000021da190
=#
