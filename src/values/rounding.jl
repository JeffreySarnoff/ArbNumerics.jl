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
    
    round(::Type{T}, x::$A{P}, rounding::RoundingMode=RoundNearest) where {P,T} =
       T(round(x, P, rounding))

    
for A in (:ArbFloat, :ArbReal, :ArbComplex)
  @eval begin
    
    round(::Type{T}, x::$A{P}, rounding::RoundingMode=RoundNearest) where {P,T} =
       T(round(x, P, rounding))

    function round(x::$A{P}, rounding::RoundingMode=RoundNearest; 
                   sigdigits::Integer = 0, digits::Integer = 0, base = 10) where {P}
        sigdigits = max(sigdigits, digits) 
        if base == 10
            round(x, digits4bits(sigdigits), rounding) 
        elseif base ==  2
            round(x, sigdigits, rounding)
        else
            throw(DomainError("base ($base) not supported"))
        end
     end
  end
                
end


