## ArbNumerics: mathematical functions

#### arithmetic functions

- `+`,`-`, `*`, `/`
- `square`, `cube`, `sqrt`, `cbrt`, `hypot`
- `pow(x,i)`, `root(x,i)` _where i is an integer > 0_
- `factorial`, `doublefactorial`, `risingfactorial`
- `binomial`

#### elementary functions

- `exp`, `expm1`, `log`, `log1p`
- `sin`, `cos`, `tan`, `csc`, `sec`, `cot`
- `asin`, `acos`, `atan`, `atan(y,x)`
- `sinh`, `cosh`, `tanh`, `csch`, `sech`, `coth`
- `asinh`, `acosh`, `atanh`

#### gamma functions

- `gamma`, `lgamma`
- `rgamma`, `digamma`

#### error functions

- `erf`, `erfc`, `erfi`

#### Bessel functions

- `besselj`, `besselj0`, `besselj1`
- `bessely`, `bessely0`, `bessely1`
- `besseli`, `besselk`
       
#### Airy functions

- `airyai`, `airyaiprime`
- `airybi`, `airybiprime`

#### arithmetic-geometric mean

- `agm`, `agm1`

#### elliptic functions

- `elliptice`, `elliptick`
- `ellipticp`, `ellipticpi`
- `ellipticzeta`, `ellipticsigma`

#### other special functions

- `ei`, `si`, `ci`
- `shi`, `chi`
- `zeta`, `eta`, `xi`    # Reimann
- `lambertw`


## ArbNumerics: interval support

#### parts

- `midpoint`, `radius`
- `upperbound`, `lowerbound`, `bounds`
- `upperbound_abs`, `lowerbound_abs`, `bounds_abs`

#### construction

- `setreal(midpoint, radius)`
- `setinterval(lobound, hibound)`

#### retrieval

- `midpoint, radius = getreal(x::ArbReal)`
- `lobound, hibound = getinterval(x::ArbReal)`
