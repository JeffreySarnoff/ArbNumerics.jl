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
        @test_throws DomainError ArbFloat{23}(0)
        a = ArbFloat(10)
        b = ArbFloat(20)
        swap!(a, b)
        @test (a, b) == (20, 10)

        a = ArbFloat(pi)
        @test ArbFloat(a) === a
        @test copy(a) == a
        @test copy(a) !== a
        @test copy(a, 24, RoundDown) == 13176794 / 2^22
        @test copy(a, 24, RoundUp) == 13176795 / 2^22
        @test copy(a, RoundUp) > a
        @test a > copy(a, RoundDown)
        @test copy(a, 24) == copy(a, 24, RoundUp)
        @test_throws DomainError copy(a, 10)

        @test Float64(a) ≈ Float64(pi)
        @test Float32(a) ≈ Float32(pi)
        @test Float16(a) ≈ Float16(pi)
        @test BigFloat(a) ≈ BigFloat(pi, precision=128)

        @test ArbFloat(typemax(UInt)) == typemax(UInt)
        @test ArbFloat(typemax(Int128)) == typemax(Int128)
        @test ArbFloat(1 // 3) ≈ ArbFloat(1) / ArbFloat(3)
        @test ArbFloat(a, bits=25) isa ArbFloat{49}

        @test ArbFloat{25}(ArbReal{26}(42)) == 42
        @test ArbFloat{25}(ArbComplex{26}(42)) == 42
        @test_throws InexactError ArbFloat{25}(ArbComplex{26}(1+im))
    end

    @testset "convert ArbFloat to Integer" begin
        v = typemax(Int32) + 1.51
        w = round(v)
        a = ArbFloat(v)
        @test_throws InexactError Int32(a)
        @test_throws InexactError Int64(a) == w
        @test_throws InexactError Int128(a) == w
        @test_throws InexactError BigInt(a) == w

        @test_throws InexactError Int32(a, RoundUp) == w
        @test Int64(a, RoundDown) == w - 1
        @test Int128(a, RoundNearest) == w
        @test Int128(a, RoundUp) == w
        @test BigInt(a, RoundToZero) == w - 1

        @test_throws InexactError Integer(a)

        a = ArbFloat(w)
        @test_throws InexactError Int32(a) == w
        @test Int64(a) == w
        @test Int128(a) == w
        @test BigInt(a) == w

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
        @test_broken hash(b) == hash(1) # because isequal(b, 1), see ?hash

        @test widen(ArbFloat{24}) == ArbFloat{52}
    end

    @testset "ArbReal" begin
        @test_throws DomainError ArbReal{23}(0)
        a = ArbReal(10)
        b = ArbReal(20)
        swap!(a, b)
        @test (a, b) == (20, 10)

        a = ArbReal(pi)
        @test ArbReal(a) === a
        @test copy(a) == a
        @test copy(a) !== a

        @test Float64(a) ≈ Float64(pi)
        @test Float32(a) ≈ Float32(pi)
        @test Float16(a) ≈ Float16(pi)
        @test BigFloat(a) ≈ BigFloat(pi, precision=128)

        ma = ArbNumerics.Mag(a)
        @test Float64(ma) ≈ Float64(pi)
        @test Float32(ma) ≈ Float32(pi)
        @test Float16(ma) ≈ Float16(pi)
        @test_throws MethodError BigFloat(ma) ≈ BigFloat(pi, precision=128)

        @test ArbReal(typemax(UInt)) == typemax(UInt)
        @test ArbReal(typemax(Int128)) == typemax(Int128)
        @test ArbReal(1 // 3) ≈ ArbReal(1) / ArbReal(3)
        @test ArbReal(1 + 0im) == 1
        @test ArbReal{25}(ArbComplex{26}(42)) == 42
    end

    @testset "convert ArbReal to Integer" begin
        v = typemax(Int32) + 1
        w = round(v)
        a = ArbReal(v)
        @test_throws InexactError Int32(a)
        @test Int64(a) == w
        @test Int128(a) == w
        @test BigInt(a) == w

        a = ArbReal(1.5)
        @test_throws InexactError Int(a)
        @test_throws InexactError Integer(a)
        v = typemin(Int32) - 1
        a = ArbReal(v)
        x = Integer(a)
        @test typeof(x) == Int64
        @test x == v
        v = Int128(typemax(Int64)) + 1
        a = ArbReal(v)
        x = Integer(a)
        @test typeof(x) == BigInt
        @test x == v
    end

    @testset "functions with ArbReal" begin
        a = ArbReal(ℯ)
        @test midpoint(a) ≈ a
        @test !iszero(radius(a))
        @test radius(a, ArbFloat) ≈ radius(a) rtol=1e-5
        @test radius(a, ArbNumerics.Mag) == radius(a)

        @test modf(a) == (a - 2, 2)
        @test fmod(modf(a)) ≈ a
        @test fmod(modf(a)...) ≈ a

        b = ArbReal(1)
        @test iszero(radius(b))
        @test div(-a, b) == -2
        @test rem(-a, b) ≈ -a + 2
        @test fld(-a, b) == -3
        @test mod(-a, b) ≈ -a + 3
        @test divrem(a, b) == (div(a, b), rem(a, b))
        @test fldmod(a, b) == (fld(a, b), mod(a, b))

        @test hash(a) isa UInt
        @test_broken hash(b) == hash(1) # because isequal(b, 1), see ?hash

        @test widen(ArbReal{24}) == ArbReal{52}
    end

end
