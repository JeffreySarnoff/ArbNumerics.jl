
mutable struct ArbFloat{P} <: AbstractFloat    # P is the precision in bits
    exp::Int        # fmpz         exponent of 2 (2^exp)
    size::UInt      # mp_size_t    nwords and sign (lsb holds sign of significand)
    d1::UInt        # significand  unsigned, immediate value or the initial span
    d2::UInt        #   (d1, d2)   the final part indicating the significand, or 0

    function ArbFloat{P}() where {P}
        minprec(P, ArbFloat)
        z = new{P}(0, 0, 0, 0)
        ccall(@libarb(arf_init), Cvoid, (Ref{ArbFloat},), z)
        finalizer(arf_clear, z)
        return z
    end
end

# for use within structs, e.g ArbFloatMatrix
const PtrToArbFloat = Ptr{ArbFloat} # arf_ptr
const PtrToPtrToArbFloat = Ptr{Ptr{ArbFloat}} # arf_ptr*

arf_clear(x::ArbFloat{P}) where {P} = ccall(@libarb(arf_clear), Cvoid, (Ref{ArbFloat},), x)

# ArbReal structs hold balls given as midpoint, radius
mutable struct ArbReal{P} <: Real     # P is the precision in bits
    #      midpoint
    mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
    #      radius
    rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    rad_man::UInt   # mp_limb_t  radius, unsigned by definition

    function ArbReal{P}() where {P}
        minprec(P, ArbReal)
        z = new{P}(0, 0, 0, 0, 0, 0)
        ccall(@libarb(arb_init), Cvoid, (Ref{ArbReal},), z)
        finalizer(arb_clear, z)
        return z
    end
end

# for use within structs, e.g. ArbRealMatrix
const PtrToArbReal = Ptr{ArbReal} # arb_ptr
const PtrToPtrToArbReal = Ptr{Ptr{ArbReal}} # arb_ptr*

arb_clear(x::ArbReal{P}) where {P} = ccall(@libarb(arb_clear), Cvoid, (Ref{ArbReal},), x)

# ArbComplex structs hold complex balls given as ArbReal pairs

mutable struct ArbComplex{P} <: Number  # P is the precision in bits
    #      real midpoint
    real_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    real_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    real_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    real_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
    #      real radius
    real_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    real_rad_man::UInt   # mp_limb_t  radius, unsigned by definition
    #      imaginary midpoint
    imag_mid_exp::Int    # fmpz         exponent of 2 (2^exp)
    imag_mid_size::UInt  # mp_size_t    nwords and sign (lsb holds sign of significand)
    imag_mid_d1::UInt    # significand  unsigned, immediate value or the initial span
    imag_mid_d2::UInt    #   (d1, d2)   the final part indicating the significand, or 0
    #      imaginary radius
    imag_rad_exp::Int    # fmpz       exponent of 2 (2^exp)
    imag_rad_man::UInt   # mp_limb_t  radius, unsigned by definition


    function ArbComplex{P}() where {P}
        minprec(P, ArbComplex)
        z = new{P}(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        ccall(@libarb(acb_init), Cvoid, (Ref{ArbComplex},), z)
        finalizer(clear_acb, z)
        return z
    end
end

# finalizer:
clear_acb(x::ArbComplex{P}) where {P} = ccall(@libarb(acb_clear), Cvoid, (Ref{ArbComplex},), x)

ArbComplex{P}(x::T) where {P,T<:Number} = ArbComplex{P}(real(x), imag(x))

# for use within a struct, eg. ArbComplexMatrix
const PtrToArbComplex = Ptr{ArbComplex} # acb_ptr
const PtrToPtrToArbComplex = Ptr{Ptr{ArbComplex}} # acb_ptr*

const ArbFloatReal{P} = Union{ArbFloat{P},ArbReal{P}}
const ArbNumber{P} = Union{ArbFloat{P}, ArbReal{P}, ArbComplex{P}}

# Types supporting C-API
const Slong = Int # to accomodate windows
const USlong = unsigned(Slong)
const ArbInts = Union{Int,Int32,Int16,Int8} # Int may be Int32
