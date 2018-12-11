# ArbNumerics

- ArbNumerics.jl offers efficient mathematical computation with multiprecision floating point values.

- Floating Point values, Real values (as interval enclosures) and Complex values are available.

- You can set the precision to a given number of bits (24..8196) or to approximate a number of digits (7..2450).  

- Many mathematical functions are available.

- Some basic matrix functions are supported.

a Julian perspective on Frederik Johansson's [Arb C library](http://arblib.org/), offering state of the art mathematical computation with multiprecision floating point values and assured interval enclosures. The package outperforms BigFloats when computing elementary and advanced mathematical functions in precisions upto 4000 bits (1200 digits) and beyond.  Performance reflects the Arb C library. Simple arithmetic is somewhat slower than with BigFloat, although polynomial evaluation is somewhat faster. All the elementary and advanced math functions are faster than with BigFloat.


