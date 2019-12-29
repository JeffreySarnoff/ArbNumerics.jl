mutable struct acb_calc_integrate_opt_struct
    deg_limit::Clong
    eval_limit::Clong
    depth_limit::Clong
    use_heap::Cint
    verbose::Cint

    function acb_calc_integrate_opt_struct(
        deg_limit::Integer, eval_limit::Integer, depth_limit::Integer,
        use_heap::Integer=0, verbose::Integer=0)
      return new(deg_limit, eval_limit, depth_limit, use_heap, verbose)
    end

    function acb_calc_integrate_opt_struct()
      opts = new()
      ccall(@libarb(acb_calc_integrate_opt_init), Cvoid,
        (Ref{acb_calc_integrate_opt_struct},), opts)
      return opts
    end
end

function acb_calc_func(out::PtrToArbComplex, inp::PtrToArbComplex,
        param::Ptr{Cvoid}, order::Cint, prec::Cint)
    @assert iszero(order) || isone(order) # ← we'd need to verify holomorphicity
    x = unsafe_load(convert(Ptr{ArbComplex{Int(prec)}}, inp))
    f = unsafe_pointer_to_objref(param)
    @debug "Evaluating at" x f(x)
    ccall(@libarb(acb_set), Cvoid, (PtrToArbComplex, Ref{ArbComplex}), out, f(x))
    return zero(Cint)
end

acb_calc_func_cfun() = @cfunction(acb_calc_func, Cint,
        (PtrToArbComplex, PtrToArbComplex, Ptr{Cvoid}, Cint, Cint))

function acb_calc_integrate(res::ArbComplex, cfunc, param,
    a::ArbComplex, b::ArbComplex, rel_goal::Integer, abs_tol::Mag,
    options::acb_calc_integrate_opt_struct, prec::Integer)
    status = ccall(@libarb(acb_calc_integrate), Cint,
        (Ref{ArbComplex}, # res
        Ptr{Cvoid}, # cfun
        Any, # param
        Ref{ArbComplex}, # a
        Ref{ArbComplex}, # b
        Cint, # rel_goal
        Ref{Mag}, # abs_tol
        Ref{acb_calc_integrate_opt_struct}, # options
        Cint, # prec
        ),
        res, cfunc, param, a, b, rel_goal, abs_tol, options, prec)
    return status
end

