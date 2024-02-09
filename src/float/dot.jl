#= DOES NOT WORK PROPERLY
for (TT,dot_f) in [(:ArbReal, @libarb(arb_dot)),(:ArbComplex, @libarb(acb_dot))]
    @eval begin
        function LinearAlgebra.dot(x::ArblibVector{T}, y::ArblibVector{T}) where {T<:$TT}
            @assert x.len == y.len
            res = T(0) # Aliasing is allowed between res and s

            P = precision(T)

            ccall($dot_f, Cvoid, (Ref{T}, Ref{T}, Clong,
                                  Ref{T}, Clong,
                                  Ref{T}, Clong,
                                  Clong, Clong),
                  res, res, 0, x.ptr, 0, y.ptr, 0, x.len, P)

            res
        end
    end
end
=#
