mutable struct Fmpz
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
