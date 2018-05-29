abstract type ExtendedFloat{P} <: AbstractFloat end

abstract type Interval end

abstract type BallInterval  <: Interval end  # (midpoint, radius)
abstract type BoundInterval <: Interval end  # (lowerbound, upperbound)

struct Midpoint <: BallInterval end
struct Radius   <: BallInterval end

struct LowerBound <: BoundInterval end
struct UpperBound <: BoundInterval end

struct RealPart <: Number end
struct ImagPart <: Number end
