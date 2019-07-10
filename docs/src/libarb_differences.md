## LibArb values do not own their precision

> The input values have no memory of the precision that was used to create them. An input value could be,    
`[1.0 +/- 0.25]`, irrespective of the precision used to compute it -- was it 2 bits, 100 or 1_000 bits.
>
> Just think of a ball as a pair of rational numbers, not in terms of precision. The precision p for the new operation specifies ... that the midpoint of the output ball is to be rounded to at most p bits; if p = 100 then the output will be rounded to at most 100 bits even if the inputs have 1_000_000 bits.
>
> -- Fredrik Johansson on nemo-dev, 2018-Dec-05

## ArbNumerics values own their own precision

- works properly with mixed precision arithmetic
- works as intended with precision reduction
- maintains value integrity with precision expansion

