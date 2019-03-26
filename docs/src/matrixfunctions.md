# Matrix Functions

## Performance

```julia
using BenchmarkTools

setprecision(BigFloat, workingprecision(ArbFloat))
128

n = 100;

bf = rand(BigFloat, n, n);
af = rand(ArbFloat, n, n);

@btime bf * bf;
 154.192 ms (4080002 allocations: 186.84 MiB)

@btime af * af;
 21.161 ms (40011 allocations: 2.44 MiB)
```

Keeping the working precision at 128 bits, increasing n from 100 to 250:

```julia
@btime bf * bf;
  2.618 s (63000002 allocations: 2.82 GiB)

@btime af * af;
  176.600 ms (250011 allocations: 15.26 MiB)
```

as the working precision increases, they narrow -- e.g. with precision of 512 bits and n=100

```julia
@btime bf * bf;
  225.928 ms (4080002 allocations: 280.23 MiB)

@btime af * af;
  79.719 ms (40013 allocations: 2.44 MiB)
```

as n increases they widen -- e.g. with precision of 512 bits and n=250

```julia
@btime bf * bf;
  3.849 s (63000002 allocations: 4.22 GiB)

@btime af * af;
  610.671 ms (250013 allocations: 15.26 MiB)
```
