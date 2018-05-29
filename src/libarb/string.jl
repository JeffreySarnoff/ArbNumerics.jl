const imaginary_unit_str =  split(string(Complex(0,0)), "0")[end]

const ARB_STR_FLAGS                = UInt64(0)

const ARB_STR_MORE                 = UInt64(1)        # extra, maybe incorrect digs
const ARB_STR_NO_RADIUS            = UInt64(2)        # omit radius

const ARB_STR_CONDENSE             = UInt64(16)
const ARB_STR_CONDENSE_36_Digits   = UInt64(50*16)
const ARB_STR_CONDENSE_72_Digits   = UInt64(72*16)

const NO_RADIUS = ARB_STR_NO_RADIUS

@inline function digit_precision(bitprecision::Int)
    bitprecision = evincedbits(bitprecision)
    return maximin_digits(bitprecision)
end

function string(x::Mag, maxdigits::Int = maximin_digits(30), flags::UInt = NO_RADIUS)
    y = Arf{precision(x)}()
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{Arf}, Ref{Mag}), y, x)
    z = Arb{precision(x)}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, y)
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{Arb}, Clong, Culong), z, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end

function string(x::Arf{P}, maxdigits::Int=digit_precision(P), flags::UInt = NO_RADIUS) where {P}
    z = Arb{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{Arb}, Ref{Arf}), z, x)
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{Arb}, Clong, Culong), z, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end


function string(x::Arb{P}, maxdigits::Int=digit_precision(P), flags::UInt = NO_RADIUS) where {P}
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{Arb}, Clong, Culong), x, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end



function string(x::Acb{P}, maxdigits::Int=digit_precision(P), flags::UInt = NO_RADIUS) where {P}
    # rea, ima = real(x), imag(x)
    rea = Arb{P}()
    ima = Arb{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{Arb}, Ref{Acb}), rea, x)
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{Arb}, Ref{Acb}), ima, x)

    ima_isneg = signbit(ima)
    ima_abs = ima_isneg ? -ima : ima
    connection = ima_isneg ? " - " : " + "
    rea_str = string(rea, maxdigits, flags)
    ima_str = string(abs(ima), maxdigits, flags)
    str = string(rea_str, connection, ima_str, imaginary_unit_str)
    return str
end

#= from Nemo.jl
function show(io::IO, x::arb)
  d = ceil(parent(x).prec * 0.30102999566398119521)
  cstr = ccall((:arb_get_str, :libarb), Ptr{UInt8}, (Ref{arb}, Int, UInt),
                                                  x, Int(d), UInt(0))
  print(io, unsafe_string(cstr))
  ccall((:flint_free, :libflint), Void, (Ptr{UInt8},), cstr)
end
=#
