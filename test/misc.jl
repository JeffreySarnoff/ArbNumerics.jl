@testset "rounding mode" begin
  @test ArbNumerics.match_rounding_mode(RoundNearest) == 4
end
