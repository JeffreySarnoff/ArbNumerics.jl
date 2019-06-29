> call these functions with ArbFloat, ArbReal, ArbComplex or __Float64__ args (_all args are to be of the same type_)
----

## Complete Elliptic Integrals

- the complete elliptic integral of the first kind

    - `elliptick(m)`
    - `elliptic_k(m) == elliptick(m^2)`

![elliptick](assets/elliptic_k.png)

- the complete elliptic integral of the second kind

    - `elliptice(m)`
    - `elliptic_e(m) == elliptice(m^2)`

![elliptice](assets/elliptic_e.png)
        
- the complete elliptic integral of the third kind

    - `ellipticpi(n, m)`
    - `elliptic_pi(n, m) == ellipticpi(n, m^2)`

![ellipticpi](assets/elliptic_pi.png)

## Incomplete Elliptic Integrals

- the incomplete elliptic integral of the first kind

    - `ellipticf(phi, m)`
    - `elliptic_f(phi, m) == ellipticf(phi, m^2)`

![ellipticf](assets/elliptic_f.png)

- the incomplete elliptic integral of the second kind

    - `elliptice(phi, m)`
    - `elliptic_e(phi, m) == elliptice(phi, m^2)`

![elliptice_incomplete](assets/elliptic_e_incomplete.png)
        
- the incomplete elliptic integral of the third kind

    - `ellipticpi(n, phi, m)`
    - `elliptic_pi(n, phi, m) == ellipticpi(n, phi, m^2)`

![ellipticpi_incomplete](assets/elliptic_pi_incomplete.png)


## Carlson's Symmetric Elliptic Integrals

- the symmetric elliptic integral of the first kind
    
    - `ellipticrf(x, y, z)`

![ellipticrf](assets/elliptic_rf.png)

- the symmetric elliptic integral of the second kind
    
    - `ellipticrg(x, y, z)`

![ellipticrg](assets/elliptic_rg.png)

- the symmetric elliptic integral of the third kind
    
    - `ellipticrj(x, y, z)`

![ellipticrj](assets/elliptic_rj.png)


(images from the Arb C library docs)
