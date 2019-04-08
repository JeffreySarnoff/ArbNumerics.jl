maxintfloat(::Type{ArbFloat{P}}) where {P} = ArbFloat{P}(BigInt(2)^(P))
maxintfloat(::Type{ArbReal{P}}) where {P} = ArbReal{P}(BigInt(2)^(P))
