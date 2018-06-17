# IEEEFloat

# rounds up (widens)
function Float64(x::Mag)
    z = ccall(@libarb(mag_get_d), Float64, (Ref{Mag},), x)
    return z
end

function Float64(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_d), Float64, (Ref{ArbFloat}, Cint), x, rounding)
    return z
end
Float32(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbFloat{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::ArbBall{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    x = midpoint(x)
    y = ArbFloat{P}(x)
    Float64(y, roundingmode)
end
Float32(x::ArbBall{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbBall{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::ArbComplex{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    x = midpoint(real(x))
    y = ArbFloat{P}(x)
    Float64(y, roundingmode)
end
Float32(x::ArbComplex{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::ArbComplex{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

# parts

function real(x::ArbComplex{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{ArbBall}, Ref{ArbComplex}), z, x)
    return z
end

function imag(x::ArbComplex{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{ArbBall}, Ref{ArbComplex}), z, x)
    return z
end

function arg(x::ArbComplex{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(acb_arg), Cvoid, (Ref{ArbBall}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

# retype

ArbFloat(x::ArbBall{P}) where {P} = ArbFloat{P}(x)
ArbFloat(x::ArbComplex{P}) where {P} = ArbFloat{P}(real(x))
ArbBall(x::ArbFloat{P}) where {P} = ArbBall{P}(x)
ArbBall(x::ArbComplex{P}) where {P} = ArbBall{P}(real(x))
# ArbComplex(x::ArbFloat{P}) where {P} = ArbComplex{P}(ArbBall{P}(x))
# ArbComplex(x::ArbBall{P}) where {P} = ArbComplex{P}(x)

ArbFloat{Q}(x::ArbBall{P}) where {P,Q} = ArbFloat{Q}(ArbBall{Q}(x))
ArbFloat{Q}(x::ArbComplex{P}) where {P,Q} = ArbFloat{Q}(ArbBall{Q}(real(x)))
ArbBall{Q}(x::ArbFloat{P}) where {P,Q} = ArbBall{Q}(ArbFloat{Q}(x))
ArbBall{Q}(x::ArbComplex{P}) where {P,Q} = ArbBall{Q}(real(x))
ArbComplex{Q}(x::ArbFloat{P}) where {P,Q} = ArbComplex{Q}(ArbBall{Q}(ArbFloat{Q}(x)))
ArbComplex{Q}(x::ArbBall{P}) where {P,Q} = ArbComplex{Q}(ArbBall{Q}(x))


@inline convert(::Type{ArbFloat{Q}}, x::ArbBall{P}) where {P,Q} = ArbFloat{Q}(x)
@inline convert(::Type{ArbFloat{Q}}, x::ArbComplex{P}) where {P,Q} = ArbFloat{Q}(x)
@inline convert(::Type{ArbBall{Q}}, x::ArbFloat{P}) where {P,Q} = ArbBall{Q}(x)
@inline convert(::Type{ArbBall{Q}}, x::ArbComplex{P}) where {P,Q} = ArbBall{Q}(x)
@inline convert(::Type{ArbComplex{Q}}, x::ArbFloat{P}) where {P,Q} = ArbComplex{Q}(x)
@inline convert(::Type{ArbComplex{Q}}, x::ArbBall{P}) where {P,Q} = ArbComplex{Q}(x)



# change precision

function ArbFloat{P}(x::ArbFloat{Q}, roundingmode::RoundingMode) where {P,Q}
    rounding = match_rounding_mode(roundingmode)
    z = ArbFloat{P}()
    rnd = ccall(@libarb(arf_set_round), Cint,
                (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, P, rounding)
    return z
end
ArbFloat{P}(x::ArbFloat{Q}) where {P,Q} = ArbFloat{P}(x, RoundNearest)

function ArbBall{P}(x::ArbBall{Q}) where {P,Q}
    z = ArbBall{P}()
    ccall(@libarb(arb_set_round), Cvoid,
          (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, P)
    return z
end

function ArbComplex{P}(x::ArbComplex{Q}) where {P,Q}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_round), Cvoid,
          (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end
