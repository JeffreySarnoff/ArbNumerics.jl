
import ArbNumerics: sign_bit, sign_bits

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

    # issue 34 and similar Cint-related stuff
    @testset "ArbComplex constructors" begin
        @test ismissing(ArbComplex{100}(missing))
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
        @test sign_bit(ac) == false
        @test sign_bits(ac) == (false, false)
        @test ArbComplex(fac) == ArbComplex(rac)
        @test copy(ac) == deepcopy(ac)
        @test ArbComplex(rac, fac) == Complex(rac, fac) == complex(rac, fac)
        @test ArbComplex(rac) == Complex(rac) == complex(rac)

        @test ArbComplex(rac, Int128(1)) isa ArbComplex{64}
        @test ArbComplex(fac, UInt8(1)) isa ArbComplex{128} # inconsistent for fac::ArbFloat
        @test ArbComplex(Float32(1.0), fac) isa ArbComplex{64}
        @test ArbComplex{25}(1, fac) isa ArbComplex{25}
        @test ArbComplex(π) isa ArbComplex{128}

        @test ArbComplex(Int32(-1)) == ArbComplex(-1.0)
        @test ArbComplex(Int32(-1), Int32(-2)) == ArbComplex(-1.0, -2.0)
        @test ArbComplex(typemax(Int32) + 1) == ArbComplex(float(typemax(Int32) + 1))
        @test hash(ArbComplex(-2, -2)) isa UInt
        @test_broken ArbComplex{256}(1.0 + im) == ArbComplex(1 + im, bits=256) # TODO missing
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
        @test_broken angle(api) ≈ angle(Complex(api))

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

end
