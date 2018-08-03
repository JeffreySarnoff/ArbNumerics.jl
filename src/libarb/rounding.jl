function round(x::ArbFloat{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    z = ArbFloat{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

function round(x::ArbReal{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    z = ArbReal{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arb_set_round), Cint, (Ref{ArbReal}, Ref{ArbReal}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

function round(x::ArbComplex{P}, bitprecision::Int, roundingmode::RoundingMode) where {P}
    z = ArbComplex{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(acb_set_round), Cint, (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

for A in (:ArbFloat, :ArbReal, :ArbComplex)
  @eval begin
    round(x::$A{P}, rounding::RoundingMode=RoundNearest) = round(x, P, roundingmode)
    
    round(::Type{T}, x::$A{P}, rounding::RoundingMode=RoundNearest) = T(round(x, P, rounding))

    round(x::$A, rounding::RoundingMode=RoundNearest; digits::Integer = 0, base = 10) =
        base == 10 ? round(x, digits4bits(sigdigits), rounding) : 
        base ==  2 ? round(x, sigdigits, rounding) : throw(DomainError("base ($base) not supported"))
        
    round(x::$A, rounding::RoundingMode=RoundNearest; sigdigits::Integer, base = 10) =
        base == 10 ? round(x, digits4bits(sigdigits), rounding) : 
        base ==  2 ? round(x, sigdigits, rounding) : throw(DomainError("base ($base) not supported"))
  end
end


