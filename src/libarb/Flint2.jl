mutable struct Fmpz <: Signed
    d::Int
    
    function Fmpz()
        z = new(0)
        finalizer(fmpz_clear, z)
        return z
    end
    
    function Fmpz(x::Int)
        z = new(x)
        finalizer(fmpz_clear, z)
        return z
    end
end

Fmpz(x::Fmpz) = x

fmpz_clear(a::Fmpz) = ccall(@libflint(fmpz_clear), Cvoid, (Ref{Fmpz},), a)
