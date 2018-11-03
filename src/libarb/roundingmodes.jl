
#=
    Specifies the rounding mode for the result of an approximate operation.
ARF_RND_NEAR   (4)
    Round to the nearest representable number, rounding to even if there is a tie.
ARF_RND_FLOOR  (2)
    Round to the nearest representable number in the direction towards minus infinity.
ARF_RND_CEIL   (3)
    Round to the nearest representable number in the direction towards plus infinity.
ARF_RND_DOWN   (0)
    Round to the nearest representable number in the direction towards zero.
ARF_RND_UP     (1)
    Round to the nearest representable number in the direction away from zero.
=#

const ArbRoundNearest  = Cint(4) # RoundingMode{:Nearest}()
const ArbRoundDown     = Cint(2) # RoundingMode{:Down}()
const ArbRoundUp       = Cint(3) # RoundingMode{:Up}()
const ArbRoundToZero   = Cint(0) # RoundingMode{:ToZero}()
const ArbRoundFromZero = Cint(1) # RoundingMode{:FromZero}()

const MpfrRoundNearest  = Cint(0) # RoundingMode{:Nearest}()
const MpfrRoundDown     = Cint(3) # RoundingMode{:Down}()
const MpfrRoundUp       = Cint(2) # RoundingMode{:Up}()
const MpfrRoundToZero   = Cint(1) # RoundingMode{:ToZero}()
const MpfrRoundFromZero = Cint(4) # RoundingMode{:FromZero}()

# matched with Julia's terminology

match_rounding_mode(::Type{Val{ArbRoundNearest}})      = RoundNearest
match_rounding_mode(::Type{Val{ArbRoundDown}})         = RoundDown
match_rounding_mode(::Type{Val{ArbRoundUp}})           = RoundUp
match_rounding_mode(::Type{Val{ArbRoundToZero}})       = RoundToZero
match_rounding_mode(::Type{Val{ArbRoundFromZero}})     = RoundFromZero

match_rounding_mode(::Type{Val{RoundNearest}})         = ArbRoundNearest
match_rounding_mode(::Type{Val{RoundDown}})            = ArbRoundDown
match_rounding_mode(::Type{Val{RoundUp}})              = ArbRoundUp
match_rounding_mode(::Type{Val{RoundToZero}})          = ArbRoundToZero
match_rounding_mode(::Type{Val{RoundFromZero}})        = ArbRoundFromZero
match_rounding_mode(::Type{Val{RoundNearestTiesAway}}) = ArbRoundNearest
match_rounding_mode(::Type{Val{RoundNearestTiesUp}})   = throw(ErrorException("RoundNearestTiesUp is not supported"))


@inline match_rounding_mode(mode::Cint) =
    match_rounding_mode(Val{mode})

@inline match_rounding_mode(mode::RoundingMode{S}) where {S} =
    match_rounding_mode(Val{mode})
