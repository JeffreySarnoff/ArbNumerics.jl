@testset "DFT" begin
    x = ArbComplex.(1.0:4)
    y = [ArbComplex(10.0), ArbComplex(-2.0,+2.0), ArbComplex(-2.0),ArbComplex(-2.0,-2.0)]
    @test dft(x) == y
    @test inverse_dft(y) == x

    u = vcat(one(ArbComplex), zeros(ArbComplex, 7))
    v = ones(ArbComplex, 8)
    @test dft(u) == v
    @test dft(im*u) == im*v
end
