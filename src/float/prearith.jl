signbit(x::Mag) = false

signbit(x::ArbFloat{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)

signbit(x::ArbBall{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)

signbit(x::ArbComplex{P}, ::Type{RealPart}) where {P} = signbit(real(x))
signbit(x::ArbComplex{P}, ::Type{ImagPart}) where {P} = signbit(imag(x))
signbit(x::ArbComplex{P}) where {P} = signbit(x, RealPart)
signbits(x::ArbComplex{P}) where {P} = signbit(x, RealPart), signbit(x, ImagPart)


function sign(x::ArbFloat{P}) where {P}
    thesgn = ccall(@libarb(arf_sgn), Cint, (Ref{ArbFloat},), x)
    return ArbFloat{P}(thesgn)
end

#=
    void arb_sgn(arb_t y, const arb_t x)

    Sets y to the sign function of x.
    The result is [0±1]
       if x contains both zero and nonzero numbers.
=#
function sign(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_sgn), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end

#=
    void acb_sgn(acb_t r, const acb_t z, slong prec)

    Sets r to the complex sign of z, defined as 0 if z is exactly zero
        and the projection onto the unit circle z/|z|=exp(iarg(z)) otherwise.

    void acb_csgn(arb_t r, const acb_t z)

    Sets r to the extension of the real sign function taking the value 1
        for z strictly in the right half plane, -1 for z strictly in the left half plane,
       and the sign of the imaginary part when z is on the imaginary axis.
=#
function sign(x::ArbComplex{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(acb_csgn), Cvoid, (Ref{ArbBall}, Ref{ArbComplex}), z, x)
    return z
end

function signs(x::ArbComplex{P}) where {P}
    return sign(real(x)), sign(imag(x))
end


function (-)(x::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_neg), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
    return z
end

function (-)(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_neg), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end

function (-)(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_neg), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}), z, x)
    return z
end

function abs(x::ArbFloat{P}) where {P}
    z = ArbFloat{P}()
    ccall(@libarb(arf_abs), Cvoid, (Ref{ArbFloat}, Ref{ArbFloat}), z, x)
    return z
end

function abs(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_abs), Cvoid, (Ref{ArbBall}, Ref{ArbBall}), z, x)
    return z
end

function abs(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_abs), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

abs2(x::ArbFloat{P})   where {P} = square( abs(x) )
abs2(x::ArbBall{P})    where {P} = square( abs(x) )
abs2(x::ArbComplex{P}) where {P} = square( abs(x) )


inv(x::ArbFloat{P}) where {P} = ArbFloat{P}( inv(ArbBall{P}(x)) )

function inv(x::ArbBall{P}) where {P}
    z = ArbBall{P}()
    ccall(@libarb(arb_inv), Cvoid, (Ref{ArbBall}, Ref{ArbBall}, Clong), z, x, P)
    return z
end

function inv(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_inv), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end
