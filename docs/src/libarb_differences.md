### ArbNumerics and LibArb

> The input values have no memory of the precision that was used to create them. An input value could be, say, [1.0 +/- 0.25], regardless of whether the precision used to compute it was 2 bits, 100 bits, or 1000000 bits.
>
>Just think of a ball as a pair of rational numbers, not in terms of precision. The precision p for the new operation specifies (in almost all functions) that the midpoint of the output ball is to be rounded to at most p bits; if p = 100 then the output will be rounded to at most 100 bits even if the inputs have 1000000 bits.
>
> -- Fredrik Johansson on nemo-dev, 2018-Dec-05
