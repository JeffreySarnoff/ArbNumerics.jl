## available precision

- The minimum precision is 24 significant bits, or 8 significant digits.
- Performance remains strong with 10\_000 bit, or 3\_000 digit significands.
- There is no maximum; using 2^14 bits, or 5\_000 digits is straightforward.

## operating precision

For some numerical work, it is necessary that all significant bits/digits
of each value computed be visible.  This is especially true with algorithmic
development, precision-sensitive analysis, and delivery of numerical assurances.

This mode of use obtains with an initial directive: `setextrabits(0)`.

## perceptual precision

For some numerical work, it is preferred that all values are displayed
as accurately as circumstance may allow, and without any non-informing
or potentially misleading trailing digits.  This is certainly true
when computation is designed to inform decisions, where the purpose
of calculation is distill from complexity some coherence, or when
the use of computed results has substantive consequences.

This mode of use obtains by default, and may be made more or less
coarse with an initial directive: `setextrabits(_nbits_)` where
_nbits_ is whatever you choose.  The default is 24 bits, and
unless it is set to zero (see __operating precision__), that
is the lowest recommended value.

This approach uses some of the least significant bits as a "cushion"
that protects against showing greater precision than may be warranted
by the available accuracy. When using this mode with intervals of enclosure,
additional care is taken when preparing the values that you see.

### ArbFloat

It is reasonable to use settings of {32, 48, or 64} with `ArbFloats`.

With `ArbFloat`, the extra bits serve to pad away some numerical
noise that otherwise could accumulate as uncertainty or opacity.
When using `ArbFloats` in an ill-conditioned calculation, consider
raising this setting -- you will see the same number of digits,
the internal precision will have increased.

### ArbReal, ArbComplex

It is reasonable to use settings of {64, 96, 128} with `ArbReal`,
and {64, 128, 196} with `ArbComplex`.

With `ArbReal` and `ArbComplex`, the extra bits serve to extend
the proper intelligebility of the midpoint within an enclosure.
Enclosures are given as a pair: `midpoint, radius`, called a `ball`.
When the `radius` is quite small relative to the position of the
`midpoint`, then the `midpoint` itself is a better reflection of
the enclosed _true_ or the _theoretical best_ value.  Increasing
the `extrabits` serves to push the `radius` farther "down" along
the `midpoint` (as it were), which, at least temporarily, makes
it more resiliant to gross widening.


## Reliability and Production

When computing for production or for presentation
 - use `setextrabits` once only, and at the start
 - modifying `extrabits` may reduce reliablility
 - changing a variables' precision is reliable
 

## finding precisions 

- `precision(<ArbNumber>)` gives the number signficant bits displayed
- `workingprecision(<ArbNumber>)` gives the internal bit precision
- `extrabits(<ArbNumber>)` gives the significance "cushion"
    - `extrabits == workingprecision - precision`
