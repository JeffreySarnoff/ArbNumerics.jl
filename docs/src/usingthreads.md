## Setting the number of threads for the module
You may specify the number of threads to be used by this package.
- This must be done before `using ArbNumerics`.
- Set the environment variable "ARB_NUM_THREADS" to the desired count.
  - ENV["ARB_NUM_THREADS"] = 8
    - note: the environment variable "FLINT_NUM_THREADS" may be used.

### The maximum number of threads
The count used will not exceed Sys.CPU_THREADS - 1.

### The automatic assignment of threads
When ENV["ARB_NUM_THREADS"] or ENV["FLINT_NUM_THREADS"] has not been set, the count is automatically assigned.

The count used is a function of Hwloc.num_virtual_cores(), Hwloc.num_physical_cores(), and Sys.CPU_THREADS.
- this is expected to approach the number of distinct hardware threads available from below