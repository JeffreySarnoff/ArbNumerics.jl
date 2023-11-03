@testset "misc.jl" begin
    @testset "rounding mode" begin
        @test ArbNumerics.match_rounding_mode(RoundNearest) == 4
    end

    @testset "ArbNumerics.Mag" begin
        @test signbit(ArbNumerics.Mag(0)) == false
        @test ArbNumerics.Mag(-1e-5) == ArbNumerics.Mag(1e-5)
        @test_throws InexactError ArbNumerics.Mag(-1)
    end

    @testset "$T($v)" for T in (ArbFloat, ArbFloat{64}, ArbReal, ArbReal{64}),
        (v, c, f, t) in [(0.6, 1, 0, 0), (-0.6, 0, -1, 0)]

        x = T(v)
        @test ceil(x) == float(c)
        0 <= c <= 1 && @test ceil(Bool, x) == (c == 1)
        @test ceil(Int, x) === c

        @test floor(x) == float(f)
        if 0 <= f <= 1
            @test floor(Bool, x) == (f == 1)
        else
            @test_throws InexactError floor(Bool, x)
        end
        @test floor(Int, x) === f

        @test trunc(x) == float(t)
        0 <= t <= 1 && @test trunc(Bool, x) == (t == 1)
        @test trunc(Int, x) === t
    end

    @testset "ArbFloat" begin
        a = ArbFloat(10)
        b = ArbFloat(20)
        swap!(a, b)
        @test (a, b) == (20, 10)

        a = ArbFloat(pi)
        @test ArbFloat(a) === a
        @test copy(a) == a
        @test copy(a) !== a
        @test copy(a, 10, RoundDown) == 804 / 256
        @test copy(a, 10, RoundUp) == 805 / 256
        @test copy(a, RoundUp) > a
        @test a > copy(a, RoundDown)
        @test copy(a, 10) == copy(a, 10, RoundDown)

        @test ArbFloat(typemax(UInt)) == typemax(UInt)
        @test ArbFloat(typemax(Int128)) == typemax(Int128)
        @test ArbFloat(1 // 3) ≈ ArbFloat(1) / ArbFloat(3)
    end

    @testset "convert ArbFloat to Integer" begin
        v = typemax(Int32) + 1.5
        w = round(v)
        a = ArbFloat(v)
        @test_throws InexactError Int32(a)
        @test Int64(a) == w
        @test Int128(a) == w
        @test BigInt(a) == w

        @test_throws InexactError Integer(a) # TODO inconsistent with Int64, BigInt, ...
        v = typemin(Int32) - 1
        a = ArbFloat(v)
        x = Integer(a)
        @test typeof(x) == Int64
        @test x == v
        v = Int128(typemax(Int64)) + 1
        a = ArbFloat(v)
        x = Integer(a)
        @test typeof(x) == BigInt
        @test x == v
    end

    @testset "functions with ArbFloat" begin
        a = ArbFloat(ℯ)
        @test midpoint(a) === a
        @test iszero(radius(a))

        @test modf(a) == (a - 2, 2)
        @test fmod(modf(a)) ≈ a
        @test fmod(modf(a)...) ≈ a

        b = ArbFloat(1)
        @test div(-a, b) == -2
        @test rem(-a, b) ≈ -a + 2
        @test fld(-a, b) == -3
        @test mod(-a, b) ≈ -a + 3
        @test divrem(a, b) == (div(a, b), rem(a, b))
        @test fldmod(a, b) == (fld(a, b), mod(a, b))

        @test hash(a) isa UInt
    end
end
