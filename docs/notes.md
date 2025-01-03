## built-ins "_bits", "_trim"

slong arb_rel_error_bits(const arb_t x)
    Returns the effective relative error of x measured in bits, defined as the difference between the position oAf the top bit in the radius and the top bit in the midpoint, plus one. The result is clamped between plus/minus RF_PREC_EXACT.
slong arb_rel_accuracy_bits(const arb_t x)
    Returns the effective relative accuracy of x measured in bits, equal to the negative of the return value from arb_rel_error_bits() .

slong arb_rel_one_accuracy_bits(const arb_t x)
    Given a ball with midpoint m and radius r, returns an approximation of the relative accuracy of [max(1, |𝑚|) ± 𝑟] measured in bits.

slong arb_bits(const arb_t x)
    Returns the number of bits needed to represent the absolute value of the mantissa of the midpoint of x, i.e. the minimum precision sufficient to represent x exactly. Returns 0 if the midpoint of x is a special value.

void arb_trim(arb_t y, const arb_t x)
    Sets y to a trimmed copy of x: rounds x to a number of bits equal to the accuracy of x (as indicated by its radius), plus a few guard bits. The resulting ball is guaranteed to contain x, but is more economical if x has less than full accuracy.

### some with `prec` argument

void arb_nint(arb_t y, const arb_t x, slong prec)
    Sets y to a ball containing respectively, ⌊𝑥⌋ and ⌈𝑥⌉, trunc(𝑥), nint(𝑥), with the midpoint of y rounded to at most prec bits.

void arb_get_abs_ubound_arf(arf_t u, const arb_t x, slong prec)
    Sets u to the upper bound for the absolute value of x, rounded up to prec bits. If x contains NaN, the result is NaN.

void arb_get_abs_lbound_arf(arf_t u, const arb_t x, slong prec)
    Sets u to the lower bound for the absolute value of x, rounded down to prec bits. If x contains NaN, the result is NaN.

void arb_get_ubound_arf(arf_t u, const arb_t x, slong prec)
    Sets u to the upper bound for the value of x, rounded up to prec bits. If x contains NaN, the result is NaN.

void arb_get_lbound_arf(arf_t u, const arb_t x, slong prec)
    Sets u to the lower

void acb_set_round_arb(acb_t z, const arb_t x, slong prec)
    Sets z to x, rounded to prec bits.

void acb_get_abs_ubound_arf(arf_t u, const acb_t z, slong prec)
    Sets u to an upper bound for the absolute value of z, computed using a working precision of prec bits.

void acb_get_abs_lbound_arf(arf_t u, const acb_t z, slong prec)
    Sets u to a lower bound for the absolute value of z, computed using a working precision of prec bits.

void acb_get_rad_ubound_arf(arf_t u, const acb_t z, slong prec)
    Sets u to an upper bound for the error radius of z (the value is currently not computed tightly).

