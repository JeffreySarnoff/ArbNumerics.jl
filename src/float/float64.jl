const SigBitsForFloat64 = 80

elliptick(modulus::Float64) = Float64(elliptick(ArbFloat(modulus, SigBitsForFloat64)))
elliptice(modulus::Float64) = Float64(elliptice(ArbFloat(modulus, SigBitsForFloat64)))
ellipticf(modulus::Float64) = Float64(ellipticf(ArbFloat(modulus, SigBitsForFloat64)))
ellipticpi(nu::Float64, modulus::Float64) = Float64(ellipticpi(ArbFloat(nu, SigBitsForFloat64), ArbFloat(modulus, SigBitsForFloat64)))

elliptic_k(modulus::Float64) = Float64(elliptic_k(ArbFloat(modulus, SigBitsForFloat64)))
elliptic_e(modulus::Float64) = Float64(elliptic_e(ArbFloat(modulus, SigBitsForFloat64)))
elliptic_f(modulus::Float64) = Float64(elliptic_f(ArbFloat(modulus, SigBitsForFloat64)))
elliptic_pi(nu::Float64, modulus::Float64) = Float64(elliptic_pi(ArbFloat(nu, SigBitsForFloat64), ArbFloat(modulus, SigBitsForFloat64)))

ellipticrf(x::Float64, y::Float64, z::Float64) =
    Float64(ellipticrf(ArbFloat(x, SigBitsForFloat64), ArbFloat(y, SigBitsForFloat64), ArbFloat(z, SigBitsForFloat64)))
ellipticrg(x::Float64, y::Float64, z::Float64) =
    Float64(ellipticrg(ArbFloat(x, SigBitsForFloat64), ArbFloat(y, SigBitsForFloat64), ArbFloat(z, SigBitsForFloat64)))
ellipticrj(x::Float64, y::Float64, z::Float64) =
    Float64(ellipticrj(ArbFloat(x, SigBitsForFloat64), ArbFloat(y, SigBitsForFloat64), ArbFloat(z, SigBitsForFloat64)))
