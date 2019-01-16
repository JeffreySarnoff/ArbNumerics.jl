#=
int arf_addmul(arf_t z, const arf_t x, const arf_t y, slong prec, arf_rnd_t rnd)
Performs a fused multiply-add z=z+x⋅y, updating z in-place.

int arf_submul(arf_t z, const arf_t x, const arf_t y, slong prec, arf_rnd_t rnd)
Performs a fused multiply-subtract z=z−x⋅y, updating z in-place.
=#

function muladd(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}, roundingmode::RoundingMode) where {P}
    rounding = match_rounding_mode(roundingmode)
    zz = copy(z)
    res = ccall(@libarb(arf_addmul), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint),
                 zz, x, y, P, rounding)
    return zz
end

@inline muladd(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    muladd(x, y, z, RoundNearest)

@inline fma(x::ArbFloat{P}, y::ArbFloat{P}, z::ArbFloat{P}) where {P} =
    muladd(x, y, z, RoundNearest)

#=
void arb_addmul(arb_t z, const arb_t x, const arb_t y, slong prec)
void arb_addmul_arf(arb_t z, const arb_t x, const arf_t y, slong prec)
void arb_addmul_si(arb_t z, const arb_t x, slong y, slong prec)
void arb_addmul_ui(arb_t z, const arb_t x, ulong y, slong prec)
void arb_addmul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)¶
Sets z=z+x⋅y, rounded to prec bits. 

void arb_submul(arb_t z, const arb_t x, const arb_t y, slong prec)¶
void arb_submul_arf(arb_t z, const arb_t x, const arf_t y, slong prec)
void arb_submul_si(arb_t z, const arb_t x, slong y, slong prec)
void arb_submul_ui(arb_t z, const arb_t x, ulong y, slong prec)
void arb_submul_fmpz(arb_t z, const arb_t x, const fmpz_t y, slong prec)
Sets z=z−x⋅y, rounded to prec bits. The precision can be ARF_PREC_EXACT provided that the result fits in memory.
=#

function muladd(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    zz = copy(z)
    res = ccall(@libarb(arb_addmul), Cint, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong),
                 zz, x, y, P)
    return zz
end

function fma(x::ArbReal{P}, y::ArbReal{P}, z::ArbReal{P}) where {P}
    xx = ArbFloat{P}(x)
    yy = ArbFloat{P}(y)
    zz = ArbFloat{P}(z)
    zz = fma(xx, yy, zz)
    zzz = copy(z)
    res = ccall(@libarb(arb_addmul), Cint, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong),
                 zzz, x, y, P)
    return setball(zzz, radius(z))
end

#=
void acb_addmul(acb_t z, const acb_t x, const acb_t y, slong prec)
void acb_addmul_ui(acb_t z, const acb_t x, ulong y, slong prec)
void acb_addmul_si(acb_t z, const acb_t x, slong y, slong prec)
void acb_addmul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
void acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
Sets z to z plus the product of x and y.

void acb_submul(acb_t z, const acb_t x, const acb_t y, slong prec)
void acb_submul_ui(acb_t z, const acb_t x, ulong y, slong prec)
void acb_submul_si(acb_t z, const acb_t x, slong y, slong prec)
void acb_submul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
void acb_submul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
Sets z to z minus the product of x and y.
=#

function muladd(x::ArbComplex{P}, y::ArbComplex{P}, z::ArbComplex{P}) where {P}
    zz = copy(z)
    res = ccall(@libarb(acb_addmul), Cint, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong),
                 zz, x, y, P)
    return zz
end
