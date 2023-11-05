# protect minimum precision
@noinline function minprecerror(n, minp, t, f)
    text = t === f ? "" : " for $t"
    throw(DomainError("$f: minimum precision$text is $minp bits but was $n"))
end

function minprec(n, t, f=t)
    minp = max(extrabits(ArbFloat), 1)
    if n < minp
        minprecerror(n, minp, t, f)
    end
    nothing
end
