convert(::Type{Mag}, x::Int64) = Mag(x)

convert(::Type{Mag}, x::UInt64) = Mag(x)

convert(::Type{Mag}, x::Float64) = Mag(x)

convert(::Type{Arf{P}}, x::Int64) where {P} = Arf{P}(x)

convert(::Type{Arf{P}}, x::UInt64) where {P} = Arf{P}(x)

convert(::Type{Arf{P}}, x::Float64) where {P} = Arf{P}(x)


convert(::Type{Arb{P}}, x::Int64) where {P} = Arb{P}(x)

convert(::Type{Arb{P}}, x::UInt64) where {P} = Arb{P}(x)

convert(::Type{Arb{P}}, x::Float64) where {P} = Arb{P}(x)


convert(::Type{Acb{P}}, x::Int64) where {P} = Acb{P}(x)

convert(::Type{Acb{P}}, x::UInt64) where {P} = Acb{P}(x)

convert(::Type{Acb{P}}, x::Float64) where {P} = Acb{P}(x)
