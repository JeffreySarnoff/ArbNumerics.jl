@testset "complex" begin
  @test (1 + im) / ArbNumerics.ArbComplex(1, 1) == 1

  w = ArbComplex(1+im)
  refw = Base.cconvert(Ref{ArbComplex}, w)
  ptrw = Base.unsafe_convert(Ref{ArbComplex}, refw)
  P = workingprecision(w)
  ptrw_prec = convert(Ptr{ArbComplex{P}}, ptrw)
  @test unsafe_load(ptrw_prec) isa ArbComplex{P}
  ul_w = unsafe_load(ptrw_prec)
  @test w == ul_w

  @test integrate(x->x^2, 0, 1) isa ArbComplex
  @test real(integrate(x-> x^2, 0, 1)) - 1/3 < eps(Float64)
  @test real(integrate(sin, 0, π)) - 2 < 1e-32
  @test abs(real(integrate(cos, -ArbComplex(π), π))) < 1e-32
end
