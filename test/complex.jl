@testset "ArbComplex" begin

    @testset "complex" begin
        @test (1 + im) / ArbNumerics.ArbComplex(1, 1) == 1
    end

    # issue 34 and similar Cint-related stuff
    @testset "ArbComplex constructors" begin
        @test ArbComplex(Int32(-1)) == ArbComplex(-1.0)
        @test ArbComplex(Int32(-1), Int32(-2)) == ArbComplex(-1.0, -2.0)
        @test ArbComplex(typemax(Int32) + 1) == ArbComplex(float(typemax(Int32) + 1))
    end

end
