import Printf: ini_dec, fix_dec

if VERSION < v"1.1"
using Base.Grisu: DIGITSs
fix_dec(out, d::ArbFloat{P}, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
fix_dec(out, d::ArbReal{P}, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_dec(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_dec(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_hex(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_HEX(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_hex(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
ini_HEX(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, DIGITSs[Threads.threadid()])
else
fix_dec(out, d::ArbFloat{P}, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
fix_dec(out, d::ArbReal{P}, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_dec(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_dec(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_hex(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_HEX(out, d::ArbFloat{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_hex(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
ini_HEX(out, d::ArbReal{P}, ndigits::Int, flags::String, width::Int, precision::Int, c::Char, digits) where P = 
    Base.Printf.bigfloat_printf(out, BigFloat(d), flags, width, precision, c, digits)
end    
