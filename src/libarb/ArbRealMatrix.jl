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

mutable struct ArbRealMatrix{P} <: AbstractMatrix
   entries::Ptr{ArbReal{P}}
   nrows::Int
   ncols::Int
   rows::Ptr{Ptr{ArbReal{P}}}
   
    
   function ArbRealMatrix{P}(nrows::Int, ncols::Int) where {P}
       z = new{P}(Ptr{ArbReal{P}}(0), 0, 0, Ptr{Ptr{ArbReal{P}}}(0))
       arb_mat_init(z)
       finalizer(arb_mat_clear, z)
       return z
   end
end

function arb_mat_clear(x::ArbRealMatrix) where {P}
    ccall(@libarb(arb_mat_clear), Cvoid, (Ref{ArbRealMatrix}, ), x)
    return nothing
end

function arb_mat_init(x::ArbRealMatrix{P}) where {P}
    ccall(@libarb(arb_mat_init), Cvoid, (Ref{ArbRealMatrix}, Cint, Cint), x, x.nrows, x.ncols)
    return nothing
end


