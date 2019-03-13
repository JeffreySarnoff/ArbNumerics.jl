for T in (:Int8, :Int16, :Int32, :Int64, :Int128, :Float16, :Float32, :Float64)
    @eval begin
        promote_type(::Type{ArbComplex}, ::Type{$T}) = ArbComplex
        promote_type(::Type{ArbReal}, ::Type{$T}) = ArbReal
        promote_type(::Type{ArbFloat}, ::Type{$T}) = ArbFloat
        
        promote_type(::Type{ArbComplex{P}}, ::Type{$T}) where {P} = ArbComplex{P}
        promote_type(::Type{ArbReal{P}}, ::Type{$T}) where {P} = ArbReal{P}
        promote_type(::Type{ArbFloat{P}}, ::Type{$T}) where {P} = ArbFloat{P}

        promote_rule(::Type{ArbComplex}, ::Type{$T}) = ArbComplex
        promote_rule(::Type{ArbReal}, ::Type{$T}) = ArbReal
        promote_rule(::Type{ArbFloat}, ::Type{$T}) = ArbFloat
        
        promote_rule(::Type{ArbComplex{P}}, ::Type{$T}) where {P} = ArbComplex{P}
        promote_rule(::Type{ArbReal{P}}, ::Type{$T}) where {P} = ArbReal{P}
        promote_rule(::Type{ArbFloat{P}}, ::Type{$T}) where {P} = ArbFloat{P}        
    end
end
        
promote_type(::Type{ArbComplex}, ::Type{ArbReal}) = ArbComplex
promote_type(::Type{ArbComplex}, ::Type{ArbFloat}) = ArbComplex
promote_type(::Type{ArbReal}, ::Type{ArbFloat}) = ArbReal

promote_rule(::Type{ArbComplex}, ::Type{ArbReal}) = ArbComplex
promote_rule(::Type{ArbComplex}, ::Type{ArbFloat}) = ArbComplex
promote_rule(::Type{ArbReal}, ::Type{ArbFloat}) = ArbReal

promote_type(::Type{ArbComplex{P}}, ::Type{ArbReal{P}}) where {P} = ArbComplex{P}
promote_type(::Type{ArbComplex{P}}, ::Type{ArbFloat{P}}) where {P} = ArbComplex{P}
promote_type(::Type{ArbReal{P}}, ::Type{ArbFloat{P}}) where {P} = ArbReal{P}

promote_rule(::Type{ArbComplex{P}}, ::Type{ArbReal{P}}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{ArbFloat{P}}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbReal{P}}, ::Type{ArbFloat{P}}) where {P} = ArbReal{P}

promote_rule(::Type{ArbComplex{P}}, ::Type{Mag}) where {P} = ArbComplex{P}
promote_rule(::Type{ArbReal{P}}, ::Type{Mag}) where {P} = ArbReal{P}
promote_rule(::Type{ArbFloat{P}}, ::Type{Mag}) where {P} = ArbFloat{P}

promote_type(::Type{ArbFloat{P}}, ::Type{BigInt}) where {P} = ArbFloat{P}
promote_type(::Type{ArbReal{P}}, ::Type{BigInt}) where {P} = ArbReal{P}
promote_type(::Type{ArbComplex{P}}, ::Type{BigInt}) where {P} = ArbComplex{P}

promote_type(::Type{ArbFloat{P}}, ::Type{Rational{I}}) where {P,I} = ArbFloat{P}
promote_type(::Type{ArbReal{P}}, ::Type{Rational{I}}) where {P,I} = ArbReal{P}
promote_type(::Type{ArbComplex{P}}, ::Type{Rational{I}}) where {P,I} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{BigInt}) where {P} = promote_type(ArbFloat{P}, BigInt)
promote_rule(::Type{ArbReal{P}}, ::Type{BigInt}) where {P} = promote_type(ArbReal{P}, BigInt)
promote_rule(::Type{ArbComplex{P}}, ::Type{BigInt}) where {P} = promote_type(ArbComplex{P}, BigInt)

promote_rule(::Type{ArbFloat{P}}, ::Type{Rational{I}}) where {P,I} = promote_type(ArbFloat{P}, Rational{I})
promote_rule(::Type{ArbReal{P}}, ::Type{Rational{I}}) where {P,I} = promote_type(ArbReal{P}, Rational{I})
promote_rule(::Type{ArbComplex{P}}, ::Type{Rational{I}}) where {P,I} = promote_type(ArbComplex{P}, Rational{I})

promote_type(::Type{BigFloat},::Type{ArbFloat{P}}) where {P} = ArbFloat{P}
promote_type(::Type{BigFloat},::Type{ArbReal{P}}) where {P} = ArbReal{P}
promote_type(::Type{BigFloat},::Type{ArbComplex{P}}) where {P} = ArbComplex{P}
promote_type(::Type{ArbFloat{P}}, ::Type{BigFloat}) where {P} = ArbFloat{P}
promote_type(::Type{ArbReal{P}}, ::Type{BigFloat}) where {P} = ArbReal{P}
promote_type(::Type{ArbComplex{P}}, ::Type{BigFloat}) where {P} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{BigFloat}) where {P} = promote_type(ArbFloat{P}, BigFloat)
promote_rule(::Type{ArbReal{P}}, ::Type{BigFloat}) where {P} = promote_type(ArbReal{P}, BigFloat)
promote_rule(::Type{ArbComplex{P}}, ::Type{BigFloat}) where {P} = promote_type(ArbComplex{P}, BigFloat)

promote_rule(::Type{ArbFloat{P}}, ::Type{I}) where {P, I<:Integer} = ArbFloat{P}
promote_rule(::Type{ArbReal{P}}, ::Type{I}) where {P, I<:Integer} = ArbReal{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{I}) where {P, I<:Integer} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbFloat{P}
promote_rule(::Type{ArbReal{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbReal{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{F}) where {P, F<:AbstractFloat} = ArbComplex{P}
promote_rule(::Type{ArbComplex{P}}, ::Type{C}) where {P, C<:Complex} = ArbComplex{P}

promote_rule(::Type{ArbFloat{P}}, x::ArbFloat{Q}) where {P,Q} =
    P>Q ? ArbFloat{P} : ArbFloat{Q}
promote_rule(::Type{ArbReal{P}}, x::ArbReal{Q}) where {P,Q} =
    P>Q ? ArbReal{P} : ArbReal{Q}
promote_rule(::Type{ArbComplex{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}
promote_rule(::Type{ArbFloat{P}}, x::ArbReal{Q}) where {P,Q} =
    P>Q ? ArbReal{P} : ArbReal{Q}
promote_rule(::Type{ArbFloat{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}
promote_rule(::Type{ArbReal{P}}, x::ArbComplex{Q}) where {P,Q} =
    P>Q ? ArbComplex{P} : ArbComplex{Q}

promote_rule(::Type{ArbFloat{P}},::Type{ArbFloat{Q}}) where {P,Q} = P<Q ? ArbFloat{P} : ArbFloat{Q}
promote_rule(::Type{ArbReal{P}},::Type{ArbReal{Q}}) where {P,Q} = P<Q ? ArbReal{P} : ArbReal{Q}
promote_rule(::Type{ArbComplex{P}},::Type{ArbComplex{Q}}) where {P,Q} = P<Q ? ArbComplex{P} : ArbComplex{Q}

promote_rule(::Type{<:AbstractIrrational}, ::Type{ArbFloat{P}}) where {P} = ArbFloat{P}
promote_rule(::Type{<:AbstractIrrational}, ::Type{ArbReal{P}}) where {P} = ArbReal{P}
promote_rule(::Type{<:AbstractIrrational}, ::Type{ArbComplex{P}}) where {P} = ArbComplex{P}

convert(::Type{ArbFloat}, x::ArbFloat{P}) where {P} = x
convert(::Type{ArbReal}, x::ArbReal{P}) where {P} = x
convert(::Type{ArbComplex}, x::ArbComplex{P}) where {P} = x
convert(::Type{ArbFloat}, x::ArbReal{P}) where {P} = ArbFloat{P}(x)
convert(::Type{ArbFloat}, x::ArbComplex{P}) where {P} = ArbFloat{P}(real(x))
convert(::Type{ArbReal}, x::ArbComplex{P}) where {P} = real(x)
convert(::Type{ArbReal}, x::ArbFloat{P}) where {P} = ArbReal{P}(x)
convert(::Type{ArbComplex}, x::ArbFloat{P}) where {P} = ArbComplex{P}(x)

convert(::Type{ArbReal{P}}, x::ArbComplex{P}) where {P} = real(x)
convert(::Type{ArbFloat{P}}, x::ArbComplex{P}) where {P} = midpoint(real(x), ArbFloat{P})
convert(::Type{Mag}, x::ArbComplex{P}) where {P} = radius(real(x), Mag)

convert(::Type{ArbComplex{P}}, x::ArbReal{P}) where {P} = ArbComplex{P}(x)
convert(::Type{ArbComplex{P}}, x::ArbFloat{P}) where {P} = ArbComplex{P}(ArbReal{P}(x))
convert(::Type{ArbComplex{P}}, x::Mag) where {P} = ArbComplex{P}(ArbFloat{P}(x))

convert(::Type{ArbFloat{P}}, x::ArbReal{P}) where {P} = midpoint(x, ArbFloat{P})
convert(::Type{Mag}, x::ArbReal{P}) where {P} = radius(x, Mag)

convert(::Type{ArbReal{P}}, x::ArbFloat{P}) where {P} = ArbReal{P}(x)
convert(::Type{ArbReal{P}}, x::Mag) where {P} = ArbReal{P}(ArbFloat{P}(x))

convert(::Type{Mag}, x::ArbFloat{P}) where {P} = Mag(x)
convert(::Type{ArbFloat{P}}, x::Mag) where {P} = ArbFloat{P}(x)

convert(::Type{ArbFloat{P}}, x::BigFloat) where {P} = ArbFloat{P}(x)
convert(::Type{ArbReal{P}}, x::BigFloat) where {P} = ArbReal{P}(x)
convert(::Type{ArbComplex{P}}, x::BigFloat) where {P} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::BigInt) where {P} = ArbFloat{P}(x)
convert(::Type{ArbReal{P}}, x::BigInt) where {P} = ArbReal{P}(x)
convert(::Type{ArbComplex{P}}, x::BigInt) where {P} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::I) where {P, I<:Integer} = ArbFloat{P}(x)
convert(::Type{ArbReal{P}}, x::I) where {P, I<:Integer} = ArbReal{P}(x)
convert(::Type{ArbComplex{P}}, x::I) where {P, I<:Integer} = ArbComplex{P}(x)

convert(::Type{ArbFloat{P}}, x::Rational{I}) where {P, I} = ArbFloat{P}(x.num) / ArbFloat{P}(x.den)
convert(::Type{ArbReal{P}}, x::Rational{I}) where {P, I} = ArbReal{P}(x.num) / ArbReal{P}(x.den)
convert(::Type{ArbComplex{P}}, x::Rational{I}) where {P, I} = ArbComplex{P}(ArbReal{P}(x))

function rationalize(::Type{I}, x::ArbFloat{P}) where {P,I<:Integer}
    oldprec = precision(BigFloat)
    setprecision(BigFloat, P)
    y = BigFloat(x)
    z = rationalize(I, y)
    setprecision(BigFloat, oldprec)
    return z
end

rationalize(::Type{I}, x::ArbReal{P}) where {P, I<:Integer} = rationalize(I, ArbFloat{P}(x))
rationalize(::Type{I}, x::ArbComplex{P}) where {P, I<:Integer} = Complex{I}(rationalize(I, ArbFloat{P}(real(x))), rationalize(I, ArbFloat{P}(imag(x))))

rationalize(x::ArbFloat{P}) where {P} = rationalize(Int64, x)
rationalize(x::ArbReal{P}) where {P} = rationalize(Int64, ArbFloat{P}(x))
rationalize(x::ArbComplex{P}) where {P} = Complex{Int64}(rationalize(Int64, ArbFloat{P}(real(x))), rationalize(Int64, ArbFloat{P}(imag(x))))

convert(::Type{Rational{I}}, x::ArbFloat{P}) where {P, I} = rationalize(I, x)
convert(::Type{Rational{I}}, x::ArbReal{P}) where {P, I} = rationalize(I, x)
convert(::Type{Rational{I}}, x::ArbComplex{P}) where {P, I} = rationalize(I, x)

convert(::Type{ArbFloat{P}}, x::AbstractFloat) where {P} = ArbFloat{P}(x)
convert(::Type{ArbReal{P}}, x::AbstractFloat) where {P} = ArbReal{P}(x)
convert(::Type{ArbComplex{P}}, x::AbstractFloat) where {P} = ArbComplex{P}(x)
convert(::Type{ArbComplex{P}}, x::Complex) where {P} = ArbComplex{P}(x)
