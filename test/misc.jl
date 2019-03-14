@testset "rounding mode" begin
  ArbNumerics.match_rounding_mode(RoundNearest) == 4
end
