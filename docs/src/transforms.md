## Discrete Fourier Transforms

- `dft`, `inverse_dft`

----

The DFT is often used as a tool to analyze a collection of samples as a sum of periodic signals q.v. [DFT](https://en.wikipedia.org/wiki/Discrete_Fourier_transform). ArbNumerics implements a rigorous DFT and Inverse DFT.
The following example is taken from the web page linked above.
```

julia> fourvec =  [1.0+0.0im, 2.0-1.0im, 0.0-1.0im, -1.0+2.0im]
4-element Array{Complex{Float64},1}:
  1.0 + 0.0im
  2.0 - 1.0im
  0.0 - 1.0im
 -1.0 + 2.0im

julia> x = map(ArbComplex, fourvec)
4-element Array{ArbComplex{128},1}:
    1.0 + 0im
  2.0 - 1.0im
    0 - 1.0im
 -1.0 + 2.0im

julia> dft_x = dft(x)
4-element Array{ArbComplex{128},1}:
    2.0 + 0im
 -2.0 - 2.0im
    0 - 2.0im
  4.0 + 4.0im

julia> invert_dft_x = inverse_dft(dft_x)
4-element Array{ArbComplex{128},1}:
    1.0 + 0im
  2.0 - 1.0im
    0 - 1.0im
 -1.0 + 2.0im

julia> x == invert_dft_x
true
```
```

julia> fourvec = [1.0, 2.0, -1.0, -2.0]
4-element Array{Float64,1}:
  1.0
  2.0
 -1.0
 -2.0

julia> x = map(ArbFloat, fourvec)
4-element Array{ArbFloat{128},1}:
  1.0
  2.0
 -1.0
 -2.0

julia> dft_x = dft(x)
4-element Array{ArbComplex{128},1}:
     0 + 0im
 2.0 - 4.0im
     0 + 0im
 2.0 + 4.0im

julia> invert_dft_x = inverse_dft(dft_x)
4-element Array{ArbComplex{128},1}:
  1.0 + 0im
  2.0 + 0im
 -1.0 + 0im
 -2.0 + 0im

julia> map(real, invert_dft_x)
4-element Array{ArbReal{128},1}:
  1.0
  2.0
 -1.0
 -2.0

julia> ans == x
true
```
----

For a more in depth example, please [see this](https://github.com/JeffreySarnoff/ArbNumerics.jl/pull/30#issuecomment-562482450).
