@inline function ArbFloat(x)
    prec = DEFAULT_PRECISION.x
    res  = ArbFloat{prec}(x)
    return res
end
@inline function ArbReal(x)
    prec = DEFAULT_PRECISION.x
    res  = ArbReal{prec}(x)
    return res
end

@inline function ArbComplex(x)
    prec = DEFAULT_PRECISION.x
    res  = ArbComplex{prec}(x)
    return res
end

@inline function ArbComplex(x, y)
    prec = DEFAULT_PRECISION.x
    res  = ArbComplex{prec}(x, y)
    return res
end

@inline function ArbComplex(x::I, y::T) where {I<:Integer, T<:AbstractFloat}
    prec = DEFAULT_PRECISION.x
    res  = ArbComplex{prec}(T(x), y)
    return res
end

@inline function ArbComplex(x::T, y::I) where {I<:Integer, T<:AbstractFloat}
    prec = DEFAULT_PRECISION.x
    res  = ArbComplex{prec}(x, T(y))
    return res
end

# IEEEFloat

# rounds up (widens)
function Float64(x::Mag)
    z = ccall(@libarb(mag_get_d), Float64, (Ref{Mag},), x)
    return z
end

function Float64(x::ArbFloat{P}) where {P}
    rounding = match_rounding_mode(RoundNearest)
    z = ccall(@libarb(arf_get_d), Float64, (Ref{ArbFloat}, Cint), x, rounding)
    return z
end
Float32(x::ArbFloat{P}) where {P} = Float32(Float64(x))
Float16(x::ArbFloat{P}) where {P} = Float16(Float64(x))

function Float64(x::ArbReal{P}) where {P}
    x = midpoint(x)
    y = ArbFloat{P}(x)
    Float64(y)
end
Float32(x::ArbReal{P}) where {P} = Float32(Float64(x))
Float16(x::ArbReal{P}) where {P} = Float16(Float64(x))

function Float64(x::ArbComplex{P}) where {P}
    x = midpoint(real(x))
    y = ArbFloat{P}(x)
    Float64(y)
end
Float32(x::ArbComplex{P}) where {P} = Float32(Float64(x))
Float16(x::ArbComplex{P}) where {P} = Float16(Float64(x))

function Float64(x::ArbFloat{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_d), Float64, (Ref{ArbFloat}, Cint), x, rounding)
    return z
end
Float32(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbFloat{P}, roundingmode::RoundingMode) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::ArbReal{P}, roundingmode::RoundingMode) where {P}
    x = midpoint(x)
    y = ArbFloat{P}(x)
    Float64(y, roundingmode)
end
Float32(x::ArbReal{P}, roundingmode::RoundingMode) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbReal{P}, roundingmode::RoundingMode) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::ArbComplex{P}, roundingmode::RoundingMode) where {P}
    x = midpoint(real(x))
    y = ArbFloat{P}(x)
    Float64(y, roundingmode)
end
Float32(x::ArbComplex{P}, roundingmode::RoundingMode) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbComplex{P}, roundingmode::RoundingMode) where {P} = Float16(Float64(x, roundingmode))


function Complex{T}(x::ArbComplex{P}, roundingmode::RoundingMode) where {P, T<:IEEEFloat}
   re = T(real(x), roundingmode)
   im = T(imag(x), roundingmode)
   return Complex{T}(re, im)
end

Complex{T}(x::ArbComplex{P}) where {P, T<:IEEEFloat} = Complex{T}(x, RoundNearest)
Complex(x::ArbComplex{P}) where {P} = Complex{Float64}(x, RoundNearest)

# integers

for I in (:Int8, :Int16, :Int32, :Int64, :Int128)
  @eval begin
        
    function $I(x::ArbFloat{P}) where {P}
        !isinteger(x) && throw(InexactError("$(x) is not an integer"))
        bi = BigInt(BigFloat(x))
        !(typemin($I) <= bi <= typemax($I)) && throw(InexactError("$(x)"))
        return $I(bi)
    end

    function $I(x::ArbReal{P}) where {P}   
        (!isexact(x) | !isinteger(x)) && throw(InexactError("$(x) is not an integer"))
        bi = BigInt(BigFloat(x))
        !(typemin($I) <= bi <= typemax($I)) && throw(InexactError("$(x)"))
        return $I(bi)
    end

    function $I(x::ArbComplex{P}) where {P}   
        (!isexact(x) | !isinteger(x) | !iszero(imag(x))) && throw(InexactError("$(x) is not an integer"))
        bi = BigInt(BigFloat(x))
        !(typemin($I) <= bi <= typemax($I)) && throw(InexactError("$(x)"))
        return $I(bi)
    end        
        
  end
end

# rational

ArbFloat(x::T) where {S, T<:Rational{S}} = ArbFloat(x.num)/ArbFloat(x.den)
ArbReal(x::T) where {S, T<:Rational{S}} = ArbReal(ArbFloat(x))
ArbComplex(x::T) where {S, T<:Rational{S}} = ArbComplex(ArbReal(x))

# fallback

ArbFloat{P}(x::T) where {P,T<:Real} = ArbFloat{P}(BigFloat(x))
ArbFloat(x::T) where {T<:Real} = ArbFloat{workingprecision(ArbFloat)}(BigFloat(x))
ArbFloat{P}(x::T) where {P,T<:Complex} = ArbFloat{P}(BigFloat(real(x)))
ArbFloat(x::T) where {T<:Complex} = ArbFloat{workingprecision(ArbFloat)}(BigFloat(real(x)))

ArbReal{P}(x::T) where {P,T<:Real} = ArbReal{P}(BigFloat(x))
ArbReal(x::T) where {T<:Real} = ArbReal{workingprecision(ArbReal)}(BigFloat(real(x)))
ArbReal{P}(x::T) where {P,T<:Complex} = ArbReal{P}(BigFloat(x))
ArbReal(x::T) where {T<:Complex} = ArbReal{workingprecision(ArbReal)}(BigFloat(real(x)))

ArbComplex{P}(x::BigInt) where {P} = ArbComplex{P}(ArbReal{P}(x))
ArbComplex{P}(x::BigFloat) where {P} = ArbComplex{P}(ArbReal{P}(x))
ArbComplex{P}(x::T) where {P,T<:Real} = ArbComplex{P}(BigFloat(x))
#ArbComplex(x::T) where {T<:Real} = ArbComplex{workingprecision(ArbComplex)}(BigFloat(x))
ArbComplex{P}(x::T, y::T) where {P,T<:Real} = ArbComplex{P}(BigFloat(x), BigFloat(y))
#ArbComplex(x::T, y::T) where {T<:Real} = ArbComplex{workingprecision(ArbComplex)}(BigFloat(x), BigFloat(y))
ArbComplex{P}(x::T) where {P,T<:Complex} = ArbComplex{P}(BigFloat(real(x)), BigFloat(imag(x)))
ArbComplex(x::T) where {T<:Complex} = ArbComplex{workingprecision(ArbComplex)}(BigFloat(real(x)), BigFloat(imag(x)))

# retype

ArbFloat(x::ArbReal{P}) where {P} = ArbFloat{P}(x)
ArbFloat(x::ArbComplex{P}) where {P} = ArbFloat{P}(real(x))
ArbReal(x::ArbFloat{P}) where {P} = ArbReal{P}(x)
ArbReal(x::ArbComplex{P}) where {P} = ArbReal{P}(real(x))
# ArbComplex(x::ArbFloat{P}) where {P} = ArbComplex{P}(ArbReal{P}(x))
# ArbComplex(x::ArbReal{P}) where {P} = ArbComplex{P}(x)

ArbFloat{Q}(x::ArbReal{P}) where {P,Q} = ArbFloat{Q}(ArbReal{Q}(x))
ArbFloat{Q}(x::ArbComplex{P}) where {P,Q} = ArbFloat{Q}(ArbReal{Q}(real(x)))
ArbReal{Q}(x::ArbFloat{P}) where {P,Q} = ArbReal{Q}(ArbFloat{Q}(x))
ArbReal{Q}(x::ArbComplex{P}) where {P,Q} = ArbReal{Q}(real(x))
ArbComplex{Q}(x::ArbFloat{P}) where {P,Q} = ArbComplex{Q}(ArbReal{Q}(ArbFloat{Q}(x)))
ArbComplex{Q}(x::ArbReal{P}) where {P,Q} = ArbComplex{Q}(ArbReal{Q}(x))


@inline convert(::Type{ArbFloat{Q}}, x::ArbReal{P}) where {P,Q} = ArbFloat{Q}(x)
@inline convert(::Type{ArbFloat{Q}}, x::ArbComplex{P}) where {P,Q} = ArbFloat{Q}(x)
@inline convert(::Type{ArbReal{Q}}, x::ArbFloat{P}) where {P,Q} = ArbReal{Q}(x)
@inline convert(::Type{ArbReal{Q}}, x::ArbComplex{P}) where {P,Q} = ArbReal{Q}(x)
@inline convert(::Type{ArbComplex{Q}}, x::ArbFloat{P}) where {P,Q} = ArbComplex{Q}(x)
@inline convert(::Type{ArbComplex{Q}}, x::ArbReal{P}) where {P,Q} = ArbComplex{Q}(x)


# change precision

function ArbFloat{P}(x::ArbFloat{Q}, roundingmode::RoundingMode) where {P,Q}
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_set_round), Cint,
                (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end
ArbFloat{P}(x::ArbFloat{Q}) where {P,Q} = ArbFloat{P}(x, RoundNearest)

function ArbReal{P}(x::ArbReal{Q}) where {P,Q}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_round), Cvoid,
          (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, P)
    return z
end

function ArbComplex{P}(x::ArbComplex{Q}) where {P,Q}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_round), Cvoid,
          (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

# widen

widen(::Type{ArbFloat{P}}) where {P} = ArbFloat{P+P+4}
widen(::Type{ArbReal{P}}) where {P} = ArbReal{P+P+4}
widen(::Type{ArbComplex{P}}) where {P} = ArbComplex{P+P+4}
