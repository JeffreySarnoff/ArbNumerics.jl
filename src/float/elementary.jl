for (A,F) in ((:log, :arb_log), (:log1p, :arb_log1p), (:exp, :arb_exp), (:expm1, :arb_expm1),
              (:sin, :arb_sin), (:cos, :arb_cos), (:tan, :arb_tan),
              (:csc, :arb_csc), (:sec, :arb_sec), (:cot, :arb_cot),
              (:sinpi, :arb_sin_pi), (:cospi, :arb_cos_pi), (:sinc, :arb_sinc),
              (:tanpi, :arb_tan_pi), (:cotpi, :arb_cot_pi), (:sincpi, :arb_sinc_pi),
              (:asin, :arb_asin), (:acos, :arb_acos), (:atan, :arb_atan),
              (:sinh, :arb_sinh), (:cosh, :arb_cosh), (:tanh, :arb_tanh),
              (:csch, :arb_csch), (:sech, :arb_sech), (:coth, :arb_coth),
              (:asinh, :arb_asinh), (:acosh, :arb_acosh), (:atanh, :arb_atanh),
             )
    @eval begin
        function ($A)(x::ArbReal{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, prec)
            return z
         end
    end
end


function log_2(x::ArbReal{P}) where {P}
    return log(ArbReal{P}(2.0))
end
function log_10(x::ArbReal{P}) where {P}
    return log(ArbReal{P}(10.0))
end

function log2(x::ArbReal{P}, logof2::ArbReal{P}=zero(ArbReal{P})) where {P}
    logof2 = iszero(logof2) ? log_2(ArbReal{P}) : logof2
    result = log(x, P)
    result = result / logof2
    return result
end

function log10(x::ArbReal{P}, logof10::ArbReal{P}=zero(ArbReal{P})) where {P}
    logof10 = iszero(logof10) ? log_10(ArbReal{P}) : logof10
    result = log(x)
    result = result / logof10
    return result
end

function atan(y::ArbReal{P}, x::ArbReal{P}, prec::Int=P) where {P}
    z = ArbReal{P}()
    ccall(@libarb(arb_atan2), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, y, x, prec)
    return z
end

@inline function atan(y::ArbFloat{P}, x::ArbFloat{P}, prec::Int=P) where {P}
    xr = ArbReal{P}(x)
    yr = ArbReal{P}(y)
    return midpoint_byref(atan(yr, xr, prec))
end

function sincos(x::ArbReal{P}, prec::Int=P) where {P}
    zs = ArbReal{P}()
    zc = ArbReal{P}()
    ccall(@libarb(arb_sin_cos), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), zs, zc, x, prec)
    return zs, zc
end

@inline function sincos(x::ArbFloat{P}, prec::Int=P) where {P}
    xr = ArbReal{P}(x)
    sx, cx = sincos(xr, prec)
    s = midpoint_byref(sx)
    c = midpoint_byref(cx)
    return s, c
end

function sincos(x::ArbComplex{P}, prec::Int=P) where {P}
    zs = ArbComplex{P}()
    zc = ArbComplex{P}()
    ccall(@libarb(acb_sin_cos), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), zs, zc, x, prec)
    return zs, zc
end


const Cint0 = zero(Cint)


for (A,F) in ((:log, :acb_log), (:log1p, :acb_log1p), (:exp, :acb_exp), (:expm1, :acb_expm1),
              (:sin, :acb_sin), (:cos, :acb_cos), (:tan, :acb_tan),
              (:csc, :acb_csc), (:sec, :acb_sec), (:cot, :acb_cot),
              (:sinpi, :acb_sin_pi), (:cospi, :acb_cos_pi), (:sinc, :acb_sinc),
              (:tanpi, :acb_tan_pi), (:cotpi, :acb_cot_pi), (:sincpi, :acb_sinc_pi),
              (:asin, :acb_asin), (:acos, :acb_acos), (:atan, :acb_atan),
              (:sinh, :acb_sinh), (:cosh, :acb_cosh), (:tanh, :acb_tanh),
              (:csch, :acb_csch), (:sech, :acb_sech), (:coth, :acb_coth),
              (:asinh, :acb_asinh), (:acosh, :acb_acosh), (:atanh, :acb_atanh),
             )
    @eval begin
        function ($A)(x::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbComplex}, Ref{ArbComplex}, Clong), z, x, prec)
            return z
         end
    end
end

for (A,F) in ((:loghypot, :arb_log_hypot),)
    @eval begin
        function ($A)(x::ArbFloat{P}, y::ArbFloat{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            xb = ArbReal{P}(x)
            yb = ArbReal{P}(y)
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
    end
end

for (A,F) in ((:loghypot, :arb_log_hypot), )
    @eval begin
        function ($A)(x::ArbReal{P}, y::ArbReal{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, prec)
            return z
         end
    end
end


for (A,F) in ((:loghypot, :acb_log_hypot),)
    @eval begin
        function ($A)(x::ArbComplex{P}, y::ArbComplex{P}, prec::Int=P) where {P}
            z = ArbComplex{P}()
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Ref{ArbReal}, Clong), z, x, y, prec)
            return z
         end
    end
end


for (A,F) in ((:log, :arb_log), (:log1p, :arb_log1p), (:exp, :arb_exp), (:expm1, :arb_expm1),
              (:sin, :arb_sin), (:cos, :arb_cos), (:tan, :arb_tan),
              (:csc, :arb_csc), (:sec, :arb_sec), (:cot, :arb_cot),
              (:sinpi, :arb_sin_pi), (:cospi, :arb_cos_pi), (:sinc, :arb_sinc),
              (:tanpi, :arb_tan_pi), (:cotpi, :arb_cot_pi), (:sincpi, :arb_sinc_pi),
              (:asin, :arb_asin), (:acos, :arb_acos), (:atan, :arb_atan),
              (:sinh, :arb_sinh), (:cosh, :arb_cosh), (:tanh, :arb_tanh),
              (:csch, :arb_csch), (:sech, :arb_sech), (:coth, :arb_coth),
              (:asinh, :arb_asinh), (:acosh, :arb_acosh), (:atanh, :arb_atanh),
             )
    @eval begin
        function ($A)(x::ArbFloat{P}, prec::Int=P) where {P}
            z = ArbReal{P}()
            xb = ArbReal{P}(x)
            ccall(@libarb($F), Cvoid, (Ref{ArbReal}, Ref{ArbReal}, Clong), z, xb, prec)
            return midpoint_byref(z)
         end
    end
end



function log_2(x::ArbFloat{P}) where {P}
    return midpoint_byref(log(ArbReal{P}(2.0)))
end
function log_10(x::ArbFloat{P}) where {P}
    return midpoint_byref(log(ArbReal{P}(10.0)))
end

function log2(x::ArbFloat{P}, logof2::ArbFloat{P}=zero(ArbFloat{P})) where {P}
   logof2 = iszero(logof2) ? log_2(x) : logof2
   z = log(ArbReal{P}(x))
   z = z / logof2
   return midpoint_byref(z)
end

function log10(x::ArbFloat{P}, logof10::ArbFloat{P}=zero(ArbFloat{P})) where {P}
   logof10 = iszero(logof10) ? log_10(x) : logof10
   z = log(ArbReal{P}(x))
   z = z / logof10
   return midpoint_byref(z)
end
