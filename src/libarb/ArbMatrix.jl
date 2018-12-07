abstract type LibArbMatrix{P, T}  <: AbstractMatrix{T} end

abstract type LibArbFloatMatrix{P}   <: LibArbMatrix{P, ArbFloat}    end
abstract type LibArbRealMatrix{P}    <: LibArbMatrix{P, ArbReal}     end
abstract type LibArbComplexMatrix{P} <: LibArbMatrix{P, ArbComplex}  end
