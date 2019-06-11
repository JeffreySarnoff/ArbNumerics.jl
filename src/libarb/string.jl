const imaginary_unit_str =  split(string(Complex(0,0)), "0")[end]

const ARB_STR_FLAGS                = UInt64(0)

const ARB_STR_MORE                 = UInt64(1)        # extra, maybe incorrect digs
const ARB_STR_NO_RADIUS            = UInt64(2)        # omit radius
const ARB_STR_RADIUS               = UInt64(4)
const ARB_STR_CONDENSE             = UInt64(16)
const ARB_STR_CONDENSE_36_Digits   = UInt64(50*16)
const ARB_STR_CONDENSE_72_Digits   = UInt64(72*16)

const NO_FLAGS  = UInt64(0)
const NO_RADIUS = ARB_STR_NO_RADIUS

@inline function digit_precision(bitprecision::Int)
    bitprecision = evincedbits(bitprecision)
    return maximin_digits(bitprecision)
end

function trimzeros(str::String)
    if occursin('e', str)
        str1, str2 = String.(split(str, 'e'))
        if occursin('.', str1)
            str1a, str1b = String.(split(str1, '.'))
            str1b = trimallzeros(str1b)
            if str1b === ""
                str1b = "0"
            end    
            str1 = join((str1a, str1b), '.')
        end
        str = join((str1, str2), 'e')
    elseif occursin('.', str)   
        str1a, str1b = String.(split(str, '.'))
        str1b = trimallzeros(str1b)
        if str1b === ""
            str1b = "0"
        end    
        str = join((str1a, str1b), '.')
    end        
    return str
end
            
function trimallzeros(str::String)
    m = n = length(str)
    (n === 0 || str[n] !== '0') && return str
    while n>1 && str[n] === '0'
        n -= 1
    end
    m === n ? str : str[1:n]
end


function string(x::Mag, maxdigits::Int = maximin_digits(30), flags::UInt = NO_FLAGS)
    y = ArbFloat{precision(x)}()
    ccall(@libarb(arf_set_mag), Cvoid, (Ref{ArbFloat}, Ref{Mag}), y, x)
    z = ArbReal{precision(x)}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, y)
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{ArbReal}, Clong, Culong), z, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end

function string(x::ArbFloat{P}; midpoint::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = ARB_STR_NO_RADIUS
    return arbstring(x, prec, flags=flags)
end

stringall(x::ArbFloat{P}) where {P} = return arbstring(x, floor(Int,log10(2)*precision(x))+10; flags=NO_RADIUS)
    
function arbstring(x::ArbFloat{P}, maxdigits::Int=digit_precision(P); flags::UInt = NO_RADIUS) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_set_arf), Cvoid, (Ref{ArbReal}, Ref{ArbFloat}), z, x)
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{ArbReal}, Clong, Culong), z, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    str = trimzeros(str)
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end

function string(x::ArbReal{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = radius ? ARB_STR_RADIUS : ARB_STR_NO_RADIUS
    return arbstring(x, prec, flags=flags)
end

stringall(x::ArbReal{P}; radius::Bool=false) where {P} =
    radius ? arbstring(x, floor(Int,log10(2)*precision(x))+10; flags=ARB_STR_RADIUS) :
             arbstring(x, floor(Int,log10(2)*precision(x))+10; flags=ARB_STR_NO_RADIUS)

function arbstring(x::ArbReal{P}, maxdigits::Int=digit_precision(P); flags::UInt = NO_FLAGS) where {P}
    unsafestr = ccall(@libarb(arb_get_str), Cstring,
                      (Ref{ArbReal}, Clong, Culong), x, maxdigits, flags)
    str = deepcopy( unsafe_string(pointer(unsafestr)) )
    str = trimzeros(str)
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return str
end


function string(x::ArbComplex{P}; midpoint::Bool=false, radius::Bool=false) where {P}
    prec = midpoint ? digits4bits(P) : digit_precision(P)
    flags = radius ? ARB_STR_RADIUS : ARB_STR_NO_RADIUS
    return arbstring(x, prec, flags=flags)
end

stringall(x::ArbComplex{P}; radius::Bool=false) where {P} =
    radius ? arbstring(x, floor(Int,log10(2)*precision(x))+10; flags=ARB_STR_RADIUS) :
             arbstring(x, floor(Int,log10(2)*precision(x))+10; flags=ARB_STR_NO_RADIUS)

function arbstring(x::ArbComplex{P}, maxdigits::Int=digit_precision(P); flags::UInt = NO_FLAGS) where {P}
    # rea, ima = real(x), imag(x)
    rea = ArbReal{P}()
    ima = ArbReal{P}()
    ccall(@libarb(acb_get_real), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), rea, x)
    ccall(@libarb(acb_get_imag), Cvoid, (Ref{ArbReal}, Ref{ArbComplex}), ima, x)

    ima_isneg = signbit(ima)
    ima_abs = ima_isneg ? -ima : ima
    connection = ima_isneg ? " - " : " + "
    rea_str = arbstring(rea, maxdigits, flags=flags)
    ima_str = arbstring(abs(ima), maxdigits, flags=flags)
    str = string(rea_str, connection, ima_str, imaginary_unit_str)
    return str
end
