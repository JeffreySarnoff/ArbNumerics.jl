Base.setindex!(v::Array{Complex{ArbFloat{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
         setindex!(v, Complex{ArbFloat{P}}(ArbFloat{P}(real(c)), ArbFloat{P}(imag(c))), idx)

Base.setindex!(v::Array{Complex{ArbReal{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
    setindex!(v, Complex{ArbReal{P}}(real(c), imag(c)), idx)

Base.convert(::ArbFloatMatrix{P}, x::Array{ArbFloat{P}, 2}) where {P} = ArbFloatMatrix(x)
Base.convert(::ArbRealMatrix{P}, x::Array{ArbReal{P}, 2})  where {P} = ArbRealMatrix(x)
Base.convert(::ArbComplexMatrix{P}, x::Array{ArbComplex{P}, 2}) where {P} = ArbComplexMatrix(x)

svdvals(x::Array{ArbReal{N},2}) where {N} = ArbReal{N}.(svdvals(ArbFloat{N}.(midpoint.(x))))
svdvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supproted"))

eigvals(x::Array{ArbReal{N},2}) where {N} = ArbReal{N}.(eigvals(ArbFloat{N}.(midpoint.(x))))
eigvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supported"))

LinearAlgebra.eigvecs(x::Array{ArbFloat{N},M}) where {N,M} = throw(ErrorException("not supported"))
LinearAlgebra.eigvecs(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not supported"))
LinearAlgebra.eigvecs(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supported"))
