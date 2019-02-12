
arf = inv(ArbFloat(3))
arb = inv(ArbReal(3))
acb = inv(ArbComplex(3))

@testset "Arithmetic" begin
    @test Float64(arf + 2*arf) == 1.0
    @test Float64(arb + 2*arb) == 1.0
    @test Float64(acb + 2*acb) == 1.0
    @test Float64(arf - 2*arf) == Float64(-arf)
    @test Float64(arb - 2*arb) == Float64(-arb)
    @test Float64(acb - 2*acb) == Float64(-acb)
    @test Float64(arf * arf / arf) == Float64(arf)
    @test Float64(arb * arb / arb) == Float64(arf)
    @test Float64(acb * acb / acb) == Float64(arf)
    @test Float64(arf / arf) == 1.0
    @test Float64(arb / arb) == 1.0
    @test Float64(acb / acb) == 1.0
end
