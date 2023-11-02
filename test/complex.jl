@testset "ArbComplex" begin

    @testset "complex" begin
        @test (1 + im) / ArbNumerics.ArbComplex(1, 1) == 1
        @test one(ArbComplex) == 1
        BITS = 53
        a = sqrt(ArbFloat(2, bits=BITS))
        b = ArbReal(pi, bits=BITS)
        c = ArbComplex(a, b, bits=BITS)
        @test precision(c) == BITS
    end

    @testset "missing data" begin
        @test ismissing(ArbFloat(missing))
        @test ismissing(ArbReal(missing))
        @test ismissing(ArbComplex(missing))

        @test ismissing(ArbComplex(missing, 1))
        @test ismissing(ArbComplex(1, missing))
        @test ismissing(ArbComplex(missing, missing))
        @test_throws MethodError ismissing(ArbComplex(1+im, missing))
        @test_throws MethodError ismissing(ArbComplex(missing, 1+im))

        @test ismissing(ArbFloat{99}(missing))
        @test ismissing(ArbReal{99}(missing))
        @test ismissing(ArbComplex{99}(missing))

        @test ismissing(ArbComplex{99}(missing, 1))
        @test ismissing(ArbComplex{99}(1, missing))
        @test ismissing(ArbComplex{99}(missing, missing))
        @test_throws MethodError ismissing(ArbComplex{99}(1+im, missing))
        @test_throws MethodError ismissing(ArbComplex{99}(missing, 1+im))
    end
    @testset "ArbComplex constructors" begin
        @test_throws ErrorException ArbComplex(5.0, base=3)
        @test_throws ErrorException ArbComplex(5.0, 1.0, base=3)
        @test ArbComplex{128}(1) == 1
        ac = ArbComplex{64}(1.0 + 2im)
        rac = real(ac)
        fac = float(rac)
        @test abs(ac) ≈ sqrt(abs2(fac) + abs2(imag(ac)))
        @test ArbComplex{64}(ac) === ac
        @test ArbComplex{64}(fac) == ArbComplex(fac)
        @test ArbComplex(5, digits=53) == 5
        @test ArbComplex(5, 0, digits=53) == 5
        @test ArbComplex{53}(1 + 2im) == 1 + 2im
        @test signbit(ac) == false
        @test signbits(ac) == (false, false)
        @test ArbComplex(fac) == ArbComplex(rac)
        @test copy(ac) == deepcopy(ac)
        @test ArbComplex(rac, fac) == Complex(rac, fac) == complex(rac, fac)
        @test ArbComplex(rac) == Complex(rac) == complex(rac)

        @test typeof(ArbComplex(rac, Int128(1))) == ArbComplex{64}
        @test typeof(ArbComplex(fac, UInt8(1))) == ArbComplex{64}
        @test typeof(ArbComplex(Float32(1.0), fac)) == ArbComplex{64}
        @test typeof(ArbComplex{25}(1, fac)) == ArbComplex{25}
        @test typeof(ArbComplex(π)) == ArbComplex{128}

        @test ArbComplex(Int32(-1)) == ArbComplex(-1.0)
        @test ArbComplex(Int32(-1), Int32(-2)) == ArbComplex(-1.0, -2.0)
        @test ArbComplex(typemax(Int32) + 1) == ArbComplex(float(typemax(Int32) + 1))
        @test hash(ArbComplex(-2, -2)) isa UInt
        @test ArbComplex{256}(1.0 + im) == ArbComplex(1 + im, bits=256)
        @test ArbComplex{256}(1.0 + im) == ArbComplex(1, 1, bits=256)

        @test midpoint(ac) == ac
        @test 1e-38 <= abs(radius(ArbComplex(π))) <= 2e-38
        api = ArbComplex(pi, -pi)
        @test trunc(api) == ArbComplex(3 - 3im)
        @test floor(api) == ArbComplex(3 - 4im)
        @test ceil(api) == ArbComplex(4 - 3im)
        @test trunc(Int, api) == (3, -3)
        @test floor(Int8, api) == (3, -4)
        @test ceil(Int16, api) == (4, -3)
        @test modf(ArbComplex(3.5, -2.5)) == ((0.5, 3.0), (-0.5, -2.0))
        @test fmod(modf(api)...) == api
        @test angle(api) ≈ angle(Complex(api))

        @test flipsign(api, -1) == -api
        @test flipsign(api, 0.0) == api
        @test flipsign(api, ArbFloat(-1)) == -api
        @test flipsign(api, ArbReal(0.0)) == api

        @test copysign(-api, -1) == -api
        @test copysign(-api, 0.0) == api
        @test copysign(-api, ArbFloat(-1)) == -api
        @test copysign(-api, ArbReal(0.0)) == api

        @test sign(api) == 1
        @test signs(api) == (1, -1)
        @test signs(ArbComplex(0)) == (0, 0)

        @test signbit(api) == false
        @test signbits(api) == (false, true)

        @test abs2(api) ≈ abs2(real(api)) + abs2(imag(api))

    end

    INF = typemax(Int)
    sprec(a::ArbNumber) = workingprecision(a)
    sprec(::Number) = workingprecision(ArbFloat)
    dprec(a::ArbNumber) = sprec(a)
    dprec(::Number) = INF

    TEST_TYPES = (Int8, Int, UInt32, Float16, Float64, BigFloat, ArbFloat{200}, ArbReal{200})

    @testset "ArbComplex(::$T)" for T in (TEST_TYPES..., ArbComplex{200})
        a = T(10)
        DEF = sprec(a)
        c = ArbComplex(a)
        @test c == 10
        @test typeof(c) == ArbComplex{DEF}

        d = ArbComplex{100}(a)
        @test typeof(d) == ArbComplex{100}
    end

    @testset "ArbComplex(::$TA, ::$TB)" for TA in TEST_TYPES, TB in TEST_TYPES
        a = TA(10)
        b = TB(20)
        DEF = min(dprec(a), dprec(b))
        DEF == INF && (DEF = sprec(a))
        c = ArbComplex(a, b)
        @test c == 10 + 20im
        @test typeof(c) == ArbComplex{DEF} || a isa ArbNumber || b isa ArbNumber # TODO should be true also for ArbNumbers

        d = ArbComplex{250}(a, b)
        @test typeof(d) == ArbComplex{250}
    end

    @testset "ArbComplex(::Int, ::ArbComplex)" begin
        @test_throws MethodError ArbComplex(-12, ArbComplex(1))
        @test_throws MethodError ArbComplex(ArbComplex(1), 0)
    end

end
