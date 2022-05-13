@testset "compare" begin
    
    @test ArbNumerics.Mag(2.0) == ArbNumerics.Mag(2.0)
    @test ArbNumerics.Mag(1.0) != ArbNumerics.Mag(2.0)
    @test ArbNumerics.Mag(2.0) > ArbNumerics.Mag(1.0)
    @test ArbNumerics.Mag(1.0) < ArbNumerics.Mag(2.0)
    @test ArbNumerics.Mag(2.0) >= ArbNumerics.Mag(1.0)
    @test ArbNumerics.Mag(1.0) <= ArbNumerics.Mag(2.0)
    
    @test ArbFloat(2.0) > 1
    @test ArbFloat(2.0) >= 1
    @test 1 < ArbFloat(2.0)
    @test 1 <= ArbFloat(2.0)

    @test ArbFloat(2.0) > 1.0
    @test 1.0 < ArbFloat(2.0)
    @test ArbFloat(2.0) >= 1.0
    @test 1.0 <= ArbFloat(2.0)

    @test ArbFloat(2.0) == ArbFloat(2.0)
    @test ArbFloat(1.0) != ArbFloat(2.0)
    @test ArbFloat(2.0) > ArbFloat(1.0)
    @test ArbFloat(1.0) < ArbFloat(2.0)
    @test ArbFloat(2.0) >= ArbFloat(1.0)
    @test ArbFloat(1.0) <= ArbFloat(2.0)

    @test ArbFloat(2.0) == ArbReal(2.0)
    @test ArbFloat(1.0) != ArbReal(2.0)
    @test ArbFloat(2.0) > ArbReal(1.0)
    @test ArbFloat(1.0) < ArbReal(2.0)
    @test ArbFloat(2.0) >= ArbReal(1.0)
    @test ArbFloat(1.0) <= ArbReal(2.0)

    @test ArbReal(2.0) == ArbFloat(2.0)
    @test ArbReal(1.0) != ArbFloat(2.0)
    @test ArbReal(2.0) > ArbFloat(1.0)
    @test ArbReal(1.0) < ArbFloat(2.0)
    @test ArbReal(2.0) >= ArbFloat(1.0)
    @test ArbReal(1.0) <= ArbFloat(2.0)

    @test ArbReal(2.0) > 1
    @test ArbReal(2.0) >= 1
    @test 1 < ArbReal(2.0)
    @test 1 <= ArbReal(2.0)

    @test ArbReal(2.0) > 1.0
    @test 1.0 < ArbReal(2.0)
    @test ArbReal(2.0) >= 1.0
    @test 1.0 <= ArbReal(2.0)

    @test ArbReal(2.0) == ArbReal(2.0)
    
    @test ArbReal(1.0) != ArbReal(2.0)
    @test ArbReal(2.0) > ArbReal(1.0)
    @test ArbReal(1.0) < ArbReal(2.0)
    @test ArbReal(2.0) >= ArbReal(1.0)
    @test ArbReal(1.0) <= ArbReal(2.0)

    @test isapprox(ArbFloat(1.0), ArbFloat(1.0))
    @test isapprox(ArbFloat(1.0), ArbReal(1.0))
    @test isapprox(ArbReal(1.0), ArbFloat(1.0))
    @test isapprox(ArbReal(1.0), ArbReal(1.0))
    @test isapprox(ArbFloat(1.0), ArbComplex(1.0,0.0))
    @test isapprox(ArbReal(1.0), ArbComplex(1.0,0.0))
    @test isapprox(ArbComplex(1.0,0.0), ArbFloat(1.0))
    @test isapprox(ArbComplex(1.0,0.0), ArbReal(1.0))
    @test isapprox(ArbComplex(1.0,0.5), ArbComplex(1.0,0.5))
            
end
