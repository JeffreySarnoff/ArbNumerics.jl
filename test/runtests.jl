using ArbNumerics
using Test

setprecision(BigFloat, 512)

# @testset "Support" begin
#    include("ArblibVector.jl")
# end

@testset "ArbNumerics tests" begin
    @testset "ArbNumerics without ambiguous methods" begin
        @test isempty(detect_ambiguities(ArbNumerics))
    end
    include("specialvalues.jl")
    include("compare.jl")
    include("arithmetic.jl")
    include("elementaryfunctions.jl")
    include("misc.jl")
    include("complex.jl")
    include("dft.jl")
end
