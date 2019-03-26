# Matrix Functions

## Performance


Keeping the working precision at 128 bits, with 100x100 element matrices, 10.8x

```julia
using BenchmarkTools

setprecision(BigFloat, workingprecision(ArbFloat))
128

n = 100;

bf = rand(BigFloat, n, n);
af = rand(ArbFloat, n, n);

@btime bf * bf;
  129.716 ms (4080002 allocations: 186.84 MiB)

@btime af * af;
  12.027 ms (40011 allocations: 2.44 MiB)
```

Keeping the working precision at 128 bits, increasing n from 100 to 250, 16.4x

```julia
@btime bf * bf;
  2.573 s (63000002 allocations: 2.82 GiB)

@btime af * af;
  156.604 ms (250011 allocations: 15.26 MiB)
```

as the working precision increases, they narrow -- e.g. with precision of 512 bits and n=100, 2.8x

```julia
@btime bf * bf;
  125.851 ms (4080002 allocations: 186.84 MiB)

@btime af * af;
  75.515 ms (40013 allocations: 2.44 MiB)
```

as n increases they widen -- e.g. with precision of 512 bits and n=250, 3.5x

```julia
@btime bf * bf;
  2.168 s (63000002 allocations: 2.82 GiB)

@btime af * af;
  606.713 ms (250013 allocations: 15.26 MiB)
```
