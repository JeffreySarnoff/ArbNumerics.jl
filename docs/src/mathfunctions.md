
## constituents

- `modf`, `fmod` (_inv of modf_)

## integer related

- `floor`, `ceil`, `trunc`
- `round`

- `rem`, `mod`
- `div`, `cld`, `fld`
- `divrem`, `fldmod`

## arithmetic functions

- `+`,`-`, `*`, `/`
- `square`, `cube`, `sqrt`, `cbrt`, `hypot`
- `pow(x,i)`, `root(x,i)` _where i is an integer > 0_
- `factorial`, `doublefactorial`, `risingfactorial`
- `binomial`

## complex constituents

- `real`, `imag`
- `angle`, `magnitude`
- `conj` # applies to a value and applies to a matrix

## random numbers

- `rand`, `randn`

## arithmetic-geometric mean

- `agm`, `agm1`

----

_All of the following functions are available for `ArbFloat`, `ArbReal` and `ArbComplex` types_

---

## elementary functions

- `exp`, `expm1`
- `log`, `log1p`, `log2`, `log10`
- `sin`, `cos`, `tan`, `csc`, `sec`, `cot`
- `sinpi`, `cospi`, `tanpi`, `cotpi`
- `asin`, `acos`, `atan`, `atan(y,x)`
- `sinh`, `cosh`, `tanh`, `csch`, `sech`, `coth`
- `asinh`, `acosh`, `atanh`

## gamma functions

- `gamma`, `lgamma`
- `rgamma`, `digamma`

## error functions

- `erf`, `erfc`, `erfi`

## Bessel functions

- `besselj`, `besselj0`, `besselj1`
- `bessely`, `bessely0`, `bessely1`
- `besseli`, `besselk`
       
## Airy functions

- `airyai`, `airyaiprime`
- `airybi`, `airybiprime`

## elliptic functions

- `elliptic_e`, `elliptic_k`, `elliptic_pi`     (complete and incomplete integrals)
- `elliptic_e2`, `elliptic_k2`, `elliptic_pi2`  (squares the modulus)
- `elliptic_rf`, `elliptic_rg`, `elliptic_rj`   (Carleson's symmetric integrals)

## other special functions

- `ei`, `si`, `ci`
- `shi`, `chi`
- `zeta`, `eta`, `xi`    # Reimann
- `lambertw`
