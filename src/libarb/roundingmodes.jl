
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

const ArbBallRoundNearest  = Cint(4) # RoundingMode{:Nearest}()
const ArbBallRoundDown     = Cint(2) # RoundingMode{:Down}()
const ArbBallRoundUp       = Cint(3) # RoundingMode{:Up}()
const ArbBallRoundToZero   = Cint(0) # RoundingMode{:ToZero}()
const ArbBallRoundFromZero = Cint(1) # RoundingMode{:FromZero}()

const MpfrRoundNearest  = Cint(0) # RoundingMode{:Nearest}()
const MpfrRoundDown     = Cint(3) # RoundingMode{:Down}()
const MpfrRoundUp       = Cint(2) # RoundingMode{:Up}()
const MpfrRoundToZero   = Cint(1) # RoundingMode{:ToZero}()
const MpfrRoundFromZero = Cint(4) # RoundingMode{:FromZero}()

# matched with Julia's terminology

match_rounding_mode(::Type{Val{ArbBallRoundNearest}})      = RoundNearest
match_rounding_mode(::Type{Val{ArbBallRoundDown}})         = RoundDown
match_rounding_mode(::Type{Val{ArbBallRoundUp}})           = RoundUp
match_rounding_mode(::Type{Val{ArbBallRoundToZero}})       = RoundToZero
match_rounding_mode(::Type{Val{ArbBallRoundFromZero}})     = RoundFromZero

match_rounding_mode(::Type{Val{RoundNearest}})         = ArbBallRoundNearest
match_rounding_mode(::Type{Val{RoundDown}})            = ArbBallRoundDown
match_rounding_mode(::Type{Val{RoundUp}})              = ArbBallRoundUp
match_rounding_mode(::Type{Val{RoundToZero}})          = ArbBallRoundToZero
match_rounding_mode(::Type{Val{RoundFromZero}})        = ArbBallRoundFromZero
match_rounding_mode(::Type{Val{RoundNearestTiesAway}}) = ArbBallRoundNearest
match_rounding_mode(::Type{Val{RoundNearestTiesUp}})   = throw(ErrorException("RoundNearestTiesUp is not supported"))


@inline match_rounding_mode(mode::Cint) =
    match_rounding_mode(Val{mode})

@inline match_rounding_mode(mode::RoundingMode{S}) where {S} =
    match_rounding_mode(Val{mode})


match_mpfr_rounding_mode(::Type{Val{MpfrRoundNearest}})   = RoundNearest
match_mpfr_rounding_mode(::Type{Val{MpfrRoundDown}})      = RoundDown
match_mpfr_rounding_mode(::Type{Val{MpfrRoundUp}})        = RoundUp
match_mpfr_rounding_mode(::Type{Val{MpfrRoundToZero}})    = RoundToZero
match_mpfr_rounding_mode(::Type{Val{MpfrRoundFromZero}})  = RoundFromZero

match_mpfr_rounding_mode(::Type{Val{RoundNearest}})   = MpfrRoundNearest
match_mpfr_rounding_mode(::Type{Val{RoundDown}})      = MpfrRoundDown
match_mpfr_rounding_mode(::Type{Val{RoundUp}})        = MpfrRoundUp
match_mpfr_rounding_mode(::Type{Val{RoundToZero}})    = MpfrRoundToZero
match_mpfr_rounding_mode(::Type{Val{RoundFromZero}})  = MpfrRoundFromZero


@inline match_mpfr_rounding_mode(mode::Cint) =
    match_mpfr_rounding_mode(Val{mode})

@inline match_mpfr_rounding_mode(mode::RoundingMode{S}) where {S} =
    match_mpfr_rounding_mode(Val{mode})
