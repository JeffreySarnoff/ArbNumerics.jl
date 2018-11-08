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

const PtrToArbReal = Ref(ArbReal)
const PtrToPtrToArbReal = Ref(PtrToArbReal)

mutable struct ArbRealMatrix{P} <: AbstractMatrix
   entries::Ptr{ArbReal{P}}
   nrows::Int
   ncols::Int
   rows::Ptr{Ptr{ArbReal{P}}}
   
   function ArbRealMatrix{P}(nrows::Int, ncols::Int)
       a = zero(ArbReal{P})
       ptrto_zero = Ref(a)
       ptrto_ptrto_zero = Ref(ptrto_a)
       z = new{P}(PtrToArbReal, 0, 0, PtrToPtrToArbReal)
       arb_mat_init(z)
       finalizer(arb_mat_clear, z)
       return z
   end
end

function arb_mat_clear(x::ArbRealMatrix)
    ccall(@libarb(arb_mat_clear), Cvoid, (Ref{ArbRealMatrix}, ), x)
    return nothing
end

function arb_mat_init(x::ArbRealMatrix{P})
    ccall(@libarb(arb_mat_init), Cvoid, (Ref{ArbRealMatrix}, Cint, Cint), x, x.nrows, x.ncols)
    return nothing
end


