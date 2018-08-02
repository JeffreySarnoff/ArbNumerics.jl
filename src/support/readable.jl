const IMAG = "im"

function readable(x::ArbComplex{P}) where {P}
    re = real(x)
    im = imag(x)
    sgn = signbit(im) ? " - " : " + "
    im = abs(im)
    re_str = readable(string(re))
    im_str = readable(string(im))
    string(re_str, sgn, im_str, IMAG)
end
