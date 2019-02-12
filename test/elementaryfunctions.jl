fla = sqrt(2.0)
flb = sqrt(2.0)/2
afa = sqrt(ArbFloat(2.0))
afb = sqrt(ArbFloat(2.0))/2
ara = sqrt(ArbReal(2.0))
arb = sqrt(ArbReal(2.0))/2

@testset "log exp functions" begin
   @test isapprox(log(fla), log(afa))
   @test isapprox(exp(fla), exp(afa))
   @test isapprox(log(fla), log(ara))
   @test isapprox(exp(fla), exp(ara))
end

@testset "trig functions" begin
   @test isapprox(sin(f64a), sin(d64a))
   @test isapprox(cos(f64a), cos(d64a))
   @test isapprox(tan(f64a), tan(d64a))
   @test isapprox(csc(f64a), csc(d64a))
   @test isapprox(sec(f64a), sec(d64a))
   @test isapprox(cot(f64a), cot(d64a))
   @test isapprox(asin(f64b), asin(d64b))
   @test isapprox(acos(f64b), acos(d64b))
   @test isapprox(atan(f64a), atan(d64a))
   @test isapprox(acsc(f64a), acsc(d64a))
   @test isapprox(asec(f64a), asec(d64a))
   @test isapprox(acot(f64a), acot(d64a))
end

@testset "hyperbolic trig functions" begin
   @test isapprox(sinh(f64a), sinh(d64a))
   @test isapprox(cosh(f64a), cosh(d64a))
   @test isapprox(tanh(f64a), tanh(d64a))
   @test isapprox(csch(f64a), csch(d64a))
   @test isapprox(sech(f64a), sech(d64a))
   @test isapprox(coth(f64a), coth(d64a))
   @test isapprox(asinh(f64b), asinh(d64b))
   @test isapprox(acosh(f64a), acosh(d64a))
   @test isapprox(atanh(f64b), atanh(d64b))
   @test isapprox(acsch(f64b), acsch(d64b))
   @test isapprox(asech(f64b), asech(d64b))
   @test isapprox(acoth(f64a), acoth(d64a))
end
