Base.Printf.fix_dec(out, d::ArbFloat{P}, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)

Base.Printf.fix_dec(out, d::ArbReal{P}, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
