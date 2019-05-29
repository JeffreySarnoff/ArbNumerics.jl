Base.setindex!(v::Array{Complex{ArbFloat{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
         setindex!(v, Complex{ArbFloat{P}}(ArbFloat{P}(real(c)), ArbFloat{P}(imag(c))), idx)

Base.setindex!(v::Array{Complex{ArbReal{P}},1}, c::ArbComplex{P}, idx::Int64) where {P} =
    setindex!(v, Complex{ArbReal{P}}(real(c), imag(c)), idx)

Base.convert(::ArbFloatMatrix{P}, x::Array{ArbFloat{P}, 2}) where {P} = ArbFloatMatrix(x)
Base.convert(::ArbRealMatrix{P}, x::Array{ArbReal{P}, 2})  where {P} = ArbRealMatrix(x)
Base.convert(::ArbComplexMatrix{P}, x::Array{ArbComplex{P}, 2}) where {P} = ArbComplexMatrix(x)

svdvals(x::Array{ArbComplex{N},2}) where {N} = throw(ErrorException("not supported"))
svdvals(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supported"))
svdvals(x::Array{Complex{ArbFloat{N}},2}) where {N} = throw(ErrorException("not supported"))
svdvals(x::Array{Complex{ArbReal{N}},2}) where {N} = throw(ErrorException("not supported"))
svdvals(x::Array{ArbComplex,2}) = throw(ErrorException("not supported"))
svdvals(x::Array{ArbComplex,M}) where {M} = throw(ErrorException("not supported"))
svdvals(x::Array{Complex{ArbFloat},2}) = throw(ErrorException("not supported"))
svdvals(x::Array{Complex{ArbReal},2}) = throw(ErrorException("not supported"))

eigvals(x::Array{ArbReal{N},2}) where {N} = ArbReal{N}.(eigvals(ArbFloat{N}.(midpoint.(x))))
eigvals(x::Array{ArbReal,2})  = ArbReal{workingprecision{ArbReal}}.(eigvals(ArbFloat{workingprecision(ArbFloat)}.(midpoint.(x))))

eigvals(x::Array{ArbComplex{N},2}) where {N} = throw(ErrorException("not supported"))
eigvals(x::Array{Complex{ArbFloat{N}},2}) where {N} = throw(ErrorException("not supported"))
eigvals(x::Array{Complex{ArbReal{N}},2}) where {N} = throw(ErrorException("not supported"))


eigvecs(x::Array{ArbFloat{N},2}) where {N} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbReal{N},2}) where {N} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbComplex{N},2}) where {N} = throw(ErrorException("not supported"))
eigvecs(x::Array{Complex{ArbFloat{N}},2}) where {N} = throw(ErrorException("not supported"))
eigvecs(x::Array{Complex{ArbReal{N}},2}) where {N} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbFloat{N},M}) where {N,M} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supported"))

eigvecs(x::Array{ArbFloat,2}) = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbReal,2}) = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbComplex,2}) = throw(ErrorException("not supported"))
eigvecs(x::Array{Complex{ArbFloat},2}) = throw(ErrorException("not supported"))
eigvecs(x::Array{Complex{ArbReal},2}) = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbFloat,M}) where {M} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbReal,M}) where {M} = throw(ErrorException("not supported"))
eigvecs(x::Array{ArbComplex,M}) where {M} = throw(ErrorException("not supported"))

eigen(x::Array{ArbFloat{N},2}) where {N} = throw(ErrorException("not supported"))
eigen(x::Array{ArbReal{N},2}) where {N} = throw(ErrorException("not supported"))
eigen(x::Array{ArbComplex{N},2}) where {N} = throw(ErrorException("not supported"))
eigen(x::Array{Complex{ArbFloat{N}},2}) where {N} = throw(ErrorException("not supported"))
eigen(x::Array{Complex{ArbReal{N}},2}) where {N} = throw(ErrorException("not supported"))
eigen(x::Array{ArbFloat{N},M}) where {N,M} = throw(ErrorException("not supported"))
eigen(x::Array{ArbReal{N},M}) where {N,M} = throw(ErrorException("not supported"))
eigen(x::Array{ArbComplex{N},M}) where {N,M} = throw(ErrorException("not supported"))

eigen(x::Array{ArbFloat,2}) = throw(ErrorException("not supported"))
eigen(x::Array{ArbReal,2}) = throw(ErrorException("not supported"))
eigen(x::Array{ArbComplex,2}) = throw(ErrorException("not supported"))
eigen(x::Array{Complex{ArbFloat},2}) = throw(ErrorException("not supported"))
eigen(x::Array{Complex{ArbReal},2}) = throw(ErrorException("not supported"))
eigen(x::Array{ArbFloat,M}) where {M} = throw(ErrorException("not supported"))
eigen(x::Array{ArbReal,M}) where {M} = throw(ErrorException("not supported"))
eigen(x::Array{ArbComplex,M}) where {M} = throw(ErrorException("not supported"))
