const RNEAREST = Int32(4)

function add2!(x::ArbFloat{P}, y::ArbFloat{P}) where P
    rounddir = ccall(@libarb(arf_add), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), x, x, y, P, RNEAREST)
    return x
end

function sub2!(x::ArbFloat{P}, y::ArbFloat{P}) where P
    rounddir = ccall(@libarb(arf_sub), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), x, x, y, P, RNEAREST)
    return x
end

function mul2!(x::ArbFloat{P}, y::ArbFloat{P}) where P
    rounddir = ccall(@libarb(arf_mul_rnd_any), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), x, x, y, P, RNEAREST)
    return x
end

function div2!(x::ArbFloat{P}, y::ArbFloat{P}) where P
    rounddir = ccall(@libarb(arf_div), Cint, (Ref{ArbFloat}, Ref{ArbFloat}, Ref{ArbFloat}, Clong, Cint), x, x, y, P, RNEAREST)
    return x
end

function add2!(x::ArbReal{P}, y::ArbReal{P}) where P
    ccall(@libarb(arb_add), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), x, x, y, P)
    return x
end

function sub2!(x::ArbReal{P}, y::ArbReal{P}) where P
    ccall(@libarb(arb_sub), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), x, x, y, P)
    return x
end

function mul2!(x::ArbReal{P}, y::ArbReal{P}) where P
    ccall(@libarb(arb_mul), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), x, x, y, P)
    return x
end

function div2!(x::ArbReal{P}, y::ArbReal{P}) where P
    ccall(@libarb(arb_div), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), x, x, y, P)
    return x
end

function add2!(x::ArbComplex{P}, y::ArbComplex{P}) where P
    ccall(@libarb(acb_add), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), x, x, y, P)
    return x
end

function sub2!(x::ArbComplex{P}, y::ArbComplex{P}) where P
    ccall(@libarb(acb_sub), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), x, x, y, P)
    return x
end

function mul2!(x::ArbComplex{P}, y::ArbComplex{P}) where P
    ccall(@libarb(acb_mul), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), x, x, y, P)
    return x
end

function div2!(x::ArbComplex{P}, y::ArbComplex{P}) where P
    ccall(@libarb(acb_div), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Ref{ArbComplex}, Clong), x, x, y, P)
    return x
end






"""
    add2!(x, y)
    
x gets the sum of x and y

returns updated x
""" add2!

"""
    sub2!(x, y)
    
x gets the difference of x and y

returns updated x
""" sub2!

"""
    mul2!(x, y)
    
x gets the product of x and y

returns updated x
""" mul2!

"""
    div2!(x, y)
    
x gets the quotient of x and y

returns updated x
""" div2!
