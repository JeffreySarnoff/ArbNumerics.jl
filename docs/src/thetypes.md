There are three core types: `ArbFloat`, `ArbReal`, `ArbComplex`.  Vectors of elements of these types are formed and used in the usual ways. Some matrix operations are supported through the underlying C library, which requires data be given in row-dominant order, we have Matrix types: `ArbFloatMatrix`, `ArbRealMatrix`, `ArbComplexMatrix`.  Their use is described in the section on Matrices.

----

# ArbFloat

An `ArbFloat` value is an extended precision floating point value where the precision is fixed at construction.

# ArbReal

An `ArbReal` value is implemented in the underlying C library as an `ArbFloat` _midpoint_ and a value enclosing _radius_.


![midrad](assets/midrad.jpg)

---

![midrad](https://github.com/JeffreySarnoff/ArbNumerics.jl/blob/master/docs/assets/midrad.jpg)

---

![midrad](https://jeffreysarnoff.github.io/ArbNumerics.jl/dev/assets/midrad.jpg)

# ArbComplex

An `ArbComplex` value is implemented in the underlying C library as two `ArbReal` values being the real part and the imaginary part.
With `ArbNumerics`, you can form an `ArbComplex` using `ArbReals` or `ArbFloats` or one of each.  The real and imaginary parts are recovered using `real(z)` and `imag(z)` where `z` is an `ArbComplex`.

##TODO
The extent and the phase angle of an `ArbComplex` are recovered using `length(z)` and `angle(z)`.
