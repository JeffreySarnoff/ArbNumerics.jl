abstract type LibArbMatrix{P, T}  <: AbstractMatrix{T}            end

abstract type ArbFloatMatrix{P}   <: LibArbMatrix{P, ArbFloat}    end
abstract type ArbRealMatrix{P}    <: LibArbMatrix{P, ArbReal}     end
abstract type ArbComplexMatrix{P} <: LibArbMatrix{P, ArbComplex}  end
