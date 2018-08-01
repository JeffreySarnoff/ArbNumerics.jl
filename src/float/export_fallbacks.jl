square(x) = x*x
cube(x) = x*x*x
pow(x::T1, y::T2) where {T1,T2} = x^T1(y)
root(x::T1, y::T2) where {T1,T2} = x^inv(T1(y))
sqrt(x) = root(x, 2.0)
cbrt(x) = root(x, 3.0)
rsqrt(x) = sqrt(inv(x))
rcbrt(x) = cbrt(inv(x))
