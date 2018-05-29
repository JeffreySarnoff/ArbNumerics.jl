function (-)(x::Arf{P}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_neg), Cvoid, (Ref{Arf}, Ref{Arf}), z, x)
    return z
end

function (-)(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_neg), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end

function (-)(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_neg), Cvoid, (Ref{Acb}, Ref{Acb}), z, x)
    return z
end

function abs(x::Arf{P}) where {P}
    z = Arf{P}()
    ccall(@libarb(arf_abs), Cvoid, (Ref{Arf}, Ref{Arf}), z, x)
    return z
end

function abs(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_abs), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
    return z
end

function abs(x::Acb{P}) where {P}
    z = Acb{P}()
    ccall(@libarb(acb_abs), Cvoid, (Ref{Acb}, Ref{Acb}, Clong), z, x, P)
    return z
end


function sign(x::Arf{P}) where {P}
    thesgn = ccall(@libarb(arf_sgn), Cint, (Ref{Arf},), x)
    return Arf{P}(thesgn)
end

#=
    void arb_sgn(arb_t y, const arb_t x)

    Sets y to the sign function of x.
    The result is [0±1]
       if x contains both zero and nonzero numbers.
=#
function sign(x::Arb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_sgn), Cvoid, (Ref{Arb}, Ref{Arb}), z, x)
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
function sign(x::Acb{P}) where {P}
    z = Arb{P}()
    ccall(@libarb(acb_csgn), Cvoid, (Ref{Arb}, Ref{Acb}), z, x)
    return z
end

function signs(x::Acb{P}) where {P}
    return sign(real(x)), sign(imag(x))
end

signbit(x::Mag) = false
signbit(x::Arf{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)
signbit(x::Arb{P}) where {P} = isfinite(x) ? sign_bit(x) : isneginf(x)
signbit(x::Acb{P}, ::Type{RealPart}) where {P} = signbit(real(x))
signbit(x::Acb{P}, ::Type{ImagPart}) where {P} = signbit(imag(x))
signbit(x::Acb{P}) where {P} = signbit(x, RealPart)
signbits(x::Acb{P}) where {P} = signbit(x, RealPart), signbit(x, ImagPart)
