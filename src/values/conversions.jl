# IEEEFloat

# rounds up (widens)
function Float64(x::Mag)
    z = ccall(@libarb(mag_get_d), Float64, (Ref{Mag},), x)
    return z
end

function Float64(x::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    rounding = match_rounding_mode(roundingmode)
    z = ccall(@libarb(arf_get_d), Float64, (Ref{Arf}, Cint), x, rounding)
    return z
end
Float32(x::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::Arf{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::Arb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    x = midpoint(x)
    y = Arf{P}(x)
    Float64(y, roundingmode)
end
Float32(x::Arb{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::Arb{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

function Float64(x::Acb{P}, roundingmode::RoundingMode=RoundNearest) where {P}
    x = midpoint(real(x))
    y = Arf{P}(x)
    Float64(y, roundingmode)
end
Float32(x::Acb{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float32(Float64(x, roundingmode))
Float16(x::Acb{P}, roundingmode::RoundingMode=RoundNearest) where {P} = Float16(Float64(x, roundingmode))

# parts

function real(x::Acb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{Arb}, Ref{Acb}), z, x)
    return z
end

function imag(x::Acb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{Arb}, Ref{Acb}), z, x)
    return z
end

function arg(x::Acb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(acb_arg), Cvoid, (Ref{Arb}, Ref{Acb}, Clong), z, x, P)
    return z
end


# change precision

function Arf{P}(x::Arf{Q}, roundingmode::RoundingMode) where {P,Q}
    rounding = match_rounding_mode(roundingmode)
    z = Arf{P}()
    rnd = ccall(@libarb(arf_set_round), Cint,
                (Ref{Arf}, Ref{Arf}, Clong, Cint), z, x, P, rounding)
    return z
end
Arf{P}(x::Arf{Q}) where {P,Q} = Arf{P}(x, RoundNearest)

function Arb{P}(x::Arb{Q}) where {P,Q}
    z = Arb{P}()
    ccall(@libarb(arb_set_round), Cvoid,
          (Ref{Arb}, Ref{Arb}, Clong), z, x, P)
    return z
end

function Acb{P}(x::Acb{Q}) where {P,Q}
    z = Acb{P}()
    ccall(@libarb(acb_set_round), Cvoid,
          (Ref{Acb}, Ref{Acb}, Clong), z, x, P)
    return z
end
