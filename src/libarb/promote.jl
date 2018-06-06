promote_rule(::Type{ArbComplex{P}}, ::Type{ArbBall{P}}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{ArbFloat{P}}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbBall{P}}, ::Type{ArbFloat{P}}) where {P} = ArbBall{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{Mag}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbBall{P}}, ::Type{Mag}) where {P} = ArbBall{P}
promote_rule(::Type{ArbFloat{P}}, ::Type{Mag}) where {P} = ArbFloat{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{BigInt}) where {P} = ArbFloat{P}
promote_rule(::Type{ArbBall{P}}, ::Type{BigInt}) where {P} = ArbBall{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{BigInt}) where {P} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{BigFloat}) where {P} = ArbFloat{P}
promote_rule(::Type{ArbBall{P}}, ::Type{BigFloat}) where {P} = ArbBall{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{BigFloat}) where {P} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{I}) where {P, I<:Integer} = ArbFloat{P}
promote_rule(::Type{ArbBall{P}}, ::Type{I}) where {P, I<:Integer} = ArbBall{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{I}) where {P, I<:Integer} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbFloat{P}
promote_rule(::Type{ArbBall{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbBall{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbComplex{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{C}) where {P, C<:Complex} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, x::ArbFloat{Q}) where {P,Q} =
    P>Q ? ArbFloat{P} : ArbFloat{Q}
promote_rule(::Type{ArbBall{P}}, x::ArbBall{Q}) where {P,Q} =
    P>Q ? ArbBall{P} : ArbBall{Q}
promote_rule(::Type{ArbComplex{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}
promote_rule(::Type{ArbFloat{P}}, x::ArbBall{Q}) where {P,Q} =
    P>Q ? ArbBall{P} : ArbBall{Q}
promote_rule(::Type{ArbFloat{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}
promote_rule(::Type{ArbBall{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}

convert(::Type{ArbFloat}, x::ArbFloat{P}) where {P} = x
convert(::Type{ArbBall}, x::ArbBall{P}) where {P} = x
convert(::Type{ArbComplex}, x::ArbComplex{P}) where {P} = x
convert(::Type{ArbFloat}, x::ArbBall{P}) where {P} = ArbFloat{P}(x)
convert(::Type{ArbFloat}, x::ArbComplex{P}) where {P} = ArbFloat{P}(real(x))
convert(::Type{ArbBall}, x::ArbComplex{P}) where {P} = real(x)
convert(::Type{ArbBall}, x::ArbFloat{P}) where {P} = ArbBall{P}(x)
convert(::Type{ArbComplex}, x::ArbFloat{P}) where {P} = ArbComplex{P}(x)

convert(::Type{ArbBall{P}}, x::ArbComplex{P}) where {P} = real(x)
convert(::Type{ArbFloat{P}}, x::ArbComplex{P}) where {P} = midpoint(real(x), ArbFloat{P})
convert(::Type{Mag}, x::ArbComplex{P}) where {P} = radius(real(x), Mag)

convert(::Type{ArbComplex{P}}, x::ArbBall{P}) where {P} = ArbComplex{P}(x)
convert(::Type{ArbComplex{P}}, x::ArbFloat{P}) where {P} = ArbComplex{P}(ArbBall{P}(x))
convert(::Type{ArbComplex{P}}, x::Mag) where {P} = ArbComplex{P}(ArbFloat{P}(x))

convert(::Type{ArbFloat{P}}, x::ArbBall{P}) where {P} = midpoint(x, ArbFloat{P})
convert(::Type{Mag}, x::ArbBall{P}) where {P} = radius(x, Mag)

convert(::Type{ArbBall{P}}, x::ArbFloat{P}) where {P} = ArbBall{P}(x)
convert(::Type{ArbBall{P}}, x::Mag) where {P} = ArbBall{P}(ArbFloat{P}(x))

convert(::Type{Mag}, x::ArbFloat{P}) where {P} = Mag(x)
convert(::Type{ArbFloat{P}}, x::Mag) where {P} = ArbFloat{P}(x)

convert(::Type{ArbFloat{P}}, x::BigFloat) where {P} = ArbFloat{P}(x)
convert(::Type{ArbBall{P}}, x::BigFloat) where {P} = ArbBall{P}(x)
convert(::Type{ArbComplex{P}}, x::BigFloat) where {P} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::BigInt) where {P} = ArbFloat{P}(x)
convert(::Type{ArbBall{P}}, x::BigInt) where {P} = ArbBall{P}(x)
convert(::Type{ArbComplex{P}}, x::BigInt) where {P} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::I) where {P, I<:Integer} = ArbFloat{P}(x)
convert(::Type{ArbBall{P}}, x::I) where {P, I<:Integer} = ArbBall{P}(x)
convert(::Type{ArbComplex{P}}, x::I) where {P, I<:Integer} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::AbstractFloat) where {P} = ArbFloat{P}(x)
convert(::Type{ArbBall{P}}, x::AbstractFloat) where {P} = ArbBall{P}(x)
convert(::Type{ArbComplex{P}}, x::AbstractFloat) where {P} = ArbComplex{P}(x)
convert(::Type{ArbComplex{P}}, x::Complex) where {P} = ArbComplex{P}(x)
