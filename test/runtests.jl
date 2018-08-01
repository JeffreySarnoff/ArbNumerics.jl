using ArbNumerics
using Test

setprecision(BigFloat, 512)
DIGITS = 78;
afpi = ArbFloat(pi, bits4digits(DIGITS))
arpi = ArbReal(pi, bits4digits(DIGITS))
@test DIGITS == length(string(afpi)) - 1 # (-1 for the decimal point)
@test DIGITS == length(string(arpi)) - 1 # (-1 for the decimal point)

a = 2*log(ArbFloat(2))
@test exp(lambertw(a)) == 2
