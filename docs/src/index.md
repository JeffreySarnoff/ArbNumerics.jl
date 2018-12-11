# ArbNumerics
ArbNumerics.jl is a Julian perspective on Frederik Johansson's [Arb C library](http://arblib.org/), offering state of the art mathematical computation with multiprecision floating point values and assured interval enclosures. This package outperforms BigFloats when computing elementary and advanced mathematical functions in precisions upto 4000 bits (1200 digits) and beyond.

100	0.89
250	0.7
500	0.83
1000	1.07
2000	1.04
3000	1.02
4000	1.02


function | bits of precision | relative speed
---------|-------------------|---------------
*        | 100 | 0.89 
 | 250	| 0.7
 | 500  |	0.83
 | 1000 |	1.07
 | 2000 |	1.04
 | 3000 |	1.02
 | 4000	| 1.02
