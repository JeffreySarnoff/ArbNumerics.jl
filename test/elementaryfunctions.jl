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

@testset "trig functions 1" begin
   @test isapprox(sin(fla), sin(afa))
   @test isapprox(cos(fla), cos(afa))
   @test isapprox(tan(fla), tan(afa))
   @test isapprox(csc(fla), csc(afa))
   @test isapprox(sec(fla), sec(afa))
   @test isapprox(cot(fla), cot(afa))
   @test isapprox(asin(flb), asin(afb))
   @test isapprox(acos(flb), acos(afb))
   @test isapprox(atan(fla), atan(afa))
   @test isapprox(acsc(fla), acsc(afa))
   @test isapprox(asec(fla), asec(afa))
   @test isapprox(acot(fla), acot(afa))
end

@testset "hyperbolic trig functions 1" begin
   @test isapprox(sinh(fla), sinh(afa))
   @test isapprox(cosh(fla), cosh(afa))
   @test isapprox(tanh(fla), tanh(afa))
   @test isapprox(csch(fla), csch(afa))
   @test isapprox(sech(fla), sech(afa))
   @test isapprox(coth(fla), coth(afa))
   @test isapprox(asinh(flb), asinh(afb))
   @test isapprox(acosh(fla), acosh(afa))
   @test isapprox(atanh(flb), atanh(afb))
   @test isapprox(acsch(flb), acsch(afb))
   @test isapprox(asech(flb), asech(afb))
   @test isapprox(acoth(fla), acoth(afa))
end


@testset "trig functions 2" begin
   @test isapprox(sin(fla), sin(ara))
   @test isapprox(cos(fla), cos(ara))
   @test isapprox(tan(fla), tan(ara))
   @test isapprox(csc(fla), csc(ara))
   @test isapprox(sec(fla), sec(ara))
   @test isapprox(cot(fla), cot(ara))
   @test isapprox(asin(flb), asin(arb))
   @test isapprox(acos(flb), acos(arb))
   @test isapprox(atan(fla), atan(ara))
   @test isapprox(acsc(fla), acsc(ara))
   @test isapprox(asec(fla), asec(ara))
   @test isapprox(acot(fla), acot(ara))
end

@testset "hyperbolic trig functions 2" begin
   @test isapprox(sinh(fla), sinh(ara))
   @test isapprox(cosh(fla), cosh(ara))
   @test isapprox(tanh(fla), tanh(ara))
   @test isapprox(csch(fla), csch(ara))
   @test isapprox(sech(fla), sech(ara))
   @test isapprox(coth(fla), coth(ara))
   @test isapprox(asinh(flb), asinh(arb))
   @test isapprox(acosh(fla), acosh(ara))
   @test isapprox(atanh(flb), atanh(arb))
   @test isapprox(acsch(flb), acsch(arb))
   @test isapprox(asech(flb), asech(arb))
   @test isapprox(acoth(fla), acoth(ara))
end
