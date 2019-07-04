## Matrix Functions

#### `using ArbNumerics, GenericSchur, GenericSVD, LinearAlgebra`

- `det`, `tr`
- `transpose`, `adjoint`, `inv`
- `exp`

- `.+`, `.-`, `.*`, `./`           ( element op element )
- `+`, `-`, `*`, `/`, `\`          ( matrix  op matrix  )

- `lu`, `qr`, `factorize`

----

## Performance

With the working precision at 128 bits, and 100x100 element matrices, 13x (24x, 32x with 8 cores)

```julia
using BenchmarkTools

setprecision(BigFloat, workingprecision(ArbFloat))
128

n = 100;

bf = rand(BigFloat, n, n);
af = rand(ArbFloat, n, n);
ar = rand(ArbReal, n, n);

@btime $bf * $bf;
  158.920 ms (4080002 allocations: 186.84 MiB)

@btime $af * $af;
  12.027 ms (40011 allocations: 2.44 MiB)
  
@btime $af * $af; # 8 cores available
   6.611 ms (40011 allocations: 2.44 MiB)

@btime $ar * $ar; # 8 cores available
  4.881 ms (10006 allocations: 703.41 KiB)

```

With the working precision at 128 bits, increasing n from 100 to 250, 18x (35x, 44x with 8 cores)

```julia
@btime $bf * $bf;
  2.905 s (63000002 allocations: 2.82 GiB)

@btime $af * $af;
  156.604 ms (250011 allocations: 15.26 MiB)
  
@btime $af * $af; # 8 cores available
  80.941 ms (250011 allocations: 15.26 MiB)

@btime $ar * $ar; # 8 cores available
  65.392 ms (62506 allocations: 4.29 MiB)
```

as the working precision increases, they narrow --    
e.g. with precision of 512 bits and n=100, 3x (9x, 11x with 8 cores)

```julia
@btime $bf * $bf;
  247.357 ms (4080002 allocations: 280.23 MiB)

@btime $af * $af;
  75.515 ms (40013 allocations: 2.44 MiB)

@btime $af * $af; # 8 cores available
  25.473 ms (40013 allocations: 2.44 MiB)

@btime $ar * $ar; # 8 cores available
  21.264 ms (10008 allocations: 703.44 KiB)
```

as n increases they widen --    
e.g. with precision of 512 bits and n=250, 7x (9x, 12x with 8 cores)

```julia
@btime $bf * $bf;
   4.311 s (63000002 allocations: 4.22 GiB)

@btime $af * $af;
  606.713 ms (250013 allocations: 15.26 MiB)
  
@btime $af * $af; # 8 cores available
  457.125 ms (250013 allocations: 15.26 MiB)

@btime $ar * $ar; # 8 cores available
  333.056 ms (62508 allocations: 4.29 MiB)
```
