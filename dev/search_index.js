var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Overview",
    "title": "Overview",
    "category": "page",
    "text": ""
},

{
    "location": "#ArbNumerics-1",
    "page": "Overview",
    "title": "ArbNumerics",
    "category": "section",
    "text": "ArbNumerics.jl offers efficient mathematical computation with multiprecision values\nFloating Point values, Real values (as interval enclosures) and Complex values are supported\nSet the precision to a given number of bits (24..8000) or to cover a number of digits (10..2400)\nMany mathematical functions are available\nSome basic matrix functions are supported\nA Julian perspective on Frederik Johansson\'s Arb C library"
},

{
    "location": "thetypes/#",
    "page": "The Types",
    "title": "The Types",
    "category": "page",
    "text": "There are three core types: ArbFloat, ArbReal, ArbComplex.  Vectors of elements of these types are formed and used in the usual ways. Some matrix operations are supported through the underlying C library, which requires data be given in row-dominant order, we have Matrix types: ArbFloatMatrix, ArbRealMatrix, ArbComplexMatrix.  Their use is described in the section on Matrices."
},

{
    "location": "thetypes/#ArbFloat-1",
    "page": "The Types",
    "title": "ArbFloat",
    "category": "section",
    "text": "An ArbFloat value is an extended precision floating point value where the precision is fixed at construction."
},

{
    "location": "thetypes/#ArbReal-1",
    "page": "The Types",
    "title": "ArbReal",
    "category": "section",
    "text": "An ArbReal value is implemented in the underlying C library as an ArbFloat midpoint and a value enclosing radius.(Image: midrad)"
},

{
    "location": "thetypes/#ArbComplex-1",
    "page": "The Types",
    "title": "ArbComplex",
    "category": "section",
    "text": "An ArbComplex value is implemented in as two ArbReal one for the real part and one for the imaginary part.You can form an ArbComplex using two ArbReals or two ArbFloats or one of each.The real and imaginary parts are recovered using real(z) and imag(z) where z is an ArbComplex.\nangle(z) and magnitude(z) recover the phase angle and the lineal extent of an ArbComplex number.\nconj(z) obtains the complex conjugate of an ArbComplex number."
},

{
    "location": "settingvalues/#",
    "page": "Setting Values",
    "title": "Setting Values",
    "category": "page",
    "text": ""
},

{
    "location": "settingvalues/#Set-a-Floating-Point-value-1",
    "page": "Setting Values",
    "title": "Set a Floating Point value",
    "category": "section",
    "text": "To set a floating point value with 100 bits of precisionjulia> two = ArbFloat(2, bits=100)\n2.0\njulia> sqrt2 = sqrt(two)\n1.41421356237309504880168872421To set a floating point value with a precision of 30 digitsjulia> two = ArbFloat(2, digits=30)\n2.0\njulia> sqrt2 = sqrt(two)\n1.41421356237309504880168872421"
},

{
    "location": "settingvalues/#Set-a-Real-enclosure-1",
    "page": "Setting Values",
    "title": "Set a Real enclosure",
    "category": "section",
    "text": "To set a real valued interval with 100 bits of precisiontwo = ArbReal(2, bits=100)\nsqrt2 = sqrt(two)           # precision(sqrt2, base=2) == 100To set a real valued interval with a precision of 30 digitstwo = ArbReal(2, digits=30)\nsqrt2 = sqrt(two)            # precision(sqrt2, base=10) == 30"
},

{
    "location": "settingvalues/#Set-a-Complex-value-1",
    "page": "Setting Values",
    "title": "Set a Complex value",
    "category": "section",
    "text": "To set a complex value with 100 bits of precisionArbComplex(1.0, 0.5, bits=100)\n# or\nre = ArbFloat(1.0, bits=100)\nim = ArbFloat(0.5, bits=100)\nArbComplex(re, im)\n# or\nre = ArbReal(1.0, bits=100)\nim = ArbReal(0.5, bits=100)\nArbComplex(re, im)To set a complex value with a precision of 30 digitsArbComplex(1.0, 0.5, digits=30)\n# or\nre = ArbFloat(1.0, digits=30)\nim = ArbFloat(0.5, digits=30)\nArbComplex(re, im)\n# or\nre = ArbReal(1.0, digits=30)\nim = ArbReal(0.5, digits=30)\nArbComplex(re, im)"
},

{
    "location": "seeingvalues/#",
    "page": "Seeing Values",
    "title": "Seeing Values",
    "category": "page",
    "text": ""
},

{
    "location": "seeingvalues/#show,-showall,-string,-stringall-1",
    "page": "Seeing Values",
    "title": "show, showall, string, stringall",
    "category": "section",
    "text": "using ArbNumerics\n\njulia> string(ArbFloat(pi)^12)\n\"924269.1815233741862225791703585\"\n\njulia> stringall(ArbFloat(pi)^12)\n\"924269.18152337418622257917035847560717530\"\n\njulia> setprecision(ArbReal, 168)\n168\n\njulia> show(ArbFloat(pi)^12)\n924269.18152337418622257917035847560717292226894005\n\njulia> showall(ArbFloat(pi)^12)\n924269.181523374186222579170358475607172922268940049306206"
},

{
    "location": "seeingvalues/#@sprintf,-@printf-1",
    "page": "Seeing Values",
    "title": "@sprintf, @printf",
    "category": "section",
    "text": "using ArbNumerics, Printf\n\njulia> @printf \"%3.7f\" ArbFloat(pi)^12\n924269.1815234\njulia> @sprintf \"%3.12e\" ArbReal(pi)^12\n\"9.242691815234e+05\""
},

{
    "location": "seeingvalues/#vectors,-matricies-1",
    "page": "Seeing Values",
    "title": "vectors, matricies",
    "category": "section",
    "text": "julia> using ArbNumerics\n\njulia> m = reshape(rand(ArbReal, 5*5), 5, 5)\n\njulia> m\n5×5 Array{ArbFloat,2}:\n 0.6411792438227919647430884603712  0.9172297277765197771411841297676   …  0.9223421384409213026075800198888\n 0.8450969059727185724253076754441  0.01646810654535360936754546223339     0.08308546884930868750284819194842\n 0.4169143288874284216661610699120  0.2171960329239345115781880947476      0.1607068347736886642746528027130\n 0.5440900728685100306230036517586  0.2239538083426297723496374964114      0.4592276629733160297254143720105\n 0.3350641275593416157706181564106  0.1671789815655477013169811621209      0.8609026985890416531378821669739\n\njulia> Float64.(m)\n5×5 Array{Float64,2}:\n 0.641179  0.91723    0.038678  0.867392  0.922342\n 0.845097  0.0164681  0.218183  0.342917  0.0830855\n 0.416914  0.217196   0.858553  0.400199  0.160707\n 0.54409   0.223954   0.414976  0.407089  0.459228\n 0.335064  0.167179   0.269326  0.724101  0.860903"
},

{
    "location": "precisions/#",
    "page": "Precisions",
    "title": "Precisions",
    "category": "page",
    "text": ""
},

{
    "location": "precisions/#minimum-precision-1",
    "page": "Precisions",
    "title": "minimum precision",
    "category": "section",
    "text": "The minimum precision is 24 significant bits, or 8 significant digits."
},

{
    "location": "precisions/#working-precision-1",
    "page": "Precisions",
    "title": "working precision",
    "category": "section",
    "text": "ArbNumerics values have an intrinsic precision, which is the number of bits that are evaluated in computation.  Values that are determined by calculation may be displayed at this, their full precision.  If this is the behavior you prefer, start using the package this way:using ArbNumerics\nsetextrabits(0)"
},

{
    "location": "precisions/#enclosed-precision-1",
    "page": "Precisions",
    "title": "enclosed precision",
    "category": "section",
    "text": "The alternative is to use some of the least significant bits as a \"cushion\" that protects against showing greater precision than is warranted by the accuracy that is assured.  This is particularly important when showing values that are point estimates of an interval that encloses the mathematical result. If you prefer to be shown quantities as point values that best reflect the accuracy available at the end of a computation by letting go of uncertain trailing bits, start using the package this way:using ArbNumerics\nsetextrabits(48)"
},

{
    "location": "precisions/#rounded-precision-1",
    "page": "Precisions",
    "title": "rounded precision",
    "category": "section",
    "text": "If you do specify the number of extrabits to use, then the working precision will exceed the displayed precision by a fixed number of bits (24, the default).setextrabits should be used only at the start of work. Reliabile computations presume you not alter it midstream."
},

{
    "location": "precisions/#finding-precisions-1",
    "page": "Precisions",
    "title": "finding precisions",
    "category": "section",
    "text": "The number of displayed bits is given by any of:    precision(ArbFloat), precision(ArbReal), precision(ArbComplex).         All of these are kept in sync.The number of working bits is given by any of:     workingprecision(ArbFloat), workingprecision(ArbReal), workingprecision(ArbComplex).         All of these are kept in sync.The number of extrabits is given by any of:     extrabits(ArbFloat), extrabits(ArbReal), extrabits(ArbComplex).     All of these are kept in sync."
},

{
    "location": "rounding/#",
    "page": "Rounding",
    "title": "Rounding",
    "category": "page",
    "text": ""
},

{
    "location": "rounding/#To-an-integral-value-1",
    "page": "Rounding",
    "title": "To an integral value",
    "category": "section",
    "text": "julia> round(ArbFloat(2.5), RoundNearest), round(ArbFloat(3.5, RoundNearest)\n2.0, 2.0\n\njulia> round(ArbReal(4.5), RoundNearest), round(ArbReal(5.4, RoundNearest)\n4.0, 4.0\n\njulia> round(ArbFloat(pi), RoundDown), round(ArbFloat(pi), RoundUp)\n3.0, 4.0\n\njulia> round(ArbReal(pi), RoundToZero), round(ArbFloat(pi), RoundFromZero)\n3.0, 4.0"
},

{
    "location": "rounding/#To-a-given-number-of-bits-1",
    "page": "Rounding",
    "title": "To a given number of bits",
    "category": "section",
    "text": ""
},

{
    "location": "rounding/#To-a-given-number1-of-digits-1",
    "page": "Rounding",
    "title": "To a given number±1 of digits",
    "category": "section",
    "text": ""
},

{
    "location": "mathfunctions/#",
    "page": "Elementary Functions",
    "title": "Elementary Functions",
    "category": "page",
    "text": ""
},

{
    "location": "mathfunctions/#arithmetic-functions-1",
    "page": "Elementary Functions",
    "title": "arithmetic functions",
    "category": "section",
    "text": "+,-, *, /\nsquare, cube, sqrt, cbrt, hypot\npow(x,i), root(x,i) where i is an integer > 0\nfactorial, doublefactorial, risingfactorial\nbinomial"
},

{
    "location": "mathfunctions/#complex-constituents-1",
    "page": "Elementary Functions",
    "title": "complex constituents",
    "category": "section",
    "text": "real, imag\nangle, magnitude\nconj # applies to a value and applies to a matrix"
},

{
    "location": "mathfunctions/#random-numbers-1",
    "page": "Elementary Functions",
    "title": "random numbers",
    "category": "section",
    "text": "rand, randn"
},

{
    "location": "mathfunctions/#arithmetic-geometric-mean-1",
    "page": "Elementary Functions",
    "title": "arithmetic-geometric mean",
    "category": "section",
    "text": "agm, agm1All of the following functions are available for ArbFloat, ArbReal and ArbComplex types"
},

{
    "location": "mathfunctions/#elementary-functions-1",
    "page": "Elementary Functions",
    "title": "elementary functions",
    "category": "section",
    "text": "exp, expm1\nlog, log1p, log2, log10\nsin, cos, tan, csc, sec, cot\nsinpi, cospi, tanpi, cotpi\nasin, acos, atan, atan(y,x)\nsinh, cosh, tanh, csch, sech, coth\nasinh, acosh, atanh"
},

{
    "location": "mathfunctions/#gamma-functions-1",
    "page": "Elementary Functions",
    "title": "gamma functions",
    "category": "section",
    "text": "gamma, lgamma\nrgamma, digamma"
},

{
    "location": "mathfunctions/#error-functions-1",
    "page": "Elementary Functions",
    "title": "error functions",
    "category": "section",
    "text": "erf, erfc, erfi"
},

{
    "location": "mathfunctions/#Bessel-functions-1",
    "page": "Elementary Functions",
    "title": "Bessel functions",
    "category": "section",
    "text": "besselj, besselj0, besselj1\nbessely, bessely0, bessely1\nbesseli, besselk"
},

{
    "location": "mathfunctions/#Airy-functions-1",
    "page": "Elementary Functions",
    "title": "Airy functions",
    "category": "section",
    "text": "airyai, airyaiprime\nairybi, airybiprime"
},

{
    "location": "mathfunctions/#elliptic-functions-1",
    "page": "Elementary Functions",
    "title": "elliptic functions",
    "category": "section",
    "text": "elliptice, elliptick, ellipticpi     (complete and incomplete integrals)\nelliptic_e, elliptic_k, elliptic_pi  (squares the modulus)\nellipticrf, ellipticrg, ellipticrj   (Carleson\'s symmetric integrals)"
},

{
    "location": "mathfunctions/#other-special-functions-1",
    "page": "Elementary Functions",
    "title": "other special functions",
    "category": "section",
    "text": "ei, si, ci\nshi, chi\nzeta, eta, xi    # Reimann\nlambertw"
},

{
    "location": "ellipticintegrals/#",
    "page": "Elliptic Integrals",
    "title": "Elliptic Integrals",
    "category": "page",
    "text": ""
},

{
    "location": "ellipticintegrals/#[complete](http://arblib.org/acb_elliptic.html#complete-elliptic-integrals)-1",
    "page": "Elliptic Integrals",
    "title": "complete",
    "category": "section",
    "text": "the complete elliptic integral of the first kind\nelliptic_k(m)\nelliptic_k2(m) == elliptic_k(m^2)(Image: elliptick)the complete elliptic integral of the second kind\nelliptic_e(m)\nelliptic_e2(m) == elliptic_e(m^2)(Image: elliptice)the complete elliptic integral of the third kind\nelliptic_pi(n, m)\nelliptic_pi2(n, m) == elliptic_pi(n, m^2)(Image: ellipticpi)"
},

{
    "location": "ellipticintegrals/#[incomplete](http://arblib.org/acb_elliptic.html#legendre-incomplete-elliptic-integrals)-1",
    "page": "Elliptic Integrals",
    "title": "incomplete",
    "category": "section",
    "text": "the incomplete elliptic integral of the first kind\nelliptic_f(phi, m)\nelliptic_f2(phi, m) == elliptic_f(phi, m^2)(Image: ellipticf)the incomplete elliptic integral of the second kind\nelliptic_e(phi, m)\nelliptic_e2(phi, m) == elliptic_e(phi, m^2)(Image: elliptice_incomplete)the incomplete elliptic integral of the third kind\nelliptic_pi(n, phi, m)\nelliptic_pi2(n, phi, m) == elliptic_pi(n, phi, m^2)(Image: ellipticpi_incomplete)"
},

{
    "location": "ellipticintegrals/#[symmetric-(Carlson)](http://arblib.org/acb_elliptic.html#carlson-symmetric-elliptic-integrals)-1",
    "page": "Elliptic Integrals",
    "title": "symmetric (Carlson)",
    "category": "section",
    "text": "the symmetric elliptic integral of the first kind\nelliptic_rf(x, y, z)(Image: ellipticrf)the symmetric elliptic integral of the second kind\nelliptic_rg(x, y, z)(Image: ellipticrg)the symmetric elliptic integral of the third kind\nelliptic_rj(x, y, z)(Image: ellipticrj)"
},

{
    "location": "ellipticfunctions/#",
    "page": "Elliptic Functions",
    "title": "Elliptic Functions",
    "category": "page",
    "text": ""
},

{
    "location": "ellipticfunctions/#[Weierstrass-Functions](http://arblib.org/acb_elliptic.html#weierstrass-elliptic-functions)-1",
    "page": "Elliptic Functions",
    "title": "Weierstrass Functions",
    "category": "section",
    "text": "Weierstrass elliptic function\nweierstrass_p(z, tau)(Image: Weierstrass_p)     Weierstrass inverse elliptic function\nweierstrass_invp(z, tau)(Image: Weierstrass_pinv)Weierstrass zeta function\nweierstrass_zeta(z, tau)(Image: Weierstrass_zeta)Weierstrass sigma function\nweierstrass_sigma(z, tau)(Image: Weierstrass_sigma)"
},

{
    "location": "matrixfunctions/#",
    "page": "Matrix Functions",
    "title": "Matrix Functions",
    "category": "page",
    "text": ""
},

{
    "location": "matrixfunctions/#Matrix-Functions-1",
    "page": "Matrix Functions",
    "title": "Matrix Functions",
    "category": "section",
    "text": ""
},

{
    "location": "matrixfunctions/#using-ArbNumerics,-GenericSchur,-GenericSVD,-LinearAlgebra-1",
    "page": "Matrix Functions",
    "title": "using ArbNumerics, GenericSchur, GenericSVD, LinearAlgebra",
    "category": "section",
    "text": "det, tr\ntranspose, adjoint, inv\nexp\n.+, .-, .*, ./           ( element op element )\n+, -, *, /, \\          ( matrix  op matrix  )\nlu, qr, factorize"
},

{
    "location": "matrixfunctions/#Performance-1",
    "page": "Matrix Functions",
    "title": "Performance",
    "category": "section",
    "text": "With the working precision at 128 bits, and 100x100 element matrices, 13x (24x, 32x with 8 cores)using BenchmarkTools\n\nsetprecision(BigFloat, workingprecision(ArbFloat))\n128\n\nn = 100;\n\nbf = rand(BigFloat, n, n);\naf = rand(ArbFloat, n, n);\nar = rand(ArbReal, n, n);\n\n@btime $bf * $bf;\n  158.920 ms (4080002 allocations: 186.84 MiB)\n\n@btime $af * $af;\n  12.027 ms (40011 allocations: 2.44 MiB)\n  \n@btime $af * $af; # 8 cores available\n   6.611 ms (40011 allocations: 2.44 MiB)\n\n@btime $ar * $ar; # 8 cores available\n  4.881 ms (10006 allocations: 703.41 KiB)\nWith the working precision at 128 bits, increasing n from 100 to 250, 18x (35x, 44x with 8 cores)@btime $bf * $bf;\n  2.905 s (63000002 allocations: 2.82 GiB)\n\n@btime $af * $af;\n  156.604 ms (250011 allocations: 15.26 MiB)\n  \n@btime $af * $af; # 8 cores available\n  80.941 ms (250011 allocations: 15.26 MiB)\n\n@btime $ar * $ar; # 8 cores available\n  65.392 ms (62506 allocations: 4.29 MiB)as the working precision increases, they narrow –     e.g. with precision of 512 bits and n=100, 3x (9x, 11x with 8 cores)@btime $bf * $bf;\n  247.357 ms (4080002 allocations: 280.23 MiB)\n\n@btime $af * $af;\n  75.515 ms (40013 allocations: 2.44 MiB)\n\n@btime $af * $af; # 8 cores available\n  25.473 ms (40013 allocations: 2.44 MiB)\n\n@btime $ar * $ar; # 8 cores available\n  21.264 ms (10008 allocations: 703.44 KiB)as n increases they widen –     e.g. with precision of 512 bits and n=250, 7x (9x, 12x with 8 cores)@btime $bf * $bf;\n   4.311 s (63000002 allocations: 4.22 GiB)\n\n@btime $af * $af;\n  606.713 ms (250013 allocations: 15.26 MiB)\n  \n@btime $af * $af; # 8 cores available\n  457.125 ms (250013 allocations: 15.26 MiB)\n\n@btime $ar * $ar; # 8 cores available\n  333.056 ms (62508 allocations: 4.29 MiB)"
},

{
    "location": "intervalfunctions/#",
    "page": "Interval Functions",
    "title": "Interval Functions",
    "category": "page",
    "text": "Where x is an ArbReal value and other values are ArbFloats."
},

{
    "location": "intervalfunctions/#parts-1",
    "page": "Interval Functions",
    "title": "parts",
    "category": "section",
    "text": "midpoint(x), radius(x)\nlowerbound(x), upperbound(x)\nupperbound_abs(x), lowerbound_abs(x)"
},

{
    "location": "intervalfunctions/#construction-1",
    "page": "Interval Functions",
    "title": "construction",
    "category": "section",
    "text": "setball(midpoint, radius)\nsetinterval(lobound, hibound)"
},

{
    "location": "intervalfunctions/#retrieval-1",
    "page": "Interval Functions",
    "title": "retrieval",
    "category": "section",
    "text": "midpoint, radius = ball(x)\nlobound, hibound = interval(x)"
},

{
    "location": "libarb_differences/#",
    "page": "LibArb Differences",
    "title": "LibArb Differences",
    "category": "page",
    "text": ""
},

{
    "location": "libarb_differences/#LibArb-values-do-not-own-their-precision-1",
    "page": "LibArb Differences",
    "title": "LibArb values do not own their precision",
    "category": "section",
    "text": "The input values have no memory of the precision that was used to create them. An input value could be, say,    [1.0 +/- 0.25], regardless of whether the precision used to compute it was 2 bits, 100 bits, or 1000000 bits.Just think of a ball as a pair of rational numbers, not in terms of precision. The precision p for the new operation specifies (in almost all functions) that the midpoint of the output ball is to be rounded to at most p bits; if p = 100 then the output will be rounded to at most 100 bits even if the inputs have 1000000 bits.– Fredrik Johansson on nemo-dev, 2018-Dec-05"
},

{
    "location": "libarb_differences/#ArbNumerics-values-own-their-own-precision-1",
    "page": "LibArb Differences",
    "title": "ArbNumerics values own their own precision",
    "category": "section",
    "text": "works properly with mixed precision arithmetic\nworks as intended with precision reduction\nmaintains value integrity with precision expansion"
},

{
    "location": "references/#",
    "page": "References",
    "title": "References",
    "category": "page",
    "text": ""
},

{
    "location": "references/#References-1",
    "page": "References",
    "title": "References",
    "category": "section",
    "text": ""
},

{
    "location": "documentindex/#",
    "page": "Index",
    "title": "Index",
    "category": "page",
    "text": ""
},

{
    "location": "documentindex/#Index-1",
    "page": "Index",
    "title": "Index",
    "category": "section",
    "text": ""
},

]}
