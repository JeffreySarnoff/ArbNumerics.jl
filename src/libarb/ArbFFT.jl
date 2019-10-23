function dft(x::Array{ArbComplex{P},1}) where {P}
    # to guarantee safe bounds
    length = size(x)[1]
    
    # we transfer the data into a C acb vector
    
    #(ALLOC x_c) Allocate the memory in C space
    x_c = ccall(@libarb(_acb_vec_init), Ptr{ArbComplex{P}}, (Int32,), length)
    #
    
    # copy x_c
    @inbounds for i in 1:length
                unsafe_store!(x_c, x[i], i)
              end
    #
    
    #(ALLOC transf_C)
    transf_c = ccall(@libarb(_acb_vec_init), Ptr{ArbComplex{P}}, (Int32,), length)
    #
    
    # we call the acb_dft 
    # Signature: void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec)
    ccall(@libarb(acb_dft), Cvoid, (Ref{ArbComplex{P}}, Ref{ArbComplex{P}}, Cint, Cint ), transf_c, x_c, length, P)
    
    #(DEALLOC x_c)
    ccall(@libarb(_acb_vec_clear), Cvoid, (Ref{ArbComplex{P}}, Cint ), x_c, length)
    #
    
    transf = zeros(ArbComplex{P}, length)
    @inbounds for i in 1:length
                transf[i] = unsafe_load(transf_c, i)
              end
    
    #(DEALLOC transf_c)
    ccall(@libarb(_acb_vec_clear), Cvoid, (Ref{ArbComplex{P}}, Cint ), transf_c, length)
    #
    
    return transf
end

dft(x::Array{ArbComplex,1}) = dft(Array{ArbComplex{workingprecision(ArbComplex)}, 1}(x))
dft(x::Array{ArbReal,1}) = dft(ArbComplex.(x))
dft(x::Array{ArbFloat,1}) = dft(ArbComplex.(x))

function inverse_dft(x::Array{ArbComplex{P},1}) where {P}
    # to guarantee safe bounds
    length = size(x)[1]
    
    # we transfer the data into a C acb vector
    
    #(ALLOC x_c) Allocate the memory in C space
    x_c = ccall(@libarb(_acb_vec_init), Ptr{ArbComplex{P}}, (Int32,), length)
    #
    
    # copy x_c
    @inbounds for i in 1:length
                unsafe_store!(x_c, x[i], i)
              end
    #
    
    #(ALLOC transf_C)
    transf_c = ccall(@libarb(_acb_vec_init), Ptr{ArbComplex{P}}, (Int32,), length)
    #
    
    # we call the acb_dft 
    # Signature: void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec)
    ccall(@libarb(acb_dft_inverse), Cvoid, (Ref{ArbComplex{P}}, Ref{ArbComplex{P}}, Cint, Cint ), transf_c, x_c, length, P)
    
    #(DEALLOC x_c)
    ccall(@libarb(_acb_vec_clear), Cvoid, (Ref{ArbComplex{P}}, Cint ), x_c, length)
    #
    
    transf = zeros(ArbComplex{P}, length)
    @inbounds for i in 1:length
                transf[i] = unsafe_load(transf_c, i)
              end
    
    #(DEALLOC transf_c)
    ccall(@libarb(_acb_vec_clear), Cvoid, (Ref{ArbComplex{P}}, Cint ), transf_c, length)
    #
    
    return transf
end

inverse_dft(x::Array{ArbComplex,1}) = inverse_dft(Array{ArbComplex{workingprecision(ArbComplex)}, 1}(x))
inverse_dft(x::Array{ArbReal,1}) = inverse_dft(ArbComplex.(x))
inverse_dft(x::Array{ArbFloat,1}) = inverse_dft(ArbComplex.(x))
