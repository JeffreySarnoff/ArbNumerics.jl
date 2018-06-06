convert(::Type{Mag}, x::Int64) = Mag(x)

convert(::Type{Mag}, x::UInt64) = Mag(x)

convert(::Type{Mag}, x::Float64) = Mag(x)

convert(::Type{ArbFloat{P}}, x::Int64) where {P} = ArbFloat{P}(x)

convert(::Type{ArbFloat{P}}, x::UInt64) where {P} = ArbFloat{P}(x)

convert(::Type{ArbFloat{P}}, x::Float64) where {P} = ArbFloat{P}(x)


convert(::Type{ArbBall{P}}, x::Int64) where {P} = ArbBall{P}(x)

convert(::Type{ArbBall{P}}, x::UInt64) where {P} = ArbBall{P}(x)

convert(::Type{ArbBall{P}}, x::Float64) where {P} = ArbBall{P}(x)


convert(::Type{ArbComplex{P}}, x::Int64) where {P} = ArbComplex{P}(x)

convert(::Type{ArbComplex{P}}, x::UInt64) where {P} = ArbComplex{P}(x)

convert(::Type{ArbComplex{P}}, x::Float64) where {P} = ArbComplex{P}(x)
