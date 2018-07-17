
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

const ArbRealRoundNearest  = Cint(4) # RoundingMode{:Nearest}()
const ArbRealRoundDown     = Cint(2) # RoundingMode{:Down}()
const ArbRealRoundUp       = Cint(3) # RoundingMode{:Up}()
const ArbRealRoundToZero   = Cint(0) # RoundingMode{:ToZero}()
const ArbRealRoundFromZero = Cint(1) # RoundingMode{:FromZero}()

const MpfrRoundNearest  = Cint(0) # RoundingMode{:Nearest}()
const MpfrRoundDown     = Cint(3) # RoundingMode{:Down}()
const MpfrRoundUp       = Cint(2) # RoundingMode{:Up}()
const MpfrRoundToZero   = Cint(1) # RoundingMode{:ToZero}()
const MpfrRoundFromZero = Cint(4) # RoundingMode{:FromZero}()

# matched with Julia's terminology

match_rounding_mode(::Type{Val{ArbRealRoundNearest}})      = RoundNearest
match_rounding_mode(::Type{Val{ArbRealRoundDown}})         = RoundDown
match_rounding_mode(::Type{Val{ArbRealRoundUp}})           = RoundUp
match_rounding_mode(::Type{Val{ArbRealRoundToZero}})       = RoundToZero
match_rounding_mode(::Type{Val{ArbRealRoundFromZero}})     = RoundFromZero

match_rounding_mode(::Type{Val{RoundNearest}})         = ArbRealRoundNearest
match_rounding_mode(::Type{Val{RoundDown}})            = ArbRealRoundDown
match_rounding_mode(::Type{Val{RoundUp}})              = ArbRealRoundUp
match_rounding_mode(::Type{Val{RoundToZero}})          = ArbRealRoundToZero
match_rounding_mode(::Type{Val{RoundFromZero}})        = ArbRealRoundFromZero
match_rounding_mode(::Type{Val{RoundNearestTiesAway}}) = ArbRealRoundNearest
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
