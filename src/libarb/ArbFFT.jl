for (f,acb_f) in [(:dft, @libarb(:acb_dft), (:inverse_dft, :acb_dft_inverse))]
    @eval begin
        function $f(x::Vector{ArbComplex{P}}) where P
            n = length(x)
            x_c = AcbVector(x)
            transf_c = AcbVector(ArbComplex{P}, n)

            # Signature: void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec)
            ccall($acb_f, Cvoid, (Ref{ArbComplex{P}}, Ref{ArbComplex{P}}, Cint, Cint ), transf_c.ptr, x_c.ptr, n, P)

            free!(x_c)

            # Copy data and release memory
            take!(transf_c)
        end
    end
end

dft(x::Array{ArbComplex,1}) = dft(Array{ArbComplex{workingprecision(ArbComplex)}, 1}(x))
dft(x::Array{ArbReal{P},1}) where {P} = dft(Array{ArbComplex{P}, 1}(x))
dft(x::Array{ArbFloat{P},1}) where {P} = dft(Array{ArbComplex{P}, 1}(x))
dft(x::Array{ArbReal,1}) = dft(Array{ArbComplex{workingprecision(ArbReal)}, 1}(x))
dft(x::Array{ArbFloat,1}) = dft(Array{ArbComplex{workingprecision(ArbFloat)}, 1}(x))

inverse_dft(x::Array{ArbComplex,1}) = inverse_dft(Array{ArbComplex{workingprecision(ArbComplex)}, 1}(x))
inverse_dft(x::Array{ArbReal{P},1}) where {P} = dft(Array{ArbComplex{P}, 1}(x))
inverse_dft(x::Array{ArbFloat{P},1}) where {P} = dft(Array{ArbComplex{P}, 1}(x))
inverse_dft(x::Array{ArbReal,1}) = dft(Array{ArbComplex{workingprecision(ArbReal)}, 1}(x))
inverse_dft(x::Array{ArbFloat,1}) = dft(Array{ArbComplex{workingprecision(ArbFloat)}, 1}(x))
