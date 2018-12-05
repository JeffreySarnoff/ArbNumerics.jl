signbit(x::Mag) = false

signbit(x::ArbFloat{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)

signbit(x::ArbReal{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)

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
function sign(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_sgn), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
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
    z = ArbReal{P}()
    ccall(@libarb(acb_csgn), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), z, x)
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

function (-)(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_neg), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
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

function abs(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_abs), Cvoid, (Ref{ArbReal}, Ref{ArbReal}), z, x)
    return z
end

function abs(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_abs), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end

abs2(x::ArbFloat{P})   where {P} = square( abs(x) )
abs2(x::ArbReal{P})    where {P} = square( abs(x) )
abs2(x::ArbComplex{P}) where {P} = square( abs(x) )



flipsign(x::ArbFloat{P}, y::U) where {P, U<:Unsigned} = +x
copysign(x::ArbFloat{P}, y::U) where {P, U<:Unsigned} = +x

flipsign(x::ArbFloat{P}, y::S) where {P, S<:Signed} = signbit(y) ? -x : x
copysign(x::ArbFloat{P}, y::S) where {P, S<:Signed} = signbit(y) ? -abs(x) : abs(x)

flipsign(x::ArbFloat{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? -x : x
copysign(x::ArbFloat{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? -abs(x) : abs(x)

flipsign(x::ArbReal{P}, y::U) where {P, U<:Unsigned} = +x
copysign(x::ArbReal{P}, y::U) where {P, U<:Unsigned} = +x

flipsign(x::ArbReal{P}, y::S) where {P, S<:Signed} = signbit(y) ? -x : x
copysign(x::ArbReal{P}, y::S) where {P, S<:Signed} = signbit(y) ? -abs(x) : abs(x)

flipsign(x::ArbReal{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? -x : x
copysign(x::ArbReal{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? -abs(x) : abs(x)

flipsign(x::ArbComplex{P}, y::U) where {P, U<:Unsigned} = +x
copysign(x::ArbComplex{P}, y::U) where {P, U<:Unsigned} = +x

flipsign(x::ArbComplex{P}, y::S) where {P, S<:Signed} = signbit(y) ? -x : x
copysign(x::ArbComplex{P}, y::S) where {P, S<:Signed} = signbit(y) ? -abs(x) : abs(x)

flipsign(x::ArbComplex{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? -x : x
copysign(x::ArbComplex{P}, y::F) where {P, F<:AbstractFloat} = signbit(y) ? (signbit(x.re) ? x : -x) : x



inv(x::ArbFloat{P}) where {P} = ArbFloat{P}( inv(ArbReal{P}(x)) )

function inv(x::ArbReal{P}) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_inv), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, P)
    return z
end

function inv(x::ArbComplex{P}) where {P}
    z = ArbComplex{P}()
    ccall(@libarb(acb_inv), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, P)
    return z
end
