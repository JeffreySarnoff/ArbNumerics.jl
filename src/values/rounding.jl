round(x::ArbFloat{P}, ::RoundingMode{:Up}) where {P} = ceil(x)
round(x::ArbFloat{P}, ::RoundingMode{:Down}) where {P} = floor(x)
round(x::ArbFloat{P}, ::RoundingMode{:ToZero}) where {P} = signbit(x) ? ceil(x) : floor(x)
round(x::ArbFloat{P}, ::RoundingMode{:FromZero}) where {P} = signbit(x) ? floor(x) : ceil(x)

round(x::ArbReal{P}, ::RoundingMode{:Up}) where {P} = ArbReal(round(ArbFloat(x), RoundUp))
round(x::ArbReal{P}, ::RoundingMode{:Down}) where {P} = ArbReal(round(ArbFloat(x), RoundDown))
round(x::ArbReal{P}, ::RoundingMode{:ToZero}) where {P} = ArbReal(round(ArbFloat(x), RoundToZero))
round(x::ArbReal{P}, ::RoundingMode{:FromZero}) where {P} = ArbReal(round(ArbFloat(x), RoundFromZero))

round(x::ArbComplex{P}, ::RoundingMode{:Up}) where {P} =
    ArbComplex(ArbReal(round(ArbFloat(real(x)), RoundUp)),
               ArbReal(round(ArbFloat(imag(x)), RoundUp)) )
round(x::ArbComplex{P}, ::RoundingMode{:Down}) where {P} =
    ArbComplex(ArbReal(round(ArbFloat(real(x)), RoundDown)),
               ArbReal(round(ArbFloat(imag(x)), RoundDown)) )
round(x::ArbComplex{P}, ::RoundingMode{:ToZero}) where {P} =
    ArbComplex(ArbReal(round(ArbFloat(real(x)), RoundToZero)),
               ArbReal(round(ArbFloat(imag(x)), RoundToZero)) )
round(x::ArbComplex{P}, ::RoundingMode{:FromZero}) where {P} =
    ArbComplex(ArbReal(round(ArbFloat(real(x)), RoundFromZero)),
               ArbReal(round(ArbFloat(imag(x)), RoundFromZero)) )

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

round(x::ArbReal{P}, ::RoundingMode{:Nearest}) where {P} =
    ArbReal(round(ArbFloat(x), RoundNearest))
round(x::ArbComplex{P}, ::RoundingMode{:Nearest}) where {P} =
    ArbComplex(ArbReal(round(ArbFloat(real(x)), RoundNearest)),
               ArbReal(round(ArbFloat(imag(x)), RoundNearest)) )

#=
round(x::ArbFloat{P}) where {P} = round(x, RoundNearest)
round(x::ArbReal{P}) where {P} = round(x, RoundNearest)
round(x::ArbComplex{P}) where {P} = round(x, RoundNearest)

round!(x::ArbFloat{P}) where {P} = round!(x, RoundNearest)
round!(x::ArbReal{P}) where {P} = round!(x, RoundNearest)
round!(x::ArbComplex{P}) where {P} = round!(x, RoundNearest)
=#

round(x::ArbFloat; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round(x,RoundNearest) : round(x,RoundNearest,sigdigits=sigdigits,base=base)
round(x::ArbReal; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round(x,RoundNearest) : round(x,RoundNearest,sigdigits=sigdigits,base=base)
round(x::ArbComplex; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round(x,RoundNearest) : round(x,RoundNearest,sigdigits=sigdigits,base=base)

round!(x::ArbFloat; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round!(x,RoundNearest) : round!(x,RoundNearest,sigdigits=sigdigits,base=base)
round!(x::ArbReal; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round!(x,RoundNearest) : round!(x,RoundNearest,sigdigits=sigdigits,base=base)
round!(x::ArbComplex; sigdigits::Integer=0, base::Integer=10) = sigdigits==0 ? round!(x,RoundNearest) : round!(x,RoundNearest,sigdigits=sigdigits,base=base)

#=
function round(x::ArbComplex{P}, roundingmode::RoundingMode) where {P}
    z = ArbComplex{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(acb_set_round), Cint, (Ref{ArbComplex}, Ref{ArbComplex}, Clong, Cint), z, x, P, rounding)
    return z
end
=#

# int arf_set_round(arf_t res, const arf_t x, slong prec, arf_rnd_t rnd)
function roundbits(x::ArbFloat{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    sigbits >= P && return ArbFloat{sigbits}(x)
    z = ArbFloat{P}()
    rounding = match_rounding_mode(roundingmode)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, sigbits, rounding)
    return z
end

roundbits(x::ArbFloat{P}, sigbits::Int) where {P} = roundbits(x, RoundNearest, sigbits)

function roundbits!(x::ArbFloat{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    z = roundbits(x, roundingmode, sigbits)
    return ArbFloat{sigbits+extrabits()}(z)
end

roundbits!(x::ArbFloat{P}, sigbits::Int) where {P} = roundbits!(x, RoundNearest, sigbits)

rounddigits(x::ArbFloat{P}, roundingmode::RoundingMode, digits::Int) where {P} =
    roundbits(x, roundingmode, bits4digits(digits))

rounddigits(x::ArbFloat{P}, digits::Int) where {P} = roundbits(x, RoundNearest, bits4digits(digits))

rounddigits!(x::ArbFloat{P}, roundingmode::RoundingMode, digits::Int) where {P} =
    roundbits!(x, roundingmode, bits4digits(digits))

rounddigits!(x::ArbFloat{P}, digits::Int) where {P} = roundbits!(x, RoundNearest, bits4digits(digits))

function roundbits(x::ArbReal{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    sigbits >= P && return ArbReal{sigbits}(x)
    z = ArbReal{P}()
    ccall(@libarb(arb_set_round), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, sigbits)
    return z
end

function roundbits!(x::ArbReal{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    z = roundbits(x, roundingmode, sigbits)
    P2 = sigbits + extrabits()
    return ArbReal{P2}(z)
end

roundbits(x::ArbReal{P}, sigbits::Int) where {P} = roundbits(x, RoundNearest, sigbits)

rounddigits(x::ArbReal{P}, roundingmode::RoundingMode, digits::Int) where {P} =
    roundbits(x, roundingmode, bits4digits(digits))

rounddigits(x::ArbReal{P}, digits::Int) where {P} = roundbits(x, RoundNearest, bits4digits(digits))

rounddigits!(x::ArbReal{P}, roundingmode::RoundingMode, digits::Int) where {P} =
    roundbits!(x, roundingmode, bits4digits(digits))

rounddigits!(x::ArbReal{P}, digits::Int) where {P} = roundbits!(x, RoundNearest, bits4digits(digits))

function roundbits(x::ArbComplex{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    sigbits >= P && return ArbComplex{sigbits}(x)
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_round), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, sigbits)
    return z
end

function roundbits!(x::ArbComplex{P}, roundingmode::RoundingMode, sigbits::Int) where {P}
    z = roundbits(x, roundingmode, sigbits)
    P2 = sigbits + extrabits()
    return ArbComplex{P2}(z)
end

roundbits(x::ArbComplex{P}, sigbits::Int) where {P} = roundbits(x, RoundNearest, sigbits)

rounddigits(x::ArbComplex{P}, roundingmode::RoundingMode, digits::Int) where {P} =
    roundbits(x, roundingmode, bits4digits(digits))

rounddigits(x::ArbComplex{P}, digits::Int) where {P} = roundbits(x, RoundNearest, bits4digits(digits))

function round(x::ArbFloat{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   r = round!(x, roundingmode, sigdigits=sigdigits, base=base)
   s = string(r)
   result = ArbFloat{P}(s)
   return result
end

function round!(x::ArbFloat{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   if base==10
       return rounddigits!(x, roundingmode, sigdigits)
   elseif base == 2
       return roundbits!(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end

function round(x::ArbReal{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   if base==10
       return rounddigits(x, roundingmode, sigdigits)
   elseif base==2
       return roundbits(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end

function round!(x::ArbReal{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   if base==10
       return rounddigits!(x, roundingmode, sigdigits)
   elseif base == 2
       return roundbits!(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end

function round(x::ArbComplex{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   if base==10
       return rounddigits(x, roundingmode, sigdigits)
   elseif base==2
       return roundbits(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end

function round!(x::ArbComplex{P}, roundingmode::RoundingMode; sigdigits::Integer, base::Integer=10) where {P}
   if base==10
       return rounddigits!(x, roundingmode, sigdigits)
   elseif base == 2
       return roundbits!(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end

    
function roundfrac(x::ArbFloat{P}, roundingmode::RoundingMode, sigdigits::Integer, base::Integer) where {P}
   if base==10
       return rounddigits(x, roundingmode, sigdigits)
   elseif base == 2
       return roundbits(x, roundingmode, sigdigits)
   else
       throw(ErrorException("unsupported base ($base)"))
   end
end



#=    
function round(x::ArbFloat{P}, bitprecision::Int) where {P}
    z = ArbFloat{P}()
    rounding = match_rounding_mode(RoundNearest)
    rounddir = ccall(@libarb(arf_set_round), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), z, x, bitprecision, rounding)
    return z
end

# void arb_set_round(arb_t y, const arb_t x, slong prec)
function round(x::ArbReal{P}, bitprecision::Int) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_round), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, bitprecision)
    return z
end

#void acb_set_round(acb_t z, const acb_t x, slong prec)
function round(x::ArbComplex{P}, bitprecision::Int) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_set_round), Cint, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, bitprecision)
    return z
end
=#

#=    
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
=#

#=
  round([T,] x, [r::RoundingMode])
  round(x, [r::RoundingMode]; digits::Integer=0, base = 10)
  round(x, [r::RoundingMode]; sigdigits::Integer, base = 10)

  Rounds the number x.

  Without keyword arguments, x is rounded to an integer value, returning a value of type T, or of the same type of x
  if no T is provided. An InexactError will be thrown if the value is not representable by T, similar to convert.

  If the digits keyword argument is provided, it rounds to the specified number of digits after the decimal place (or
  before if negative), in base base.

  If the sigdigits keyword argument is provided, it rounds to the specified number of significant digits, in base
  base.

  The RoundingMode r controls the direction of the rounding; the default is RoundNearest, which rounds to the nearest
  integer, with ties (fractional values of 0.5) being rounded to the nearest even integer. Note that round may give
  incorrect results if the global rounding mode is changed (see rounding).
=#


