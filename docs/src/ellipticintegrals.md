## [complete](http://arblib.org/acb_elliptic.html#complete-elliptic-integrals)

- the complete elliptic integral of the first kind

  - `elliptic_k(m)`
  - `elliptic_k2(m) == elliptic_k(m^2)`

  ```math
  K(m) = \int_0^{π/2} \frac{dt}{\sqrt{1 - m \sin^2 t}}
  = \int_0^1 \frac{dt}{\sqrt{(1-t^2) (1-mt^2)}}
  ```

- the complete elliptic integral of the second kind

  - `elliptic_e(m)`
  - `elliptic_e2(m) == elliptic_e(m^2)`

  ```math
  E(m) = \int_0^{π/2} \sqrt{1 - m \sin^2 t} \, dt
  = \int_0^1 \frac{\sqrt{1 - mt^2}}{\sqrt{1 - t^2}} dt
  ```

- the complete elliptic integral of the third kind

  - `elliptic_pi(n, m)`
  - `elliptic_pi2(n, m) == elliptic_pi(n, m^2)`

  ```math
  \begin{align*}
  Π(n,m) &= \int_0^{π/2} \frac{dt}{(1 - n \sin^2 t)\sqrt{1 - m \sin^2 t}} \\
  &= \int_0^1 \frac{dt}{(1 - nt^2) \sqrt{(1 - t^2)(1 - mt^2)}}
  \end{align*}
  ```

----

## [incomplete](http://arblib.org/acb_elliptic.html#legendre-incomplete-elliptic-integrals)


- the incomplete elliptic integral of the first kind

  - `elliptic_f(phi, m)`
  - `elliptic_f2(phi, m) == elliptic_f(phi, m^2)`

  ```math
  F(φ, m) = \int_0^φ \frac{dt}{\sqrt{1 - m \sin^2 t}}
  = \int_0^{\sin φ} \frac{dt}{\sqrt{(1 - t^2)(1 - m t^2)}}
  ```

- the incomplete elliptic integral of the second kind

  - `elliptic_e(phi, m)`
  - `elliptic_e2(phi, m) == elliptic_e(phi, m^2)`

  ```math
  E(φ, m) = \int_0^φ \sqrt{1 - m \sin^2 t} \, dt
  = \int_0^{\sin φ} \frac{\sqrt{1 - m t^2}}{\sqrt{1 - t^2}} dt
  ```

- the incomplete elliptic integral of the third kind

  - `elliptic_pi(n, phi, m)`
  - `elliptic_pi2(n, phi, m) == elliptic_pi(n, phi, m^2)`

  ```math
  \begin{align*}
  Π(n, φ, m) &= \int_0^φ \frac{dt}{(1 - n \sin^2 t) \sqrt{1 - m \sin^2 t}} \\
  &= \int_0^φ \frac{dt}{(1 - n t^2) \sqrt{(1 - t^2)(1 - m t^2)}}
  \end{align*}
  ```

----

## [symmetric (Carlson)](http://arblib.org/acb_elliptic.html#carlson-symmetric-elliptic-integrals)


- the symmetric elliptic integral of the first kind

  - `elliptic_rf(x, y, z)`

  ```math
  R_F(x,y,z) = \frac{1}{2} \int_0^∞ \frac{dt}{\sqrt{(t+x)(t+y)(t+z)}}
  ```

- the symmetric elliptic integral of the second kind

  - `elliptic_rg(x, y, z)`

  ```math
  R_G(x,y,z) = \frac{1}{4} \int_0^∞ \frac{t}{\sqrt{(t+x)(t+y)(t+z)}} \left(\frac{x}{t+x} + \frac{y}{t+y} + \frac{z}{t+z}\right) dt
  ```

- the symmetric elliptic integral of the third kind

  - `elliptic_rj(x, y, z)`

  ```math
  R_J(x,y,z,p) = \frac{3}{2} \int_0^∞ \frac{dt}{(t+p)\sqrt{(t+x)(t+y)(t+z)}}
  ```
