import ArbNumerics: ArblibVector, take!, free!
using LinearAlgebra

@testset "ArblibVectors" begin
    @testset "ArblibVector{$T}" for T = [ArbReal{128},ArbComplex{128}]
        v = rand(T, 5)
        vv = ArblibVector(v)

        @test eltype(vv) == T
        @test length(vv) == 5
        @test size(vv) == (5,)

        @test vv[1] == v[1]
        @test_throws BoundsError vv[0]
        @test_throws BoundsError vv[6]

        vvv = take!(vv)
        @test vvv == v

        @test length(vv) == 0
        @test vv.ptr == C_NULL
        @test_throws BoundsError vv[1]

        @testset "Dot product" begin
            # Test automatic copy to ArblibVector and dot product
            o = ones(T, 5)
            d = dot(o,o)
            @test d isa T
            @test d == T(5)

            # Test dot product on manually allocated ArblibVector
            O = ArblibVector(o)
            D = dot(O,O)
            @test D isa T
            @test D == T(5)
            free!(O)
        end
    end

    @testset "ArbFloat" begin
        v = rand(ArbFloat{128}, 5)
        vv = ArblibVector(v)

        @test eltype(vv) == ArbReal{128}

        vvv = Vector{ArbFloat{128}}(vv)
        free!(vv)
        @test length(vv) == 0
        @test vv.ptr == C_NULL

        @test vvv == v
        @test eltype(vvv) == ArbFloat{128}

        @testset "Dot product" begin
            o = ones(ArbFloat{128}, 5)
            d = dot(o,o)
            @test d isa ArbFloat{128}
            @test d == ArbFloat{128}(5)
        end
    end
end
