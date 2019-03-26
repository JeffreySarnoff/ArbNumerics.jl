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
    "location": "settingvalues/#Setting-Values-1",
    "page": "Setting Values",
    "title": "Setting Values",
    "category": "section",
    "text": "To set a floating point value with 100 bits of precisionjulia> two = ArbFloat(2, bits=100)\n2.0\njulia> sqrt2 = sqrt(two)\n1.41421356237309504880168872421To set a floating point value with a precision of 30 digitsjulia> two = ArbFloat(2, digits=30)\n2.0\njulia> sqrt2 = sqrt(two)\n1.41421356237309504880168872421To set a real valued interval with 100 bits of precisiontwo = ArbReal(2, bits=100)\nsqrt2 = sqrt(two)           # precision(sqrt2, base=2) == 100To set a real valued interval with a precision of 30 digitstwo = ArbReal(2, digits=30)\nsqrt2 = sqrt(two)            # precision(sqrt2, base=10) == 30To set a complex value with 100 bits of precisionArbComplex(1.0, 0.5, bits=100)\n# or\nre = ArbFloat(1.0, bits=100)\nim = ArbFloat(0.5, bits=100)\nArbComplex(re, im)\n# or\nre = ArbReal(1.0, bits=100)\nim = ArbReal(0.5, bits=100)\nArbComplex(re, im)To set a complex value with a precision of 30 digitsArbComplex(1.0, 0.5, digits=30)\n# or\nre = ArbFloat(1.0, digits=30)\nim = ArbFloat(0.5, digits=30)\nArbComplex(re, im)\n# or\nre = ArbReal(1.0, digits=30)\nim = ArbReal(0.5, digits=30)\nArbComplex(re, im)"
},

{
    "location": "seeingvalues/#",
    "page": "Seeing Values",
    "title": "Seeing Values",
    "category": "page",
    "text": ""
},

{
    "location": "seeingvalues/#Seeing-Values-1",
    "page": "Seeing Values",
    "title": "Seeing Values",
    "category": "section",
    "text": "show works, showall shows the digits closer to workingprecision. string and stringall correspond."
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
    "location": "precisions/#",
    "page": "Precisions",
    "title": "Precisions",
    "category": "page",
    "text": ""
},

{
    "location": "precisions/#working-precision-1",
    "page": "Precisions",
    "title": "working precision",
    "category": "section",
    "text": "ArbNumerics values have an intrinsic precision, which is the number of bits that are evaluated in computation.  Values that are determined by calculation may be displayed at this, their full precision.  If this is the behavior you prefer, start using the package this way:using ArbNumerics\nshow_working_values()"
},

{
    "location": "precisions/#enclosed-precision-1",
    "page": "Precisions",
    "title": "enclosed precision",
    "category": "section",
    "text": "The alternative is to use some of the least significant bits as a \"cushion\" that protects against showing greater precision than is warranted by the accuracy that is assured.  This is particularly important when showing values that are point estimates of an interval that encloses the mathematical result. If you prefer to be shown quantities as point values that best reflect the accuracy available at the end of a computation by letting go of uncertain trailing bits, start using the package this way:using ArbNumerics\nshow_enclosed_values()"
},

{
    "location": "precisions/#rounded-precision-1",
    "page": "Precisions",
    "title": "rounded precision",
    "category": "section",
    "text": "If you specify neither show_working_precision() nor show_enclosed_precision(), then the working precision will exceed the displayed precision by a fixed number of bits.  By default, 24 extra bits are used for the working precision.  This is a settable quantity. If you prefer a different bit differential, you should establish that at the start and you should not alter it midstream:using ArbNumerics\nshow_rounded_values(32)"
},

{
    "location": "precisions/#precision-modality-1",
    "page": "Precisions",
    "title": "precision modality",
    "category": "section",
    "text": "The operative modality is obtainable using bits_rounded(). After show_working_values(), it is 0. After show_rounded_values(nbits), it is nbits.  After show_enclosed_values, it is missing.function precision_modality()\n    nbits = bits_rounded()\n    return if nbits === missing\n               :enclosed\n           elseif iszero(nbits)\n               :working\n           else\n               :rounded\n           end\nend"
},

{
    "location": "mathfunctions/#",
    "page": "Math Functions",
    "title": "Math Functions",
    "category": "page",
    "text": ""
},

{
    "location": "mathfunctions/#arithmetic-functions-1",
    "page": "Math Functions",
    "title": "arithmetic functions",
    "category": "section",
    "text": "+,-, *, /\nsquare, cube, sqrt, cbrt, hypot\npow(x,i), root(x,i) where i is an integer > 0\nfactorial, doublefactorial, risingfactorial\nbinomial"
},

{
    "location": "mathfunctions/#elementary-functions-1",
    "page": "Math Functions",
    "title": "elementary functions",
    "category": "section",
    "text": "exp, expm1\nlog, log1p, log2, log10\nsin, cos, tan, csc, sec, cot\nasin, acos, atan, atan(y,x)\nsinh, cosh, tanh, csch, sech, coth\nasinh, acosh, atanh"
},

{
    "location": "mathfunctions/#gamma-functions-1",
    "page": "Math Functions",
    "title": "gamma functions",
    "category": "section",
    "text": "gamma, lgamma\nrgamma, digamma"
},

{
    "location": "mathfunctions/#error-functions-1",
    "page": "Math Functions",
    "title": "error functions",
    "category": "section",
    "text": "erf, erfc, erfi"
},

{
    "location": "mathfunctions/#Bessel-functions-1",
    "page": "Math Functions",
    "title": "Bessel functions",
    "category": "section",
    "text": "besselj, besselj0, besselj1\nbessely, bessely0, bessely1\nbesseli, besselk"
},

{
    "location": "mathfunctions/#Airy-functions-1",
    "page": "Math Functions",
    "title": "Airy functions",
    "category": "section",
    "text": "airyai, airyaiprime\nairybi, airybiprime"
},

{
    "location": "mathfunctions/#arithmetic-geometric-mean-1",
    "page": "Math Functions",
    "title": "arithmetic-geometric mean",
    "category": "section",
    "text": "agm, agm1"
},

{
    "location": "mathfunctions/#elliptic-functions-1",
    "page": "Math Functions",
    "title": "elliptic functions",
    "category": "section",
    "text": "elliptice, elliptick\nellipticp, ellipticpi\nellipticzeta, ellipticsigma"
},

{
    "location": "mathfunctions/#other-special-functions-1",
    "page": "Math Functions",
    "title": "other special functions",
    "category": "section",
    "text": "ei, si, ci\nshi, chi\nzeta, eta, xi    # Reimann\nlambertw"
},

{
    "location": "mathfunctions/#complex-functions-1",
    "page": "Math Functions",
    "title": "complex functions",
    "category": "section",
    "text": "conj # applies to a value and applies to a matrix"
},

{
    "location": "matrixfunctions/#",
    "page": "Matrix Functions",
    "title": "Matrix Functions",
    "category": "page",
    "text": ""
},

{
    "location": "matrixfunctions/#functions-1",
    "page": "Matrix Functions",
    "title": "functions",
    "category": "section",
    "text": "det, tr\ntranspose, adjoint, inv\n.+, .-, .*, ./           ( element op element )\n+, -, *, /, \\          ( matrix  op matrix  )"
},

{
    "location": "matrixfunctions/#using-LinearAlgebra-1",
    "page": "Matrix Functions",
    "title": "using LinearAlgebra",
    "category": "section",
    "text": "using GenericSVD, LinearAlgebralu\neigvals\nsvdvals # except matrices of ArbComplex"
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
    "text": ""
},

{
    "location": "intervalfunctions/#parts-1",
    "page": "Interval Functions",
    "title": "parts",
    "category": "section",
    "text": "midpoint, radius\nupperbound, lowerbound\nupperbound_abs, lowerbound_abs"
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
    "text": "midpoint, radius = ball(x::ArbReal)\nlobound, hibound = interval(x::ArbReal)"
},

{
    "location": "libarb_differences/#",
    "page": "LibArb Differences",
    "title": "LibArb Differences",
    "category": "page",
    "text": ""
},

{
    "location": "libarb_differences/#ArbNumerics-and-LibArb-1",
    "page": "LibArb Differences",
    "title": "ArbNumerics and LibArb",
    "category": "section",
    "text": "The input values have no memory of the precision that was used to create them. An input value could be, say,    [1.0 +/- 0.25], regardless of whether the precision used to compute it was 2 bits, 100 bits, or 1000000 bits.Just think of a ball as a pair of rational numbers, not in terms of precision. The precision p for the new operation specifies (in almost all functions) that the midpoint of the output ball is to be rounded to at most p bits; if p = 100 then the output will be rounded to at most 100 bits even if the inputs have 1000000 bits.– Fredrik Johansson on nemo-dev, 2018-Dec-05"
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
