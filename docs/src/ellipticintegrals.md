## Complete Elliptic Integrals

- `elliptick(m)`
    
     |       the complete elliptic integral of the first kind            |
     |:-----------------------------------------------------------------:|
     |  <img src="assets/elliptick.png" alt="elliptick" width="500">     |

    - `elliptic_k(M) == elliptick(m^2)`
    
- `elliptice(m)`

     |       the complete elliptic integral of the second kind           |
     |:-----------------------------------------------------------------:|
     |  <img src="assets/elliptice.png" alt="elliptice" width="500">     |

    - `elliptic_e(M) == elliptice(m^2)`

- `ellipticpi(n, m)`

     |       the complete elliptic integral of the third kind            |
     |:-----------------------------------------------------------------:|
     |   <img src="assets/ellipticpi.png" alt="ellipticpi" width="600">  |

    - `elliptic_pi(n, M) == ellipticpi(n, m^2)`
   
## Incomplete Elliptic Integrals

- `ellipticf(phi, m)`

     |       the incomplete elliptic integral of the first kind           |
     |:------------------------------------------------------------------:|
     |   <img src="assets/ellipticf.png" alt="ellipticf" width="500">     |

    - `elliptic_f(phi, M) == ellipticf(phi, m^2)`

- `elliptice(phi, m)`

     |       the incomplete elliptic integral of the second kind                 |
     |:-------------------------------------------------------------------------:|
     |   <img src="assets/elliptice_incomplete.png" alt="elliptice" width="500"> |

    - `elliptic_e(phi, M) == elliptice(phi, m^2)`

- `ellipticpi(n, phi, m)`

     |       the incomplete elliptic integral of the third kind                   |
     |:--------------------------------------------------------------------------:|
     |   <img src="assets/ellipticpi_incomplete.png" alt="elliptice" width="600"> |

    - `elliptic_pi(n, phi, M) == ellipticpi(n, phi, m^2)`

## Carlson's Symmetric Elliptic Integrals

- `ellipticrf(x, y, z)`

     |       the symmetric elliptic integral of the first kind            |
     |:------------------------------------------------------------------:|
     |   <img src="assets/elliptic_rf.png" alt="ellipticrf" width="400">  |

- `ellipticrg(x, y, z)`

     |       the symmetric elliptic integral of the second kind           |
     |:------------------------------------------------------------------:|
     |   <img src="assets/elliptic_rg.png" alt="ellipticrg" width="600">  |

- `ellipticrj(x, y, z, p)`

     |       the symmetric elliptic integral of the third kind              |
     |:--------------------------------------------------------------------:|
     |   <img src="assets/elliptic_rj.png" alt="ellipticrj" width="500">    |



(images from the Arb C library docs)
