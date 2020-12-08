using ArbNumerics
using Test

setprecision(BigFloat, 512)

# @testset "Support" begin
#    include("ArblibVector.jl")
# end

@testset "ArbNumerics tests" begin
  include("specialvalues.jl")
  include("compare.jl")
  include("arithmetic.jl")
  include("elementaryfunctions.jl")
  include("misc.jl")
  include("complex.jl")
  include("dft.jl")
end
