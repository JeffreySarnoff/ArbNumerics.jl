@testset "ArbComplex" begin

    @testset "complex" begin
        @test (1 + im) / ArbNumerics.ArbComplex(1, 1) == 1
    end

    # issue 34 and similar Cint-related stuff
    @testset "ArbComplex constructors" begin
        @test_throws ErrorException ArbComplex(5.0, base = 3)
        @test_throws ErrorException ArbComplex(5.0,1.0, base = 3)
        @test ArbComplex(5, digits = 53) == ArbComplex{53}(5)
        @test ArbComplex(5, 0, digits = 53) == ArbComplex{53}(5, 0)
        @test ArbComplex{53}(1 + 2im) == 1 + 2im
        @test ArbComplex(Int32(-1)) == ArbComplex(-1.0)
        @test ArbComplex(Int32(-1), Int32(-2)) == ArbComplex(-1.0, -2.0)
        @test ArbComplex(typemax(Int32) + 1) == ArbComplex(float(typemax(Int32) + 1))
        @test hash(ArbComplex(-2, -2)) isa UInt
    end

end
