round(x::ArbFloat{P}, ::RoundingMode{:Up}) where {P} = ceil(x)
round(x::ArbFloat{P}, ::RoundingMode{:Down}) where {P} = floor(x)
round(x::ArbFloat{P}, ::RoundingMode{:ToZero}) where {P} = signbit(x) ? ceil(x) : floor(x)
round(x::ArbFloat{P}, ::RoundingMode{:FromZero}) where {P} = signbit(x) ? floor(x) : ceil(x)

function round(x::ArbFloat{P}, ::RoundingMode{:Nearest}) where {P}
    absx = abs(x)
    fl = floor(absx)
    cl = fl + 1
    xfl = absx - fl
    xcl = cl - absx
    if xfl < xcl
        copysign(fl, x)
    elseif xfl > xcl
        copysign(cl, x)
    elseif iseven(BigInt(fl))
        copysign(fl, x)
    else
        copysign(cl, x)
    end
end

round(x::ArbReal{P}, ::RoundingMode{:Up}) where {P} = ceil(ArbFloat{P}(x))
round(x::ArbReal{P}, ::RoundingMode{:Down}) where {P} = floor(ArbFloat{P}(x))
round(x::ArbReal{P}, ::RoundingMode{:ToZero}) where {P} = round(ArbFloat{P}(x), RoundToZero)
round(x::ArbReal{P}, ::RoundingMode{:FromZero}) where {P} = round(ArbFloat{P}(x), RoundFromZero)
round(x::ArbReal{P}, ::RoundingMode{:Nearest}) where {P} = round(ArbFloat{P}(x), RoundNearest)

#=
function round(x::ArbComplex{P}, roundingmode::RoundingMode) where {P}
    z = ArbComplex{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(acb_set_round), Cint, (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Cint), z, x, P, rounding)
    return z
end
=#

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
       T(round(x, digits=P, base=rounding))

    function round(x::$A{P}, rounding::RoundingMode=RoundNearest; 
                   sigdigits::Integer = 0, digits::Integer = 0, base = 10) where {P}
        sigdigits = max(sigdigits, digits) 
        if base == 10
            round(x, digits=digits4bits(sigdigits), base=rounding) 
        elseif base ==  2
            round(x, digits=sigdigits, base=rounding)
        else
            throw(DomainError("base ($base) not supported"))
        end
     end
  end
                
end


