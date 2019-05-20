svdvals(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
svdvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))

eigvals(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
eigvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))
LinearAlgebra.eigvecs(x::Array{ArbFloat{N},M}) where {N,M} = throw(ErrorException("not implemented"))
LinearAlgebra.eigvecs(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
LinearAlgebra.eigvecs(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))
