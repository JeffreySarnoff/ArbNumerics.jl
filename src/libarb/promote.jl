promote_rule(::Type{Acb{P}}, ::Type{Arb{P}}) where {P} = Acb{P}
promote_rule(::Type{Acb{P}}, ::Type{Arf{P}}) where {P} = Acb{P}
promote_rule(::Type{Arb{P}}, ::Type{Arf{P}}) where {P} = Arb{P}
promote_rule(::Type{Acb{P}}, ::Type{Mag}) where {P} = Acb{P}
promote_rule(::Type{Arb{P}}, ::Type{Mag}) where {P} = Arb{P}
promote_rule(::Type{Arf{P}}, ::Type{Mag}) where {P} = Arf{P}

promote_rule(::Type{Arf{P}}, ::Type{BigInt}) where {P} = Arf{P}
promote_rule(::Type{Arb{P}}, ::Type{BigInt}) where {P} = Arb{P}
promote_rule(::Type{Acb{P}}, ::Type{BigInt}) where {P} = Acb{P}

promote_rule(::Type{Arf{P}}, ::Type{BigFloat}) where {P} = Arf{P}
promote_rule(::Type{Arb{P}}, ::Type{BigFloat}) where {P} = Arb{P}
promote_rule(::Type{Acb{P}}, ::Type{BigFloat}) where {P} = Acb{P}

promote_rule(::Type{Arf{P}}, ::Type{I}) where {P, I<:Integer} = Arf{P}
promote_rule(::Type{Arb{P}}, ::Type{I}) where {P, I<:Integer} = Arb{P}
promote_rule(::Type{Acb{P}}, ::Type{I}) where {P, I<:Integer} = Acb{P}

promote_rule(::Type{Arf{P}}, ::Type{F}) where {P, F<:AbstractFloat} = Arf{P}
promote_rule(::Type{Arb{P}}, ::Type{F}) where {P, F<:AbstractFloat} = Arb{P}
promote_rule(::Type{Acb{P}}, ::Type{F}) where {P, F<:AbstractFloat} = Acb{P}
promote_rule(::Type{Acb{P}}, ::Type{C}) where {P, C<:Complex} = Acb{P}

promote_rule(::Type{Arf{P}}, x::Arf{Q}) where {P,Q} =
    P>Q ? Arf{P} : Arf{Q}
promote_rule(::Type{Arb{P}}, x::Arb{Q}) where {P,Q} =
    P>Q ? Arb{P} : Arb{Q}
promote_rule(::Type{Acb{P}}, x::Acb{Q}) where {P,Q} =
    P>Q ? Acb{P} : Acb{Q}
promote_rule(::Type{Arf{P}}, x::Arb{Q}) where {P,Q} =
    P>Q ? Arb{P} : Arb{Q}
promote_rule(::Type{Arf{P}}, x::Acb{Q}) where {P,Q} =
    P>Q ? Acb{P} : Acb{Q}
promote_rule(::Type{Arb{P}}, x::Acb{Q}) where {P,Q} =
    P>Q ? Acb{P} : Acb{Q}

convert(::Type{Arf}, x::Arf{P}) where {P} = x
convert(::Type{Arb}, x::Arb{P}) where {P} = x
convert(::Type{Acb}, x::Acb{P}) where {P} = x
convert(::Type{Arf}, x::Arb{P}) where {P} = Arf{P}(x)
convert(::Type{Arf}, x::Acb{P}) where {P} = Arf{P}(real(x))
convert(::Type{Arb}, x::Acb{P}) where {P} = real(x)
convert(::Type{Arb}, x::Arf{P}) where {P} = Arb{P}(x)
convert(::Type{Acb}, x::Arf{P}) where {P} = Acb{P}(x)

convert(::Type{Arb{P}}, x::Acb{P}) where {P} = real(x)
convert(::Type{Arf{P}}, x::Acb{P}) where {P} = midpoint(real(x), Arf{P})
convert(::Type{Mag}, x::Acb{P}) where {P} = radius(real(x), Mag)

convert(::Type{Acb{P}}, x::Arb{P}) where {P} = Acb{P}(x)
convert(::Type{Acb{P}}, x::Arf{P}) where {P} = Acb{P}(Arb{P}(x))
convert(::Type{Acb{P}}, x::Mag) where {P} = Acb{P}(Arf{P}(x))

convert(::Type{Arf{P}}, x::Arb{P}) where {P} = midpoint(x, Arf{P})
convert(::Type{Mag}, x::Arb{P}) where {P} = radius(x, Mag)

convert(::Type{Arb{P}}, x::Arf{P}) where {P} = Arb{P}(x)
convert(::Type{Arb{P}}, x::Mag) where {P} = Arb{P}(Arf{P}(x))

convert(::Type{Mag}, x::Arf{P}) where {P} = Mag(x)
convert(::Type{Arf{P}}, x::Mag) where {P} = Arf{P}(x)

convert(::Type{Arf{P}}, x::BigFloat) where {P} = Arf{P}(x)
convert(::Type{Arb{P}}, x::BigFloat) where {P} = Arb{P}(x)
convert(::Type{Acb{P}}, x::BigFloat) where {P} = Acb{P}(x)

convert(::Type{Arf{P}}, x::BigInt) where {P} = Arf{P}(x)
convert(::Type{Arb{P}}, x::BigInt) where {P} = Arb{P}(x)
convert(::Type{Acb{P}}, x::BigInt) where {P} = Acb{P}(x)

convert(::Type{Arf{P}}, x::I) where {P, I<:Integer} = Arf{P}(x)
convert(::Type{Arb{P}}, x::I) where {P, I<:Integer} = Arb{P}(x)
convert(::Type{Acb{P}}, x::I) where {P, I<:Integer} = Acb{P}(x)

convert(::Type{Arf{P}}, x::AbstractFloat) where {P} = Arf{P}(x)
convert(::Type{Arb{P}}, x::AbstractFloat) where {P} = Arb{P}(x)
convert(::Type{Acb{P}}, x::AbstractFloat) where {P} = Acb{P}(x)
convert(::Type{Acb{P}}, x::Complex) where {P} = Acb{P}(x)

convert(::Type{Arf{P}}, x::Arf{Q}) where {P,Q} = Arf{P}(x)
convert(::Type{Arb{P}}, x::Arb{Q}) where {P,Q} = Arb{P}(x)
convert(::Type{Acb{P}}, x::Acb{Q}) where {P,Q} = Acb{P}(x)
convert(::Type{Arf{P}}, x::Arb{Q}) where {P,Q} = Arf{P}(Arb{P}(x))
convert(::Type{Arf{P}}, x::Acb{Q}) where {P,Q} = Arf{P}(Arb{P}(real(x)))
convert(::Type{Arb{P}}, x::Arf{Q}) where {P,Q} = Arb{P}(Arf{P}(x))
convert(::Type{Arb{P}}, x::Acb{Q}) where {P,Q} = Arb{P}(real(x))
convert(::Type{Acb{P}}, x::Arf{Q}) where {P,Q} = Acb{P}(Arf{P}(x))
convert(::Type{Acb{P}}, x::Arb{Q}) where {P,Q} = Acb{P}(Arb{P}(x))
