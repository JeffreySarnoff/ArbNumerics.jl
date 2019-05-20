Base.setindex!(v::Array{Complex{ArbFloat{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
         setindex!(v, Complex{ArbFloat{P}}(ArbFloat{P}(real(c)), ArbFloat{P}(imag(c))), idx)

Base.setindex!(v::Array{Complex{ArbReal{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
    setindex!(v, Complex{ArbReal{P}}(real(c), imag(c)), idx)

Base.convert(::ArbFloatMatrix{P}, x::Array{ArbFloat{P}}, 2) = ArbFloatMatrix(x)
Base.convert(::ArbRealMatrix{P}, x::Array{ArbReal{P}}, 2) = ArbRealMatrix(x)
Base.convert(::ArbComplexMatrix{P}, x::Array{ArbComplex{P}}, 2) = ArbComplexMatrix(x)

#svdvals(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
#svdvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))

#eigvals(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
#eigvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))
#LinearAlgebra.eigvecs(x::Array{ArbFloat{N},M}) where {N,M} = throw(ErrorException("not implemented"))
#LinearAlgebra.eigvecs(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not implemented"))
#LinearAlgebra.eigvecs(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not implemented"))
