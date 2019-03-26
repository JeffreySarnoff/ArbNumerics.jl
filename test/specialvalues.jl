@testset "Inf" begin
  @test isinf(ArbFloat(Inf))
  @test isinf(ArbReal(Inf))
  @test isinf(ArbComplex(Inf))

  @test isposinf(ArbFloat(Inf))
  @test isposinf(ArbReal(Inf))
  @test isposinf(ArbComplex(Inf))

  @test isneginf(ArbFloat(-Inf))
  @test isneginf(ArbReal(-Inf))
  @test isneginf(ArbComplex(-Inf))
end

@testset "NaN" begin
  @test isnan(ArbFloat(NaN))
  @test isnan(ArbReal(NaN))
  @test isnan(ArbComplex(NaN))
end

@testset "01" begin
  @test iszero(ArbFloat(0))
  @test iszero(ArbReal(0))
  @test iszero(ArbComplex(0))

  @test isone(ArbFloat(1))
  @test isone(ArbReal(1))
  @test isone(ArbComplex(1))
end
