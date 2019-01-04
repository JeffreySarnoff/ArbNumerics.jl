
## working precision

`ArbNumerics` values have an intrinsic precision, which is the number of bits
that are evaluated in computation.  Values that are determined by calculation
may be displayed at this, their full precision.  If this is the behavior you
prefer, start using the package this way:

```julia
using ArbNumerics
show_working_values()
```

## enclosed precision

The alternative is to use some of the least significant bits as a "cushion"
that protects against showing greater precision than is warranted by the
accuracy that is assured.  This is particularly important when showing values
that are point estimates of an interval that encloses the mathematical result.
If you prefer to be shown quantities as point values that best reflect the
accuracy available at the end of a computation by letting go of uncertain
trailing bits, start using the package this way:

```julia
using ArbNumerics
show_enclosed_values()
```

## rounded precision

If you specify neither `show_working_precision()` nor `show_enclosed_precision()`,
then the working precision will exceed the displayed precision by a fixed number
of bits.  By default, 24 extra bits are used for the working precision.  This
is a settable quantity. If you prefer a different bit differential, you should
establish that at the start and you should __not__ alter it midstream:

```julia
using ArbNumerics
show_rounded_values(32)
```

## precision modality

The operative modality is obtainable using `bits_rounded()`.
After `show_working_values()`, it is `0`. After `show_rounded_values(nbits)`,
it is `nbits`.  After `show_enclosed_values`, it is `missing`.

```julia
function precision_modality()
    nbits = bits_rounded()
    return if nbits === missing
               :enclosed
           elseif iszero(nbits)
               :working
           else
               :rounded
           end
end
```

