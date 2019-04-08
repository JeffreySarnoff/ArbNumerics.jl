# Julia wrapper for header: acb.h
# Automatically generated using Clang.jl


function acb_init(x)
    ccall((:acb_init, libarb), Cvoid, (acb_t,), x)
end

function acb_clear(x)
    ccall((:acb_clear, libarb), Cvoid, (acb_t,), x)
end

function _acb_vec_init(n)
    ccall((:_acb_vec_init, libarb), acb_ptr, (Cint,), n)
end

function _acb_vec_clear(v, n)
    ccall((:_acb_vec_clear, libarb), Cvoid, (acb_ptr, Cint), v, n)
end

function acb_real_ptr(z)
    ccall((:acb_real_ptr, libarb), arb_ptr, (acb_t,), z)
end

function acb_imag_ptr(z)
    ccall((:acb_imag_ptr, libarb), arb_ptr, (acb_t,), z)
end

function acb_get_real(re, z)
    ccall((:acb_get_real, libarb), Cvoid, (arb_t, acb_t), re, z)
end

function acb_get_imag(im, z)
    ccall((:acb_get_imag, libarb), Cvoid, (arb_t, acb_t), im, z)
end

function acb_get_mid(res, x)
    ccall((:acb_get_mid, libarb), Cvoid, (acb_t, acb_t), res, x)
end

function acb_is_zero(z)
    ccall((:acb_is_zero, libarb), Cint, (acb_t,), z)
end

function acb_is_one(z)
    ccall((:acb_is_one, libarb), Cint, (acb_t,), z)
end

function acb_is_exact(z)
    ccall((:acb_is_exact, libarb), Cint, (acb_t,), z)
end

function acb_is_int(z)
    ccall((:acb_is_int, libarb), Cint, (acb_t,), z)
end

function acb_is_int_2exp_si(z, e)
    ccall((:acb_is_int_2exp_si, libarb), Cint, (acb_t, Cint), z, e)
end

function acb_zero(z)
    ccall((:acb_zero, libarb), Cvoid, (acb_t,), z)
end

function acb_one(z)
    ccall((:acb_one, libarb), Cvoid, (acb_t,), z)
end

function acb_onei(z)
    ccall((:acb_onei, libarb), Cvoid, (acb_t,), z)
end

function acb_set(z, x)
    ccall((:acb_set, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_set_round(z, x, prec)
    ccall((:acb_set_round, libarb), Cvoid, (acb_t, acb_t, Cint), z, x, prec)
end

function acb_neg_round(z, x, prec)
    ccall((:acb_neg_round, libarb), Cvoid, (acb_t, acb_t, Cint), z, x, prec)
end

function acb_swap(z, x)
    ccall((:acb_swap, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_equal(x, y)
    ccall((:acb_equal, libarb), Cint, (acb_t, acb_t), x, y)
end

function acb_equal_si(x, y)
    ccall((:acb_equal_si, libarb), Cint, (acb_t, Cint), x, y)
end

function acb_eq(x, y)
    ccall((:acb_eq, libarb), Cint, (acb_t, acb_t), x, y)
end

function acb_ne(x, y)
    ccall((:acb_ne, libarb), Cint, (acb_t, acb_t), x, y)
end

function acb_overlaps(x, y)
    ccall((:acb_overlaps, libarb), Cint, (acb_t, acb_t), x, y)
end

function acb_contains_zero(x)
    ccall((:acb_contains_zero, libarb), Cint, (acb_t,), x)
end

function acb_contains_fmpq(x, y)
    ccall((:acb_contains_fmpq, libarb), Cint, (acb_t, Cint), x, y)
end

function acb_contains_fmpz(x, y)
    ccall((:acb_contains_fmpz, libarb), Cint, (acb_t, Cint), x, y)
end

function acb_contains(x, y)
    ccall((:acb_contains, libarb), Cint, (acb_t, acb_t), x, y)
end

function acb_set_ui(z, c)
    ccall((:acb_set_ui, libarb), Cvoid, (acb_t, Cint), z, c)
end

function acb_set_d(z, c)
    ccall((:acb_set_d, libarb), Cvoid, (acb_t, Cdouble), z, c)
end

function acb_set_si(z, c)
    ccall((:acb_set_si, libarb), Cvoid, (acb_t, Cint), z, c)
end

function acb_set_si_si(z, x, y)
    ccall((:acb_set_si_si, libarb), Cvoid, (acb_t, Cint, Cint), z, x, y)
end

function acb_set_d_d(z, x, y)
    ccall((:acb_set_d_d, libarb), Cvoid, (acb_t, Cdouble, Cdouble), z, x, y)
end

function acb_set_fmpz(z, c)
    ccall((:acb_set_fmpz, libarb), Cvoid, (acb_t, Cint), z, c)
end

function acb_set_fmpz_fmpz(z, x, y)
    ccall((:acb_set_fmpz_fmpz, libarb), Cvoid, (acb_t, Cint, Cint), z, x, y)
end

function acb_set_round_fmpz(z, y, prec)
    ccall((:acb_set_round_fmpz, libarb), Cvoid, (acb_t, Cint, Cint), z, y, prec)
end

function acb_contains_int(x)
    ccall((:acb_contains_int, libarb), Cint, (acb_t,), x)
end

function acb_get_unique_fmpz(z, x)
    ccall((:acb_get_unique_fmpz, libarb), Cint, (Cint, acb_t), z, x)
end

function acb_set_fmpq(z, c, prec)
    ccall((:acb_set_fmpq, libarb), Cvoid, (acb_t, Cint, Cint), z, c, prec)
end

function acb_set_arb(z, c)
    ccall((:acb_set_arb, libarb), Cvoid, (acb_t, arb_t), z, c)
end

function acb_set_arb_arb(z, x, y)
    ccall((:acb_set_arb_arb, libarb), Cvoid, (acb_t, arb_t, arb_t), z, x, y)
end

function acb_set_round_arb(z, x, prec)
    ccall((:acb_set_round_arb, libarb), Cvoid, (acb_t, arb_t, Cint), z, x, prec)
end

function acb_trim(z, x)
    ccall((:acb_trim, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_add_error_arf(x, err)
    ccall((:acb_add_error_arf, libarb), Cvoid, (acb_t, arf_t), x, err)
end

function acb_add_error_mag(x, err)
    ccall((:acb_add_error_mag, libarb), Cvoid, (acb_t, mag_t), x, err)
end

function acb_get_mag(z, x)
    ccall((:acb_get_mag, libarb), Cvoid, (mag_t, acb_t), z, x)
end

function acb_get_mag_lower(z, x)
    ccall((:acb_get_mag_lower, libarb), Cvoid, (mag_t, acb_t), z, x)
end

function acb_get_abs_ubound_arf(u, z, prec)
    ccall((:acb_get_abs_ubound_arf, libarb), Cvoid, (arf_t, acb_t, Cint), u, z, prec)
end

function acb_get_abs_lbound_arf(u, z, prec)
    ccall((:acb_get_abs_lbound_arf, libarb), Cvoid, (arf_t, acb_t, Cint), u, z, prec)
end

function acb_get_rad_ubound_arf(u, z, prec)
    ccall((:acb_get_rad_ubound_arf, libarb), Cvoid, (arf_t, acb_t, Cint), u, z, prec)
end

function acb_union(res, x, y, prec)
    ccall((:acb_union, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, x, y, prec)
end

function acb_arg(r, z, prec)
    ccall((:acb_arg, libarb), Cvoid, (arb_t, acb_t, Cint), r, z, prec)
end

function acb_sgn(res, z, prec)
    ccall((:acb_sgn, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_csgn(res, z)
    ccall((:acb_csgn, libarb), Cvoid, (arb_t, acb_t), res, z)
end

function acb_real_abs(res, z, analytic, prec)
    ccall((:acb_real_abs, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_real_sgn(res, z, analytic, prec)
    ccall((:acb_real_sgn, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_real_heaviside(res, z, analytic, prec)
    ccall((:acb_real_heaviside, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_real_floor(res, z, analytic, prec)
    ccall((:acb_real_floor, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_real_ceil(res, z, analytic, prec)
    ccall((:acb_real_ceil, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_real_max(res, x, y, analytic, prec)
    ccall((:acb_real_max, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, x, y, analytic, prec)
end

function acb_real_min(res, x, y, analytic, prec)
    ccall((:acb_real_min, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, x, y, analytic, prec)
end

function acb_real_sqrtpos(res, z, analytic, prec)
    ccall((:acb_real_sqrtpos, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_sqrt_analytic(res, z, analytic, prec)
    ccall((:acb_sqrt_analytic, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_rsqrt_analytic(res, z, analytic, prec)
    ccall((:acb_rsqrt_analytic, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_log_analytic(res, z, analytic, prec)
    ccall((:acb_log_analytic, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, analytic, prec)
end

function acb_pow_analytic(res, z, w, analytic, prec)
    ccall((:acb_pow_analytic, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, z, w, analytic, prec)
end

function acb_add(z, x, y, prec)
    ccall((:acb_add, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_sub(z, x, y, prec)
    ccall((:acb_sub, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_add_si(z, x, c, prec)
    ccall((:acb_add_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_add_ui(z, x, c, prec)
    ccall((:acb_add_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_sub_si(z, x, c, prec)
    ccall((:acb_sub_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_sub_ui(z, x, c, prec)
    ccall((:acb_sub_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_add_fmpz(z, x, y, prec)
    ccall((:acb_add_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_add_arb(z, x, y, prec)
    ccall((:acb_add_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_sub_fmpz(z, x, y, prec)
    ccall((:acb_sub_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_sub_arb(z, x, y, prec)
    ccall((:acb_sub_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_neg(z, x)
    ccall((:acb_neg, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_conj(z, x)
    ccall((:acb_conj, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_abs(u, z, prec)
    ccall((:acb_abs, libarb), Cvoid, (arb_t, acb_t, Cint), u, z, prec)
end

function acb_mul_ui(z, x, y, prec)
    ccall((:acb_mul_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_mul_si(z, x, y, prec)
    ccall((:acb_mul_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_mul_fmpz(z, x, y, prec)
    ccall((:acb_mul_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_mul_arb(z, x, y, prec)
    ccall((:acb_mul_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_mul_onei(z, x)
    ccall((:acb_mul_onei, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_div_onei(z, x)
    ccall((:acb_div_onei, libarb), Cvoid, (acb_t, acb_t), z, x)
end

function acb_mul(z, x, y, prec)
    ccall((:acb_mul, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_mul_naive(z, x, y, prec)
    ccall((:acb_mul_naive, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_mul_2exp_si(z, x, e)
    ccall((:acb_mul_2exp_si, libarb), Cvoid, (acb_t, acb_t, Cint), z, x, e)
end

function acb_mul_2exp_fmpz(z, x, c)
    ccall((:acb_mul_2exp_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint), z, x, c)
end

function acb_addmul(z, x, y, prec)
    ccall((:acb_addmul, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_submul(z, x, y, prec)
    ccall((:acb_submul, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_addmul_ui(z, x, y, prec)
    ccall((:acb_addmul_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_addmul_si(z, x, y, prec)
    ccall((:acb_addmul_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_submul_ui(z, x, y, prec)
    ccall((:acb_submul_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_submul_si(z, x, y, prec)
    ccall((:acb_submul_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_addmul_fmpz(z, x, y, prec)
    ccall((:acb_addmul_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_submul_fmpz(z, x, y, prec)
    ccall((:acb_submul_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, y, prec)
end

function acb_addmul_arb(z, x, y, prec)
    ccall((:acb_addmul_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_submul_arb(z, x, y, prec)
    ccall((:acb_submul_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_dot_simple(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:acb_dot_simple, libarb), Cvoid, (acb_t, acb_t, Cint, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function acb_dot_precise(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:acb_dot_precise, libarb), Cvoid, (acb_t, acb_t, Cint, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function acb_dot(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:acb_dot, libarb), Cvoid, (acb_t, acb_t, Cint, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function acb_approx_dot(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:acb_approx_dot, libarb), Cvoid, (acb_t, acb_t, Cint, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function acb_inv(z, x, prec)
    ccall((:acb_inv, libarb), Cvoid, (acb_t, acb_t, Cint), z, x, prec)
end

function acb_div(z, x, y, prec)
    ccall((:acb_div, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, y, prec)
end

function acb_div_ui(z, x, c, prec)
    ccall((:acb_div_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_div_si(z, x, c, prec)
    ccall((:acb_div_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_div_arb(z, x, c, prec)
    ccall((:acb_div_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, c, prec)
end

function acb_div_fmpz(z, x, c, prec)
    ccall((:acb_div_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, c, prec)
end

function acb_cube(y, x, prec)
    ccall((:acb_cube, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_pow_fmpz(y, b, e, prec)
    ccall((:acb_pow_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, b, e, prec)
end

function acb_pow_ui(y, b, e, prec)
    ccall((:acb_pow_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, b, e, prec)
end

function acb_pow_si(y, b, e, prec)
    ccall((:acb_pow_si, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, b, e, prec)
end

function acb_const_pi(x, prec)
    ccall((:acb_const_pi, libarb), Cvoid, (acb_t, Cint), x, prec)
end

function acb_log(r, z, prec)
    ccall((:acb_log, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_log1p(r, z, prec)
    ccall((:acb_log1p, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_exp(r, z, prec)
    ccall((:acb_exp, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_exp_pi_i(r, z, prec)
    ccall((:acb_exp_pi_i, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_exp_invexp(r, s, z, prec)
    ccall((:acb_exp_invexp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), r, s, z, prec)
end

function acb_expm1(r, z, prec)
    ccall((:acb_expm1, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sin(r, z, prec)
    ccall((:acb_sin, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_cos(r, z, prec)
    ccall((:acb_cos, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sin_cos(s, c, z, prec)
    ccall((:acb_sin_cos, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), s, c, z, prec)
end

function acb_tan(r, z, prec)
    ccall((:acb_tan, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_cot(r, z, prec)
    ccall((:acb_cot, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_asin(r, z, prec)
    ccall((:acb_asin, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_acos(r, z, prec)
    ccall((:acb_acos, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_atan(r, z, prec)
    ccall((:acb_atan, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_asinh(r, z, prec)
    ccall((:acb_asinh, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_acosh(r, z, prec)
    ccall((:acb_acosh, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_atanh(r, z, prec)
    ccall((:acb_atanh, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sinh(y, x, prec)
    ccall((:acb_sinh, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_cosh(y, x, prec)
    ccall((:acb_cosh, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_sinh_cosh(y, z, x, prec)
    ccall((:acb_sinh_cosh, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), y, z, x, prec)
end

function acb_tanh(y, x, prec)
    ccall((:acb_tanh, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_coth(y, x, prec)
    ccall((:acb_coth, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_sech(r, z, prec)
    ccall((:acb_sech, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_csch(r, z, prec)
    ccall((:acb_csch, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sec(y, x, prec)
    ccall((:acb_sec, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_csc(y, x, prec)
    ccall((:acb_csc, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_sin_pi(r, z, prec)
    ccall((:acb_sin_pi, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_cos_pi(r, z, prec)
    ccall((:acb_cos_pi, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sin_cos_pi(s, c, z, prec)
    ccall((:acb_sin_cos_pi, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), s, c, z, prec)
end

function acb_tan_pi(r, z, prec)
    ccall((:acb_tan_pi, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_cot_pi(r, z, prec)
    ccall((:acb_cot_pi, libarb), Cvoid, (acb_t, acb_t, Cint), r, z, prec)
end

function acb_sinc(res, z, prec)
    ccall((:acb_sinc, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_sinc_pi(res, z, prec)
    ccall((:acb_sinc_pi, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_pow_arb(z, x, y, prec)
    ccall((:acb_pow_arb, libarb), Cvoid, (acb_t, acb_t, arb_t, Cint), z, x, y, prec)
end

function acb_pow(r, x, y, prec)
    ccall((:acb_pow, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), r, x, y, prec)
end

function acb_sqrt(y, x, prec)
    ccall((:acb_sqrt, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_rsqrt(y, x, prec)
    ccall((:acb_rsqrt, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_root_ui(y, x, k, prec)
    ccall((:acb_root_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, x, k, prec)
end

function acb_quadratic_roots_fmpz(r1, r2, a, b, c, prec)
    ccall((:acb_quadratic_roots_fmpz, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint, Cint), r1, r2, a, b, c, prec)
end

function acb_chebyshev_t_ui(a, n, x, prec)
    ccall((:acb_chebyshev_t_ui, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), a, n, x, prec)
end

function acb_chebyshev_t2_ui(a, b, n, x, prec)
    ccall((:acb_chebyshev_t2_ui, libarb), Cvoid, (acb_t, acb_t, Cint, acb_t, Cint), a, b, n, x, prec)
end

function acb_chebyshev_u_ui(a, n, x, prec)
    ccall((:acb_chebyshev_u_ui, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), a, n, x, prec)
end

function acb_chebyshev_u2_ui(a, b, n, x, prec)
    ccall((:acb_chebyshev_u2_ui, libarb), Cvoid, (acb_t, acb_t, Cint, acb_t, Cint), a, b, n, x, prec)
end

function acb_rising_ui_bs(y, x, n, prec)
    ccall((:acb_rising_ui_bs, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, x, n, prec)
end

function acb_rising_ui_rs(y, x, n, m, prec)
    ccall((:acb_rising_ui_rs, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint), y, x, n, m, prec)
end

function acb_rising_ui_rec(y, x, n, prec)
    ccall((:acb_rising_ui_rec, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), y, x, n, prec)
end

function acb_rising_ui(z, x, n, prec)
    ccall((:acb_rising_ui, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), z, x, n, prec)
end

function acb_rising(z, x, n, prec)
    ccall((:acb_rising, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, x, n, prec)
end

function acb_rising2_ui_bs(u, v, x, n, prec)
    ccall((:acb_rising2_ui_bs, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), u, v, x, n, prec)
end

function acb_rising2_ui_rs(u, v, x, n, m, prec)
    ccall((:acb_rising2_ui_rs, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint, Cint), u, v, x, n, m, prec)
end

function acb_rising2_ui(u, v, x, n, prec)
    ccall((:acb_rising2_ui, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), u, v, x, n, prec)
end

function acb_rising_ui_get_mag(bound, s, n)
    ccall((:acb_rising_ui_get_mag, libarb), Cvoid, (mag_t, acb_t, Cint), bound, s, n)
end

function acb_gamma(y, x, prec)
    ccall((:acb_gamma, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_rgamma(y, x, prec)
    ccall((:acb_rgamma, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_lgamma(y, x, prec)
    ccall((:acb_lgamma, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_log_sin_pi(res, z, prec)
    ccall((:acb_log_sin_pi, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_digamma(y, x, prec)
    ccall((:acb_digamma, libarb), Cvoid, (acb_t, acb_t, Cint), y, x, prec)
end

function acb_zeta(z, s, prec)
    ccall((:acb_zeta, libarb), Cvoid, (acb_t, acb_t, Cint), z, s, prec)
end

function acb_hurwitz_zeta(z, s, a, prec)
    ccall((:acb_hurwitz_zeta, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), z, s, a, prec)
end

function acb_polygamma(res, s, z, prec)
    ccall((:acb_polygamma, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, s, z, prec)
end

function acb_bernoulli_poly_ui(res, n, x, prec)
    ccall((:acb_bernoulli_poly_ui, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), res, n, x, prec)
end

function acb_log_barnes_g(res, z, prec)
    ccall((:acb_log_barnes_g, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_barnes_g(res, z, prec)
    ccall((:acb_barnes_g, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_polylog(w, s, z, prec)
    ccall((:acb_polylog, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), w, s, z, prec)
end

function acb_polylog_si(w, s, z, prec)
    ccall((:acb_polylog_si, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), w, s, z, prec)
end

function acb_agm1(m, z, prec)
    ccall((:acb_agm1, libarb), Cvoid, (acb_t, acb_t, Cint), m, z, prec)
end

function acb_agm1_cpx(m, z, len, prec)
    ccall((:acb_agm1_cpx, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), m, z, len, prec)
end

function acb_lambertw_asymp(res, z, k, L, M, prec)
    ccall((:acb_lambertw_asymp, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint, Cint), res, z, k, L, M, prec)
end

function acb_lambertw_check_branch(w, k, prec)
    ccall((:acb_lambertw_check_branch, libarb), Cint, (acb_t, Cint, Cint), w, k, prec)
end

function acb_lambertw_bound_deriv(res, z, ez1, k)
    ccall((:acb_lambertw_bound_deriv, libarb), Cvoid, (mag_t, acb_t, acb_t, Cint), res, z, ez1, k)
end

function acb_lambertw(res, z, k, flags, prec)
    ccall((:acb_lambertw, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint), res, z, k, flags, prec)
end

function acb_sqr(res, val, prec)
    ccall((:acb_sqr, libarb), Cvoid, (acb_t, acb_t, Cint), res, val, prec)
end

function acb_is_finite(x)
    ccall((:acb_is_finite, libarb), Cint, (acb_t,), x)
end

function acb_indeterminate(x)
    ccall((:acb_indeterminate, libarb), Cvoid, (acb_t,), x)
end

function _acb_vec_entry_ptr(vec, i)
    ccall((:_acb_vec_entry_ptr, libarb), acb_ptr, (acb_ptr, Cint), vec, i)
end

function _acb_vec_zero(A, n)
    ccall((:_acb_vec_zero, libarb), Cvoid, (acb_ptr, Cint), A, n)
end

function _acb_vec_is_zero(vec, len)
    ccall((:_acb_vec_is_zero, libarb), Cint, (acb_srcptr, Cint), vec, len)
end

function _acb_vec_set(res, vec, len)
    ccall((:_acb_vec_set, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint), res, vec, len)
end

function _acb_vec_set_round(res, vec, len, prec)
    ccall((:_acb_vec_set_round, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, vec, len, prec)
end

function _acb_vec_neg(res, vec, len)
    ccall((:_acb_vec_neg, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint), res, vec, len)
end

function _acb_vec_add(res, vec1, vec2, len, prec)
    ccall((:_acb_vec_add, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), res, vec1, vec2, len, prec)
end

function _acb_vec_sub(res, vec1, vec2, len, prec)
    ccall((:_acb_vec_sub, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), res, vec1, vec2, len, prec)
end

function _acb_vec_scalar_submul(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_submul, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_addmul(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_addmul, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_mul(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_mul, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_mul_ui(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_mul_ui, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_mul_2exp_si(res, vec, len, c)
    ccall((:_acb_vec_scalar_mul_2exp_si, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, vec, len, c)
end

function _acb_vec_scalar_mul_onei(res, vec, len)
    ccall((:_acb_vec_scalar_mul_onei, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint), res, vec, len)
end

function _acb_vec_scalar_div_ui(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_div_ui, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_div(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_div, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_mul_arb(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_mul_arb, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, arb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_div_arb(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_div_arb, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, arb_t, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_mul_fmpz(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_mul_fmpz, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, vec, len, c, prec)
end

function _acb_vec_scalar_div_fmpz(res, vec, len, c, prec)
    ccall((:_acb_vec_scalar_div_fmpz, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, vec, len, c, prec)
end

function acb_fprint(file, x)
    ccall((:acb_fprint, libarb), Cvoid, (Ptr{Cint}, acb_t), file, x)
end

function acb_print(x)
    ccall((:acb_print, libarb), Cvoid, (acb_t,), x)
end

function acb_fprintd(file, z, digits)
    ccall((:acb_fprintd, libarb), Cvoid, (Ptr{Cint}, acb_t, Cint), file, z, digits)
end

function acb_printd(z, digits)
    ccall((:acb_printd, libarb), Cvoid, (acb_t, Cint), z, digits)
end

function acb_fprintn(fp, z, digits, flags)
    ccall((:acb_fprintn, libarb), Cvoid, (Ptr{Cint}, acb_t, Clong, Cint), fp, z, digits, flags)
end

function acb_printn(x, digits, flags)
    ccall((:acb_printn, libarb), Cvoid, (acb_t, Cint, Cint), x, digits, flags)
end

function acb_randtest(z, state, prec, mag_bits)
    ccall((:acb_randtest, libarb), Cvoid, (acb_t, Cint, Cint, Cint), z, state, prec, mag_bits)
end

function acb_randtest_special(z, state, prec, mag_bits)
    ccall((:acb_randtest_special, libarb), Cvoid, (acb_t, Cint, Cint, Cint), z, state, prec, mag_bits)
end

function acb_randtest_precise(z, state, prec, mag_bits)
    ccall((:acb_randtest_precise, libarb), Cvoid, (acb_t, Cint, Cint, Cint), z, state, prec, mag_bits)
end

function acb_randtest_param(z, state, prec, mag_bits)
    ccall((:acb_randtest_param, libarb), Cvoid, (acb_t, Cint, Cint, Cint), z, state, prec, mag_bits)
end

function acb_rel_error_bits()
    ccall((:acb_rel_error_bits, libarb), Cint, ())
end

function acb_rel_accuracy_bits()
    ccall((:acb_rel_accuracy_bits, libarb), Cint, ())
end

function acb_rel_one_accuracy_bits()
    ccall((:acb_rel_one_accuracy_bits, libarb), Cint, ())
end

function acb_bits()
    ccall((:acb_bits, libarb), Cint, ())
end

function acb_is_real(x)
    ccall((:acb_is_real, libarb), Cint, (acb_t,), x)
end

function _acb_vec_is_real(v, len)
    ccall((:_acb_vec_is_real, libarb), Cint, (acb_srcptr, Cint), v, len)
end

function _acb_vec_bits()
    ccall((:_acb_vec_bits, libarb), Cint, ())
end

function _acb_vec_set_powers(xs, x, len, prec)
    ccall((:_acb_vec_set_powers, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), xs, x, len, prec)
end

function _acb_vec_add_error_arf_vec(res, err, len)
    ccall((:_acb_vec_add_error_arf_vec, libarb), Cvoid, (acb_ptr, arf_srcptr, Cint), res, err, len)
end

function _acb_vec_add_error_mag_vec(res, err, len)
    ccall((:_acb_vec_add_error_mag_vec, libarb), Cvoid, (acb_ptr, mag_srcptr, Cint), res, err, len)
end

function _acb_vec_indeterminate(vec, len)
    ccall((:_acb_vec_indeterminate, libarb), Cvoid, (acb_ptr, Cint), vec, len)
end

function _acb_vec_trim(res, vec, len)
    ccall((:_acb_vec_trim, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint), res, vec, len)
end

function _acb_vec_get_unique_fmpz_vec(res, vec, len)
    ccall((:_acb_vec_get_unique_fmpz_vec, libarb), Cint, (Ptr{Cint}, acb_srcptr, Cint), res, vec, len)
end

function _acb_vec_sort_pretty(vec, len)
    ccall((:_acb_vec_sort_pretty, libarb), Cvoid, (acb_ptr, Cint), vec, len)
end

function acb_unit_root(res, order, prec)
    ccall((:acb_unit_root, libarb), Cvoid, (acb_t, Cint, Cint), res, order, prec)
end

function _acb_vec_unit_roots(z, order, len, prec)
    ccall((:_acb_vec_unit_roots, libarb), Cvoid, (acb_ptr, Cint, Cint, Cint), z, order, len, prec)
end

function acb_allocated_bytes()
    ccall((:acb_allocated_bytes, libarb), Cint, ())
end

function _acb_vec_allocated_bytes()
    ccall((:_acb_vec_allocated_bytes, libarb), Cint, ())
end

function _acb_vec_estimate_allocated_bytes(len, prec)
    ccall((:_acb_vec_estimate_allocated_bytes, libarb), Cdouble, (Cint, Cint), len, prec)
end
# Julia wrapper for header: acb_calc.h
# Automatically generated using Clang.jl


function acb_calc_cauchy_bound(bound, func, param, x, radius, maxdepth, prec)
    ccall((:acb_calc_cauchy_bound, libarb), Cvoid, (arb_t, acb_calc_func_t, Ptr{Cvoid}, acb_t, arb_t, Cint, Cint), bound, func, param, x, radius, maxdepth, prec)
end

function acb_calc_integrate_taylor(res, func, param, a, b, inner_radius, outer_radius, accuracy_goal, prec)
    ccall((:acb_calc_integrate_taylor, libarb), Cint, (acb_t, acb_calc_func_t, Ptr{Cvoid}, acb_t, acb_t, arf_t, arf_t, Cint, Cint), res, func, param, a, b, inner_radius, outer_radius, accuracy_goal, prec)
end

function acb_calc_integrate_opt_init(options)
    ccall((:acb_calc_integrate_opt_init, libarb), Cvoid, (acb_calc_integrate_opt_t,), options)
end

function acb_calc_integrate(res, f, param, a, b, goal, tol, options, prec)
    ccall((:acb_calc_integrate, libarb), Cint, (acb_t, acb_calc_func_t, Ptr{Cvoid}, acb_t, acb_t, Cint, mag_t, acb_calc_integrate_opt_t, Cint), res, f, param, a, b, goal, tol, options, prec)
end

function acb_calc_integrate_gl_auto_deg(res, eval_count, f, param, a, b, tol, deg_limit, verbose, prec)
    ccall((:acb_calc_integrate_gl_auto_deg, libarb), Cint, (acb_t, Ptr{Cint}, acb_calc_func_t, Ptr{Cvoid}, acb_t, acb_t, mag_t, Cint, Cint, Cint), res, eval_count, f, param, a, b, tol, deg_limit, verbose, prec)
end
# Julia wrapper for header: acb_dft.h
# Automatically generated using Clang.jl


function _acb_dft_naive(w, v, dv, z, dz, len, prec)
    ccall((:_acb_dft_naive, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), w, v, dv, z, dz, len, prec)
end

function acb_dft_naive(w, v, len, prec)
    ccall((:acb_dft_naive, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function acb_dft_crt(w, v, len, prec)
    ccall((:acb_dft_crt, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function acb_dft_cyc(w, v, len, prec)
    ccall((:acb_dft_cyc, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function acb_dft_rad2_inplace(v, e, prec)
    ccall((:acb_dft_rad2_inplace, libarb), Cvoid, (acb_ptr, Cint, Cint), v, e, prec)
end

function acb_dft_rad2(w, v, e, prec)
    ccall((:acb_dft_rad2, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, e, prec)
end

function acb_dft_bluestein(w, v, len, prec)
    ccall((:acb_dft_bluestein, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function acb_dft_prod(w, v, cyc, num, prec)
    ccall((:acb_dft_prod, libarb), Cvoid, (acb_ptr, acb_srcptr, Ptr{Cint}, Cint, Cint), w, v, cyc, num, prec)
end

function acb_dft_convol_naive(w, f, g, len, prec)
    ccall((:acb_dft_convol_naive, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), w, f, g, len, prec)
end

function acb_dft_convol_dft(w, f, g, len, prec)
    ccall((:acb_dft_convol_dft, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), w, f, g, len, prec)
end

function acb_dft_convol_rad2(w, f, g, len, prec)
    ccall((:acb_dft_convol_rad2, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), w, f, g, len, prec)
end

function acb_dft_convol_mullow(w, f, g, len, prec)
    ccall((:acb_dft_convol_mullow, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), w, f, g, len, prec)
end

function acb_dft_convol(w, f, g, len, prec)
    ccall((:acb_dft_convol, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), w, f, g, len, prec)
end

function crt_init(c, n)
    ccall((:crt_init, libarb), Cvoid, (crt_t, Cint), c, n)
end

function crt_decomp(y, x, dx, c, len)
    ccall((:crt_decomp, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, crt_t, Cint), y, x, dx, c, len)
end

function crt_recomp(y, x, c, len)
    ccall((:crt_recomp, libarb), Cvoid, (acb_ptr, acb_srcptr, crt_t, Cint), y, x, c, len)
end

function acb_dft_step(w, v, cyc, num, prec)
    ccall((:acb_dft_step, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_step_ptr, Cint, Cint), w, v, cyc, num, prec)
end

function acb_dft_precomp(w, v, pre, prec)
    ccall((:acb_dft_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_pre_t, Cint), w, v, pre, prec)
end

function acb_dft_inverse_precomp(w, v, pre, prec)
    ccall((:acb_dft_inverse_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_pre_t, Cint), w, v, pre, prec)
end

function acb_dft_naive_precomp(w, v, pol, prec)
    ccall((:acb_dft_naive_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_naive_t, Cint), w, v, pol, prec)
end

function acb_dft_cyc_precomp(w, v, cyc, prec)
    ccall((:acb_dft_cyc_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_cyc_t, Cint), w, v, cyc, prec)
end

function acb_dft_rad2_precomp_inplace(v, rad2, prec)
    ccall((:acb_dft_rad2_precomp_inplace, libarb), Cvoid, (acb_ptr, acb_dft_rad2_t, Cint), v, rad2, prec)
end

function acb_dft_rad2_precomp(w, v, rad2, prec)
    ccall((:acb_dft_rad2_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_rad2_t, Cint), w, v, rad2, prec)
end

function acb_dft_crt_precomp(w, v, crt, prec)
    ccall((:acb_dft_crt_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_crt_t, Cint), w, v, crt, prec)
end

function acb_dft_prod_precomp(w, v, prod, prec)
    ccall((:acb_dft_prod_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_prod_t, Cint), w, v, prod, prec)
end

function acb_dft_bluestein_precomp(w, v, t, prec)
    ccall((:acb_dft_bluestein_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_bluestein_t, Cint), w, v, t, prec)
end

function acb_dft_inverse_rad2_precomp_inplace(v, rad2, prec)
    ccall((:acb_dft_inverse_rad2_precomp_inplace, libarb), Cvoid, (acb_ptr, acb_dft_rad2_t, Cint), v, rad2, prec)
end

function acb_dft_inverse_rad2_precomp(w, v, rad2, prec)
    ccall((:acb_dft_inverse_rad2_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_dft_rad2_t, Cint), w, v, rad2, prec)
end

function acb_dft_convol_rad2_precomp(w, f, g, len, arg1, prec)
    ccall((:acb_dft_convol_rad2_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, acb_dft_rad2_t, Cint), w, f, g, len, arg1, prec)
end

function _acb_dft_precomp_init(pre, dv, z, dz, len, prec)
    ccall((:_acb_dft_precomp_init, libarb), Cvoid, (acb_dft_pre_t, Cint, acb_ptr, Cint, Cint, Cint), pre, dv, z, dz, len, prec)
end

function acb_dft_precomp_init(pre, len, prec)
    ccall((:acb_dft_precomp_init, libarb), Cvoid, (acb_dft_pre_t, Cint, Cint), pre, len, prec)
end

function acb_dft_precomp_clear(pre)
    ccall((:acb_dft_precomp_clear, libarb), Cvoid, (acb_dft_pre_t,), pre)
end

function acb_dft(w, v, len, prec)
    ccall((:acb_dft, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function acb_dft_inverse(w, v, len, prec)
    ccall((:acb_dft_inverse, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), w, v, len, prec)
end

function _acb_dft_steps_prod(m, num, prec)
    ccall((:_acb_dft_steps_prod, libarb), acb_dft_step_ptr, (Ptr{Cint}, Cint, Cint), m, num, prec)
end

function acb_dft_prod_init(t, cyc, num, prec)
    ccall((:acb_dft_prod_init, libarb), Cvoid, (acb_dft_prod_t, Ptr{Cint}, Cint, Cint), t, cyc, num, prec)
end

function acb_dft_prod_clear(t)
    ccall((:acb_dft_prod_clear, libarb), Cvoid, (acb_dft_prod_t,), t)
end

function _acb_dft_cyc_init_z_fac(t, fac, dv, z, dz, len, prec)
    ccall((:_acb_dft_cyc_init_z_fac, libarb), Cvoid, (acb_dft_cyc_t, Cint, Cint, acb_ptr, Cint, Cint, Cint), t, fac, dv, z, dz, len, prec)
end

function _acb_dft_cyc_init(t, dv, len, prec)
    ccall((:_acb_dft_cyc_init, libarb), Cvoid, (acb_dft_cyc_t, Cint, Cint, Cint), t, dv, len, prec)
end

function acb_dft_cyc_init(t, len, prec)
    ccall((:acb_dft_cyc_init, libarb), Cvoid, (acb_dft_cyc_t, Cint, Cint), t, len, prec)
end

function acb_dft_cyc_clear(t)
    ccall((:acb_dft_cyc_clear, libarb), Cvoid, (acb_dft_cyc_t,), t)
end

function _acb_dft_naive_init(pol, dv, z, dz, len, prec)
    ccall((:_acb_dft_naive_init, libarb), Cvoid, (acb_dft_naive_t, Cint, acb_ptr, Cint, Cint, Cint), pol, dv, z, dz, len, prec)
end

function acb_dft_naive_init(pol, len, prec)
    ccall((:acb_dft_naive_init, libarb), Cvoid, (acb_dft_naive_t, Cint, Cint), pol, len, prec)
end

function acb_dft_naive_clear(pol)
    ccall((:acb_dft_naive_clear, libarb), Cvoid, (acb_dft_naive_t,), pol)
end

function _acb_dft_rad2_init(t, dv, e, prec)
    ccall((:_acb_dft_rad2_init, libarb), Cvoid, (acb_dft_rad2_t, Cint, Cint, Cint), t, dv, e, prec)
end

function acb_dft_rad2_init(t, e, prec)
    ccall((:acb_dft_rad2_init, libarb), Cvoid, (acb_dft_rad2_t, Cint, Cint), t, e, prec)
end

function acb_dft_rad2_clear(t)
    ccall((:acb_dft_rad2_clear, libarb), Cvoid, (acb_dft_rad2_t,), t)
end

function _acb_dft_bluestein_init(t, dv, n, prec)
    ccall((:_acb_dft_bluestein_init, libarb), Cvoid, (acb_dft_bluestein_t, Cint, Cint, Cint), t, dv, n, prec)
end

function acb_dft_bluestein_init(t, n, prec)
    ccall((:acb_dft_bluestein_init, libarb), Cvoid, (acb_dft_bluestein_t, Cint, Cint), t, n, prec)
end

function acb_dft_bluestein_clear(t)
    ccall((:acb_dft_bluestein_clear, libarb), Cvoid, (acb_dft_bluestein_t,), t)
end

function _acb_dft_crt_init(crt, dv, len, prec)
    ccall((:_acb_dft_crt_init, libarb), Cvoid, (acb_dft_crt_t, Cint, Cint, Cint), crt, dv, len, prec)
end

function acb_dft_crt_init(crt, len, prec)
    ccall((:acb_dft_crt_init, libarb), Cvoid, (acb_dft_crt_t, Cint, Cint), crt, len, prec)
end

function acb_dft_crt_clear(crt)
    ccall((:acb_dft_crt_clear, libarb), Cvoid, (acb_dft_crt_t,), crt)
end

function acb_swap_ri(x)
    ccall((:acb_swap_ri, libarb), Cvoid, (acb_t,), x)
end

function acb_vec_swap_ri(v, len)
    ccall((:acb_vec_swap_ri, libarb), Cvoid, (acb_ptr, Cint), v, len)
end

function _acb_vec_kronecker_mul(z, x, y, len, prec)
    ccall((:_acb_vec_kronecker_mul, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), z, x, y, len, prec)
end

function _acb_vec_kronecker_mul_step(z, x, y, step, len, prec)
    ccall((:_acb_vec_kronecker_mul_step, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint, Cint), z, x, y, step, len, prec)
end

function acb_vec_printd_index(vec, len, digits)
    ccall((:acb_vec_printd_index, libarb), Cvoid, (acb_srcptr, Cint, Cint), vec, len, digits)
end
# Julia wrapper for header: acb_dirichlet.h
# Automatically generated using Clang.jl


function acb_dirichlet_powsum_term(res, log_prev, prev, s, k, integer, critical_line, len, prec)
    ccall((:acb_dirichlet_powsum_term, libarb), Cvoid, (acb_ptr, arb_t, Ptr{Cint}, acb_t, Cint, Cint, Cint, Cint, Cint), res, log_prev, prev, s, k, integer, critical_line, len, prec)
end

function acb_dirichlet_powsum_sieved(z, s, n, len, prec)
    ccall((:acb_dirichlet_powsum_sieved, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint, Cint), z, s, n, len, prec)
end

function acb_dirichlet_powsum_smooth(z, s, n, len, prec)
    ccall((:acb_dirichlet_powsum_smooth, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint, Cint), z, s, n, len, prec)
end

function acb_dirichlet_zeta_bound(res, s)
    ccall((:acb_dirichlet_zeta_bound, libarb), Cvoid, (mag_t, acb_t), res, s)
end

function acb_dirichlet_zeta_deriv_bound(der1, der2, s)
    ccall((:acb_dirichlet_zeta_deriv_bound, libarb), Cvoid, (mag_t, mag_t, acb_t), der1, der2, s)
end

function acb_dirichlet_zeta_rs_f_coeffs(c, p, N, prec)
    ccall((:acb_dirichlet_zeta_rs_f_coeffs, libarb), Cvoid, (acb_ptr, arb_t, Cint, Cint), c, p, N, prec)
end

function acb_dirichlet_zeta_rs_d_coeffs(d, sigma, k, prec)
    ccall((:acb_dirichlet_zeta_rs_d_coeffs, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), d, sigma, k, prec)
end

function acb_dirichlet_zeta_rs_bound(err, s, K)
    ccall((:acb_dirichlet_zeta_rs_bound, libarb), Cvoid, (mag_t, acb_t, Cint), err, s, K)
end

function acb_dirichlet_zeta_rs_r(res, s, K, prec)
    ccall((:acb_dirichlet_zeta_rs_r, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, s, K, prec)
end

function acb_dirichlet_zeta_rs(res, s, K, prec)
    ccall((:acb_dirichlet_zeta_rs, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, s, K, prec)
end

function acb_dirichlet_zeta(res, s, prec)
    ccall((:acb_dirichlet_zeta, libarb), Cvoid, (acb_t, acb_t, Cint), res, s, prec)
end

function acb_dirichlet_zeta_jet_rs(res, s, len, prec)
    ccall((:acb_dirichlet_zeta_jet_rs, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), res, s, len, prec)
end

function acb_dirichlet_zeta_jet(res, s, deflate, len, prec)
    ccall((:acb_dirichlet_zeta_jet, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint), res, s, deflate, len, prec)
end

function acb_dirichlet_hurwitz(res, s, a, prec)
    ccall((:acb_dirichlet_hurwitz, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, s, a, prec)
end

function acb_dirichlet_stieltjes(res, n, a, prec)
    ccall((:acb_dirichlet_stieltjes, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), res, n, a, prec)
end

function acb_dirichlet_hurwitz_precomp_init(pre, s, deflate, A, K, N, prec)
    ccall((:acb_dirichlet_hurwitz_precomp_init, libarb), Cvoid, (acb_dirichlet_hurwitz_precomp_t, acb_t, Cint, Cint, Cint, Cint, Cint), pre, s, deflate, A, K, N, prec)
end

function acb_dirichlet_hurwitz_precomp_init_num(pre, s, deflate, num_eval, prec)
    ccall((:acb_dirichlet_hurwitz_precomp_init_num, libarb), Cvoid, (acb_dirichlet_hurwitz_precomp_t, acb_t, Cint, Cdouble, Cint), pre, s, deflate, num_eval, prec)
end

function acb_dirichlet_hurwitz_precomp_clear(pre)
    ccall((:acb_dirichlet_hurwitz_precomp_clear, libarb), Cvoid, (acb_dirichlet_hurwitz_precomp_t,), pre)
end

function acb_dirichlet_hurwitz_precomp_bound(res, s, A, K, N)
    ccall((:acb_dirichlet_hurwitz_precomp_bound, libarb), Cvoid, (mag_t, acb_t, Cint, Cint, Cint), res, s, A, K, N)
end

function acb_dirichlet_hurwitz_precomp_eval(res, pre, p, q, prec)
    ccall((:acb_dirichlet_hurwitz_precomp_eval, libarb), Cvoid, (acb_t, acb_dirichlet_hurwitz_precomp_t, Cint, Cint, Cint), res, pre, p, q, prec)
end

function acb_dirichlet_hurwitz_precomp_choose_param(A, K, N, s, num_eval, prec)
    ccall((:acb_dirichlet_hurwitz_precomp_choose_param, libarb), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, acb_t, Cdouble, Cint), A, K, N, s, num_eval, prec)
end

function _acb_dirichlet_euler_product_real_ui(res, s, chi, mod, reciprocal, prec)
    ccall((:_acb_dirichlet_euler_product_real_ui, libarb), Cvoid, (arb_t, Cint, Ptr{UInt8}, Cint, Cint, Cint), res, s, chi, mod, reciprocal, prec)
end

function acb_dirichlet_eta(res, s, prec)
    ccall((:acb_dirichlet_eta, libarb), Cvoid, (acb_t, acb_t, Cint), res, s, prec)
end

function acb_dirichlet_xi(res, s, prec)
    ccall((:acb_dirichlet_xi, libarb), Cvoid, (acb_t, acb_t, Cint), res, s, prec)
end

function acb_dirichlet_pairing(res, G, m, n, prec)
    ccall((:acb_dirichlet_pairing, libarb), Cvoid, (acb_t, dirichlet_group_t, Cint, Cint, Cint), res, G, m, n, prec)
end

function acb_dirichlet_pairing_char(res, G, a, b, prec)
    ccall((:acb_dirichlet_pairing_char, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t, Cint), res, G, a, b, prec)
end

function acb_dirichlet_roots_init(t, order, num, prec)
    ccall((:acb_dirichlet_roots_init, libarb), Cvoid, (acb_dirichlet_roots_t, Cint, Cint, Cint), t, order, num, prec)
end

function acb_dirichlet_roots_clear(t)
    ccall((:acb_dirichlet_roots_clear, libarb), Cvoid, (acb_dirichlet_roots_t,), t)
end

function acb_dirichlet_root(z, t, n, prec)
    ccall((:acb_dirichlet_root, libarb), Cvoid, (acb_t, acb_dirichlet_roots_t, Cint, Cint), z, t, n, prec)
end

function acb_dirichlet_chi(res, G, chi, n, prec)
    ccall((:acb_dirichlet_chi, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, G, chi, n, prec)
end

function acb_dirichlet_chi_vec(v, G, chi, nv, prec)
    ccall((:acb_dirichlet_chi_vec, libarb), Cvoid, (acb_ptr, dirichlet_group_t, dirichlet_char_t, Cint, Cint), v, G, chi, nv, prec)
end

function acb_dirichlet_arb_quadratic_powers(v, nv, x, prec)
    ccall((:acb_dirichlet_arb_quadratic_powers, libarb), Cvoid, (arb_ptr, Cint, arb_t, Cint), v, nv, x, prec)
end

function acb_dirichlet_qseries_arb(res, a, x, len, prec)
    ccall((:acb_dirichlet_qseries_arb, libarb), Cvoid, (acb_t, acb_srcptr, arb_t, Cint, Cint), res, a, x, len, prec)
end

function acb_dirichlet_qseries_arb_powers_naive(res, x, parity, a, z, len, prec)
    ccall((:acb_dirichlet_qseries_arb_powers_naive, libarb), Cvoid, (acb_t, arb_t, Cint, Ptr{Cint}, acb_dirichlet_roots_t, Cint, Cint), res, x, parity, a, z, len, prec)
end

function acb_dirichlet_qseries_arb_powers_smallorder(res, x, parity, a, z, len, prec)
    ccall((:acb_dirichlet_qseries_arb_powers_smallorder, libarb), Cvoid, (acb_t, arb_t, Cint, Ptr{Cint}, acb_dirichlet_roots_t, Cint, Cint), res, x, parity, a, z, len, prec)
end

function acb_dirichlet_theta_length_d()
    ccall((:acb_dirichlet_theta_length_d, libarb), Cint, ())
end

function acb_dirichlet_theta_length()
    ccall((:acb_dirichlet_theta_length, libarb), Cint, ())
end

function mag_tail_kexpk2_arb(res, a, n)
    ccall((:mag_tail_kexpk2_arb, libarb), Cvoid, (mag_t, arb_t, Cint), res, a, n)
end

function _acb_dirichlet_theta_argument_at_arb(xt, q, t, prec)
    ccall((:_acb_dirichlet_theta_argument_at_arb, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), xt, q, t, prec)
end

function acb_dirichlet_theta_arb(res, G, chi, t, prec)
    ccall((:acb_dirichlet_theta_arb, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, arb_t, Cint), res, G, chi, t, prec)
end

function acb_dirichlet_ui_theta_arb(res, G, a, t, prec)
    ccall((:acb_dirichlet_ui_theta_arb, libarb), Cvoid, (acb_t, dirichlet_group_t, Cint, arb_t, Cint), res, G, a, t, prec)
end

function acb_dirichlet_gauss_sum_naive(res, G, chi, prec)
    ccall((:acb_dirichlet_gauss_sum_naive, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_gauss_sum_factor(res, G, chi, prec)
    ccall((:acb_dirichlet_gauss_sum_factor, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_gauss_sum_order2(res, G, chi, prec)
    ccall((:acb_dirichlet_gauss_sum_order2, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_gauss_sum_theta(res, G, chi, prec)
    ccall((:acb_dirichlet_gauss_sum_theta, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_gauss_sum(res, G, chi, prec)
    ccall((:acb_dirichlet_gauss_sum, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_root_number_theta(res, G, chi, prec)
    ccall((:acb_dirichlet_root_number_theta, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_root_number(res, G, chi, prec)
    ccall((:acb_dirichlet_root_number, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, G, chi, prec)
end

function acb_dirichlet_si_poly_evaluate(res, v, len, z, prec)
    ccall((:acb_dirichlet_si_poly_evaluate, libarb), Cvoid, (acb_t, Ptr{Cint}, Cint, acb_t, Cint), res, v, len, z, prec)
end

function acb_dirichlet_jacobi_sum_naive(res, G, chi1, chi2, prec)
    ccall((:acb_dirichlet_jacobi_sum_naive, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t, Cint), res, G, chi1, chi2, prec)
end

function jacobi_one_prime()
    ccall((:jacobi_one_prime, libarb), Cint, ())
end

function acb_dirichlet_jacobi_sum_factor(res, G, chi1, chi2, prec)
    ccall((:acb_dirichlet_jacobi_sum_factor, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t, Cint), res, G, chi1, chi2, prec)
end

function acb_dirichlet_jacobi_sum_gauss(res, G, chi1, chi2, prec)
    ccall((:acb_dirichlet_jacobi_sum_gauss, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t, Cint), res, G, chi1, chi2, prec)
end

function acb_dirichlet_jacobi_sum(res, G, chi1, chi2, prec)
    ccall((:acb_dirichlet_jacobi_sum, libarb), Cvoid, (acb_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t, Cint), res, G, chi1, chi2, prec)
end

function acb_dirichlet_jacobi_sum_ui(res, G, a, b, prec)
    ccall((:acb_dirichlet_jacobi_sum_ui, libarb), Cvoid, (acb_t, dirichlet_group_t, Cint, Cint, Cint), res, G, a, b, prec)
end

function acb_dirichlet_l_euler_product(res, s, G, chi, prec)
    ccall((:acb_dirichlet_l_euler_product, libarb), Cvoid, (acb_t, acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, s, G, chi, prec)
end

function acb_dirichlet_l_hurwitz(res, s, precomp, G, chi, prec)
    ccall((:acb_dirichlet_l_hurwitz, libarb), Cvoid, (acb_t, acb_t, acb_dirichlet_hurwitz_precomp_t, dirichlet_group_t, dirichlet_char_t, Cint), res, s, precomp, G, chi, prec)
end

function acb_dirichlet_l(res, s, G, chi, prec)
    ccall((:acb_dirichlet_l, libarb), Cvoid, (acb_t, acb_t, dirichlet_group_t, dirichlet_char_t, Cint), res, s, G, chi, prec)
end

function acb_dirichlet_l_vec_hurwitz(res, s, precomp, G, prec)
    ccall((:acb_dirichlet_l_vec_hurwitz, libarb), Cvoid, (acb_ptr, acb_t, acb_dirichlet_hurwitz_precomp_t, dirichlet_group_t, Cint), res, s, precomp, G, prec)
end

function acb_dirichlet_l_jet(res, s, G, chi, deflate, len, prec)
    ccall((:acb_dirichlet_l_jet, libarb), Cvoid, (acb_ptr, acb_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint, Cint), res, s, G, chi, deflate, len, prec)
end

function _acb_dirichlet_l_series(res, s, slen, G, chi, deflate, len, prec)
    ccall((:_acb_dirichlet_l_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, dirichlet_group_t, dirichlet_char_t, Cint, Cint, Cint), res, s, slen, G, chi, deflate, len, prec)
end

function acb_dirichlet_l_series(res, s, G, chi, deflate, len, prec)
    ccall((:acb_dirichlet_l_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint, Cint), res, s, G, chi, deflate, len, prec)
end

function acb_dirichlet_hardy_theta(res, t, G, chi, len, prec)
    ccall((:acb_dirichlet_hardy_theta, libarb), Cvoid, (acb_ptr, acb_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, t, G, chi, len, prec)
end

function acb_dirichlet_hardy_z(res, t, G, chi, len, prec)
    ccall((:acb_dirichlet_hardy_z, libarb), Cvoid, (acb_ptr, acb_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, t, G, chi, len, prec)
end

function _acb_dirichlet_hardy_theta_series(res, s, slen, G, chi, len, prec)
    ccall((:_acb_dirichlet_hardy_theta_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, s, slen, G, chi, len, prec)
end

function acb_dirichlet_hardy_theta_series(res, s, G, chi, len, prec)
    ccall((:acb_dirichlet_hardy_theta_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, s, G, chi, len, prec)
end

function _acb_dirichlet_hardy_z_series(res, s, slen, G, chi, len, prec)
    ccall((:_acb_dirichlet_hardy_z_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, s, slen, G, chi, len, prec)
end

function acb_dirichlet_hardy_z_series(res, s, G, chi, len, prec)
    ccall((:acb_dirichlet_hardy_z_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, dirichlet_group_t, dirichlet_char_t, Cint, Cint), res, s, G, chi, len, prec)
end

function acb_dirichlet_gram_point(res, n, G, chi, prec)
    ccall((:acb_dirichlet_gram_point, libarb), Cvoid, (arb_t, Cint, dirichlet_group_t, dirichlet_char_t, Cint), res, n, G, chi, prec)
end

function acb_dirichlet_turing_method_bound()
    ccall((:acb_dirichlet_turing_method_bound, libarb), Cint, ())
end

function _acb_dirichlet_definite_hardy_z(res, t, pprec)
    ccall((:_acb_dirichlet_definite_hardy_z, libarb), Cint, (arb_t, arf_t, Ptr{Cint}), res, t, pprec)
end

function _acb_dirichlet_isolate_gram_hardy_z_zero(a, b, n)
    ccall((:_acb_dirichlet_isolate_gram_hardy_z_zero, libarb), Cvoid, (arf_t, arf_t, Cint), a, b, n)
end

function _acb_dirichlet_isolate_rosser_hardy_z_zero(a, b, n)
    ccall((:_acb_dirichlet_isolate_rosser_hardy_z_zero, libarb), Cvoid, (arf_t, arf_t, Cint), a, b, n)
end

function _acb_dirichlet_isolate_turing_hardy_z_zero(a, b, n)
    ccall((:_acb_dirichlet_isolate_turing_hardy_z_zero, libarb), Cvoid, (arf_t, arf_t, Cint), a, b, n)
end

function acb_dirichlet_isolate_hardy_z_zero(a, b, n)
    ccall((:acb_dirichlet_isolate_hardy_z_zero, libarb), Cvoid, (arf_t, arf_t, Cint), a, b, n)
end

function _acb_dirichlet_refine_hardy_z_zero(res, a, b, prec)
    ccall((:_acb_dirichlet_refine_hardy_z_zero, libarb), Cvoid, (arb_t, arf_t, arf_t, Cint), res, a, b, prec)
end

function acb_dirichlet_hardy_z_zeros(res, n, len, prec)
    ccall((:acb_dirichlet_hardy_z_zeros, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint), res, n, len, prec)
end

function acb_dirichlet_zeta_zeros(res, n, len, prec)
    ccall((:acb_dirichlet_zeta_zeros, libarb), Cvoid, (acb_ptr, Cint, Cint, Cint), res, n, len, prec)
end

function _acb_dirichlet_exact_zeta_nzeros(res, t)
    ccall((:_acb_dirichlet_exact_zeta_nzeros, libarb), Cvoid, (Cint, arf_t), res, t)
end

function acb_dirichlet_zeta_nzeros(res, t, prec)
    ccall((:acb_dirichlet_zeta_nzeros, libarb), Cvoid, (arb_t, arb_t, Cint), res, t, prec)
end

function acb_dirichlet_backlund_s(res, t, prec)
    ccall((:acb_dirichlet_backlund_s, libarb), Cvoid, (arb_t, arb_t, Cint), res, t, prec)
end

function acb_dirichlet_backlund_s_bound(res, t)
    ccall((:acb_dirichlet_backlund_s_bound, libarb), Cvoid, (mag_t, arb_t), res, t)
end

function acb_dirichlet_zeta_nzeros_gram(res, n)
    ccall((:acb_dirichlet_zeta_nzeros_gram, libarb), Cvoid, (Cint, Cint), res, n)
end

function acb_dirichlet_backlund_s_gram()
    ccall((:acb_dirichlet_backlund_s_gram, libarb), Cint, ())
end

function acb_dirichlet_hardy_z_zero(res, n, prec)
    ccall((:acb_dirichlet_hardy_z_zero, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function acb_dirichlet_zeta_zero(res, n, prec)
    ccall((:acb_dirichlet_zeta_zero, libarb), Cvoid, (acb_t, Cint, Cint), res, n, prec)
end

function acb_dirichlet_dft_index(w, v, G, prec)
    ccall((:acb_dirichlet_dft_index, libarb), Cvoid, (acb_ptr, acb_srcptr, dirichlet_group_t, Cint), w, v, G, prec)
end

function acb_dirichlet_dft(w, v, G, prec)
    ccall((:acb_dirichlet_dft, libarb), Cvoid, (acb_ptr, acb_srcptr, dirichlet_group_t, Cint), w, v, G, prec)
end

function acb_vec_printd(vec, len, digits)
    ccall((:acb_vec_printd, libarb), Cvoid, (acb_srcptr, Cint, Cint), vec, len, digits)
end
# Julia wrapper for header: acb_elliptic.h
# Automatically generated using Clang.jl


function acb_elliptic_k(k, m, prec)
    ccall((:acb_elliptic_k, libarb), Cvoid, (acb_t, acb_t, Cint), k, m, prec)
end

function acb_elliptic_k_jet(w, m, len, prec)
    ccall((:acb_elliptic_k_jet, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), w, m, len, prec)
end

function _acb_elliptic_k_series(res, m, zlen, len, prec)
    ccall((:_acb_elliptic_k_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, m, zlen, len, prec)
end

function acb_elliptic_k_series(res, m, len, prec)
    ccall((:acb_elliptic_k_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, m, len, prec)
end

function acb_elliptic_e(res, m, prec)
    ccall((:acb_elliptic_e, libarb), Cvoid, (acb_t, acb_t, Cint), res, m, prec)
end

function acb_elliptic_rf(res, x, y, z, flags, prec)
    ccall((:acb_elliptic_rf, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, x, y, z, flags, prec)
end

function acb_elliptic_rj(res, x, y, z, p, flags, prec)
    ccall((:acb_elliptic_rj, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, x, y, z, p, flags, prec)
end

function acb_elliptic_rg(res, x, y, z, flags, prec)
    ccall((:acb_elliptic_rg, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, x, y, z, flags, prec)
end

function acb_elliptic_rc1(res, x, prec)
    ccall((:acb_elliptic_rc1, libarb), Cvoid, (acb_t, acb_t, Cint), res, x, prec)
end

function acb_elliptic_f(res, phi, m, times_pi, prec)
    ccall((:acb_elliptic_f, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, phi, m, times_pi, prec)
end

function acb_elliptic_e_inc(res, phi, m, times_pi, prec)
    ccall((:acb_elliptic_e_inc, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, phi, m, times_pi, prec)
end

function acb_elliptic_pi(r, n, m, prec)
    ccall((:acb_elliptic_pi, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), r, n, m, prec)
end

function acb_elliptic_pi_inc(res, n, phi, m, times_pi, prec)
    ccall((:acb_elliptic_pi_inc, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, n, phi, m, times_pi, prec)
end

function acb_elliptic_p(r, z, tau, prec)
    ccall((:acb_elliptic_p, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), r, z, tau, prec)
end

function acb_elliptic_p_jet(r, z, tau, len, prec)
    ccall((:acb_elliptic_p_jet, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), r, z, tau, len, prec)
end

function _acb_elliptic_p_series(res, z, zlen, tau, len, prec)
    ccall((:_acb_elliptic_p_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), res, z, zlen, tau, len, prec)
end

function acb_elliptic_p_series(res, z, tau, len, prec)
    ccall((:acb_elliptic_p_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint, Cint), res, z, tau, len, prec)
end

function acb_elliptic_zeta(res, z, tau, prec)
    ccall((:acb_elliptic_zeta, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, z, tau, prec)
end

function acb_elliptic_sigma(res, z, tau, prec)
    ccall((:acb_elliptic_sigma, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, z, tau, prec)
end

function acb_elliptic_roots(e1, e2, e3, tau, prec)
    ccall((:acb_elliptic_roots, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), e1, e2, e3, tau, prec)
end

function acb_elliptic_invariants(g2, g3, tau, prec)
    ccall((:acb_elliptic_invariants, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), g2, g3, tau, prec)
end

function acb_elliptic_inv_p(res, z, tau, prec)
    ccall((:acb_elliptic_inv_p, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, z, tau, prec)
end
# Julia wrapper for header: acb_hypgeom.h
# Automatically generated using Clang.jl


function acb_hypgeom_pfq_bound_factor(C, a, p, b, q, z, n)
    ccall((:acb_hypgeom_pfq_bound_factor, libarb), Cvoid, (mag_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint), C, a, p, b, q, z, n)
end

function acb_hypgeom_pfq_choose_n()
    ccall((:acb_hypgeom_pfq_choose_n, libarb), Cint, ())
end

function acb_hypgeom_pfq_sum_forward(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum_forward, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum_rs(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum_rs, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum_bs(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum_bs, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum_fme(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum_fme, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum_bs_invz(s, t, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_sum_bs_invz, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), s, t, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_sum_invz(s, t, a, p, b, q, z, zinv, n, prec)
    ccall((:acb_hypgeom_pfq_sum_invz, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, acb_t, Cint, Cint), s, t, a, p, b, q, z, zinv, n, prec)
end

function acb_hypgeom_pfq_direct(res, a, p, b, q, z, n, prec)
    ccall((:acb_hypgeom_pfq_direct, libarb), Cvoid, (acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), res, a, p, b, q, z, n, prec)
end

function acb_hypgeom_pfq_series_choose_n()
    ccall((:acb_hypgeom_pfq_series_choose_n, libarb), Cint, ())
end

function acb_hypgeom_pfq_series_sum_forward(s, t, a, p, b, q, z, regularized, n, len, prec)
    ccall((:acb_hypgeom_pfq_series_sum_forward, libarb), Cvoid, (acb_poly_t, acb_poly_t, Ptr{acb_poly_struct}, Cint, Ptr{acb_poly_struct}, Cint, acb_poly_t, Cint, Cint, Cint, Cint), s, t, a, p, b, q, z, regularized, n, len, prec)
end

function acb_hypgeom_pfq_series_sum_bs(s, t, a, p, b, q, z, regularized, n, len, prec)
    ccall((:acb_hypgeom_pfq_series_sum_bs, libarb), Cvoid, (acb_poly_t, acb_poly_t, Ptr{acb_poly_struct}, Cint, Ptr{acb_poly_struct}, Cint, acb_poly_t, Cint, Cint, Cint, Cint), s, t, a, p, b, q, z, regularized, n, len, prec)
end

function acb_hypgeom_pfq_series_sum_rs(s, t, a, p, b, q, z, regularized, n, len, prec)
    ccall((:acb_hypgeom_pfq_series_sum_rs, libarb), Cvoid, (acb_poly_t, acb_poly_t, Ptr{acb_poly_struct}, Cint, Ptr{acb_poly_struct}, Cint, acb_poly_t, Cint, Cint, Cint, Cint), s, t, a, p, b, q, z, regularized, n, len, prec)
end

function acb_hypgeom_pfq_series_sum(s, t, a, p, b, q, z, regularized, n, len, prec)
    ccall((:acb_hypgeom_pfq_series_sum, libarb), Cvoid, (acb_poly_t, acb_poly_t, Ptr{acb_poly_struct}, Cint, Ptr{acb_poly_struct}, Cint, acb_poly_t, Cint, Cint, Cint, Cint), s, t, a, p, b, q, z, regularized, n, len, prec)
end

function acb_hypgeom_pfq_series_direct(res, a, p, b, q, z, regularized, n, len, prec)
    ccall((:acb_hypgeom_pfq_series_direct, libarb), Cvoid, (acb_poly_t, Ptr{acb_poly_struct}, Cint, Ptr{acb_poly_struct}, Cint, acb_poly_t, Cint, Cint, Cint, Cint), res, a, p, b, q, z, regularized, n, len, prec)
end

function acb_hypgeom_pfq(res, a, p, b, q, z, regularized, prec)
    ccall((:acb_hypgeom_pfq, libarb), Cvoid, (acb_t, acb_srcptr, Cint, acb_srcptr, Cint, acb_t, Cint, Cint), res, a, p, b, q, z, regularized, prec)
end

function acb_hypgeom_u_asymp(res, a, b, z, n, prec)
    ccall((:acb_hypgeom_u_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, n, prec)
end

function acb_hypgeom_u_1f1_series(res, a, b, z, len, prec)
    ccall((:acb_hypgeom_u_1f1_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, a, b, z, len, prec)
end

function acb_hypgeom_u_1f1(res, a, b, z, prec)
    ccall((:acb_hypgeom_u_1f1, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), res, a, b, z, prec)
end

function acb_hypgeom_u(res, a, b, z, prec)
    ccall((:acb_hypgeom_u, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), res, a, b, z, prec)
end

function acb_hypgeom_u_use_asymp(z, prec)
    ccall((:acb_hypgeom_u_use_asymp, libarb), Cint, (acb_t, Cint), z, prec)
end

function acb_hypgeom_m_asymp(res, a, b, z, regularized, prec)
    ccall((:acb_hypgeom_m_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function acb_hypgeom_m_1f1(res, a, b, z, regularized, prec)
    ccall((:acb_hypgeom_m_1f1, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function acb_hypgeom_m(res, a, b, z, regularized, prec)
    ccall((:acb_hypgeom_m, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function acb_hypgeom_1f1(res, a, b, z, regularized, prec)
    ccall((:acb_hypgeom_1f1, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function acb_hypgeom_bessel_j_0f1(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_j_0f1, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_j_asymp(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_j_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_j(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_j, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_i_0f1(res, nu, z, scaled, prec)
    ccall((:acb_hypgeom_bessel_i_0f1, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, nu, z, scaled, prec)
end

function acb_hypgeom_bessel_i_asymp(res, nu, z, scaled, prec)
    ccall((:acb_hypgeom_bessel_i_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, nu, z, scaled, prec)
end

function acb_hypgeom_bessel_i(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_i, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_i_scaled(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_i_scaled, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_k_0f1(res, nu, z, scaled, prec)
    ccall((:acb_hypgeom_bessel_k_0f1, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, nu, z, scaled, prec)
end

function acb_hypgeom_bessel_k_0f1_series(res, n, z, scaled, len, prec)
    ccall((:acb_hypgeom_bessel_k_0f1_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint, Cint), res, n, z, scaled, len, prec)
end

function acb_hypgeom_bessel_k_asymp(res, nu, z, scaled, prec)
    ccall((:acb_hypgeom_bessel_k_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, nu, z, scaled, prec)
end

function acb_hypgeom_bessel_k(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_k, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_k_scaled(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_k_scaled, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_y(res, nu, z, prec)
    ccall((:acb_hypgeom_bessel_y, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, nu, z, prec)
end

function acb_hypgeom_bessel_jy(res1, res2, nu, z, prec)
    ccall((:acb_hypgeom_bessel_jy, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), res1, res2, nu, z, prec)
end

function acb_hypgeom_0f1_asymp(res, a, z, regularized, prec)
    ccall((:acb_hypgeom_0f1_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, a, z, regularized, prec)
end

function acb_hypgeom_0f1_direct(res, a, z, regularized, prec)
    ccall((:acb_hypgeom_0f1_direct, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, a, z, regularized, prec)
end

function acb_hypgeom_0f1(res, a, z, regularized, prec)
    ccall((:acb_hypgeom_0f1, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, a, z, regularized, prec)
end

function acb_hypgeom_airy_bound(ai, aip, bi, bip, z)
    ccall((:acb_hypgeom_airy_bound, libarb), Cvoid, (mag_t, mag_t, mag_t, mag_t, acb_t), ai, aip, bi, bip, z)
end

function acb_hypgeom_airy_asymp(ai, aip, bi, bip, z, n, prec)
    ccall((:acb_hypgeom_airy_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), ai, aip, bi, bip, z, n, prec)
end

function acb_hypgeom_airy_direct(ai, aip, bi, bip, z, n, prec)
    ccall((:acb_hypgeom_airy_direct, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), ai, aip, bi, bip, z, n, prec)
end

function acb_hypgeom_airy(ai, aip, bi, bip, z, prec)
    ccall((:acb_hypgeom_airy, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint), ai, aip, bi, bip, z, prec)
end

function acb_hypgeom_airy_jet(ai, bi, z, len, prec)
    ccall((:acb_hypgeom_airy_jet, libarb), Cvoid, (acb_ptr, acb_ptr, acb_t, Cint, Cint), ai, bi, z, len, prec)
end

function _acb_hypgeom_airy_series(ai, ai_prime, bi, bi_prime, z, zlen, len, prec)
    ccall((:_acb_hypgeom_airy_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), ai, ai_prime, bi, bi_prime, z, zlen, len, prec)
end

function acb_hypgeom_airy_series(ai, ai_prime, bi, bi_prime, z, len, prec)
    ccall((:acb_hypgeom_airy_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), ai, ai_prime, bi, bi_prime, z, len, prec)
end

function acb_hypgeom_coulomb(F, G, Hpos, Hneg, l, eta, z, prec)
    ccall((:acb_hypgeom_coulomb, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, Cint), F, G, Hpos, Hneg, l, eta, z, prec)
end

function acb_hypgeom_coulomb_jet(F, G, Hpos, Hneg, l, eta, z, len, prec)
    ccall((:acb_hypgeom_coulomb_jet, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_t, acb_t, acb_t, Cint, Cint), F, G, Hpos, Hneg, l, eta, z, len, prec)
end

function _acb_hypgeom_coulomb_series(F, G, Hpos, Hneg, l, eta, z, zlen, len, prec)
    ccall((:_acb_hypgeom_coulomb_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_t, acb_t, acb_srcptr, Cint, Cint, Cint), F, G, Hpos, Hneg, l, eta, z, zlen, len, prec)
end

function acb_hypgeom_coulomb_series(F, G, Hpos, Hneg, l, eta, z, len, prec)
    ccall((:acb_hypgeom_coulomb_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, acb_t, acb_t, acb_poly_t, Cint, Cint), F, G, Hpos, Hneg, l, eta, z, len, prec)
end

function acb_hypgeom_gamma_upper_asymp(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_upper_asymp, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function acb_hypgeom_gamma_upper_1f1a(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_upper_1f1a, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function acb_hypgeom_gamma_upper_1f1b(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_upper_1f1b, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function acb_hypgeom_gamma_upper_singular(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_upper_singular, libarb), Cvoid, (acb_t, Cint, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function acb_hypgeom_gamma_upper(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_upper, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function _acb_hypgeom_gamma_upper_series(g, s, h, hlen, regularized, n, prec)
    ccall((:_acb_hypgeom_gamma_upper_series, libarb), Cvoid, (acb_ptr, acb_t, acb_srcptr, Cint, Cint, Cint, Cint), g, s, h, hlen, regularized, n, prec)
end

function acb_hypgeom_gamma_upper_series(g, s, h, regularized, n, prec)
    ccall((:acb_hypgeom_gamma_upper_series, libarb), Cvoid, (acb_poly_t, acb_t, acb_poly_t, Cint, Cint, Cint), g, s, h, regularized, n, prec)
end

function acb_hypgeom_gamma_lower(res, s, z, modified, prec)
    ccall((:acb_hypgeom_gamma_lower, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res, s, z, modified, prec)
end

function _acb_hypgeom_gamma_lower_series(g, s, h, hlen, regularized, n, prec)
    ccall((:_acb_hypgeom_gamma_lower_series, libarb), Cvoid, (acb_ptr, acb_t, acb_srcptr, Cint, Cint, Cint, Cint), g, s, h, hlen, regularized, n, prec)
end

function acb_hypgeom_gamma_lower_series(g, s, h, regularized, n, prec)
    ccall((:acb_hypgeom_gamma_lower_series, libarb), Cvoid, (acb_poly_t, acb_t, acb_poly_t, Cint, Cint, Cint), g, s, h, regularized, n, prec)
end

function acb_hypgeom_beta_lower(res, a, b, z, regularized, prec)
    ccall((:acb_hypgeom_beta_lower, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function _acb_hypgeom_beta_lower_series(res, a, b, z, zlen, regularized, len, prec)
    ccall((:_acb_hypgeom_beta_lower_series, libarb), Cvoid, (acb_ptr, acb_t, acb_t, acb_srcptr, Cint, Cint, Cint, Cint), res, a, b, z, zlen, regularized, len, prec)
end

function acb_hypgeom_beta_lower_series(res, a, b, z, regularized, len, prec)
    ccall((:acb_hypgeom_beta_lower_series, libarb), Cvoid, (acb_poly_t, acb_t, acb_t, acb_poly_t, Cint, Cint, Cint), res, a, b, z, regularized, len, prec)
end

function acb_hypgeom_expint(res, s, z, prec)
    ccall((:acb_hypgeom_expint, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, s, z, prec)
end

function acb_hypgeom_erf_propagated_error(re, im, z)
    ccall((:acb_hypgeom_erf_propagated_error, libarb), Cvoid, (mag_t, mag_t, acb_t), re, im, z)
end

function acb_hypgeom_erf_1f1a(res, z, prec)
    ccall((:acb_hypgeom_erf_1f1a, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_erf_1f1b(res, z, prec)
    ccall((:acb_hypgeom_erf_1f1b, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_erf_asymp(res, z, complementary, prec, prec2)
    ccall((:acb_hypgeom_erf_asymp, libarb), Cvoid, (acb_t, acb_t, Cint, Cint, Cint), res, z, complementary, prec, prec2)
end

function acb_hypgeom_erf(res, z, prec)
    ccall((:acb_hypgeom_erf, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_erf_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_erf_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_erf_series(g, h, len, prec)
    ccall((:acb_hypgeom_erf_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_erfc(res, z, prec)
    ccall((:acb_hypgeom_erfc, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_erfc_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_erfc_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_erfc_series(g, h, len, prec)
    ccall((:acb_hypgeom_erfc_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_erfi(res, z, prec)
    ccall((:acb_hypgeom_erfi, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_erfi_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_erfi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_erfi_series(g, h, len, prec)
    ccall((:acb_hypgeom_erfi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_fresnel(res1, res2, z, normalized, prec)
    ccall((:acb_hypgeom_fresnel, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint, Cint), res1, res2, z, normalized, prec)
end

function _acb_hypgeom_fresnel_series(s, c, h, hlen, normalized, len, prec)
    ccall((:_acb_hypgeom_fresnel_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, normalized, len, prec)
end

function acb_hypgeom_fresnel_series(s, c, h, normalized, len, prec)
    ccall((:acb_hypgeom_fresnel_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint, Cint), s, c, h, normalized, len, prec)
end

function acb_hypgeom_ei_asymp(res, z, prec)
    ccall((:acb_hypgeom_ei_asymp, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_ei_2f2(res, z, prec)
    ccall((:acb_hypgeom_ei_2f2, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_ei(res, z, prec)
    ccall((:acb_hypgeom_ei, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_ei_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_ei_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_ei_series(g, h, len, prec)
    ccall((:acb_hypgeom_ei_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_si_asymp(res, z, prec)
    ccall((:acb_hypgeom_si_asymp, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_si_1f2(res, z, prec)
    ccall((:acb_hypgeom_si_1f2, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_si(res, z, prec)
    ccall((:acb_hypgeom_si, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_si_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_si_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_si_series(g, h, len, prec)
    ccall((:acb_hypgeom_si_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_ci_asymp(res, z, prec)
    ccall((:acb_hypgeom_ci_asymp, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_ci_2f3(res, z, prec)
    ccall((:acb_hypgeom_ci_2f3, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_ci(res, z, prec)
    ccall((:acb_hypgeom_ci, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_ci_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_ci_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_ci_series(g, h, len, prec)
    ccall((:acb_hypgeom_ci_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_shi(res, z, prec)
    ccall((:acb_hypgeom_shi, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_shi_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_shi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_shi_series(g, h, len, prec)
    ccall((:acb_hypgeom_shi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_chi_asymp(res, z, prec)
    ccall((:acb_hypgeom_chi_asymp, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_chi_2f3(res, z, prec)
    ccall((:acb_hypgeom_chi_2f3, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_chi(res, z, prec)
    ccall((:acb_hypgeom_chi, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function _acb_hypgeom_chi_series(g, h, hlen, len, prec)
    ccall((:_acb_hypgeom_chi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_hypgeom_chi_series(g, h, len, prec)
    ccall((:acb_hypgeom_chi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, len, prec)
end

function acb_hypgeom_li(res, z, offset, prec)
    ccall((:acb_hypgeom_li, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, offset, prec)
end

function _acb_hypgeom_li_series(g, h, hlen, offset, len, prec)
    ccall((:_acb_hypgeom_li_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), g, h, hlen, offset, len, prec)
end

function acb_hypgeom_li_series(g, h, offset, len, prec)
    ccall((:acb_hypgeom_li_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint, Cint), g, h, offset, len, prec)
end

function acb_hypgeom_2f1_continuation(res0, res1, a, b, c, z0, z1, f0, f1, prec)
    ccall((:acb_hypgeom_2f1_continuation, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, Cint), res0, res1, a, b, c, z0, z1, f0, f1, prec)
end

function acb_hypgeom_2f1_series_direct(res, a, b, c, z, regularized, len, prec)
    ccall((:acb_hypgeom_2f1_series_direct, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint, Cint), res, a, b, c, z, regularized, len, prec)
end

function acb_hypgeom_2f1_direct(res, a, b, c, z, regularized, prec)
    ccall((:acb_hypgeom_2f1_direct, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, c, z, regularized, prec)
end

function acb_hypgeom_2f1_transform(res, a, b, c, z, regularized, which, prec)
    ccall((:acb_hypgeom_2f1_transform, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint, Cint), res, a, b, c, z, regularized, which, prec)
end

function acb_hypgeom_2f1_transform_limit(res, a, b, c, z, regularized, which, prec)
    ccall((:acb_hypgeom_2f1_transform_limit, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint, Cint), res, a, b, c, z, regularized, which, prec)
end

function acb_hypgeom_2f1_corner(res, a, b, c, z, regularized, prec)
    ccall((:acb_hypgeom_2f1_corner, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, c, z, regularized, prec)
end

function acb_hypgeom_2f1_choose(z)
    ccall((:acb_hypgeom_2f1_choose, libarb), Cint, (acb_t,), z)
end

function acb_hypgeom_2f1(res, a, b, c, z, regularized, prec)
    ccall((:acb_hypgeom_2f1, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, a, b, c, z, regularized, prec)
end

function acb_hypgeom_legendre_p_uiui_rec(res, n, m, z, prec)
    ccall((:acb_hypgeom_legendre_p_uiui_rec, libarb), Cvoid, (acb_t, Cint, Cint, acb_t, Cint), res, n, m, z, prec)
end

function acb_hypgeom_legendre_p(res, n, m, z, type, prec)
    ccall((:acb_hypgeom_legendre_p, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, n, m, z, type, prec)
end

function acb_hypgeom_legendre_q(res, n, m, z, type, prec)
    ccall((:acb_hypgeom_legendre_q, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), res, n, m, z, type, prec)
end

function acb_hypgeom_jacobi_p(res, n, a, b, z, prec)
    ccall((:acb_hypgeom_jacobi_p, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint), res, n, a, b, z, prec)
end

function acb_hypgeom_gegenbauer_c(res, n, m, z, prec)
    ccall((:acb_hypgeom_gegenbauer_c, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), res, n, m, z, prec)
end

function acb_hypgeom_laguerre_l(res, n, m, z, prec)
    ccall((:acb_hypgeom_laguerre_l, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), res, n, m, z, prec)
end

function acb_hypgeom_hermite_h(res, n, z, prec)
    ccall((:acb_hypgeom_hermite_h, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, n, z, prec)
end

function acb_hypgeom_chebyshev_t(res, n, z, prec)
    ccall((:acb_hypgeom_chebyshev_t, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, n, z, prec)
end

function acb_hypgeom_chebyshev_u(res, n, z, prec)
    ccall((:acb_hypgeom_chebyshev_u, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, n, z, prec)
end

function acb_hypgeom_spherical_y(res, n, m, theta, phi, prec)
    ccall((:acb_hypgeom_spherical_y, libarb), Cvoid, (acb_t, Cint, Cint, acb_t, acb_t, Cint), res, n, m, theta, phi, prec)
end

function acb_hypgeom_dilog_bernoulli(res, z, prec)
    ccall((:acb_hypgeom_dilog_bernoulli, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_dilog_continuation(res, a, z, prec)
    ccall((:acb_hypgeom_dilog_continuation, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, a, z, prec)
end

function acb_hypgeom_dilog_bitburst(res, z0, z, prec)
    ccall((:acb_hypgeom_dilog_bitburst, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), res, z0, z, prec)
end

function acb_hypgeom_dilog_transform(res, z, algorithm, prec)
    ccall((:acb_hypgeom_dilog_transform, libarb), Cvoid, (acb_t, acb_t, Cint, Cint), res, z, algorithm, prec)
end

function acb_hypgeom_dilog_zero_taylor(res, z, prec)
    ccall((:acb_hypgeom_dilog_zero_taylor, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_dilog_zero(res, z, prec)
    ccall((:acb_hypgeom_dilog_zero, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end

function acb_hypgeom_dilog(res, z, prec)
    ccall((:acb_hypgeom_dilog, libarb), Cvoid, (acb_t, acb_t, Cint), res, z, prec)
end
# Julia wrapper for header: acb_mat.h
# Automatically generated using Clang.jl


function acb_mat_entry_ptr(mat, i, j)
    ccall((:acb_mat_entry_ptr, libarb), acb_ptr, (acb_mat_t, Cint, Cint), mat, i, j)
end

function acb_mat_init(mat, r, c)
    ccall((:acb_mat_init, libarb), Cvoid, (acb_mat_t, Cint, Cint), mat, r, c)
end

function acb_mat_clear(mat)
    ccall((:acb_mat_clear, libarb), Cvoid, (acb_mat_t,), mat)
end

function acb_mat_swap(mat1, mat2)
    ccall((:acb_mat_swap, libarb), Cvoid, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_window_init(window, mat, r1, c1, r2, c2)
    ccall((:acb_mat_window_init, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint, Cint, Cint), window, mat, r1, c1, r2, c2)
end

function acb_mat_window_clear(window)
    ccall((:acb_mat_window_clear, libarb), Cvoid, (acb_mat_t,), window)
end

function acb_mat_set(dest, src)
    ccall((:acb_mat_set, libarb), Cvoid, (acb_mat_t, acb_mat_t), dest, src)
end

function acb_mat_set_fmpz_mat(dest, src)
    ccall((:acb_mat_set_fmpz_mat, libarb), Cvoid, (acb_mat_t, Cint), dest, src)
end

function acb_mat_set_round_fmpz_mat(dest, src, prec)
    ccall((:acb_mat_set_round_fmpz_mat, libarb), Cvoid, (acb_mat_t, Cint, Cint), dest, src, prec)
end

function acb_mat_set_fmpq_mat(dest, src, prec)
    ccall((:acb_mat_set_fmpq_mat, libarb), Cvoid, (acb_mat_t, Cint, Cint), dest, src, prec)
end

function acb_mat_set_arb_mat(dest, src)
    ccall((:acb_mat_set_arb_mat, libarb), Cvoid, (acb_mat_t, arb_mat_t), dest, src)
end

function acb_mat_set_round_arb_mat(dest, src, prec)
    ccall((:acb_mat_set_round_arb_mat, libarb), Cvoid, (acb_mat_t, arb_mat_t, Cint), dest, src, prec)
end

function acb_mat_randtest(mat, state, prec, mag_bits)
    ccall((:acb_mat_randtest, libarb), Cvoid, (acb_mat_t, Cint, Cint, Cint), mat, state, prec, mag_bits)
end

function acb_mat_randtest_eig(A, state, E, prec)
    ccall((:acb_mat_randtest_eig, libarb), Cvoid, (acb_mat_t, Cint, acb_srcptr, Cint), A, state, E, prec)
end

function acb_mat_fprintd(file, mat, digits)
    ccall((:acb_mat_fprintd, libarb), Cvoid, (Ptr{Cint}, acb_mat_t, Cint), file, mat, digits)
end

function acb_mat_printd(mat, digits)
    ccall((:acb_mat_printd, libarb), Cvoid, (acb_mat_t, Cint), mat, digits)
end

function acb_mat_eq(mat1, mat2)
    ccall((:acb_mat_eq, libarb), Cint, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_ne(mat1, mat2)
    ccall((:acb_mat_ne, libarb), Cint, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_equal(mat1, mat2)
    ccall((:acb_mat_equal, libarb), Cint, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_overlaps(mat1, mat2)
    ccall((:acb_mat_overlaps, libarb), Cint, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_contains(mat1, mat2)
    ccall((:acb_mat_contains, libarb), Cint, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_contains_fmpq_mat(mat1, mat2)
    ccall((:acb_mat_contains_fmpq_mat, libarb), Cint, (acb_mat_t, Cint), mat1, mat2)
end

function acb_mat_contains_fmpz_mat(mat1, mat2)
    ccall((:acb_mat_contains_fmpz_mat, libarb), Cint, (acb_mat_t, Cint), mat1, mat2)
end

function acb_mat_is_real(mat)
    ccall((:acb_mat_is_real, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_empty(mat)
    ccall((:acb_mat_is_empty, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_square(mat)
    ccall((:acb_mat_is_square, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_exact(mat)
    ccall((:acb_mat_is_exact, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_zero(mat)
    ccall((:acb_mat_is_zero, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_finite(mat)
    ccall((:acb_mat_is_finite, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_triu(mat)
    ccall((:acb_mat_is_triu, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_tril(mat)
    ccall((:acb_mat_is_tril, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_is_diag(mat)
    ccall((:acb_mat_is_diag, libarb), Cint, (acb_mat_t,), mat)
end

function acb_mat_get_mid(B, A)
    ccall((:acb_mat_get_mid, libarb), Cvoid, (acb_mat_t, acb_mat_t), B, A)
end

function acb_mat_add_error_mag(mat, err)
    ccall((:acb_mat_add_error_mag, libarb), Cvoid, (acb_mat_t, mag_t), mat, err)
end

function acb_mat_zero(mat)
    ccall((:acb_mat_zero, libarb), Cvoid, (acb_mat_t,), mat)
end

function acb_mat_one(mat)
    ccall((:acb_mat_one, libarb), Cvoid, (acb_mat_t,), mat)
end

function acb_mat_ones(mat)
    ccall((:acb_mat_ones, libarb), Cvoid, (acb_mat_t,), mat)
end

function acb_mat_indeterminate(mat)
    ccall((:acb_mat_indeterminate, libarb), Cvoid, (acb_mat_t,), mat)
end

function acb_mat_dft(res, kind, prec)
    ccall((:acb_mat_dft, libarb), Cvoid, (acb_mat_t, Cint, Cint), res, kind, prec)
end

function acb_mat_transpose(mat1, mat2)
    ccall((:acb_mat_transpose, libarb), Cvoid, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_conjugate(mat1, mat2)
    ccall((:acb_mat_conjugate, libarb), Cvoid, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_conjugate_transpose(mat1, mat2)
    ccall((:acb_mat_conjugate_transpose, libarb), Cvoid, (acb_mat_t, acb_mat_t), mat1, mat2)
end

function acb_mat_bound_inf_norm(b, A)
    ccall((:acb_mat_bound_inf_norm, libarb), Cvoid, (mag_t, acb_mat_t), b, A)
end

function acb_mat_frobenius_norm(res, A, prec)
    ccall((:acb_mat_frobenius_norm, libarb), Cvoid, (arb_t, acb_mat_t, Cint), res, A, prec)
end

function acb_mat_bound_frobenius_norm(b, A)
    ccall((:acb_mat_bound_frobenius_norm, libarb), Cvoid, (mag_t, acb_mat_t), b, A)
end

function acb_mat_neg(dest, src)
    ccall((:acb_mat_neg, libarb), Cvoid, (acb_mat_t, acb_mat_t), dest, src)
end

function acb_mat_add(res, mat1, mat2, prec)
    ccall((:acb_mat_add, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_sub(res, mat1, mat2, prec)
    ccall((:acb_mat_sub, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_mul_classical(res, mat1, mat2, prec)
    ccall((:acb_mat_mul_classical, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_mul_threaded(res, mat1, mat2, prec)
    ccall((:acb_mat_mul_threaded, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_mul_reorder(res, mat1, mat2, prec)
    ccall((:acb_mat_mul_reorder, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_mul(res, mat1, mat2, prec)
    ccall((:acb_mat_mul, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_mul_entrywise(res, mat1, mat2, prec)
    ccall((:acb_mat_mul_entrywise, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), res, mat1, mat2, prec)
end

function acb_mat_sqr_classical(res, mat, prec)
    ccall((:acb_mat_sqr_classical, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint), res, mat, prec)
end

function acb_mat_sqr(res, mat, prec)
    ccall((:acb_mat_sqr, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint), res, mat, prec)
end

function acb_mat_pow_ui(B, A, exp, prec)
    ccall((:acb_mat_pow_ui, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, exp, prec)
end

function acb_mat_scalar_mul_2exp_si(B, A, c)
    ccall((:acb_mat_scalar_mul_2exp_si, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint), B, A, c)
end

function acb_mat_scalar_addmul_si(B, A, c, prec)
    ccall((:acb_mat_scalar_addmul_si, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_mul_si(B, A, c, prec)
    ccall((:acb_mat_scalar_mul_si, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_div_si(B, A, c, prec)
    ccall((:acb_mat_scalar_div_si, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_addmul_fmpz(B, A, c, prec)
    ccall((:acb_mat_scalar_addmul_fmpz, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_mul_fmpz(B, A, c, prec)
    ccall((:acb_mat_scalar_mul_fmpz, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_div_fmpz(B, A, c, prec)
    ccall((:acb_mat_scalar_div_fmpz, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), B, A, c, prec)
end

function acb_mat_scalar_addmul_acb(B, A, c, prec)
    ccall((:acb_mat_scalar_addmul_acb, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_t, Cint), B, A, c, prec)
end

function acb_mat_scalar_mul_acb(B, A, c, prec)
    ccall((:acb_mat_scalar_mul_acb, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_t, Cint), B, A, c, prec)
end

function acb_mat_scalar_div_acb(B, A, c, prec)
    ccall((:acb_mat_scalar_div_acb, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_t, Cint), B, A, c, prec)
end

function acb_mat_scalar_addmul_arb(B, A, c, prec)
    ccall((:acb_mat_scalar_addmul_arb, libarb), Cvoid, (acb_mat_t, acb_mat_t, arb_t, Cint), B, A, c, prec)
end

function acb_mat_scalar_mul_arb(B, A, c, prec)
    ccall((:acb_mat_scalar_mul_arb, libarb), Cvoid, (acb_mat_t, acb_mat_t, arb_t, Cint), B, A, c, prec)
end

function acb_mat_scalar_div_arb(B, A, c, prec)
    ccall((:acb_mat_scalar_div_arb, libarb), Cvoid, (acb_mat_t, acb_mat_t, arb_t, Cint), B, A, c, prec)
end

function acb_mat_swap_rows(mat, perm, r, s)
    ccall((:acb_mat_swap_rows, libarb), Cvoid, (acb_mat_t, Ptr{Cint}, Cint, Cint), mat, perm, r, s)
end

function acb_mat_find_pivot_partial()
    ccall((:acb_mat_find_pivot_partial, libarb), Cint, ())
end

function acb_mat_solve_tril_classical(X, L, B, unit, prec)
    ccall((:acb_mat_solve_tril_classical, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function acb_mat_solve_tril_recursive(X, L, B, unit, prec)
    ccall((:acb_mat_solve_tril_recursive, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function acb_mat_solve_tril(X, L, B, unit, prec)
    ccall((:acb_mat_solve_tril, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function acb_mat_solve_triu_classical(X, U, B, unit, prec)
    ccall((:acb_mat_solve_triu_classical, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function acb_mat_solve_triu_recursive(X, U, B, unit, prec)
    ccall((:acb_mat_solve_triu_recursive, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function acb_mat_solve_triu(X, U, B, unit, prec)
    ccall((:acb_mat_solve_triu, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function acb_mat_lu_classical(P, LU, A, prec)
    ccall((:acb_mat_lu_classical, libarb), Cint, (Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), P, LU, A, prec)
end

function acb_mat_lu_recursive(P, LU, A, prec)
    ccall((:acb_mat_lu_recursive, libarb), Cint, (Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), P, LU, A, prec)
end

function acb_mat_lu(P, LU, A, prec)
    ccall((:acb_mat_lu, libarb), Cint, (Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), P, LU, A, prec)
end

function acb_mat_solve_lu_precomp(X, perm, A, B, prec)
    ccall((:acb_mat_solve_lu_precomp, libarb), Cvoid, (acb_mat_t, Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), X, perm, A, B, prec)
end

function acb_mat_solve_lu(X, A, B, prec)
    ccall((:acb_mat_solve_lu, libarb), Cint, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), X, A, B, prec)
end

function acb_mat_solve(X, A, B, prec)
    ccall((:acb_mat_solve, libarb), Cint, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), X, A, B, prec)
end

function acb_mat_solve_precond(X, A, B, prec)
    ccall((:acb_mat_solve_precond, libarb), Cint, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), X, A, B, prec)
end

function acb_mat_approx_mul(C, A, B, prec)
    ccall((:acb_mat_approx_mul, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), C, A, B, prec)
end

function acb_mat_approx_solve_triu(X, U, B, unit, prec)
    ccall((:acb_mat_approx_solve_triu, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function acb_mat_approx_solve_tril(X, L, B, unit, prec)
    ccall((:acb_mat_approx_solve_tril, libarb), Cvoid, (acb_mat_t, acb_mat_t, acb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function acb_mat_approx_lu(P, LU, A, prec)
    ccall((:acb_mat_approx_lu, libarb), Cint, (Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), P, LU, A, prec)
end

function acb_mat_approx_solve_lu_precomp(X, perm, A, B, prec)
    ccall((:acb_mat_approx_solve_lu_precomp, libarb), Cvoid, (acb_mat_t, Ptr{Cint}, acb_mat_t, acb_mat_t, Cint), X, perm, A, B, prec)
end

function acb_mat_approx_solve(X, A, B, prec)
    ccall((:acb_mat_approx_solve, libarb), Cint, (acb_mat_t, acb_mat_t, acb_mat_t, Cint), X, A, B, prec)
end

function acb_mat_approx_inv(X, A, prec)
    ccall((:acb_mat_approx_inv, libarb), Cint, (acb_mat_t, acb_mat_t, Cint), X, A, prec)
end

function acb_mat_inv(X, A, prec)
    ccall((:acb_mat_inv, libarb), Cint, (acb_mat_t, acb_mat_t, Cint), X, A, prec)
end

function acb_mat_det_lu(det, A, prec)
    ccall((:acb_mat_det_lu, libarb), Cvoid, (acb_t, acb_mat_t, Cint), det, A, prec)
end

function acb_mat_det_precond(det, A, prec)
    ccall((:acb_mat_det_precond, libarb), Cvoid, (acb_t, acb_mat_t, Cint), det, A, prec)
end

function acb_mat_det(det, A, prec)
    ccall((:acb_mat_det, libarb), Cvoid, (acb_t, acb_mat_t, Cint), det, A, prec)
end

function acb_mat_approx_eig_qr(E, L, R, A, tol, maxiter, prec)
    ccall((:acb_mat_approx_eig_qr, libarb), Cint, (acb_ptr, acb_mat_t, acb_mat_t, acb_mat_t, mag_t, Cint, Cint), E, L, R, A, tol, maxiter, prec)
end

function acb_mat_eig_global_enclosure(eps, A, E, R, prec)
    ccall((:acb_mat_eig_global_enclosure, libarb), Cvoid, (mag_t, acb_mat_t, acb_srcptr, acb_mat_t, Cint), eps, A, E, R, prec)
end

function acb_mat_eig_enclosure_rump(lambda, J, X, A, lambda_approx, X_approx, prec)
    ccall((:acb_mat_eig_enclosure_rump, libarb), Cvoid, (acb_t, acb_mat_t, acb_mat_t, acb_mat_t, acb_t, acb_mat_t, Cint), lambda, J, X, A, lambda_approx, X_approx, prec)
end

function acb_mat_eig_simple_rump(E, L, R, A, E_approx, R_approx, prec)
    ccall((:acb_mat_eig_simple_rump, libarb), Cint, (acb_ptr, acb_mat_t, acb_mat_t, acb_mat_t, acb_srcptr, acb_mat_t, Cint), E, L, R, A, E_approx, R_approx, prec)
end

function acb_mat_eig_simple_vdhoeven_mourrain(E, L, R, A, E_approx, R_approx, prec)
    ccall((:acb_mat_eig_simple_vdhoeven_mourrain, libarb), Cint, (acb_ptr, acb_mat_t, acb_mat_t, acb_mat_t, acb_srcptr, acb_mat_t, Cint), E, L, R, A, E_approx, R_approx, prec)
end

function acb_mat_eig_simple(E, L, R, A, E_approx, R_approx, prec)
    ccall((:acb_mat_eig_simple, libarb), Cint, (acb_ptr, acb_mat_t, acb_mat_t, acb_mat_t, acb_srcptr, acb_mat_t, Cint), E, L, R, A, E_approx, R_approx, prec)
end

function acb_mat_eig_multiple_rump(E, A, E_approx, R_approx, prec)
    ccall((:acb_mat_eig_multiple_rump, libarb), Cint, (acb_ptr, acb_mat_t, acb_srcptr, acb_mat_t, Cint), E, A, E_approx, R_approx, prec)
end

function acb_mat_eig_multiple(E, A, E_approx, R_approx, prec)
    ccall((:acb_mat_eig_multiple, libarb), Cint, (acb_ptr, acb_mat_t, acb_srcptr, acb_mat_t, Cint), E, A, E_approx, R_approx, prec)
end

function acb_mat_exp_taylor_sum(S, A, N, prec)
    ccall((:acb_mat_exp_taylor_sum, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint, Cint), S, A, N, prec)
end

function acb_mat_exp(B, A, prec)
    ccall((:acb_mat_exp, libarb), Cvoid, (acb_mat_t, acb_mat_t, Cint), B, A, prec)
end

function _acb_mat_charpoly(poly, mat, prec)
    ccall((:_acb_mat_charpoly, libarb), Cvoid, (acb_ptr, acb_mat_t, Cint), poly, mat, prec)
end

function acb_mat_charpoly(poly, mat, prec)
    ccall((:acb_mat_charpoly, libarb), Cvoid, (acb_poly_t, acb_mat_t, Cint), poly, mat, prec)
end

function _acb_mat_companion(mat, poly, prec)
    ccall((:_acb_mat_companion, libarb), Cvoid, (acb_mat_t, acb_srcptr, Cint), mat, poly, prec)
end

function acb_mat_companion(mat, poly, prec)
    ccall((:acb_mat_companion, libarb), Cvoid, (acb_mat_t, acb_poly_t, Cint), mat, poly, prec)
end

function acb_mat_trace(trace, mat, prec)
    ccall((:acb_mat_trace, libarb), Cvoid, (acb_t, acb_mat_t, Cint), trace, mat, prec)
end

function _acb_mat_diag_prod(res, A, a, b, prec)
    ccall((:_acb_mat_diag_prod, libarb), Cvoid, (acb_t, acb_mat_t, Cint, Cint, Cint), res, A, a, b, prec)
end

function acb_mat_diag_prod(res, A, prec)
    ccall((:acb_mat_diag_prod, libarb), Cvoid, (acb_t, acb_mat_t, Cint), res, A, prec)
end

function acb_mat_allocated_bytes()
    ccall((:acb_mat_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: acb_modular.h
# Automatically generated using Clang.jl


function psl2z_init(g)
    ccall((:psl2z_init, libarb), Cvoid, (psl2z_t,), g)
end

function psl2z_clear(g)
    ccall((:psl2z_clear, libarb), Cvoid, (psl2z_t,), g)
end

function psl2z_swap(f, g)
    ccall((:psl2z_swap, libarb), Cvoid, (psl2z_t, psl2z_t), f, g)
end

function psl2z_set(h, g)
    ccall((:psl2z_set, libarb), Cvoid, (psl2z_t, psl2z_t), h, g)
end

function psl2z_one(g)
    ccall((:psl2z_one, libarb), Cvoid, (psl2z_t,), g)
end

function psl2z_fprint(file, g)
    ccall((:psl2z_fprint, libarb), Cvoid, (Ptr{Cint}, psl2z_t), file, g)
end

function psl2z_print(g)
    ccall((:psl2z_print, libarb), Cvoid, (psl2z_t,), g)
end

function psl2z_equal(f, g)
    ccall((:psl2z_equal, libarb), Cint, (psl2z_t, psl2z_t), f, g)
end

function psl2z_mul(h, f, g)
    ccall((:psl2z_mul, libarb), Cvoid, (psl2z_t, psl2z_t, psl2z_t), h, f, g)
end

function psl2z_inv(h, g)
    ccall((:psl2z_inv, libarb), Cvoid, (psl2z_t, psl2z_t), h, g)
end

function psl2z_is_one(g)
    ccall((:psl2z_is_one, libarb), Cint, (psl2z_t,), g)
end

function psl2z_is_correct(g)
    ccall((:psl2z_is_correct, libarb), Cint, (psl2z_t,), g)
end

function psl2z_randtest(g, state, bits)
    ccall((:psl2z_randtest, libarb), Cvoid, (psl2z_t, Cint, Cint), g, state, bits)
end

function acb_modular_transform(w, g, z, prec)
    ccall((:acb_modular_transform, libarb), Cvoid, (acb_t, psl2z_t, acb_t, Cint), w, g, z, prec)
end

function acb_modular_fundamental_domain_approx_d(g, x, y, one_minus_eps)
    ccall((:acb_modular_fundamental_domain_approx_d, libarb), Cvoid, (psl2z_t, Cdouble, Cdouble, Cdouble), g, x, y, one_minus_eps)
end

function acb_modular_fundamental_domain_approx_arf(g, xx, yy, one_minus_eps, prec)
    ccall((:acb_modular_fundamental_domain_approx_arf, libarb), Cvoid, (psl2z_t, arf_t, arf_t, arf_t, Cint), g, xx, yy, one_minus_eps, prec)
end

function acb_modular_fundamental_domain_approx(w, g, z, one_minus_eps, prec)
    ccall((:acb_modular_fundamental_domain_approx, libarb), Cvoid, (acb_t, psl2z_t, acb_t, arf_t, Cint), w, g, z, one_minus_eps, prec)
end

function acb_modular_is_in_fundamental_domain(z, tol, prec)
    ccall((:acb_modular_is_in_fundamental_domain, libarb), Cint, (acb_t, arf_t, Cint), z, tol, prec)
end

function acb_modular_addseq_theta(exponents, aindex, bindex, num)
    ccall((:acb_modular_addseq_theta, libarb), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), exponents, aindex, bindex, num)
end

function acb_modular_addseq_eta(exponents, aindex, bindex, num)
    ccall((:acb_modular_addseq_eta, libarb), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), exponents, aindex, bindex, num)
end

function acb_modular_fill_addseq(tab, len)
    ccall((:acb_modular_fill_addseq, libarb), Cvoid, (Ptr{Cint}, Cint), tab, len)
end

function acb_modular_theta_transform(R, S, C, g)
    ccall((:acb_modular_theta_transform, libarb), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, psl2z_t), R, S, C, g)
end

function acb_modular_theta_const_sum(theta2, theta3, theta4, q, prec)
    ccall((:acb_modular_theta_const_sum, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint), theta2, theta3, theta4, q, prec)
end

function acb_modular_theta_const_sum_basecase(theta2, theta3, theta4, q, N, prec)
    ccall((:acb_modular_theta_const_sum_basecase, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), theta2, theta3, theta4, q, N, prec)
end

function acb_modular_theta_const_sum_rs(theta2, theta3, theta4, q, N, prec)
    ccall((:acb_modular_theta_const_sum_rs, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, Cint, Cint), theta2, theta3, theta4, q, N, prec)
end

function acb_modular_theta_sum(theta1, theta2, theta3, theta4, w, w_is_unit, q, len, prec)
    ccall((:acb_modular_theta_sum, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_t, Cint, acb_t, Cint, Cint), theta1, theta2, theta3, theta4, w, w_is_unit, q, len, prec)
end

function acb_modular_theta_notransform(theta1, theta2, theta3, theta4, z, tau, prec)
    ccall((:acb_modular_theta_notransform, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, Cint), theta1, theta2, theta3, theta4, z, tau, prec)
end

function acb_modular_theta(theta1, theta2, theta3, theta4, z, tau, prec)
    ccall((:acb_modular_theta, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, acb_t, Cint), theta1, theta2, theta3, theta4, z, tau, prec)
end

function acb_modular_theta_jet_notransform(theta1, theta2, theta3, theta4, z, tau, len, prec)
    ccall((:acb_modular_theta_jet_notransform, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_t, acb_t, Cint, Cint), theta1, theta2, theta3, theta4, z, tau, len, prec)
end

function acb_modular_theta_jet(theta1, theta2, theta3, theta4, z, tau, len, prec)
    ccall((:acb_modular_theta_jet, libarb), Cvoid, (acb_ptr, acb_ptr, acb_ptr, acb_ptr, acb_t, acb_t, Cint, Cint), theta1, theta2, theta3, theta4, z, tau, len, prec)
end

function acb_modular_j(z, tau, prec)
    ccall((:acb_modular_j, libarb), Cvoid, (acb_t, acb_t, Cint), z, tau, prec)
end

function acb_modular_epsilon_arg(g)
    ccall((:acb_modular_epsilon_arg, libarb), Cint, (psl2z_t,), g)
end

function acb_modular_eta_sum(eta, q, prec)
    ccall((:acb_modular_eta_sum, libarb), Cvoid, (acb_t, acb_t, Cint), eta, q, prec)
end

function acb_modular_eta(z, tau, prec)
    ccall((:acb_modular_eta, libarb), Cvoid, (acb_t, acb_t, Cint), z, tau, prec)
end

function acb_modular_lambda(r, tau, prec)
    ccall((:acb_modular_lambda, libarb), Cvoid, (acb_t, acb_t, Cint), r, tau, prec)
end

function acb_modular_delta(r, tau, prec)
    ccall((:acb_modular_delta, libarb), Cvoid, (acb_t, acb_t, Cint), r, tau, prec)
end

function acb_modular_eisenstein(r, tau, len, prec)
    ccall((:acb_modular_eisenstein, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), r, tau, len, prec)
end

function acb_modular_elliptic_p(r, z, tau, prec)
    ccall((:acb_modular_elliptic_p, libarb), Cvoid, (acb_t, acb_t, acb_t, Cint), r, z, tau, prec)
end

function acb_modular_elliptic_p_zpx(r, z, tau, len, prec)
    ccall((:acb_modular_elliptic_p_zpx, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), r, z, tau, len, prec)
end

function acb_modular_elliptic_k(k, m, prec)
    ccall((:acb_modular_elliptic_k, libarb), Cvoid, (acb_t, acb_t, Cint), k, m, prec)
end

function acb_modular_elliptic_k_cpx(w, m, len, prec)
    ccall((:acb_modular_elliptic_k_cpx, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), w, m, len, prec)
end

function acb_modular_elliptic_e(res, m, prec)
    ccall((:acb_modular_elliptic_e, libarb), Cvoid, (acb_t, acb_t, Cint), res, m, prec)
end

function acb_modular_hilbert_class_poly(res, D)
    ccall((:acb_modular_hilbert_class_poly, libarb), Cvoid, (Cint, Cint), res, D)
end

function _acb_modular_mul(z, tmp1, tmp2, x, y, wprec, prec)
    ccall((:_acb_modular_mul, libarb), Cvoid, (acb_t, acb_t, acb_t, acb_t, acb_t, Cint, Cint), z, tmp1, tmp2, x, y, wprec, prec)
end
# Julia wrapper for header: acb_poly.h
# Automatically generated using Clang.jl


function acb_poly_init(poly)
    ccall((:acb_poly_init, libarb), Cvoid, (acb_poly_t,), poly)
end

function acb_poly_init2(poly, len)
    ccall((:acb_poly_init2, libarb), Cvoid, (acb_poly_t, Cint), poly, len)
end

function acb_poly_clear(poly)
    ccall((:acb_poly_clear, libarb), Cvoid, (acb_poly_t,), poly)
end

function acb_poly_fit_length(poly, len)
    ccall((:acb_poly_fit_length, libarb), Cvoid, (acb_poly_t, Cint), poly, len)
end

function _acb_poly_set_length(poly, len)
    ccall((:_acb_poly_set_length, libarb), Cvoid, (acb_poly_t, Cint), poly, len)
end

function _acb_poly_normalise(poly)
    ccall((:_acb_poly_normalise, libarb), Cvoid, (acb_poly_t,), poly)
end

function acb_poly_swap(poly1, poly2)
    ccall((:acb_poly_swap, libarb), Cvoid, (acb_poly_t, acb_poly_t), poly1, poly2)
end

function acb_poly_length()
    ccall((:acb_poly_length, libarb), Cint, ())
end

function acb_poly_degree()
    ccall((:acb_poly_degree, libarb), Cint, ())
end

function acb_poly_valuation()
    ccall((:acb_poly_valuation, libarb), Cint, ())
end

function acb_poly_is_zero(z)
    ccall((:acb_poly_is_zero, libarb), Cint, (acb_poly_t,), z)
end

function acb_poly_is_one(z)
    ccall((:acb_poly_is_one, libarb), Cint, (acb_poly_t,), z)
end

function acb_poly_is_x(z)
    ccall((:acb_poly_is_x, libarb), Cint, (acb_poly_t,), z)
end

function acb_poly_zero(poly)
    ccall((:acb_poly_zero, libarb), Cvoid, (acb_poly_t,), poly)
end

function acb_poly_one(poly)
    ccall((:acb_poly_one, libarb), Cvoid, (acb_poly_t,), poly)
end

function acb_poly_set_coeff_si(poly, n, x)
    ccall((:acb_poly_set_coeff_si, libarb), Cvoid, (acb_poly_t, Cint, Cint), poly, n, x)
end

function acb_poly_set_coeff_acb(poly, n, x)
    ccall((:acb_poly_set_coeff_acb, libarb), Cvoid, (acb_poly_t, Cint, acb_t), poly, n, x)
end

function acb_poly_get_coeff_acb(x, poly, n)
    ccall((:acb_poly_get_coeff_acb, libarb), Cvoid, (acb_t, acb_poly_t, Cint), x, poly, n)
end

function _acb_poly_shift_right(res, poly, len, n)
    ccall((:_acb_poly_shift_right, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, n)
end

function acb_poly_shift_right(res, poly, n)
    ccall((:acb_poly_shift_right, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, n)
end

function _acb_poly_shift_left(res, poly, len, n)
    ccall((:_acb_poly_shift_left, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, n)
end

function acb_poly_shift_left(res, poly, n)
    ccall((:acb_poly_shift_left, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, n)
end

function acb_poly_truncate(poly, newlen)
    ccall((:acb_poly_truncate, libarb), Cvoid, (acb_poly_t, Cint), poly, newlen)
end

function _acb_poly_majorant(res, vec, len, prec)
    ccall((:_acb_poly_majorant, libarb), Cvoid, (arb_ptr, acb_srcptr, Cint, Cint), res, vec, len, prec)
end

function acb_poly_majorant(res, poly, prec)
    ccall((:acb_poly_majorant, libarb), Cvoid, (arb_poly_t, acb_poly_t, Cint), res, poly, prec)
end

function acb_poly_fprintd(file, poly, digits)
    ccall((:acb_poly_fprintd, libarb), Cvoid, (Ptr{Cint}, acb_poly_t, Cint), file, poly, digits)
end

function acb_poly_printd(poly, digits)
    ccall((:acb_poly_printd, libarb), Cvoid, (acb_poly_t, Cint), poly, digits)
end

function _acb_poly_evaluate_horner(res, f, len, a, prec)
    ccall((:_acb_poly_evaluate_horner, libarb), Cvoid, (acb_t, acb_srcptr, Cint, acb_t, Cint), res, f, len, a, prec)
end

function acb_poly_evaluate_horner(res, f, a, prec)
    ccall((:acb_poly_evaluate_horner, libarb), Cvoid, (acb_t, acb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _acb_poly_evaluate_rectangular(y, poly, len, x, prec)
    ccall((:_acb_poly_evaluate_rectangular, libarb), Cvoid, (acb_t, acb_srcptr, Cint, acb_t, Cint), y, poly, len, x, prec)
end

function acb_poly_evaluate_rectangular(res, f, a, prec)
    ccall((:acb_poly_evaluate_rectangular, libarb), Cvoid, (acb_t, acb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _acb_poly_evaluate(res, f, len, a, prec)
    ccall((:_acb_poly_evaluate, libarb), Cvoid, (acb_t, acb_srcptr, Cint, acb_t, Cint), res, f, len, a, prec)
end

function acb_poly_evaluate(res, f, a, prec)
    ccall((:acb_poly_evaluate, libarb), Cvoid, (acb_t, acb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _acb_poly_evaluate2_horner(y, z, f, len, x, prec)
    ccall((:_acb_poly_evaluate2_horner, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function acb_poly_evaluate2_horner(y, z, f, x, prec)
    ccall((:acb_poly_evaluate2_horner, libarb), Cvoid, (acb_t, acb_t, acb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _acb_poly_evaluate2_rectangular(y, z, f, len, x, prec)
    ccall((:_acb_poly_evaluate2_rectangular, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function acb_poly_evaluate2_rectangular(y, z, f, x, prec)
    ccall((:acb_poly_evaluate2_rectangular, libarb), Cvoid, (acb_t, acb_t, acb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _acb_poly_evaluate2(y, z, f, len, x, prec)
    ccall((:_acb_poly_evaluate2, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function acb_poly_evaluate2(y, z, f, x, prec)
    ccall((:acb_poly_evaluate2, libarb), Cvoid, (acb_t, acb_t, acb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _acb_poly_derivative(res, poly, len, prec)
    ccall((:_acb_poly_derivative, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, prec)
end

function acb_poly_derivative(res, poly, prec)
    ccall((:acb_poly_derivative, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, prec)
end

function _acb_poly_integral(res, poly, len, prec)
    ccall((:_acb_poly_integral, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, prec)
end

function acb_poly_integral(res, poly, prec)
    ccall((:acb_poly_integral, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, prec)
end

function acb_poly_borel_transform(res, poly, prec)
    ccall((:acb_poly_borel_transform, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, prec)
end

function _acb_poly_borel_transform(res, poly, len, prec)
    ccall((:_acb_poly_borel_transform, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, prec)
end

function acb_poly_inv_borel_transform(res, poly, prec)
    ccall((:acb_poly_inv_borel_transform, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, prec)
end

function _acb_poly_inv_borel_transform(res, poly, len, prec)
    ccall((:_acb_poly_inv_borel_transform, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, prec)
end

function _acb_poly_binomial_transform_basecase(b, a, alen, len, prec)
    ccall((:_acb_poly_binomial_transform_basecase, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function acb_poly_binomial_transform_basecase(b, a, len, prec)
    ccall((:acb_poly_binomial_transform_basecase, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), b, a, len, prec)
end

function _acb_poly_binomial_transform_convolution(b, a, alen, len, prec)
    ccall((:_acb_poly_binomial_transform_convolution, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function acb_poly_binomial_transform_convolution(b, a, len, prec)
    ccall((:acb_poly_binomial_transform_convolution, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), b, a, len, prec)
end

function _acb_poly_binomial_transform(b, a, alen, len, prec)
    ccall((:_acb_poly_binomial_transform, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function acb_poly_binomial_transform(b, a, len, prec)
    ccall((:acb_poly_binomial_transform, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), b, a, len, prec)
end

function acb_poly_set(dest, src)
    ccall((:acb_poly_set, libarb), Cvoid, (acb_poly_t, acb_poly_t), dest, src)
end

function acb_poly_set_round(dest, src, prec)
    ccall((:acb_poly_set_round, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), dest, src, prec)
end

function acb_poly_set_trunc(res, poly, n)
    ccall((:acb_poly_set_trunc, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, n)
end

function acb_poly_set_trunc_round(res, poly, n, prec)
    ccall((:acb_poly_set_trunc_round, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, poly, n, prec)
end

function acb_poly_set_arb_poly(poly, re)
    ccall((:acb_poly_set_arb_poly, libarb), Cvoid, (acb_poly_t, arb_poly_t), poly, re)
end

function acb_poly_set2_arb_poly(poly, re, im)
    ccall((:acb_poly_set2_arb_poly, libarb), Cvoid, (acb_poly_t, arb_poly_t, arb_poly_t), poly, re, im)
end

function acb_poly_set_fmpq_poly(poly, re, prec)
    ccall((:acb_poly_set_fmpq_poly, libarb), Cvoid, (acb_poly_t, Cint, Cint), poly, re, prec)
end

function acb_poly_set2_fmpq_poly(poly, re, im, prec)
    ccall((:acb_poly_set2_fmpq_poly, libarb), Cvoid, (acb_poly_t, Cint, Cint, Cint), poly, re, im, prec)
end

function acb_poly_set_fmpz_poly(poly, src, prec)
    ccall((:acb_poly_set_fmpz_poly, libarb), Cvoid, (acb_poly_t, Cint, Cint), poly, src, prec)
end

function acb_poly_set2_fmpz_poly(poly, re, im, prec)
    ccall((:acb_poly_set2_fmpz_poly, libarb), Cvoid, (acb_poly_t, Cint, Cint, Cint), poly, re, im, prec)
end

function acb_poly_get_unique_fmpz_poly(res, src)
    ccall((:acb_poly_get_unique_fmpz_poly, libarb), Cint, (Cint, acb_poly_t), res, src)
end

function acb_poly_set_acb(poly, c)
    ccall((:acb_poly_set_acb, libarb), Cvoid, (acb_poly_t, acb_t), poly, c)
end

function acb_poly_set_si(poly, c)
    ccall((:acb_poly_set_si, libarb), Cvoid, (acb_poly_t, Cint), poly, c)
end

function acb_poly_randtest(poly, state, len, prec, mag_bits)
    ccall((:acb_poly_randtest, libarb), Cvoid, (acb_poly_t, Cint, Cint, Cint, Cint), poly, state, len, prec, mag_bits)
end

function acb_poly_equal(A, B)
    ccall((:acb_poly_equal, libarb), Cint, (acb_poly_t, acb_poly_t), A, B)
end

function acb_poly_contains_fmpz_poly(poly1, poly2)
    ccall((:acb_poly_contains_fmpz_poly, libarb), Cint, (acb_poly_t, Cint), poly1, poly2)
end

function acb_poly_contains_fmpq_poly(poly1, poly2)
    ccall((:acb_poly_contains_fmpq_poly, libarb), Cint, (acb_poly_t, Cint), poly1, poly2)
end

function _acb_poly_overlaps(poly1, len1, poly2, len2)
    ccall((:_acb_poly_overlaps, libarb), Cint, (acb_srcptr, Cint, acb_srcptr, Cint), poly1, len1, poly2, len2)
end

function acb_poly_overlaps(poly1, poly2)
    ccall((:acb_poly_overlaps, libarb), Cint, (acb_poly_t, acb_poly_t), poly1, poly2)
end

function acb_poly_contains(poly1, poly2)
    ccall((:acb_poly_contains, libarb), Cint, (acb_poly_t, acb_poly_t), poly1, poly2)
end

function acb_poly_is_real(poly)
    ccall((:acb_poly_is_real, libarb), Cint, (acb_poly_t,), poly)
end

function _acb_poly_add(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_add, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function acb_poly_add(res, poly1, poly2, prec)
    ccall((:acb_poly_add, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function acb_poly_add_si(res, poly, c, prec)
    ccall((:acb_poly_add_si, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, poly, c, prec)
end

function _acb_poly_sub(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_sub, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function acb_poly_sub(res, poly1, poly2, prec)
    ccall((:acb_poly_sub, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function acb_poly_add_series(res, poly1, poly2, len, prec)
    ccall((:acb_poly_add_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function acb_poly_sub_series(res, poly1, poly2, len, prec)
    ccall((:acb_poly_sub_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function acb_poly_neg(res, poly)
    ccall((:acb_poly_neg, libarb), Cvoid, (acb_poly_t, acb_poly_t), res, poly)
end

function acb_poly_scalar_mul_2exp_si(res, poly, c)
    ccall((:acb_poly_scalar_mul_2exp_si, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint), res, poly, c)
end

function acb_poly_scalar_mul(res, poly, c, prec)
    ccall((:acb_poly_scalar_mul, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), res, poly, c, prec)
end

function acb_poly_scalar_div(res, poly, c, prec)
    ccall((:acb_poly_scalar_div, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), res, poly, c, prec)
end

function acb_poly_mullow_classical(res, poly1, poly2, n, prec)
    ccall((:acb_poly_mullow_classical, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_mullow_classical(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_mullow_classical, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function _acb_poly_mullow_transpose(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_mullow_transpose, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_mullow_transpose(res, poly1, poly2, n, prec)
    ccall((:acb_poly_mullow_transpose, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_mullow_transpose_gauss(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_mullow_transpose_gauss, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_mullow_transpose_gauss(res, poly1, poly2, n, prec)
    ccall((:acb_poly_mullow_transpose_gauss, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_mullow(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_mullow, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_mullow(res, poly1, poly2, n, prec)
    ccall((:acb_poly_mullow, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_mul(C, A, lenA, B, lenB, prec)
    ccall((:_acb_poly_mul, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), C, A, lenA, B, lenB, prec)
end

function acb_poly_mul(res, poly1, poly2, prec)
    ccall((:acb_poly_mul, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function _acb_poly_mul_monic(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_mul_monic, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function _acb_poly_inv_series(Qinv, Q, Qlen, len, prec)
    ccall((:_acb_poly_inv_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, len, prec)
end

function acb_poly_inv_series(Qinv, Q, n, prec)
    ccall((:acb_poly_inv_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _acb_poly_div_series(Q, A, Alen, B, Blen, n, prec)
    ccall((:_acb_poly_div_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), Q, A, Alen, B, Blen, n, prec)
end

function acb_poly_div_series(Q, A, B, n, prec)
    ccall((:acb_poly_div_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), Q, A, B, n, prec)
end

function _acb_poly_reverse(res, poly, len, n)
    ccall((:_acb_poly_reverse, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), res, poly, len, n)
end

function _acb_poly_div(Q, A, lenA, B, lenB, prec)
    ccall((:_acb_poly_div, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), Q, A, lenA, B, lenB, prec)
end

function _acb_poly_divrem(Q, R, A, lenA, B, lenB, prec)
    ccall((:_acb_poly_divrem, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), Q, R, A, lenA, B, lenB, prec)
end

function _acb_poly_rem(R, A, lenA, B, lenB, prec)
    ccall((:_acb_poly_rem, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), R, A, lenA, B, lenB, prec)
end

function acb_poly_divrem(Q, R, A, B, prec)
    ccall((:acb_poly_divrem, libarb), Cint, (acb_poly_t, acb_poly_t, acb_poly_t, acb_poly_t, Cint), Q, R, A, B, prec)
end

function _acb_poly_div_root(Q, R, A, len, c, prec)
    ccall((:_acb_poly_div_root, libarb), Cvoid, (acb_ptr, acb_t, acb_srcptr, Cint, acb_t, Cint), Q, R, A, len, c, prec)
end

function _acb_poly_taylor_shift_horner(poly, c, n, prec)
    ccall((:_acb_poly_taylor_shift_horner, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), poly, c, n, prec)
end

function acb_poly_taylor_shift_horner(g, f, c, prec)
    ccall((:acb_poly_taylor_shift_horner, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), g, f, c, prec)
end

function _acb_poly_taylor_shift_divconquer(poly, c, n, prec)
    ccall((:_acb_poly_taylor_shift_divconquer, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), poly, c, n, prec)
end

function acb_poly_taylor_shift_divconquer(g, f, c, prec)
    ccall((:acb_poly_taylor_shift_divconquer, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), g, f, c, prec)
end

function _acb_poly_taylor_shift_convolution(poly, c, n, prec)
    ccall((:_acb_poly_taylor_shift_convolution, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), poly, c, n, prec)
end

function acb_poly_taylor_shift_convolution(g, f, c, prec)
    ccall((:acb_poly_taylor_shift_convolution, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), g, f, c, prec)
end

function _acb_poly_taylor_shift(poly, c, n, prec)
    ccall((:_acb_poly_taylor_shift, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint), poly, c, n, prec)
end

function acb_poly_taylor_shift(g, f, c, prec)
    ccall((:acb_poly_taylor_shift, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint), g, f, c, prec)
end

function _acb_poly_compose(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_compose, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function acb_poly_compose(res, poly1, poly2, prec)
    ccall((:acb_poly_compose, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function _acb_poly_compose_horner(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_compose_horner, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function acb_poly_compose_horner(res, poly1, poly2, prec)
    ccall((:acb_poly_compose_horner, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function _acb_poly_compose_divconquer(res, poly1, len1, poly2, len2, prec)
    ccall((:_acb_poly_compose_divconquer, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function acb_poly_compose_divconquer(res, poly1, poly2, prec)
    ccall((:acb_poly_compose_divconquer, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint), res, poly1, poly2, prec)
end

function _acb_poly_compose_series_horner(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_compose_series_horner, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_compose_series_horner(res, poly1, poly2, n, prec)
    ccall((:acb_poly_compose_series_horner, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_compose_series_brent_kung(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_compose_series_brent_kung, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_compose_series_brent_kung(res, poly1, poly2, n, prec)
    ccall((:acb_poly_compose_series_brent_kung, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_compose_series(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_acb_poly_compose_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function acb_poly_compose_series(res, poly1, poly2, n, prec)
    ccall((:acb_poly_compose_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _acb_poly_revert_series_lagrange(Qinv, Q, Qlen, n, prec)
    ccall((:_acb_poly_revert_series_lagrange, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function acb_poly_revert_series_lagrange(Qinv, Q, n, prec)
    ccall((:acb_poly_revert_series_lagrange, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _acb_poly_revert_series_newton(Qinv, Q, Qlen, n, prec)
    ccall((:_acb_poly_revert_series_newton, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function acb_poly_revert_series_newton(Qinv, Q, n, prec)
    ccall((:acb_poly_revert_series_newton, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _acb_poly_revert_series_lagrange_fast(Qinv, Q, Qlen, n, prec)
    ccall((:_acb_poly_revert_series_lagrange_fast, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function acb_poly_revert_series_lagrange_fast(Qinv, Q, n, prec)
    ccall((:acb_poly_revert_series_lagrange_fast, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _acb_poly_revert_series(Qinv, Q, Qlen, n, prec)
    ccall((:_acb_poly_revert_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function acb_poly_revert_series(Qinv, Q, n, prec)
    ccall((:acb_poly_revert_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _acb_poly_evaluate_vec_fast_precomp(vs, poly, plen, tree, len, prec)
    ccall((:_acb_poly_evaluate_vec_fast_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Ptr{acb_ptr}, Cint, Cint), vs, poly, plen, tree, len, prec)
end

function _acb_poly_evaluate_vec_fast(ys, poly, plen, xs, n, prec)
    ccall((:_acb_poly_evaluate_vec_fast, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), ys, poly, plen, xs, n, prec)
end

function acb_poly_evaluate_vec_fast(ys, poly, xs, n, prec)
    ccall((:acb_poly_evaluate_vec_fast, libarb), Cvoid, (acb_ptr, acb_poly_t, acb_srcptr, Cint, Cint), ys, poly, xs, n, prec)
end

function _acb_poly_evaluate_vec_iter(ys, poly, plen, xs, n, prec)
    ccall((:_acb_poly_evaluate_vec_iter, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint), ys, poly, plen, xs, n, prec)
end

function acb_poly_evaluate_vec_iter(ys, poly, xs, n, prec)
    ccall((:acb_poly_evaluate_vec_iter, libarb), Cvoid, (acb_ptr, acb_poly_t, acb_srcptr, Cint, Cint), ys, poly, xs, n, prec)
end

function _acb_poly_interpolate_barycentric(poly, xs, ys, n, prec)
    ccall((:_acb_poly_interpolate_barycentric, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function acb_poly_interpolate_barycentric(poly, xs, ys, n, prec)
    ccall((:acb_poly_interpolate_barycentric, libarb), Cvoid, (acb_poly_t, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _acb_poly_interpolation_weights(w, tree, len, prec)
    ccall((:_acb_poly_interpolation_weights, libarb), Cvoid, (acb_ptr, Ptr{acb_ptr}, Cint, Cint), w, tree, len, prec)
end

function _acb_poly_interpolate_fast_precomp(poly, ys, tree, weights, len, prec)
    ccall((:_acb_poly_interpolate_fast_precomp, libarb), Cvoid, (acb_ptr, acb_srcptr, Ptr{acb_ptr}, acb_srcptr, Cint, Cint), poly, ys, tree, weights, len, prec)
end

function _acb_poly_interpolate_fast(poly, xs, ys, len, prec)
    ccall((:_acb_poly_interpolate_fast, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, len, prec)
end

function acb_poly_interpolate_fast(poly, xs, ys, n, prec)
    ccall((:acb_poly_interpolate_fast, libarb), Cvoid, (acb_poly_t, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _acb_poly_interpolate_newton(poly, xs, ys, n, prec)
    ccall((:_acb_poly_interpolate_newton, libarb), Cvoid, (acb_ptr, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function acb_poly_interpolate_newton(poly, xs, ys, n, prec)
    ccall((:acb_poly_interpolate_newton, libarb), Cvoid, (acb_poly_t, acb_srcptr, acb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _acb_poly_product_roots(poly, xs, n, prec)
    ccall((:_acb_poly_product_roots, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), poly, xs, n, prec)
end

function acb_poly_product_roots(poly, xs, n, prec)
    ccall((:acb_poly_product_roots, libarb), Cvoid, (acb_poly_t, acb_srcptr, Cint, Cint), poly, xs, n, prec)
end

function _acb_poly_tree_alloc(len)
    ccall((:_acb_poly_tree_alloc, libarb), Ptr{acb_ptr}, (Cint,), len)
end

function _acb_poly_tree_free(tree, len)
    ccall((:_acb_poly_tree_free, libarb), Cvoid, (Ptr{acb_ptr}, Cint), tree, len)
end

function _acb_poly_tree_build(tree, roots, len, prec)
    ccall((:_acb_poly_tree_build, libarb), Cvoid, (Ptr{acb_ptr}, acb_srcptr, Cint, Cint), tree, roots, len, prec)
end

function _acb_poly_root_inclusion(r, m, poly, polyder, len, prec)
    ccall((:_acb_poly_root_inclusion, libarb), Cvoid, (acb_t, acb_t, acb_srcptr, acb_srcptr, Cint, Cint), r, m, poly, polyder, len, prec)
end

function _acb_poly_validate_roots()
    ccall((:_acb_poly_validate_roots, libarb), Cint, ())
end

function _acb_poly_refine_roots_durand_kerner(roots, poly, len, prec)
    ccall((:_acb_poly_refine_roots_durand_kerner, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint), roots, poly, len, prec)
end

function _acb_poly_find_roots()
    ccall((:_acb_poly_find_roots, libarb), Cint, ())
end

function acb_poly_find_roots()
    ccall((:acb_poly_find_roots, libarb), Cint, ())
end

function _acb_poly_root_bound_fujiwara(bound, poly, len)
    ccall((:_acb_poly_root_bound_fujiwara, libarb), Cvoid, (mag_t, acb_srcptr, Cint), bound, poly, len)
end

function acb_poly_root_bound_fujiwara(bound, poly)
    ccall((:acb_poly_root_bound_fujiwara, libarb), Cvoid, (mag_t, acb_poly_t), bound, poly)
end

function _acb_poly_validate_real_roots(roots, poly, len, prec)
    ccall((:_acb_poly_validate_real_roots, libarb), Cint, (acb_srcptr, acb_srcptr, Cint, Cint), roots, poly, len, prec)
end

function acb_poly_validate_real_roots(roots, poly, prec)
    ccall((:acb_poly_validate_real_roots, libarb), Cint, (acb_srcptr, acb_poly_t, Cint), roots, poly, prec)
end

function _acb_poly_pow_ui_trunc_binexp(res, f, flen, exp, len, prec)
    ccall((:_acb_poly_pow_ui_trunc_binexp, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), res, f, flen, exp, len, prec)
end

function acb_poly_pow_ui_trunc_binexp(res, poly, exp, len, prec)
    ccall((:acb_poly_pow_ui_trunc_binexp, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint, Cint), res, poly, exp, len, prec)
end

function _acb_poly_pow_ui(res, f, flen, exp, prec)
    ccall((:_acb_poly_pow_ui, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, f, flen, exp, prec)
end

function acb_poly_pow_ui(res, poly, exp, prec)
    ccall((:acb_poly_pow_ui, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, poly, exp, prec)
end

function _acb_poly_rsqrt_series(g, h, hlen, len, prec)
    ccall((:_acb_poly_rsqrt_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_poly_rsqrt_series(g, h, n, prec)
    ccall((:acb_poly_rsqrt_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_sqrt_series(g, h, hlen, len, prec)
    ccall((:_acb_poly_sqrt_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_poly_sqrt_series(g, h, n, prec)
    ccall((:acb_poly_sqrt_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_log_series(res, f, flen, n, prec)
    ccall((:_acb_poly_log_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function acb_poly_log_series(res, f, n, prec)
    ccall((:acb_poly_log_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_log1p_series(res, f, flen, n, prec)
    ccall((:_acb_poly_log1p_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function acb_poly_log1p_series(res, f, n, prec)
    ccall((:acb_poly_log1p_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_atan_series(res, f, flen, n, prec)
    ccall((:_acb_poly_atan_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function acb_poly_atan_series(res, f, n, prec)
    ccall((:acb_poly_atan_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_exp_series_basecase(f, h, hlen, n, prec)
    ccall((:_acb_poly_exp_series_basecase, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), f, h, hlen, n, prec)
end

function acb_poly_exp_series_basecase(f, h, n, prec)
    ccall((:acb_poly_exp_series_basecase, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), f, h, n, prec)
end

function _acb_poly_exp_series(f, h, hlen, n, prec)
    ccall((:_acb_poly_exp_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), f, h, hlen, n, prec)
end

function acb_poly_exp_series(f, h, n, prec)
    ccall((:acb_poly_exp_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), f, h, n, prec)
end

function _acb_poly_exp_pi_i_series(f, h, hlen, n, prec)
    ccall((:_acb_poly_exp_pi_i_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), f, h, hlen, n, prec)
end

function acb_poly_exp_pi_i_series(f, h, n, prec)
    ccall((:acb_poly_exp_pi_i_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), f, h, n, prec)
end

function _acb_poly_sinh_cosh_series_basecase(s, c, h, hlen, n, prec)
    ccall((:_acb_poly_sinh_cosh_series_basecase, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function acb_poly_sinh_cosh_series_basecase(s, c, h, n, prec)
    ccall((:acb_poly_sinh_cosh_series_basecase, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _acb_poly_sinh_cosh_series_exponential(s, c, h, hlen, n, prec)
    ccall((:_acb_poly_sinh_cosh_series_exponential, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function acb_poly_sinh_cosh_series_exponential(s, c, h, n, prec)
    ccall((:acb_poly_sinh_cosh_series_exponential, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _acb_poly_sinh_cosh_series(s, c, h, hlen, n, prec)
    ccall((:_acb_poly_sinh_cosh_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function acb_poly_sinh_cosh_series(s, c, h, n, prec)
    ccall((:acb_poly_sinh_cosh_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _acb_poly_sinh_series(s, h, hlen, n, prec)
    ccall((:_acb_poly_sinh_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), s, h, hlen, n, prec)
end

function acb_poly_sinh_series(s, h, n, prec)
    ccall((:acb_poly_sinh_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), s, h, n, prec)
end

function _acb_poly_cosh_series(c, h, hlen, n, prec)
    ccall((:_acb_poly_cosh_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), c, h, hlen, n, prec)
end

function acb_poly_cosh_series(c, h, n, prec)
    ccall((:acb_poly_cosh_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), c, h, n, prec)
end

function _acb_poly_sin_cos_series_basecase(s, c, h, hlen, n, prec, times_pi)
    ccall((:_acb_poly_sin_cos_series_basecase, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, n, prec, times_pi)
end

function acb_poly_sin_cos_series_basecase(s, c, h, n, prec, times_pi)
    ccall((:acb_poly_sin_cos_series_basecase, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint, Cint), s, c, h, n, prec, times_pi)
end

function _acb_poly_sin_cos_series_tangent(s, c, h, hlen, len, prec, times_pi)
    ccall((:_acb_poly_sin_cos_series_tangent, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, len, prec, times_pi)
end

function acb_poly_sin_cos_series_tangent(s, c, h, n, prec, times_pi)
    ccall((:acb_poly_sin_cos_series_tangent, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint, Cint), s, c, h, n, prec, times_pi)
end

function _acb_poly_sin_cos_series(s, c, h, hlen, len, prec)
    ccall((:_acb_poly_sin_cos_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), s, c, h, hlen, len, prec)
end

function acb_poly_sin_cos_series(s, c, h, n, prec)
    ccall((:acb_poly_sin_cos_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _acb_poly_sin_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_sin_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_sin_series(g, h, n, prec)
    ccall((:acb_poly_sin_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_cos_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_cos_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_cos_series(g, h, n, prec)
    ccall((:acb_poly_cos_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_sin_cos_pi_series(s, c, h, hlen, len, prec)
    ccall((:_acb_poly_sin_cos_pi_series, libarb), Cvoid, (acb_ptr, acb_ptr, acb_srcptr, Cint, Cint, Cint), s, c, h, hlen, len, prec)
end

function acb_poly_sin_cos_pi_series(s, c, h, n, prec)
    ccall((:acb_poly_sin_cos_pi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _acb_poly_sin_pi_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_sin_pi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_sin_pi_series(g, h, n, prec)
    ccall((:acb_poly_sin_pi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_cos_pi_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_cos_pi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_cos_pi_series(g, h, n, prec)
    ccall((:acb_poly_cos_pi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_cot_pi_series(g, h, hlen, len, prec)
    ccall((:_acb_poly_cot_pi_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_poly_cot_pi_series(res, f, len, prec)
    ccall((:acb_poly_cot_pi_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, len, prec)
end

function _acb_poly_tan_series(g, h, hlen, len, prec)
    ccall((:_acb_poly_tan_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function acb_poly_tan_series(g, h, n, prec)
    ccall((:acb_poly_tan_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_sinc_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_sinc_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_sinc_series(g, h, n, prec)
    ccall((:acb_poly_sinc_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function _acb_poly_lambertw_series(res, z, zlen, k, flags, len, prec)
    ccall((:_acb_poly_lambertw_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint, Cint), res, z, zlen, k, flags, len, prec)
end

function acb_poly_lambertw_series(res, z, k, flags, len, prec)
    ccall((:acb_poly_lambertw_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint, Cint, Cint), res, z, k, flags, len, prec)
end

function _acb_poly_gamma_series(res, h, hlen, len, prec)
    ccall((:_acb_poly_gamma_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function acb_poly_gamma_series(res, f, n, prec)
    ccall((:acb_poly_gamma_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_rgamma_series(res, h, hlen, len, prec)
    ccall((:_acb_poly_rgamma_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function acb_poly_rgamma_series(res, f, n, prec)
    ccall((:acb_poly_rgamma_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_lgamma_series(res, h, hlen, len, prec)
    ccall((:_acb_poly_lgamma_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function acb_poly_lgamma_series(res, f, n, prec)
    ccall((:acb_poly_lgamma_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_digamma_series(res, h, hlen, len, prec)
    ccall((:_acb_poly_digamma_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function acb_poly_digamma_series(res, f, n, prec)
    ccall((:acb_poly_digamma_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, f, n, prec)
end

function _acb_poly_rising_ui_series(res, f, flen, r, trunc, prec)
    ccall((:_acb_poly_rising_ui_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint, Cint), res, f, flen, r, trunc, prec)
end

function acb_poly_rising_ui_series(res, f, r, trunc, prec)
    ccall((:acb_poly_rising_ui_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint, Cint), res, f, r, trunc, prec)
end

function _acb_poly_pow_acb_series(h, f, flen, g, len, prec)
    ccall((:_acb_poly_pow_acb_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), h, f, flen, g, len, prec)
end

function acb_poly_pow_acb_series(h, f, g, len, prec)
    ccall((:acb_poly_pow_acb_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint, Cint), h, f, g, len, prec)
end

function _acb_poly_pow_series(h, f, flen, g, glen, len, prec)
    ccall((:_acb_poly_pow_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_srcptr, Cint, Cint, Cint), h, f, flen, g, glen, len, prec)
end

function acb_poly_pow_series(h, f, g, len, prec)
    ccall((:acb_poly_pow_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_poly_t, Cint, Cint), h, f, g, len, prec)
end

function _acb_poly_binomial_pow_acb_series(h, f, flen, g, len, prec)
    ccall((:_acb_poly_binomial_pow_acb_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), h, f, flen, g, len, prec)
end

function _acb_poly_acb_pow_cpx(w, a, b, len, prec)
    ccall((:_acb_poly_acb_pow_cpx, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), w, a, b, len, prec)
end

function _acb_poly_acb_invpow_cpx(res, N, c, trunc, prec)
    ccall((:_acb_poly_acb_invpow_cpx, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), res, N, c, trunc, prec)
end

function _acb_poly_mullow_cpx(res, src, len, c, trunc, prec)
    ccall((:_acb_poly_mullow_cpx, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), res, src, len, c, trunc, prec)
end

function _acb_poly_powsum_series_naive(z, s, a, q, n, len, prec)
    ccall((:_acb_poly_powsum_series_naive, libarb), Cvoid, (acb_ptr, acb_t, acb_t, acb_t, Cint, Cint, Cint), z, s, a, q, n, len, prec)
end

function _acb_poly_powsum_series_naive_threaded(z, s, a, q, n, len, prec)
    ccall((:_acb_poly_powsum_series_naive_threaded, libarb), Cvoid, (acb_ptr, acb_t, acb_t, acb_t, Cint, Cint, Cint), z, s, a, q, n, len, prec)
end

function _acb_poly_powsum_one_series_sieved(z, s, n, len, prec)
    ccall((:_acb_poly_powsum_one_series_sieved, libarb), Cvoid, (acb_ptr, acb_t, Cint, Cint, Cint), z, s, n, len, prec)
end

function _acb_poly_zeta_em_sum(z, s, a, deflate, N, M, d, prec)
    ccall((:_acb_poly_zeta_em_sum, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint, Cint, Cint, Cint), z, s, a, deflate, N, M, d, prec)
end

function _acb_poly_zeta_em_choose_param(bound, N, M, s, a, d, target, prec)
    ccall((:_acb_poly_zeta_em_choose_param, libarb), Cvoid, (mag_t, Ptr{Cint}, Ptr{Cint}, acb_t, acb_t, Cint, Cint, Cint), bound, N, M, s, a, d, target, prec)
end

function _acb_poly_zeta_em_bound1(bound, s, a, N, M, d, wp)
    ccall((:_acb_poly_zeta_em_bound1, libarb), Cvoid, (mag_t, acb_t, acb_t, Cint, Cint, Cint, Cint), bound, s, a, N, M, d, wp)
end

function _acb_poly_zeta_em_bound(vec, s, a, N, M, d, wp)
    ccall((:_acb_poly_zeta_em_bound, libarb), Cvoid, (arb_ptr, acb_t, acb_t, Cint, Cint, Cint, Cint), vec, s, a, N, M, d, wp)
end

function _acb_poly_zeta_em_tail_naive(sum, s, Na, Nasx, M, len, prec)
    ccall((:_acb_poly_zeta_em_tail_naive, libarb), Cvoid, (acb_ptr, acb_t, acb_t, acb_srcptr, Cint, Cint, Cint), sum, s, Na, Nasx, M, len, prec)
end

function _acb_poly_zeta_em_tail_bsplit(z, s, Na, Nasx, M, len, prec)
    ccall((:_acb_poly_zeta_em_tail_bsplit, libarb), Cvoid, (acb_ptr, acb_t, acb_t, acb_srcptr, Cint, Cint, Cint), z, s, Na, Nasx, M, len, prec)
end

function _acb_poly_zeta_cpx_series(z, s, a, deflate, d, prec)
    ccall((:_acb_poly_zeta_cpx_series, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint, Cint), z, s, a, deflate, d, prec)
end

function _acb_poly_zeta_series(res, h, hlen, a, deflate, len, prec)
    ccall((:_acb_poly_zeta_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint, Cint), res, h, hlen, a, deflate, len, prec)
end

function acb_poly_zeta_series(res, f, a, deflate, n, prec)
    ccall((:acb_poly_zeta_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint, Cint, Cint), res, f, a, deflate, n, prec)
end

function _acb_poly_polylog_cpx_zeta(w, s, z, len, prec)
    ccall((:_acb_poly_polylog_cpx_zeta, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), w, s, z, len, prec)
end

function _acb_poly_polylog_cpx_small(w, s, z, len, prec)
    ccall((:_acb_poly_polylog_cpx_small, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), w, s, z, len, prec)
end

function _acb_poly_polylog_cpx(w, s, z, len, prec)
    ccall((:_acb_poly_polylog_cpx, libarb), Cvoid, (acb_ptr, acb_t, acb_t, Cint, Cint), w, s, z, len, prec)
end

function _acb_poly_polylog_series(res, s, slen, z, len, prec)
    ccall((:_acb_poly_polylog_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), res, s, slen, z, len, prec)
end

function acb_poly_polylog_series(res, s, z, n, prec)
    ccall((:acb_poly_polylog_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint, Cint), res, s, z, n, prec)
end

function _acb_poly_agm1_series(res, z, zlen, len, prec)
    ccall((:_acb_poly_agm1_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, z, zlen, len, prec)
end

function acb_poly_agm1_series(res, z, n, prec)
    ccall((:acb_poly_agm1_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, z, n, prec)
end

function _acb_poly_elliptic_k_series(res, z, zlen, len, prec)
    ccall((:_acb_poly_elliptic_k_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), res, z, zlen, len, prec)
end

function acb_poly_elliptic_k_series(res, z, n, prec)
    ccall((:acb_poly_elliptic_k_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), res, z, n, prec)
end

function _acb_poly_elliptic_p_series(res, z, zlen, tau, len, prec)
    ccall((:_acb_poly_elliptic_p_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, acb_t, Cint, Cint), res, z, zlen, tau, len, prec)
end

function acb_poly_elliptic_p_series(res, z, tau, n, prec)
    ccall((:acb_poly_elliptic_p_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, acb_t, Cint, Cint), res, z, tau, n, prec)
end

function _acb_poly_erf_series(g, h, hlen, n, prec)
    ccall((:_acb_poly_erf_series, libarb), Cvoid, (acb_ptr, acb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function acb_poly_erf_series(g, h, n, prec)
    ccall((:acb_poly_erf_series, libarb), Cvoid, (acb_poly_t, acb_poly_t, Cint, Cint), g, h, n, prec)
end

function acb_poly_allocated_bytes()
    ccall((:acb_poly_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: arb.h
# Automatically generated using Clang.jl


function arb_test_multiplier()
    ccall((:arb_test_multiplier, libarb), Cdouble, ())
end

function arb_init(x)
    ccall((:arb_init, libarb), Cvoid, (arb_t,), x)
end

function arb_clear(x)
    ccall((:arb_clear, libarb), Cvoid, (arb_t,), x)
end

function _arb_vec_init(n)
    ccall((:_arb_vec_init, libarb), arb_ptr, (Cint,), n)
end

function _arb_vec_clear(v, n)
    ccall((:_arb_vec_clear, libarb), Cvoid, (arb_ptr, Cint), v, n)
end

function arb_mid_ptr(z)
    ccall((:arb_mid_ptr, libarb), arf_ptr, (arb_t,), z)
end

function arb_rad_ptr(z)
    ccall((:arb_rad_ptr, libarb), mag_ptr, (arb_t,), z)
end

function arb_is_exact(x)
    ccall((:arb_is_exact, libarb), Cint, (arb_t,), x)
end

function arb_equal(x, y)
    ccall((:arb_equal, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_equal_si(x, y)
    ccall((:arb_equal_si, libarb), Cint, (arb_t, Cint), x, y)
end

function arb_eq(x, y)
    ccall((:arb_eq, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_ne(x, y)
    ccall((:arb_ne, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_lt(x, y)
    ccall((:arb_lt, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_le(x, y)
    ccall((:arb_le, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_gt(x, y)
    ccall((:arb_gt, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_ge(x, y)
    ccall((:arb_ge, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_zero(x)
    ccall((:arb_zero, libarb), Cvoid, (arb_t,), x)
end

function arb_is_zero(x)
    ccall((:arb_is_zero, libarb), Cint, (arb_t,), x)
end

function arb_pos_inf(x)
    ccall((:arb_pos_inf, libarb), Cvoid, (arb_t,), x)
end

function arb_neg_inf(x)
    ccall((:arb_neg_inf, libarb), Cvoid, (arb_t,), x)
end

function arb_zero_pm_inf(x)
    ccall((:arb_zero_pm_inf, libarb), Cvoid, (arb_t,), x)
end

function arb_zero_pm_one(x)
    ccall((:arb_zero_pm_one, libarb), Cvoid, (arb_t,), x)
end

function arb_unit_interval(x)
    ccall((:arb_unit_interval, libarb), Cvoid, (arb_t,), x)
end

function arb_indeterminate(x)
    ccall((:arb_indeterminate, libarb), Cvoid, (arb_t,), x)
end

function arb_is_finite(x)
    ccall((:arb_is_finite, libarb), Cint, (arb_t,), x)
end

function arb_set(x, y)
    ccall((:arb_set, libarb), Cvoid, (arb_t, arb_t), x, y)
end

function arb_swap(x, y)
    ccall((:arb_swap, libarb), Cvoid, (arb_t, arb_t), x, y)
end

function arb_set_round(z, x, prec)
    ccall((:arb_set_round, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_trim(y, x)
    ccall((:arb_trim, libarb), Cvoid, (arb_t, arb_t), y, x)
end

function arb_neg(y, x)
    ccall((:arb_neg, libarb), Cvoid, (arb_t, arb_t), y, x)
end

function arb_neg_round(x, y, prec)
    ccall((:arb_neg_round, libarb), Cvoid, (arb_t, arb_t, Cint), x, y, prec)
end

function arb_abs(y, x)
    ccall((:arb_abs, libarb), Cvoid, (arb_t, arb_t), y, x)
end

function arb_sgn(res, x)
    ccall((:arb_sgn, libarb), Cvoid, (arb_t, arb_t), res, x)
end

function arb_sgn_nonzero(x)
    ccall((:arb_sgn_nonzero, libarb), Cint, (arb_t,), x)
end

function _arb_digits_round_inplace(s, shift, error, n, rnd)
    ccall((:_arb_digits_round_inplace, libarb), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cint), s, shift, error, n, rnd)
end

function arb_set_str(res, inp, prec)
    ccall((:arb_set_str, libarb), Cint, (arb_t, Cstring, Cint), res, inp, prec)
end

function arb_get_str(x, n, flags)
    ccall((:arb_get_str, libarb), Cstring, (arb_t, Cint, Cint), x, n, flags)
end

function arb_set_arf(x, y)
    ccall((:arb_set_arf, libarb), Cvoid, (arb_t, arf_t), x, y)
end

function arb_set_si(x, y)
    ccall((:arb_set_si, libarb), Cvoid, (arb_t, Cint), x, y)
end

function arb_set_ui(x, y)
    ccall((:arb_set_ui, libarb), Cvoid, (arb_t, Cint), x, y)
end

function arb_set_d(x, y)
    ccall((:arb_set_d, libarb), Cvoid, (arb_t, Cdouble), x, y)
end

function arb_set_fmpz(x, y)
    ccall((:arb_set_fmpz, libarb), Cvoid, (arb_t, Cint), x, y)
end

function arb_set_fmpz_2exp(x, y, exp)
    ccall((:arb_set_fmpz_2exp, libarb), Cvoid, (arb_t, Cint, Cint), x, y, exp)
end

function arb_set_round_fmpz_2exp(y, x, exp, prec)
    ccall((:arb_set_round_fmpz_2exp, libarb), Cvoid, (arb_t, Cint, Cint, Cint), y, x, exp, prec)
end

function arb_set_round_fmpz(y, x, prec)
    ccall((:arb_set_round_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), y, x, prec)
end

function arb_is_one(f)
    ccall((:arb_is_one, libarb), Cint, (arb_t,), f)
end

function arb_one(f)
    ccall((:arb_one, libarb), Cvoid, (arb_t,), f)
end

function arb_fprint(file, x)
    ccall((:arb_fprint, libarb), Cvoid, (Ptr{Cint}, arb_t), file, x)
end

function arb_fprintd(file, x, digits)
    ccall((:arb_fprintd, libarb), Cvoid, (Ptr{Cint}, arb_t, Cint), file, x, digits)
end

function arb_fprintn(file, x, digits, flags)
    ccall((:arb_fprintn, libarb), Cvoid, (Ptr{Cint}, arb_t, Cint, Cint), file, x, digits, flags)
end

function arb_print(x)
    ccall((:arb_print, libarb), Cvoid, (arb_t,), x)
end

function arb_printd(x, digits)
    ccall((:arb_printd, libarb), Cvoid, (arb_t, Cint), x, digits)
end

function arb_printn(x, digits, flags)
    ccall((:arb_printn, libarb), Cvoid, (arb_t, Cint, Cint), x, digits, flags)
end

function arb_mul_2exp_si(y, x, e)
    ccall((:arb_mul_2exp_si, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, e)
end

function arb_mul_2exp_fmpz(y, x, e)
    ccall((:arb_mul_2exp_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, e)
end

function arb_is_int(x)
    ccall((:arb_is_int, libarb), Cint, (arb_t,), x)
end

function arb_is_int_2exp_si(x, e)
    ccall((:arb_is_int_2exp_si, libarb), Cint, (arb_t, Cint), x, e)
end

function arb_contains_zero(x)
    ccall((:arb_contains_zero, libarb), Cint, (arb_t,), x)
end

function arb_is_nonzero(x)
    ccall((:arb_is_nonzero, libarb), Cint, (arb_t,), x)
end

function arb_is_positive(x)
    ccall((:arb_is_positive, libarb), Cint, (arb_t,), x)
end

function arb_is_nonnegative(x)
    ccall((:arb_is_nonnegative, libarb), Cint, (arb_t,), x)
end

function arb_is_negative(x)
    ccall((:arb_is_negative, libarb), Cint, (arb_t,), x)
end

function arb_is_nonpositive(x)
    ccall((:arb_is_nonpositive, libarb), Cint, (arb_t,), x)
end

function arb_contains_negative(x)
    ccall((:arb_contains_negative, libarb), Cint, (arb_t,), x)
end

function arb_contains_nonpositive(x)
    ccall((:arb_contains_nonpositive, libarb), Cint, (arb_t,), x)
end

function arb_contains_positive(x)
    ccall((:arb_contains_positive, libarb), Cint, (arb_t,), x)
end

function arb_contains_nonnegative(x)
    ccall((:arb_contains_nonnegative, libarb), Cint, (arb_t,), x)
end

function arb_get_mag_lower(z, x)
    ccall((:arb_get_mag_lower, libarb), Cvoid, (mag_t, arb_t), z, x)
end

function arb_get_mag_lower_nonnegative(z, x)
    ccall((:arb_get_mag_lower_nonnegative, libarb), Cvoid, (mag_t, arb_t), z, x)
end

function arb_get_mag(z, x)
    ccall((:arb_get_mag, libarb), Cvoid, (mag_t, arb_t), z, x)
end

function arb_get_mid_arb(z, x)
    ccall((:arb_get_mid_arb, libarb), Cvoid, (arb_t, arb_t), z, x)
end

function arb_get_rad_arb(z, x)
    ccall((:arb_get_rad_arb, libarb), Cvoid, (arb_t, arb_t), z, x)
end

function arb_get_abs_ubound_arf(u, x, prec)
    ccall((:arb_get_abs_ubound_arf, libarb), Cvoid, (arf_t, arb_t, Cint), u, x, prec)
end

function arb_get_abs_lbound_arf(u, x, prec)
    ccall((:arb_get_abs_lbound_arf, libarb), Cvoid, (arf_t, arb_t, Cint), u, x, prec)
end

function arb_get_ubound_arf(u, x, prec)
    ccall((:arb_get_ubound_arf, libarb), Cvoid, (arf_t, arb_t, Clong), u, x, prec)
end

function arb_get_lbound_arf(u, x, prec)
    ccall((:arb_get_lbound_arf, libarb), Cvoid, (arf_t, arb_t, Clong), u, x, prec)
end

function arb_nonnegative_part(res, x)
    ccall((:arb_nonnegative_part, libarb), Cvoid, (arb_t, arb_t), res, x)
end

function arb_rel_error_bits()
    ccall((:arb_rel_error_bits, libarb), Cint, ())
end

function arb_rel_accuracy_bits()
    ccall((:arb_rel_accuracy_bits, libarb), Cint, ())
end

function arb_rel_one_accuracy_bits()
    ccall((:arb_rel_one_accuracy_bits, libarb), Cint, ())
end

function arb_bits()
    ccall((:arb_bits, libarb), Cint, ())
end

function arb_randtest_exact(x, state, prec, mag_bits)
    ccall((:arb_randtest_exact, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, state, prec, mag_bits)
end

function arb_randtest_wide(x, state, prec, mag_bits)
    ccall((:arb_randtest_wide, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, state, prec, mag_bits)
end

function arb_randtest_precise(x, state, prec, mag_bits)
    ccall((:arb_randtest_precise, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, state, prec, mag_bits)
end

function arb_randtest(x, state, prec, mag_bits)
    ccall((:arb_randtest, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, state, prec, mag_bits)
end

function arb_randtest_special(x, state, prec, mag_bits)
    ccall((:arb_randtest_special, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, state, prec, mag_bits)
end

function arb_add_error_arf(x, err)
    ccall((:arb_add_error_arf, libarb), Cvoid, (arb_t, arf_t), x, err)
end

function arb_add_error_2exp_si(x, err)
    ccall((:arb_add_error_2exp_si, libarb), Cvoid, (arb_t, Cint), x, err)
end

function arb_add_error_2exp_fmpz(x, err)
    ccall((:arb_add_error_2exp_fmpz, libarb), Cvoid, (arb_t, Cint), x, err)
end

function arb_add_error(x, error)
    ccall((:arb_add_error, libarb), Cvoid, (arb_t, arb_t), x, error)
end

function arb_add_error_mag(x, err)
    ccall((:arb_add_error_mag, libarb), Cvoid, (arb_t, mag_t), x, err)
end

function arb_contains_arf(x, y)
    ccall((:arb_contains_arf, libarb), Cint, (arb_t, arf_t), x, y)
end

function arb_contains_fmpq(x, y)
    ccall((:arb_contains_fmpq, libarb), Cint, (arb_t, Cint), x, y)
end

function arb_contains_fmpz(x, y)
    ccall((:arb_contains_fmpz, libarb), Cint, (arb_t, Cint), x, y)
end

function arb_contains_si(x, y)
    ccall((:arb_contains_si, libarb), Cint, (arb_t, Cint), x, y)
end

function arb_contains_mpfr(x, y)
    ccall((:arb_contains_mpfr, libarb), Cint, (arb_t, Cint), x, y)
end

function arb_overlaps(x, y)
    ccall((:arb_overlaps, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_contains(x, y)
    ccall((:arb_contains, libarb), Cint, (arb_t, arb_t), x, y)
end

function arb_contains_int(x)
    ccall((:arb_contains_int, libarb), Cint, (arb_t,), x)
end

function arb_get_interval_fmpz_2exp(a, b, exp, x)
    ccall((:arb_get_interval_fmpz_2exp, libarb), Cvoid, (Cint, Cint, Cint, arb_t), a, b, exp, x)
end

function arb_get_unique_fmpz(z, x)
    ccall((:arb_get_unique_fmpz, libarb), Cint, (Cint, arb_t), z, x)
end

function arb_get_fmpz_mid_rad_10exp(mid, rad, exp, x, n)
    ccall((:arb_get_fmpz_mid_rad_10exp, libarb), Cvoid, (Cint, Cint, Cint, arb_t, Cint), mid, rad, exp, x, n)
end

function arb_floor(z, x, prec)
    ccall((:arb_floor, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_ceil(z, x, prec)
    ccall((:arb_ceil, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_set_interval_arf(x, a, b, prec)
    ccall((:arb_set_interval_arf, libarb), Cvoid, (arb_t, arf_t, arf_t, Cint), x, a, b, prec)
end

function arb_set_interval_mpfr(x, a, b, prec)
    ccall((:arb_set_interval_mpfr, libarb), Cvoid, (arb_t, Cint, Cint, Cint), x, a, b, prec)
end

function arb_get_interval_arf(a, b, x, prec)
    ccall((:arb_get_interval_arf, libarb), Cvoid, (arf_t, arf_t, arb_t, Cint), a, b, x, prec)
end

function arb_get_interval_mpfr(a, b, x)
    ccall((:arb_get_interval_mpfr, libarb), Cvoid, (Cint, Cint, arb_t), a, b, x)
end

function arb_set_interval_mag(res, a, b, prec)
    ccall((:arb_set_interval_mag, libarb), Cvoid, (arb_t, mag_t, mag_t, Cint), res, a, b, prec)
end

function arb_set_interval_neg_pos_mag(res, a, b, prec)
    ccall((:arb_set_interval_neg_pos_mag, libarb), Cvoid, (arb_t, mag_t, mag_t, Cint), res, a, b, prec)
end

function arb_union(z, x, y, prec)
    ccall((:arb_union, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_intersection(z, x, y, prec)
    ccall((:arb_intersection, libarb), Cint, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_get_rand_fmpq(q, state, x, bits)
    ccall((:arb_get_rand_fmpq, libarb), Cvoid, (Cint, Cint, arb_t, Cint), q, state, x, bits)
end

function arb_min(z, x, y, prec)
    ccall((:arb_min, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_max(z, x, y, prec)
    ccall((:arb_max, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_can_round_arf(x, prec, rnd)
    ccall((:arb_can_round_arf, libarb), Cint, (arb_t, Cint, Cint), x, prec, rnd)
end

function arb_can_round_mpfr(x, prec, rnd)
    ccall((:arb_can_round_mpfr, libarb), Cint, (arb_t, Cint, Cint), x, prec, rnd)
end

function arb_add(z, x, y, prec)
    ccall((:arb_add, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_add_arf(z, x, y, prec)
    ccall((:arb_add_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_add_ui(z, x, y, prec)
    ccall((:arb_add_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_add_si(z, x, y, prec)
    ccall((:arb_add_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_add_fmpz(z, x, y, prec)
    ccall((:arb_add_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_add_fmpz_2exp(z, x, man, exp, prec)
    ccall((:arb_add_fmpz_2exp, libarb), Cvoid, (arb_t, arb_t, Cint, Cint, Cint), z, x, man, exp, prec)
end

function arb_sub(z, x, y, prec)
    ccall((:arb_sub, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_sub_arf(z, x, y, prec)
    ccall((:arb_sub_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_sub_ui(z, x, y, prec)
    ccall((:arb_sub_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_sub_si(z, x, y, prec)
    ccall((:arb_sub_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_sub_fmpz(z, x, y, prec)
    ccall((:arb_sub_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_mul(z, x, y, prec)
    ccall((:arb_mul, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_mul_arf(z, x, y, prec)
    ccall((:arb_mul_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_mul_si(z, x, y, prec)
    ccall((:arb_mul_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_mul_ui(z, x, y, prec)
    ccall((:arb_mul_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_mul_fmpz(z, x, y, prec)
    ccall((:arb_mul_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_addmul(z, x, y, prec)
    ccall((:arb_addmul, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_addmul_arf(z, x, y, prec)
    ccall((:arb_addmul_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_addmul_si(z, x, y, prec)
    ccall((:arb_addmul_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_addmul_ui(z, x, y, prec)
    ccall((:arb_addmul_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_addmul_fmpz(z, x, y, prec)
    ccall((:arb_addmul_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_submul(z, x, y, prec)
    ccall((:arb_submul, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_submul_arf(z, x, y, prec)
    ccall((:arb_submul_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_submul_si(z, x, y, prec)
    ccall((:arb_submul_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_submul_ui(z, x, y, prec)
    ccall((:arb_submul_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_submul_fmpz(z, x, y, prec)
    ccall((:arb_submul_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_dot_simple(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:arb_dot_simple, libarb), Cvoid, (arb_t, arb_t, Cint, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function arb_dot_precise(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:arb_dot_precise, libarb), Cvoid, (arb_t, arb_t, Cint, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function arb_dot(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:arb_dot, libarb), Cvoid, (arb_t, arb_t, Cint, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function arb_approx_dot(res, initial, subtract, x, xstep, y, ystep, len, prec)
    ccall((:arb_approx_dot, libarb), Cvoid, (arb_t, arb_t, Cint, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, initial, subtract, x, xstep, y, ystep, len, prec)
end

function arb_div(z, x, y, prec)
    ccall((:arb_div, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_div_arf(z, x, y, prec)
    ccall((:arb_div_arf, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), z, x, y, prec)
end

function arb_div_si(z, x, y, prec)
    ccall((:arb_div_si, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_div_ui(z, x, y, prec)
    ccall((:arb_div_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_div_fmpz(z, x, y, prec)
    ccall((:arb_div_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, y, prec)
end

function arb_fmpz_div_fmpz(z, x, y, prec)
    ccall((:arb_fmpz_div_fmpz, libarb), Cvoid, (arb_t, Cint, Cint, Cint), z, x, y, prec)
end

function arb_ui_div(z, x, y, prec)
    ccall((:arb_ui_div, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), z, x, y, prec)
end

function arb_inv(y, x, prec)
    ccall((:arb_inv, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_set_fmpq(y, x, prec)
    ccall((:arb_set_fmpq, libarb), Cvoid, (arb_t, Cint, Cint), y, x, prec)
end

function arb_sqrt(z, x, prec)
    ccall((:arb_sqrt, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_sqrt_arf(z, x, prec)
    ccall((:arb_sqrt_arf, libarb), Cvoid, (arb_t, arf_t, Cint), z, x, prec)
end

function arb_sqrt_fmpz(z, x, prec)
    ccall((:arb_sqrt_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_sqrt_ui(z, x, prec)
    ccall((:arb_sqrt_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_sqrtpos(z, x, prec)
    ccall((:arb_sqrtpos, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_hypot(z, x, y, prec)
    ccall((:arb_hypot, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_rsqrt(z, x, prec)
    ccall((:arb_rsqrt, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_rsqrt_ui(z, x, prec)
    ccall((:arb_rsqrt_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_sqrt1pm1(r, z, prec)
    ccall((:arb_sqrt1pm1, libarb), Cvoid, (arb_t, arb_t, Cint), r, z, prec)
end

function arb_pow_fmpz_binexp(y, b, e, prec)
    ccall((:arb_pow_fmpz_binexp, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, b, e, prec)
end

function arb_pow_fmpz(y, b, e, prec)
    ccall((:arb_pow_fmpz, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, b, e, prec)
end

function arb_pow_ui(y, b, e, prec)
    ccall((:arb_pow_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, b, e, prec)
end

function arb_ui_pow_ui(y, b, e, prec)
    ccall((:arb_ui_pow_ui, libarb), Cvoid, (arb_t, Cint, Cint, Cint), y, b, e, prec)
end

function arb_si_pow_ui(y, b, e, prec)
    ccall((:arb_si_pow_ui, libarb), Cvoid, (arb_t, Cint, Cint, Cint), y, b, e, prec)
end

function arb_pow_fmpq(y, x, a, prec)
    ccall((:arb_pow_fmpq, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, x, a, prec)
end

function arb_div_2expm1_ui(z, x, n, prec)
    ccall((:arb_div_2expm1_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, n, prec)
end

function arb_pow(z, x, y, prec)
    ccall((:arb_pow, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_root_ui(z, x, k, prec)
    ccall((:arb_root_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, k, prec)
end

function arb_root(z, x, k, prec)
    ccall((:arb_root, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, k, prec)
end

function arb_log(z, x, prec)
    ccall((:arb_log, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_log_arf(z, x, prec)
    ccall((:arb_log_arf, libarb), Cvoid, (arb_t, arf_t, Cint), z, x, prec)
end

function arb_log_ui(z, x, prec)
    ccall((:arb_log_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_log_fmpz(z, x, prec)
    ccall((:arb_log_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_log1p(r, z, prec)
    ccall((:arb_log1p, libarb), Cvoid, (arb_t, arb_t, Cint), r, z, prec)
end

function arb_log_base_ui(res, x, b, prec)
    ccall((:arb_log_base_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), res, x, b, prec)
end

function arb_log_hypot(res, x, y, prec)
    ccall((:arb_log_hypot, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, x, y, prec)
end

function arb_exp(z, x, prec)
    ccall((:arb_exp, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_expm1(z, x, prec)
    ccall((:arb_expm1, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_exp_invexp(z, w, x, prec)
    ccall((:arb_exp_invexp, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, w, x, prec)
end

function arb_sin(s, x, prec)
    ccall((:arb_sin, libarb), Cvoid, (arb_t, arb_t, Cint), s, x, prec)
end

function arb_cos(c, x, prec)
    ccall((:arb_cos, libarb), Cvoid, (arb_t, arb_t, Cint), c, x, prec)
end

function arb_sin_cos(s, c, x, prec)
    ccall((:arb_sin_cos, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), s, c, x, prec)
end

function arb_sin_pi(s, x, prec)
    ccall((:arb_sin_pi, libarb), Cvoid, (arb_t, arb_t, Cint), s, x, prec)
end

function arb_cos_pi(c, x, prec)
    ccall((:arb_cos_pi, libarb), Cvoid, (arb_t, arb_t, Cint), c, x, prec)
end

function arb_sin_cos_pi(s, c, x, prec)
    ccall((:arb_sin_cos_pi, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), s, c, x, prec)
end

function arb_tan(y, x, prec)
    ccall((:arb_tan, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_cot(y, x, prec)
    ccall((:arb_cot, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_tan_pi(y, x, prec)
    ccall((:arb_tan_pi, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_cot_pi(y, x, prec)
    ccall((:arb_cot_pi, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function _arb_sin_pi_fmpq_algebraic(s, p, q, prec)
    ccall((:_arb_sin_pi_fmpq_algebraic, libarb), Cvoid, (arb_t, Cint, Cint, Cint), s, p, q, prec)
end

function _arb_cos_pi_fmpq_algebraic(c, p, q, prec)
    ccall((:_arb_cos_pi_fmpq_algebraic, libarb), Cvoid, (arb_t, Cint, Cint, Cint), c, p, q, prec)
end

function _arb_sin_cos_pi_fmpq_algebraic(s, c, p, q, prec)
    ccall((:_arb_sin_cos_pi_fmpq_algebraic, libarb), Cvoid, (arb_t, arb_t, Cint, Cint, Cint), s, c, p, q, prec)
end

function arb_sin_cos_pi_fmpq(s, c, x, prec)
    ccall((:arb_sin_cos_pi_fmpq, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), s, c, x, prec)
end

function arb_sin_pi_fmpq(s, x, prec)
    ccall((:arb_sin_pi_fmpq, libarb), Cvoid, (arb_t, Cint, Cint), s, x, prec)
end

function arb_cos_pi_fmpq(c, x, prec)
    ccall((:arb_cos_pi_fmpq, libarb), Cvoid, (arb_t, Cint, Cint), c, x, prec)
end

function arb_sinc(z, x, prec)
    ccall((:arb_sinc, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_sinc_pi(z, x, prec)
    ccall((:arb_sinc_pi, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_sinh(z, x, prec)
    ccall((:arb_sinh, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_cosh(z, x, prec)
    ccall((:arb_cosh, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_sinh_cosh(s, c, x, prec)
    ccall((:arb_sinh_cosh, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), s, c, x, prec)
end

function arb_tanh(y, x, prec)
    ccall((:arb_tanh, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_coth(y, x, prec)
    ccall((:arb_coth, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_atan_arf(z, x, prec)
    ccall((:arb_atan_arf, libarb), Cvoid, (arb_t, arf_t, Cint), z, x, prec)
end

function arb_atan(z, x, prec)
    ccall((:arb_atan, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_atan2(z, b, a, prec)
    ccall((:arb_atan2, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, b, a, prec)
end

function arb_asin(z, x, prec)
    ccall((:arb_asin, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_acos(z, x, prec)
    ccall((:arb_acos, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_atanh(z, x, prec)
    ccall((:arb_atanh, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_asinh(z, x, prec)
    ccall((:arb_asinh, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_acosh(z, x, prec)
    ccall((:arb_acosh, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_sec(res, x, prec)
    ccall((:arb_sec, libarb), Cvoid, (arb_t, arb_t, Cint), res, x, prec)
end

function arb_csc(res, x, prec)
    ccall((:arb_csc, libarb), Cvoid, (arb_t, arb_t, Cint), res, x, prec)
end

function arb_sech(res, x, prec)
    ccall((:arb_sech, libarb), Cvoid, (arb_t, arb_t, Cint), res, x, prec)
end

function arb_csch(res, x, prec)
    ccall((:arb_csch, libarb), Cvoid, (arb_t, arb_t, Cint), res, x, prec)
end

function arb_fac_ui(z, n, prec)
    ccall((:arb_fac_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, n, prec)
end

function arb_doublefac_ui(z, n, prec)
    ccall((:arb_doublefac_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, n, prec)
end

function arb_bin_ui(z, n, k, prec)
    ccall((:arb_bin_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, n, k, prec)
end

function arb_bin_uiui(z, n, k, prec)
    ccall((:arb_bin_uiui, libarb), Cvoid, (arb_t, Cint, Cint, Cint), z, n, k, prec)
end

function arb_fib_fmpz(z, n, prec)
    ccall((:arb_fib_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), z, n, prec)
end

function arb_fib_ui(z, n, prec)
    ccall((:arb_fib_ui, libarb), Cvoid, (arb_t, Cint, Cint), z, n, prec)
end

function arb_const_pi(z, prec)
    ccall((:arb_const_pi, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_sqrt_pi(z, prec)
    ccall((:arb_const_sqrt_pi, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_log_sqrt2pi(z, prec)
    ccall((:arb_const_log_sqrt2pi, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_log2(z, prec)
    ccall((:arb_const_log2, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_log10(z, prec)
    ccall((:arb_const_log10, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_euler(z, prec)
    ccall((:arb_const_euler, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_catalan(z, prec)
    ccall((:arb_const_catalan, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_e(z, prec)
    ccall((:arb_const_e, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_khinchin(z, prec)
    ccall((:arb_const_khinchin, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_const_glaisher(z, prec)
    ccall((:arb_const_glaisher, libarb), Cvoid, (arb_t, Cint), z, prec)
end

function arb_agm(z, x, y, prec)
    ccall((:arb_agm, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, y, prec)
end

function arb_lgamma(z, x, prec)
    ccall((:arb_lgamma, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_rgamma(z, x, prec)
    ccall((:arb_rgamma, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_gamma(z, x, prec)
    ccall((:arb_gamma, libarb), Cvoid, (arb_t, arb_t, Cint), z, x, prec)
end

function arb_gamma_fmpq(z, x, prec)
    ccall((:arb_gamma_fmpq, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_gamma_fmpz(z, x, prec)
    ccall((:arb_gamma_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), z, x, prec)
end

function arb_digamma(y, x, prec)
    ccall((:arb_digamma, libarb), Cvoid, (arb_t, arb_t, Cint), y, x, prec)
end

function arb_zeta(z, s, prec)
    ccall((:arb_zeta, libarb), Cvoid, (arb_t, arb_t, Cint), z, s, prec)
end

function arb_hurwitz_zeta(z, s, a, prec)
    ccall((:arb_hurwitz_zeta, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, s, a, prec)
end

function arb_rising_ui_bs(y, x, n, prec)
    ccall((:arb_rising_ui_bs, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, x, n, prec)
end

function arb_rising_ui_rs(y, x, n, m, prec)
    ccall((:arb_rising_ui_rs, libarb), Cvoid, (arb_t, arb_t, Cint, Cint, Cint), y, x, n, m, prec)
end

function arb_rising_ui_rec(y, x, n, prec)
    ccall((:arb_rising_ui_rec, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), y, x, n, prec)
end

function arb_rising_ui(z, x, n, prec)
    ccall((:arb_rising_ui, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), z, x, n, prec)
end

function arb_rising_fmpq_ui(y, x, n, prec)
    ccall((:arb_rising_fmpq_ui, libarb), Cvoid, (arb_t, Cint, Cint, Cint), y, x, n, prec)
end

function arb_rising(z, x, n, prec)
    ccall((:arb_rising, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), z, x, n, prec)
end

function arb_rising2_ui_rs(u, v, x, n, m, prec)
    ccall((:arb_rising2_ui_rs, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint, Cint), u, v, x, n, m, prec)
end

function arb_rising2_ui_bs(u, v, x, n, prec)
    ccall((:arb_rising2_ui_bs, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), u, v, x, n, prec)
end

function arb_rising2_ui(u, v, x, n, prec)
    ccall((:arb_rising2_ui, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), u, v, x, n, prec)
end

function arb_log_ui_from_prev(s, k, log_prev, prev, prec)
    ccall((:arb_log_ui_from_prev, libarb), Cvoid, (arb_t, Cint, arb_t, Cint, Cint), s, k, log_prev, prev, prec)
end

function arb_const_apery(s, prec)
    ccall((:arb_const_apery, libarb), Cvoid, (arb_t, Cint), s, prec)
end

function arb_zeta_ui_asymp(x, s, prec)
    ccall((:arb_zeta_ui_asymp, libarb), Cvoid, (arb_t, Cint, Cint), x, s, prec)
end

function arb_zeta_ui_borwein_bsplit(x, s, prec)
    ccall((:arb_zeta_ui_borwein_bsplit, libarb), Cvoid, (arb_t, Cint, Cint), x, s, prec)
end

function arb_zeta_ui_euler_product(z, s, prec)
    ccall((:arb_zeta_ui_euler_product, libarb), Cvoid, (arb_t, Cint, Cint), z, s, prec)
end

function arb_zeta_ui_bernoulli(x, n, prec)
    ccall((:arb_zeta_ui_bernoulli, libarb), Cvoid, (arb_t, Cint, Cint), x, n, prec)
end

function arb_zeta_ui_vec_borwein(z, start, num, step, prec)
    ccall((:arb_zeta_ui_vec_borwein, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint, Cint), z, start, num, step, prec)
end

function arb_zeta_ui(x, n, prec)
    ccall((:arb_zeta_ui, libarb), Cvoid, (arb_t, Cint, Cint), x, n, prec)
end

function arb_zeta_ui_vec_even(x, start, num, prec)
    ccall((:arb_zeta_ui_vec_even, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint), x, start, num, prec)
end

function arb_zeta_ui_vec_odd(x, start, num, prec)
    ccall((:arb_zeta_ui_vec_odd, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint), x, start, num, prec)
end

function arb_zeta_ui_vec(x, start, num, prec)
    ccall((:arb_zeta_ui_vec, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint), x, start, num, prec)
end

function arb_bernoulli_ui(b, n, prec)
    ccall((:arb_bernoulli_ui, libarb), Cvoid, (arb_t, Cint, Cint), b, n, prec)
end

function arb_bernoulli_ui_zeta(b, n, prec)
    ccall((:arb_bernoulli_ui_zeta, libarb), Cvoid, (arb_t, Cint, Cint), b, n, prec)
end

function arb_bernoulli_fmpz(b, n, prec)
    ccall((:arb_bernoulli_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), b, n, prec)
end

function arb_bernoulli_poly_ui(res, n, x, prec)
    ccall((:arb_bernoulli_poly_ui, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), res, n, x, prec)
end

function arb_polylog(w, s, z, prec)
    ccall((:arb_polylog, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), w, s, z, prec)
end

function arb_polylog_si(w, s, z, prec)
    ccall((:arb_polylog_si, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), w, s, z, prec)
end

function arb_chebyshev_t_ui(a, n, x, prec)
    ccall((:arb_chebyshev_t_ui, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), a, n, x, prec)
end

function arb_chebyshev_t2_ui(a, b, n, x, prec)
    ccall((:arb_chebyshev_t2_ui, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint), a, b, n, x, prec)
end

function arb_chebyshev_u_ui(a, n, x, prec)
    ccall((:arb_chebyshev_u_ui, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), a, n, x, prec)
end

function arb_chebyshev_u2_ui(a, b, n, x, prec)
    ccall((:arb_chebyshev_u2_ui, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint), a, b, n, x, prec)
end

function arb_power_sum_vec(res, a, b, len, prec)
    ccall((:arb_power_sum_vec, libarb), Cvoid, (arb_ptr, arb_t, arb_t, Cint, Cint), res, a, b, len, prec)
end

function arb_bell_sum_taylor(res, n, a, b, mmag, prec)
    ccall((:arb_bell_sum_taylor, libarb), Cvoid, (arb_t, Cint, Cint, Cint, Cint, Cint), res, n, a, b, mmag, prec)
end

function arb_bell_sum_bsplit(res, n, a, b, mmag, prec)
    ccall((:arb_bell_sum_bsplit, libarb), Cvoid, (arb_t, Cint, Cint, Cint, Cint, Cint), res, n, a, b, mmag, prec)
end

function arb_bell_fmpz(res, n, prec)
    ccall((:arb_bell_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_bell_ui(res, n, prec)
    ccall((:arb_bell_ui, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_euler_number_fmpz(res, n, prec)
    ccall((:arb_euler_number_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_euler_number_ui(res, n, prec)
    ccall((:arb_euler_number_ui, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_partitions_fmpz(res, n, prec)
    ccall((:arb_partitions_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_partitions_ui(res, n, prec)
    ccall((:arb_partitions_ui, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_lambertw(res, x, flags, prec)
    ccall((:arb_lambertw, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), res, x, flags, prec)
end

function arb_sqr(res, val, prec)
    ccall((:arb_sqr, libarb), Cvoid, (arb_t, arb_t, Cint), res, val, prec)
end

function _arb_vec_entry_ptr(vec, i)
    ccall((:_arb_vec_entry_ptr, libarb), arb_ptr, (arb_ptr, Cint), vec, i)
end

function _arb_vec_zero(A, n)
    ccall((:_arb_vec_zero, libarb), Cvoid, (arb_ptr, Cint), A, n)
end

function _arb_vec_is_zero(vec, len)
    ccall((:_arb_vec_is_zero, libarb), Cint, (arb_srcptr, Cint), vec, len)
end

function _arb_vec_is_finite(x, len)
    ccall((:_arb_vec_is_finite, libarb), Cint, (arb_srcptr, Cint), x, len)
end

function _arb_vec_set(res, vec, len)
    ccall((:_arb_vec_set, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint), res, vec, len)
end

function _arb_vec_set_round(res, vec, len, prec)
    ccall((:_arb_vec_set_round, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, vec, len, prec)
end

function _arb_vec_swap(res, vec, len)
    ccall((:_arb_vec_swap, libarb), Cvoid, (arb_ptr, arb_ptr, Cint), res, vec, len)
end

function _arb_vec_neg(B, A, n)
    ccall((:_arb_vec_neg, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint), B, A, n)
end

function _arb_vec_sub(C, A, B, n, prec)
    ccall((:_arb_vec_sub, libarb), Cvoid, (arb_ptr, arb_srcptr, arb_srcptr, Cint, Cint), C, A, B, n, prec)
end

function _arb_vec_add(C, A, B, n, prec)
    ccall((:_arb_vec_add, libarb), Cvoid, (arb_ptr, arb_srcptr, arb_srcptr, Cint, Cint), C, A, B, n, prec)
end

function _arb_vec_scalar_mul(res, vec, len, c, prec)
    ccall((:_arb_vec_scalar_mul, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint), res, vec, len, c, prec)
end

function _arb_vec_scalar_div(res, vec, len, c, prec)
    ccall((:_arb_vec_scalar_div, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint), res, vec, len, c, prec)
end

function _arb_vec_scalar_mul_fmpz(res, vec, len, c, prec)
    ccall((:_arb_vec_scalar_mul_fmpz, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, vec, len, c, prec)
end

function _arb_vec_scalar_mul_2exp_si(res, src, len, c)
    ccall((:_arb_vec_scalar_mul_2exp_si, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, src, len, c)
end

function _arb_vec_scalar_addmul(res, vec, len, c, prec)
    ccall((:_arb_vec_scalar_addmul, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint), res, vec, len, c, prec)
end

function _arb_vec_get_mag(bound, vec, len)
    ccall((:_arb_vec_get_mag, libarb), Cvoid, (mag_t, arb_srcptr, Cint), bound, vec, len)
end

function _arb_vec_bits()
    ccall((:_arb_vec_bits, libarb), Cint, ())
end

function _arb_vec_set_powers(xs, x, len, prec)
    ccall((:_arb_vec_set_powers, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), xs, x, len, prec)
end

function _arb_vec_add_error_arf_vec(res, err, len)
    ccall((:_arb_vec_add_error_arf_vec, libarb), Cvoid, (arb_ptr, arf_srcptr, Cint), res, err, len)
end

function _arb_vec_add_error_mag_vec(res, err, len)
    ccall((:_arb_vec_add_error_mag_vec, libarb), Cvoid, (arb_ptr, mag_srcptr, Cint), res, err, len)
end

function _arb_vec_indeterminate(vec, len)
    ccall((:_arb_vec_indeterminate, libarb), Cvoid, (arb_ptr, Cint), vec, len)
end

function _arb_vec_trim(res, vec, len)
    ccall((:_arb_vec_trim, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint), res, vec, len)
end

function _arb_vec_get_unique_fmpz_vec(res, vec, len)
    ccall((:_arb_vec_get_unique_fmpz_vec, libarb), Cint, (Ptr{Cint}, arb_srcptr, Cint), res, vec, len)
end

function _arb_atan_taylor_naive(y, error, x, xn, N, alternating)
    ccall((:_arb_atan_taylor_naive, libarb), Cvoid, (Cint, Ptr{Cint}, Cint, Cint, Cint, Cint), y, error, x, xn, N, alternating)
end

function _arb_atan_taylor_rs(y, error, x, xn, N, alternating)
    ccall((:_arb_atan_taylor_rs, libarb), Cvoid, (Cint, Ptr{Cint}, Cint, Cint, Cint, Cint), y, error, x, xn, N, alternating)
end

function _arb_exp_taylor_naive(y, error, x, xn, N)
    ccall((:_arb_exp_taylor_naive, libarb), Cvoid, (Cint, Ptr{Cint}, Cint, Cint, Cint), y, error, x, xn, N)
end

function _arb_exp_taylor_rs(y, error, x, xn, N)
    ccall((:_arb_exp_taylor_rs, libarb), Cvoid, (Cint, Ptr{Cint}, Cint, Cint, Cint), y, error, x, xn, N)
end

function arb_exp_arf_bb(z, x, prec, minus_one)
    ccall((:arb_exp_arf_bb, libarb), Cvoid, (arb_t, arf_t, Cint, Cint), z, x, prec, minus_one)
end

function arb_exp_arf_rs_generic(res, x, prec, minus_one)
    ccall((:arb_exp_arf_rs_generic, libarb), Cvoid, (arb_t, arf_t, Cint, Cint), res, x, prec, minus_one)
end

function _arb_get_mpn_fixed_mod_log2(w, q, error, x, wn)
    ccall((:_arb_get_mpn_fixed_mod_log2, libarb), Cint, (Cint, Cint, Ptr{Cint}, arf_t, Cint), w, q, error, x, wn)
end

function _arb_exp_taylor_bound()
    ccall((:_arb_exp_taylor_bound, libarb), Cint, ())
end

function _arb_exp_sum_bs_powtab(T, Q, Qexp, x, r, N)
    ccall((:_arb_exp_sum_bs_powtab, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), T, Q, Qexp, x, r, N)
end

function _arb_exp_sum_bs_simple(T, Q, Qexp, x, r, N)
    ccall((:_arb_exp_sum_bs_simple, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), T, Q, Qexp, x, r, N)
end

function _arb_sin_cos_taylor_naive(ysin, ycos, error, x, xn, N)
    ccall((:_arb_sin_cos_taylor_naive, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), ysin, ycos, error, x, xn, N)
end

function _arb_sin_cos_taylor_rs(ysin, ycos, error, x, xn, N, sinonly, alternating)
    ccall((:_arb_sin_cos_taylor_rs, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint, Cint, Cint), ysin, ycos, error, x, xn, N, sinonly, alternating)
end

function _arb_get_mpn_fixed_mod_pi4(w, q, octant, error, x, wn)
    ccall((:_arb_get_mpn_fixed_mod_pi4, libarb), Cint, (Cint, Cint, Ptr{Cint}, Ptr{Cint}, arf_t, Cint), w, q, octant, error, x, wn)
end

function arb_sin_cos_arf_bb(zsin, zcos, x, prec)
    ccall((:arb_sin_cos_arf_bb, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), zsin, zcos, x, prec)
end

function arb_sin_cos_arf_rs_generic(res_sin, res_cos, x, prec)
    ccall((:arb_sin_cos_arf_rs_generic, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), res_sin, res_cos, x, prec)
end

function arb_sin_cos_arf_generic(res_sin, res_cos, x, prec)
    ccall((:arb_sin_cos_arf_generic, libarb), Cvoid, (arb_t, arb_t, arf_t, Cint), res_sin, res_cos, x, prec)
end

function _arb_sin_cos_wide(s, c, x, r, prec)
    ccall((:_arb_sin_cos_wide, libarb), Cvoid, (arb_t, arb_t, arf_t, mag_t, Cint), s, c, x, r, prec)
end

function arb_sin_cos_wide(s, c, x, prec)
    ccall((:arb_sin_cos_wide, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), s, c, x, prec)
end

function _arb_sin_cos_generic(s, c, x, xrad, prec)
    ccall((:_arb_sin_cos_generic, libarb), Cvoid, (arb_t, arb_t, arf_t, mag_t, Cint), s, c, x, xrad, prec)
end

function arb_sin_cos_generic(s, c, x, prec)
    ccall((:arb_sin_cos_generic, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), s, c, x, prec)
end

function _arb_mpn_leading_zeros()
    ccall((:_arb_mpn_leading_zeros, libarb), Cint, ())
end

function _arb_atan_sum_bs_simple(T, Q, Qexp, x, r, N)
    ccall((:_arb_atan_sum_bs_simple, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), T, Q, Qexp, x, r, N)
end

function _arb_atan_sum_bs_powtab(T, Q, Qexp, x, r, N)
    ccall((:_arb_atan_sum_bs_powtab, libarb), Cvoid, (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint), T, Q, Qexp, x, r, N)
end

function arb_atan_arf_bb(z, x, prec)
    ccall((:arb_atan_arf_bb, libarb), Cvoid, (arb_t, arf_t, Cint), z, x, prec)
end

function arb_allocated_bytes()
    ccall((:arb_allocated_bytes, libarb), Cint, ())
end

function _arb_vec_allocated_bytes()
    ccall((:_arb_vec_allocated_bytes, libarb), Cint, ())
end

function _arb_vec_estimate_allocated_bytes(len, prec)
    ccall((:_arb_vec_estimate_allocated_bytes, libarb), Cdouble, (Cint, Cint), len, prec)
end
# Julia wrapper for header: arb_calc.h
# Automatically generated using Clang.jl


function arf_interval_init(v)
    ccall((:arf_interval_init, libarb), Cvoid, (arf_interval_t,), v)
end

function arf_interval_clear(v)
    ccall((:arf_interval_clear, libarb), Cvoid, (arf_interval_t,), v)
end

function _arf_interval_vec_init(n)
    ccall((:_arf_interval_vec_init, libarb), arf_interval_ptr, (Cint,), n)
end

function _arf_interval_vec_clear(v, n)
    ccall((:_arf_interval_vec_clear, libarb), Cvoid, (arf_interval_ptr, Cint), v, n)
end

function arf_interval_set(v, u)
    ccall((:arf_interval_set, libarb), Cvoid, (arf_interval_t, arf_interval_t), v, u)
end

function arf_interval_swap(v, u)
    ccall((:arf_interval_swap, libarb), Cvoid, (arf_interval_t, arf_interval_t), v, u)
end

function arf_interval_get_arb(x, v, prec)
    ccall((:arf_interval_get_arb, libarb), Cvoid, (arb_t, arf_interval_t, Cint), x, v, prec)
end

function arf_interval_fprintd(file, v, n)
    ccall((:arf_interval_fprintd, libarb), Cvoid, (Ptr{Cint}, arf_interval_t, Cint), file, v, n)
end

function arf_interval_printd(v, n)
    ccall((:arf_interval_printd, libarb), Cvoid, (arf_interval_t, Cint), v, n)
end

function arb_calc_partition(L, R, func, param, block, prec)
    ccall((:arb_calc_partition, libarb), Cint, (arf_interval_t, arf_interval_t, arb_calc_func_t, Ptr{Cvoid}, arf_interval_t, Cint), L, R, func, param, block, prec)
end

function arb_calc_isolate_roots()
    ccall((:arb_calc_isolate_roots, libarb), Cint, ())
end

function arb_calc_refine_root_bisect(r, func, param, start, iter, prec)
    ccall((:arb_calc_refine_root_bisect, libarb), Cint, (arf_interval_t, arb_calc_func_t, Ptr{Cvoid}, arf_interval_t, Cint, Cint), r, func, param, start, iter, prec)
end

function arb_calc_newton_conv_factor(conv_factor, func, param, conv_region, prec)
    ccall((:arb_calc_newton_conv_factor, libarb), Cvoid, (arf_t, arb_calc_func_t, Ptr{Cvoid}, arb_t, Cint), conv_factor, func, param, conv_region, prec)
end

function arb_calc_newton_step(xnew, func, param, x, conv_region, conv_factor, prec)
    ccall((:arb_calc_newton_step, libarb), Cint, (arb_t, arb_calc_func_t, Ptr{Cvoid}, arb_t, arb_t, arf_t, Cint), xnew, func, param, x, conv_region, conv_factor, prec)
end

function arb_calc_refine_root_newton(r, func, param, start, conv_region, conv_factor, eval_extra_prec, prec)
    ccall((:arb_calc_refine_root_newton, libarb), Cint, (arb_t, arb_calc_func_t, Ptr{Cvoid}, arb_t, arb_t, arf_t, Cint, Cint), r, func, param, start, conv_region, conv_factor, eval_extra_prec, prec)
end
# Julia wrapper for header: arb_fmpz_poly.h
# Automatically generated using Clang.jl


function _arb_fmpz_poly_evaluate_acb_horner(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_acb_horner, libarb), Cvoid, (acb_t, Ptr{Cint}, Cint, acb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_acb_horner(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_acb_horner, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), res, f, a, prec)
end

function _arb_fmpz_poly_evaluate_acb_rectangular(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_acb_rectangular, libarb), Cvoid, (acb_t, Ptr{Cint}, Cint, acb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_acb_rectangular(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_acb_rectangular, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), res, f, a, prec)
end

function _arb_fmpz_poly_evaluate_acb(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_acb, libarb), Cvoid, (acb_t, Ptr{Cint}, Cint, acb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_acb(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_acb, libarb), Cvoid, (acb_t, Cint, acb_t, Cint), res, f, a, prec)
end

function _arb_fmpz_poly_evaluate_arb_horner(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_arb_horner, libarb), Cvoid, (arb_t, Ptr{Cint}, Cint, arb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_arb_horner(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_arb_horner, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), res, f, a, prec)
end

function _arb_fmpz_poly_evaluate_arb_rectangular(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_arb_rectangular, libarb), Cvoid, (arb_t, Ptr{Cint}, Cint, arb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_arb_rectangular(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_arb_rectangular, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), res, f, a, prec)
end

function _arb_fmpz_poly_evaluate_arb(res, f, len, x, prec)
    ccall((:_arb_fmpz_poly_evaluate_arb, libarb), Cvoid, (arb_t, Ptr{Cint}, Cint, arb_t, Cint), res, f, len, x, prec)
end

function arb_fmpz_poly_evaluate_arb(res, f, a, prec)
    ccall((:arb_fmpz_poly_evaluate_arb, libarb), Cvoid, (arb_t, Cint, arb_t, Cint), res, f, a, prec)
end

function arb_fmpz_poly_deflate(result, input, deflation)
    ccall((:arb_fmpz_poly_deflate, libarb), Cvoid, (Cint, Cint, Cint), result, input, deflation)
end

function arb_fmpz_poly_deflation()
    ccall((:arb_fmpz_poly_deflation, libarb), Cint, ())
end

function arb_fmpz_poly_complex_roots(roots, poly, flags, target_prec)
    ccall((:arb_fmpz_poly_complex_roots, libarb), Cvoid, (acb_ptr, Cint, Cint, Cint), roots, poly, flags, target_prec)
end

function arb_fmpz_poly_cos_minpoly(res, n)
    ccall((:arb_fmpz_poly_cos_minpoly, libarb), Cvoid, (Cint, Cint), res, n)
end

function arb_fmpz_poly_gauss_period_minpoly(res, q, n)
    ccall((:arb_fmpz_poly_gauss_period_minpoly, libarb), Cvoid, (Cint, Cint, Cint), res, q, n)
end
# Julia wrapper for header: arb_hypgeom.h
# Automatically generated using Clang.jl


function arb_hypgeom_pfq(res, a, p, b, q, z, regularized, prec)
    ccall((:arb_hypgeom_pfq, libarb), Cvoid, (arb_t, arb_srcptr, Cint, arb_srcptr, Cint, arb_t, Cint, Cint), res, a, p, b, q, z, regularized, prec)
end

function arb_hypgeom_0f1(res, a, z, regularized, prec)
    ccall((:arb_hypgeom_0f1, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), res, a, z, regularized, prec)
end

function arb_hypgeom_m(res, a, b, z, regularized, prec)
    ccall((:arb_hypgeom_m, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function arb_hypgeom_1f1(res, a, b, z, regularized, prec)
    ccall((:arb_hypgeom_1f1, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, a, b, z, regularized, prec)
end

function arb_hypgeom_u(res, a, b, z, prec)
    ccall((:arb_hypgeom_u, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint), res, a, b, z, prec)
end

function arb_hypgeom_2f1(res, a, b, c, z, regularized, prec)
    ccall((:arb_hypgeom_2f1, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, a, b, c, z, regularized, prec)
end

function arb_hypgeom_erf(res, z, prec)
    ccall((:arb_hypgeom_erf, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_erf_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_erf_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_erf_series(g, h, len, prec)
    ccall((:arb_hypgeom_erf_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_erfc(res, z, prec)
    ccall((:arb_hypgeom_erfc, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_erfc_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_erfc_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_erfc_series(g, h, len, prec)
    ccall((:arb_hypgeom_erfc_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_erfi(res, z, prec)
    ccall((:arb_hypgeom_erfi, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_erfi_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_erfi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_erfi_series(g, h, len, prec)
    ccall((:arb_hypgeom_erfi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_fresnel(res1, res2, z, normalized, prec)
    ccall((:arb_hypgeom_fresnel, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), res1, res2, z, normalized, prec)
end

function _arb_hypgeom_fresnel_series(s, c, h, hlen, normalized, len, prec)
    ccall((:_arb_hypgeom_fresnel_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, normalized, len, prec)
end

function arb_hypgeom_fresnel_series(s, c, h, normalized, len, prec)
    ccall((:arb_hypgeom_fresnel_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint, Cint), s, c, h, normalized, len, prec)
end

function arb_hypgeom_ei(res, z, prec)
    ccall((:arb_hypgeom_ei, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_ei_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_ei_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_ei_series(g, h, len, prec)
    ccall((:arb_hypgeom_ei_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_si(res, z, prec)
    ccall((:arb_hypgeom_si, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_si_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_si_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_si_series(g, h, len, prec)
    ccall((:arb_hypgeom_si_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_ci(res, z, prec)
    ccall((:arb_hypgeom_ci, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_ci_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_ci_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_ci_series(g, h, len, prec)
    ccall((:arb_hypgeom_ci_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_shi(res, z, prec)
    ccall((:arb_hypgeom_shi, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_shi_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_shi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_shi_series(g, h, len, prec)
    ccall((:arb_hypgeom_shi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_chi(res, z, prec)
    ccall((:arb_hypgeom_chi, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end

function _arb_hypgeom_chi_series(g, h, hlen, len, prec)
    ccall((:_arb_hypgeom_chi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_hypgeom_chi_series(g, h, len, prec)
    ccall((:arb_hypgeom_chi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, len, prec)
end

function arb_hypgeom_li(res, z, offset, prec)
    ccall((:arb_hypgeom_li, libarb), Cvoid, (arb_t, arb_t, Cint, Cint), res, z, offset, prec)
end

function _arb_hypgeom_li_series(g, h, hlen, offset, len, prec)
    ccall((:_arb_hypgeom_li_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), g, h, hlen, offset, len, prec)
end

function arb_hypgeom_li_series(g, h, offset, len, prec)
    ccall((:arb_hypgeom_li_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint, Cint), g, h, offset, len, prec)
end

function arb_hypgeom_bessel_j(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_j, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_bessel_y(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_y, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_bessel_jy(res1, res2, nu, z, prec)
    ccall((:arb_hypgeom_bessel_jy, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint), res1, res2, nu, z, prec)
end

function arb_hypgeom_bessel_i(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_i, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_bessel_k(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_k, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_bessel_i_scaled(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_i_scaled, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_bessel_k_scaled(res, nu, z, prec)
    ccall((:arb_hypgeom_bessel_k_scaled, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_airy(ai, aip, bi, bip, z, prec)
    ccall((:arb_hypgeom_airy, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, arb_t, Cint), ai, aip, bi, bip, z, prec)
end

function arb_hypgeom_airy_jet(ai, bi, z, len, prec)
    ccall((:arb_hypgeom_airy_jet, libarb), Cvoid, (arb_ptr, arb_ptr, arb_t, Cint, Cint), ai, bi, z, len, prec)
end

function arb_hypgeom_airy_series(ai, ai_prime, bi, bi_prime, z, len, prec)
    ccall((:arb_hypgeom_airy_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), ai, ai_prime, bi, bi_prime, z, len, prec)
end

function _arb_hypgeom_airy_series(ai, ai_prime, bi, bi_prime, z, zlen, len, prec)
    ccall((:_arb_hypgeom_airy_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), ai, ai_prime, bi, bi_prime, z, zlen, len, prec)
end

function arb_hypgeom_airy_zero(ai, aip, bi, bip, n, prec)
    ccall((:arb_hypgeom_airy_zero, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), ai, aip, bi, bip, n, prec)
end

function arb_hypgeom_coulomb(F, G, l, eta, z, prec)
    ccall((:arb_hypgeom_coulomb, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, arb_t, Cint), F, G, l, eta, z, prec)
end

function arb_hypgeom_coulomb_jet(F, G, l, eta, z, len, prec)
    ccall((:arb_hypgeom_coulomb_jet, libarb), Cvoid, (arb_ptr, arb_ptr, arb_t, arb_t, arb_t, Cint, Cint), F, G, l, eta, z, len, prec)
end

function _arb_hypgeom_coulomb_series(F, G, l, eta, z, zlen, len, prec)
    ccall((:_arb_hypgeom_coulomb_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_t, arb_t, arb_srcptr, Cint, Cint, Cint), F, G, l, eta, z, zlen, len, prec)
end

function arb_hypgeom_coulomb_series(F, G, l, eta, z, len, prec)
    ccall((:arb_hypgeom_coulomb_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, arb_t, arb_poly_t, Cint, Cint), F, G, l, eta, z, len, prec)
end

function arb_hypgeom_expint(res, s, z, prec)
    ccall((:arb_hypgeom_expint, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, s, z, prec)
end

function arb_hypgeom_gamma_lower(res, s, z, regularized, prec)
    ccall((:arb_hypgeom_gamma_lower, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), res, s, z, regularized, prec)
end

function _arb_hypgeom_gamma_lower_series(g, s, h, hlen, regularized, n, prec)
    ccall((:_arb_hypgeom_gamma_lower_series, libarb), Cvoid, (arb_ptr, arb_t, arb_srcptr, Cint, Cint, Cint, Cint), g, s, h, hlen, regularized, n, prec)
end

function arb_hypgeom_gamma_lower_series(g, s, h, regularized, n, prec)
    ccall((:arb_hypgeom_gamma_lower_series, libarb), Cvoid, (arb_poly_t, arb_t, arb_poly_t, Cint, Cint, Cint), g, s, h, regularized, n, prec)
end

function arb_hypgeom_gamma_upper(res, s, z, regularized, prec)
    ccall((:arb_hypgeom_gamma_upper, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint, Cint), res, s, z, regularized, prec)
end

function _arb_hypgeom_gamma_upper_series(g, s, h, hlen, regularized, n, prec)
    ccall((:_arb_hypgeom_gamma_upper_series, libarb), Cvoid, (arb_ptr, arb_t, arb_srcptr, Cint, Cint, Cint, Cint), g, s, h, hlen, regularized, n, prec)
end

function arb_hypgeom_gamma_upper_series(g, s, h, regularized, n, prec)
    ccall((:arb_hypgeom_gamma_upper_series, libarb), Cvoid, (arb_poly_t, arb_t, arb_poly_t, Cint, Cint, Cint), g, s, h, regularized, n, prec)
end

function arb_hypgeom_beta_lower(res, a, c, z, regularized, prec)
    ccall((:arb_hypgeom_beta_lower, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, a, c, z, regularized, prec)
end

function arb_hypgeom_beta_lower_series(res, a, b, z, regularized, len, prec)
    ccall((:arb_hypgeom_beta_lower_series, libarb), Cvoid, (arb_poly_t, arb_t, arb_t, arb_poly_t, Cint, Cint, Cint), res, a, b, z, regularized, len, prec)
end

function _arb_hypgeom_beta_lower_series(res, a, b, z, zlen, regularized, len, prec)
    ccall((:_arb_hypgeom_beta_lower_series, libarb), Cvoid, (arb_ptr, arb_t, arb_t, arb_srcptr, Cint, Cint, Cint, Cint), res, a, b, z, zlen, regularized, len, prec)
end

function arb_hypgeom_chebyshev_t(res, nu, z, prec)
    ccall((:arb_hypgeom_chebyshev_t, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_chebyshev_u(res, nu, z, prec)
    ccall((:arb_hypgeom_chebyshev_u, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_jacobi_p(res, n, a, b, z, prec)
    ccall((:arb_hypgeom_jacobi_p, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, arb_t, Cint), res, n, a, b, z, prec)
end

function arb_hypgeom_gegenbauer_c(res, n, m, z, prec)
    ccall((:arb_hypgeom_gegenbauer_c, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint), res, n, m, z, prec)
end

function arb_hypgeom_laguerre_l(res, n, m, z, prec)
    ccall((:arb_hypgeom_laguerre_l, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint), res, n, m, z, prec)
end

function arb_hypgeom_hermite_h(res, nu, z, prec)
    ccall((:arb_hypgeom_hermite_h, libarb), Cvoid, (arb_t, arb_t, arb_t, Cint), res, nu, z, prec)
end

function arb_hypgeom_legendre_p(res, n, m, z, type, prec)
    ccall((:arb_hypgeom_legendre_p, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, n, m, z, type, prec)
end

function arb_hypgeom_legendre_q(res, n, m, z, type, prec)
    ccall((:arb_hypgeom_legendre_q, libarb), Cvoid, (arb_t, arb_t, arb_t, arb_t, Cint, Cint), res, n, m, z, type, prec)
end

function arb_hypgeom_legendre_p_ui_deriv_bound(dp, dp2, n, x, x2sub1)
    ccall((:arb_hypgeom_legendre_p_ui_deriv_bound, libarb), Cvoid, (mag_t, mag_t, Cint, arb_t, arb_t), dp, dp2, n, x, x2sub1)
end

function arb_hypgeom_legendre_p_ui_rec(res, res_prime, n, x, prec)
    ccall((:arb_hypgeom_legendre_p_ui_rec, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint), res, res_prime, n, x, prec)
end

function arb_hypgeom_legendre_p_ui_asymp(res, res2, n, x, K, prec)
    ccall((:arb_hypgeom_legendre_p_ui_asymp, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint, Cint), res, res2, n, x, K, prec)
end

function arb_hypgeom_legendre_p_ui_one(res, res2, n, x, K, prec)
    ccall((:arb_hypgeom_legendre_p_ui_one, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint, Cint), res, res2, n, x, K, prec)
end

function arb_hypgeom_legendre_p_ui_zero(res, res2, n, x, K, prec)
    ccall((:arb_hypgeom_legendre_p_ui_zero, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint, Cint), res, res2, n, x, K, prec)
end

function arb_hypgeom_legendre_p_ui(res, res_prime, n, x, prec)
    ccall((:arb_hypgeom_legendre_p_ui, libarb), Cvoid, (arb_t, arb_t, Cint, arb_t, Cint), res, res_prime, n, x, prec)
end

function arb_hypgeom_legendre_p_ui_root(res, weight, n, k, prec)
    ccall((:arb_hypgeom_legendre_p_ui_root, libarb), Cvoid, (arb_t, arb_t, Cint, Cint, Cint), res, weight, n, k, prec)
end

function arb_hypgeom_central_bin_ui(res, n, prec)
    ccall((:arb_hypgeom_central_bin_ui, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end

function arb_hypgeom_dilog(res, z, prec)
    ccall((:arb_hypgeom_dilog, libarb), Cvoid, (arb_t, arb_t, Cint), res, z, prec)
end
# Julia wrapper for header: arb_mat.h
# Automatically generated using Clang.jl


function arb_mat_entry_ptr(mat, i, j)
    ccall((:arb_mat_entry_ptr, libarb), arb_ptr, (arb_mat_t, Cint, Cint), mat, i, j)
end

function arb_mat_init(mat, r, c)
    ccall((:arb_mat_init, libarb), Cvoid, (arb_mat_t, Cint, Cint), mat, r, c)
end

function arb_mat_clear(mat)
    ccall((:arb_mat_clear, libarb), Cvoid, (arb_mat_t,), mat)
end

function arb_mat_swap(mat1, mat2)
    ccall((:arb_mat_swap, libarb), Cvoid, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_window_init(window, mat, r1, c1, r2, c2)
    ccall((:arb_mat_window_init, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint, Cint, Cint), window, mat, r1, c1, r2, c2)
end

function arb_mat_window_clear(window)
    ccall((:arb_mat_window_clear, libarb), Cvoid, (arb_mat_t,), window)
end

function arb_mat_set(dest, src)
    ccall((:arb_mat_set, libarb), Cvoid, (arb_mat_t, arb_mat_t), dest, src)
end

function arb_mat_set_fmpz_mat(dest, src)
    ccall((:arb_mat_set_fmpz_mat, libarb), Cvoid, (arb_mat_t, Cint), dest, src)
end

function arb_mat_set_round_fmpz_mat(dest, src, prec)
    ccall((:arb_mat_set_round_fmpz_mat, libarb), Cvoid, (arb_mat_t, Cint, Cint), dest, src, prec)
end

function arb_mat_set_fmpq_mat(dest, src, prec)
    ccall((:arb_mat_set_fmpq_mat, libarb), Cvoid, (arb_mat_t, Cint, Cint), dest, src, prec)
end

function arb_mat_randtest(mat, state, prec, mag_bits)
    ccall((:arb_mat_randtest, libarb), Cvoid, (arb_mat_t, Cint, Cint, Cint), mat, state, prec, mag_bits)
end

function arb_mat_fprintd(file, mat, digits)
    ccall((:arb_mat_fprintd, libarb), Cvoid, (Ptr{Cint}, arb_mat_t, Cint), file, mat, digits)
end

function arb_mat_printd(mat, digits)
    ccall((:arb_mat_printd, libarb), Cvoid, (arb_mat_t, Cint), mat, digits)
end

function arb_mat_eq(mat1, mat2)
    ccall((:arb_mat_eq, libarb), Cint, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_ne(mat1, mat2)
    ccall((:arb_mat_ne, libarb), Cint, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_equal(mat1, mat2)
    ccall((:arb_mat_equal, libarb), Cint, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_overlaps(mat1, mat2)
    ccall((:arb_mat_overlaps, libarb), Cint, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_contains(mat1, mat2)
    ccall((:arb_mat_contains, libarb), Cint, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_contains_fmpq_mat(mat1, mat2)
    ccall((:arb_mat_contains_fmpq_mat, libarb), Cint, (arb_mat_t, Cint), mat1, mat2)
end

function arb_mat_contains_fmpz_mat(mat1, mat2)
    ccall((:arb_mat_contains_fmpz_mat, libarb), Cint, (arb_mat_t, Cint), mat1, mat2)
end

function arb_mat_is_empty(mat)
    ccall((:arb_mat_is_empty, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_square(mat)
    ccall((:arb_mat_is_square, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_exact(A)
    ccall((:arb_mat_is_exact, libarb), Cint, (arb_mat_t,), A)
end

function arb_mat_is_zero(mat)
    ccall((:arb_mat_is_zero, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_finite(mat)
    ccall((:arb_mat_is_finite, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_triu(mat)
    ccall((:arb_mat_is_triu, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_tril(mat)
    ccall((:arb_mat_is_tril, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_is_diag(mat)
    ccall((:arb_mat_is_diag, libarb), Cint, (arb_mat_t,), mat)
end

function arb_mat_get_mid(B, A)
    ccall((:arb_mat_get_mid, libarb), Cvoid, (arb_mat_t, arb_mat_t), B, A)
end

function arb_mat_add_error_mag(mat, err)
    ccall((:arb_mat_add_error_mag, libarb), Cvoid, (arb_mat_t, mag_t), mat, err)
end

function arb_mat_zero(mat)
    ccall((:arb_mat_zero, libarb), Cvoid, (arb_mat_t,), mat)
end

function arb_mat_one(mat)
    ccall((:arb_mat_one, libarb), Cvoid, (arb_mat_t,), mat)
end

function arb_mat_ones(mat)
    ccall((:arb_mat_ones, libarb), Cvoid, (arb_mat_t,), mat)
end

function arb_mat_indeterminate(mat)
    ccall((:arb_mat_indeterminate, libarb), Cvoid, (arb_mat_t,), mat)
end

function arb_mat_hilbert(mat, prec)
    ccall((:arb_mat_hilbert, libarb), Cvoid, (arb_mat_t, Cint), mat, prec)
end

function arb_mat_pascal(mat, triangular, prec)
    ccall((:arb_mat_pascal, libarb), Cvoid, (arb_mat_t, Cint, Cint), mat, triangular, prec)
end

function arb_mat_stirling(mat, kind, prec)
    ccall((:arb_mat_stirling, libarb), Cvoid, (arb_mat_t, Cint, Cint), mat, kind, prec)
end

function arb_mat_dct(mat, type, prec)
    ccall((:arb_mat_dct, libarb), Cvoid, (arb_mat_t, Cint, Cint), mat, type, prec)
end

function arb_mat_transpose(mat1, mat2)
    ccall((:arb_mat_transpose, libarb), Cvoid, (arb_mat_t, arb_mat_t), mat1, mat2)
end

function arb_mat_bound_inf_norm(b, A)
    ccall((:arb_mat_bound_inf_norm, libarb), Cvoid, (mag_t, arb_mat_t), b, A)
end

function arb_mat_frobenius_norm(res, A, prec)
    ccall((:arb_mat_frobenius_norm, libarb), Cvoid, (arb_t, arb_mat_t, Cint), res, A, prec)
end

function arb_mat_bound_frobenius_norm(b, A)
    ccall((:arb_mat_bound_frobenius_norm, libarb), Cvoid, (mag_t, arb_mat_t), b, A)
end

function arb_mat_neg(dest, src)
    ccall((:arb_mat_neg, libarb), Cvoid, (arb_mat_t, arb_mat_t), dest, src)
end

function arb_mat_add(res, mat1, mat2, prec)
    ccall((:arb_mat_add, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), res, mat1, mat2, prec)
end

function arb_mat_sub(res, mat1, mat2, prec)
    ccall((:arb_mat_sub, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), res, mat1, mat2, prec)
end

function arb_mat_mul(res, mat1, mat2, prec)
    ccall((:arb_mat_mul, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), res, mat1, mat2, prec)
end

function arb_mat_mul_classical(C, A, B, prec)
    ccall((:arb_mat_mul_classical, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), C, A, B, prec)
end

function arb_mat_mul_threaded(C, A, B, prec)
    ccall((:arb_mat_mul_threaded, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), C, A, B, prec)
end

function _arb_mat_addmul_rad_mag_fast(C, A, B, ar, ac, bc)
    ccall((:_arb_mat_addmul_rad_mag_fast, libarb), Cvoid, (arb_mat_t, mag_srcptr, mag_srcptr, Cint, Cint, Cint), C, A, B, ar, ac, bc)
end

function arb_mat_mul_block(C, A, B, prec)
    ccall((:arb_mat_mul_block, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), C, A, B, prec)
end

function arb_mat_mul_entrywise(res, mat1, mat2, prec)
    ccall((:arb_mat_mul_entrywise, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), res, mat1, mat2, prec)
end

function arb_mat_sqr_classical(B, A, prec)
    ccall((:arb_mat_sqr_classical, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), B, A, prec)
end

function arb_mat_sqr(B, A, prec)
    ccall((:arb_mat_sqr, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), B, A, prec)
end

function arb_mat_pow_ui(B, A, exp, prec)
    ccall((:arb_mat_pow_ui, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, exp, prec)
end

function arb_mat_scalar_mul_2exp_si(B, A, c)
    ccall((:arb_mat_scalar_mul_2exp_si, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), B, A, c)
end

function arb_mat_scalar_addmul_si(B, A, c, prec)
    ccall((:arb_mat_scalar_addmul_si, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_mul_si(B, A, c, prec)
    ccall((:arb_mat_scalar_mul_si, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_div_si(B, A, c, prec)
    ccall((:arb_mat_scalar_div_si, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_addmul_fmpz(B, A, c, prec)
    ccall((:arb_mat_scalar_addmul_fmpz, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_mul_fmpz(B, A, c, prec)
    ccall((:arb_mat_scalar_mul_fmpz, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_div_fmpz(B, A, c, prec)
    ccall((:arb_mat_scalar_div_fmpz, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), B, A, c, prec)
end

function arb_mat_scalar_addmul_arb(B, A, c, prec)
    ccall((:arb_mat_scalar_addmul_arb, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_t, Cint), B, A, c, prec)
end

function arb_mat_scalar_mul_arb(B, A, c, prec)
    ccall((:arb_mat_scalar_mul_arb, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_t, Cint), B, A, c, prec)
end

function arb_mat_scalar_div_arb(B, A, c, prec)
    ccall((:arb_mat_scalar_div_arb, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_t, Cint), B, A, c, prec)
end

function arb_mat_swap_rows(mat, perm, r, s)
    ccall((:arb_mat_swap_rows, libarb), Cvoid, (arb_mat_t, Ptr{Cint}, Cint, Cint), mat, perm, r, s)
end

function arb_mat_find_pivot_partial()
    ccall((:arb_mat_find_pivot_partial, libarb), Cint, ())
end

function arb_mat_solve_tril_classical(X, L, B, unit, prec)
    ccall((:arb_mat_solve_tril_classical, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function arb_mat_solve_tril_recursive(X, L, B, unit, prec)
    ccall((:arb_mat_solve_tril_recursive, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function arb_mat_solve_tril(X, L, B, unit, prec)
    ccall((:arb_mat_solve_tril, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function arb_mat_solve_triu_classical(X, U, B, unit, prec)
    ccall((:arb_mat_solve_triu_classical, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function arb_mat_solve_triu_recursive(X, U, B, unit, prec)
    ccall((:arb_mat_solve_triu_recursive, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function arb_mat_solve_triu(X, U, B, unit, prec)
    ccall((:arb_mat_solve_triu, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function arb_mat_lu_classical(P, LU, A, prec)
    ccall((:arb_mat_lu_classical, libarb), Cint, (Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), P, LU, A, prec)
end

function arb_mat_lu_recursive(P, LU, A, prec)
    ccall((:arb_mat_lu_recursive, libarb), Cint, (Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), P, LU, A, prec)
end

function arb_mat_lu(P, LU, A, prec)
    ccall((:arb_mat_lu, libarb), Cint, (Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), P, LU, A, prec)
end

function arb_mat_solve_lu_precomp(X, perm, A, B, prec)
    ccall((:arb_mat_solve_lu_precomp, libarb), Cvoid, (arb_mat_t, Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), X, perm, A, B, prec)
end

function arb_mat_solve(X, A, B, prec)
    ccall((:arb_mat_solve, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, prec)
end

function arb_mat_solve_lu(X, A, B, prec)
    ccall((:arb_mat_solve_lu, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, prec)
end

function arb_mat_solve_precond(X, A, B, prec)
    ccall((:arb_mat_solve_precond, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, prec)
end

function arb_mat_solve_preapprox(X, A, B, R, T, prec)
    ccall((:arb_mat_solve_preapprox, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, R, T, prec)
end

function arb_mat_approx_mul(C, A, B, prec)
    ccall((:arb_mat_approx_mul, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), C, A, B, prec)
end

function arb_mat_approx_solve_triu(X, U, B, unit, prec)
    ccall((:arb_mat_approx_solve_triu, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, U, B, unit, prec)
end

function arb_mat_approx_solve_tril(X, L, B, unit, prec)
    ccall((:arb_mat_approx_solve_tril, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint, Cint), X, L, B, unit, prec)
end

function arb_mat_approx_lu(P, LU, A, prec)
    ccall((:arb_mat_approx_lu, libarb), Cint, (Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), P, LU, A, prec)
end

function arb_mat_approx_solve_lu_precomp(X, perm, A, B, prec)
    ccall((:arb_mat_approx_solve_lu_precomp, libarb), Cvoid, (arb_mat_t, Ptr{Cint}, arb_mat_t, arb_mat_t, Cint), X, perm, A, B, prec)
end

function arb_mat_approx_solve(X, A, B, prec)
    ccall((:arb_mat_approx_solve, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, prec)
end

function arb_mat_approx_inv(X, A, prec)
    ccall((:arb_mat_approx_inv, libarb), Cint, (arb_mat_t, arb_mat_t, Cint), X, A, prec)
end

function arb_mat_inv(X, A, prec)
    ccall((:arb_mat_inv, libarb), Cint, (arb_mat_t, arb_mat_t, Cint), X, A, prec)
end

function arb_mat_det_lu(det, A, prec)
    ccall((:arb_mat_det_lu, libarb), Cvoid, (arb_t, arb_mat_t, Cint), det, A, prec)
end

function arb_mat_det_precond(det, A, prec)
    ccall((:arb_mat_det_precond, libarb), Cvoid, (arb_t, arb_mat_t, Cint), det, A, prec)
end

function arb_mat_det(det, A, prec)
    ccall((:arb_mat_det, libarb), Cvoid, (arb_t, arb_mat_t, Cint), det, A, prec)
end

function _arb_mat_cholesky_banachiewicz(A, prec)
    ccall((:_arb_mat_cholesky_banachiewicz, libarb), Cint, (arb_mat_t, Cint), A, prec)
end

function arb_mat_cho(L, A, prec)
    ccall((:arb_mat_cho, libarb), Cint, (arb_mat_t, arb_mat_t, Cint), L, A, prec)
end

function arb_mat_solve_cho_precomp(X, L, B, prec)
    ccall((:arb_mat_solve_cho_precomp, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, L, B, prec)
end

function arb_mat_inv_cho_precomp(X, L, prec)
    ccall((:arb_mat_inv_cho_precomp, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), X, L, prec)
end

function arb_mat_spd_solve(X, A, B, prec)
    ccall((:arb_mat_spd_solve, libarb), Cint, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, A, B, prec)
end

function arb_mat_spd_inv(X, A, prec)
    ccall((:arb_mat_spd_inv, libarb), Cint, (arb_mat_t, arb_mat_t, Cint), X, A, prec)
end

function _arb_mat_ldl_inplace(A, prec)
    ccall((:_arb_mat_ldl_inplace, libarb), Cint, (arb_mat_t, Cint), A, prec)
end

function _arb_mat_ldl_golub_and_van_loan(A, prec)
    ccall((:_arb_mat_ldl_golub_and_van_loan, libarb), Cint, (arb_mat_t, Cint), A, prec)
end

function arb_mat_ldl(L, A, prec)
    ccall((:arb_mat_ldl, libarb), Cint, (arb_mat_t, arb_mat_t, Cint), L, A, prec)
end

function arb_mat_solve_ldl_precomp(X, L, B, prec)
    ccall((:arb_mat_solve_ldl_precomp, libarb), Cvoid, (arb_mat_t, arb_mat_t, arb_mat_t, Cint), X, L, B, prec)
end

function arb_mat_inv_ldl_precomp(X, L, prec)
    ccall((:arb_mat_inv_ldl_precomp, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), X, L, prec)
end

function arb_mat_exp_taylor_sum(S, A, N, prec)
    ccall((:arb_mat_exp_taylor_sum, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint, Cint), S, A, N, prec)
end

function arb_mat_exp(B, A, prec)
    ccall((:arb_mat_exp, libarb), Cvoid, (arb_mat_t, arb_mat_t, Cint), B, A, prec)
end

function _arb_mat_charpoly(poly, mat, prec)
    ccall((:_arb_mat_charpoly, libarb), Cvoid, (arb_ptr, arb_mat_t, Cint), poly, mat, prec)
end

function arb_mat_charpoly(poly, mat, prec)
    ccall((:arb_mat_charpoly, libarb), Cvoid, (arb_poly_t, arb_mat_t, Cint), poly, mat, prec)
end

function _arb_mat_companion(mat, poly, prec)
    ccall((:_arb_mat_companion, libarb), Cvoid, (arb_mat_t, arb_srcptr, Cint), mat, poly, prec)
end

function arb_mat_companion(mat, poly, prec)
    ccall((:arb_mat_companion, libarb), Cvoid, (arb_mat_t, arb_poly_t, Cint), mat, poly, prec)
end

function arb_mat_trace(trace, mat, prec)
    ccall((:arb_mat_trace, libarb), Cvoid, (arb_t, arb_mat_t, Cint), trace, mat, prec)
end

function _arb_mat_diag_prod(res, A, a, b, prec)
    ccall((:_arb_mat_diag_prod, libarb), Cvoid, (arb_t, arb_mat_t, Cint, Cint, Cint), res, A, a, b, prec)
end

function arb_mat_diag_prod(res, A, prec)
    ccall((:arb_mat_diag_prod, libarb), Cvoid, (arb_t, arb_mat_t, Cint), res, A, prec)
end

function arb_mat_entrywise_is_zero(dest, src)
    ccall((:arb_mat_entrywise_is_zero, libarb), Cvoid, (Cint, arb_mat_t), dest, src)
end

function arb_mat_entrywise_not_is_zero(dest, src)
    ccall((:arb_mat_entrywise_not_is_zero, libarb), Cvoid, (Cint, arb_mat_t), dest, src)
end

function arb_mat_count_is_zero()
    ccall((:arb_mat_count_is_zero, libarb), Cint, ())
end

function arb_mat_count_not_is_zero()
    ccall((:arb_mat_count_not_is_zero, libarb), Cint, ())
end

function arb_mat_allocated_bytes()
    ccall((:arb_mat_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: arb_poly.h
# Automatically generated using Clang.jl


function arb_poly_init(poly)
    ccall((:arb_poly_init, libarb), Cvoid, (arb_poly_t,), poly)
end

function arb_poly_init2(poly, len)
    ccall((:arb_poly_init2, libarb), Cvoid, (arb_poly_t, Cint), poly, len)
end

function arb_poly_clear(poly)
    ccall((:arb_poly_clear, libarb), Cvoid, (arb_poly_t,), poly)
end

function arb_poly_fit_length(poly, len)
    ccall((:arb_poly_fit_length, libarb), Cvoid, (arb_poly_t, Cint), poly, len)
end

function _arb_poly_set_length(poly, len)
    ccall((:_arb_poly_set_length, libarb), Cvoid, (arb_poly_t, Cint), poly, len)
end

function _arb_poly_normalise(poly)
    ccall((:_arb_poly_normalise, libarb), Cvoid, (arb_poly_t,), poly)
end

function arb_poly_swap(poly1, poly2)
    ccall((:arb_poly_swap, libarb), Cvoid, (arb_poly_t, arb_poly_t), poly1, poly2)
end

function arb_poly_set(poly, src)
    ccall((:arb_poly_set, libarb), Cvoid, (arb_poly_t, arb_poly_t), poly, src)
end

function arb_poly_set_round(poly, src, prec)
    ccall((:arb_poly_set_round, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), poly, src, prec)
end

function arb_poly_set_trunc(res, poly, n)
    ccall((:arb_poly_set_trunc, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, n)
end

function arb_poly_set_trunc_round(res, poly, n, prec)
    ccall((:arb_poly_set_trunc_round, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, poly, n, prec)
end

function arb_poly_length()
    ccall((:arb_poly_length, libarb), Cint, ())
end

function arb_poly_degree()
    ccall((:arb_poly_degree, libarb), Cint, ())
end

function arb_poly_valuation()
    ccall((:arb_poly_valuation, libarb), Cint, ())
end

function arb_poly_is_zero(z)
    ccall((:arb_poly_is_zero, libarb), Cint, (arb_poly_t,), z)
end

function arb_poly_is_one(z)
    ccall((:arb_poly_is_one, libarb), Cint, (arb_poly_t,), z)
end

function arb_poly_is_x(z)
    ccall((:arb_poly_is_x, libarb), Cint, (arb_poly_t,), z)
end

function arb_poly_zero(poly)
    ccall((:arb_poly_zero, libarb), Cvoid, (arb_poly_t,), poly)
end

function arb_poly_one(poly)
    ccall((:arb_poly_one, libarb), Cvoid, (arb_poly_t,), poly)
end

function arb_poly_set_coeff_si(poly, n, x)
    ccall((:arb_poly_set_coeff_si, libarb), Cvoid, (arb_poly_t, Cint, Cint), poly, n, x)
end

function arb_poly_set_coeff_arb(poly, n, x)
    ccall((:arb_poly_set_coeff_arb, libarb), Cvoid, (arb_poly_t, Cint, arb_t), poly, n, x)
end

function arb_poly_get_coeff_arb(x, poly, n)
    ccall((:arb_poly_get_coeff_arb, libarb), Cvoid, (arb_t, arb_poly_t, Cint), x, poly, n)
end

function _arb_poly_reverse(res, poly, len, n)
    ccall((:_arb_poly_reverse, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, n)
end

function _arb_poly_shift_right(res, poly, len, n)
    ccall((:_arb_poly_shift_right, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, n)
end

function arb_poly_shift_right(res, poly, n)
    ccall((:arb_poly_shift_right, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, n)
end

function _arb_poly_shift_left(res, poly, len, n)
    ccall((:_arb_poly_shift_left, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, n)
end

function arb_poly_shift_left(res, poly, n)
    ccall((:arb_poly_shift_left, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, n)
end

function arb_poly_truncate(poly, newlen)
    ccall((:arb_poly_truncate, libarb), Cvoid, (arb_poly_t, Cint), poly, newlen)
end

function arb_poly_set_fmpz_poly(poly, src, prec)
    ccall((:arb_poly_set_fmpz_poly, libarb), Cvoid, (arb_poly_t, Cint, Cint), poly, src, prec)
end

function arb_poly_set_fmpq_poly(poly, src, prec)
    ccall((:arb_poly_set_fmpq_poly, libarb), Cvoid, (arb_poly_t, Cint, Cint), poly, src, prec)
end

function arb_poly_set_arb(poly, c)
    ccall((:arb_poly_set_arb, libarb), Cvoid, (arb_poly_t, arb_t), poly, c)
end

function arb_poly_set_si(poly, c)
    ccall((:arb_poly_set_si, libarb), Cvoid, (arb_poly_t, Cint), poly, c)
end

function arb_poly_get_unique_fmpz_poly(res, src)
    ccall((:arb_poly_get_unique_fmpz_poly, libarb), Cint, (Cint, arb_poly_t), res, src)
end

function arb_poly_contains(poly1, poly2)
    ccall((:arb_poly_contains, libarb), Cint, (arb_poly_t, arb_poly_t), poly1, poly2)
end

function arb_poly_contains_fmpz_poly(poly1, poly2)
    ccall((:arb_poly_contains_fmpz_poly, libarb), Cint, (arb_poly_t, Cint), poly1, poly2)
end

function arb_poly_contains_fmpq_poly(poly1, poly2)
    ccall((:arb_poly_contains_fmpq_poly, libarb), Cint, (arb_poly_t, Cint), poly1, poly2)
end

function arb_poly_equal(A, B)
    ccall((:arb_poly_equal, libarb), Cint, (arb_poly_t, arb_poly_t), A, B)
end

function _arb_poly_overlaps(poly1, len1, poly2, len2)
    ccall((:_arb_poly_overlaps, libarb), Cint, (arb_srcptr, Cint, arb_srcptr, Cint), poly1, len1, poly2, len2)
end

function arb_poly_overlaps(poly1, poly2)
    ccall((:arb_poly_overlaps, libarb), Cint, (arb_poly_t, arb_poly_t), poly1, poly2)
end

function _arb_poly_majorant(res, vec, len, prec)
    ccall((:_arb_poly_majorant, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, vec, len, prec)
end

function arb_poly_majorant(res, poly, prec)
    ccall((:arb_poly_majorant, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, prec)
end

function arb_poly_fprintd(file, poly, digits)
    ccall((:arb_poly_fprintd, libarb), Cvoid, (Ptr{Cint}, arb_poly_t, Cint), file, poly, digits)
end

function arb_poly_printd(poly, digits)
    ccall((:arb_poly_printd, libarb), Cvoid, (arb_poly_t, Cint), poly, digits)
end

function arb_poly_randtest(poly, state, len, prec, mag_bits)
    ccall((:arb_poly_randtest, libarb), Cvoid, (arb_poly_t, Cint, Cint, Cint, Cint), poly, state, len, prec, mag_bits)
end

function _arb_poly_add(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_add, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function arb_poly_add(res, poly1, poly2, prec)
    ccall((:arb_poly_add, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function arb_poly_add_si(res, poly, c, prec)
    ccall((:arb_poly_add_si, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, poly, c, prec)
end

function _arb_poly_sub(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_sub, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function arb_poly_sub(res, poly1, poly2, prec)
    ccall((:arb_poly_sub, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function arb_poly_add_series(res, poly1, poly2, len, prec)
    ccall((:arb_poly_add_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function arb_poly_sub_series(res, poly1, poly2, len, prec)
    ccall((:arb_poly_sub_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function arb_poly_neg(res, poly)
    ccall((:arb_poly_neg, libarb), Cvoid, (arb_poly_t, arb_poly_t), res, poly)
end

function arb_poly_scalar_mul_2exp_si(res, poly, c)
    ccall((:arb_poly_scalar_mul_2exp_si, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, c)
end

function arb_poly_scalar_mul(res, poly, c, prec)
    ccall((:arb_poly_scalar_mul, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), res, poly, c, prec)
end

function arb_poly_scalar_div(res, poly, c, prec)
    ccall((:arb_poly_scalar_div, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), res, poly, c, prec)
end

function _arb_poly_mullow_ztrunc(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_arb_poly_mullow_ztrunc, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function arb_poly_mullow_ztrunc(res, poly1, poly2, n, prec)
    ccall((:arb_poly_mullow_ztrunc, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _arb_poly_mullow_classical(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_arb_poly_mullow_classical, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function arb_poly_mullow_classical(res, poly1, poly2, n, prec)
    ccall((:arb_poly_mullow_classical, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _arb_poly_mullow_block(C, A, lenA, B, lenB, n, prec)
    ccall((:_arb_poly_mullow_block, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), C, A, lenA, B, lenB, n, prec)
end

function arb_poly_mullow_block(res, poly1, poly2, len, prec)
    ccall((:arb_poly_mullow_block, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function _arb_poly_mullow(C, A, lenA, B, lenB, n, prec)
    ccall((:_arb_poly_mullow, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), C, A, lenA, B, lenB, n, prec)
end

function arb_poly_mullow(res, poly1, poly2, len, prec)
    ccall((:arb_poly_mullow, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, len, prec)
end

function _arb_poly_mul(C, A, lenA, B, lenB, prec)
    ccall((:_arb_poly_mul, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), C, A, lenA, B, lenB, prec)
end

function arb_poly_mul(res, poly1, poly2, prec)
    ccall((:arb_poly_mul, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function _arb_poly_mul_monic(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_mul_monic, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function _arb_poly_inv_series(Qinv, Q, Qlen, len, prec)
    ccall((:_arb_poly_inv_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, len, prec)
end

function arb_poly_inv_series(Qinv, Q, n, prec)
    ccall((:arb_poly_inv_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _arb_poly_div_series(Q, A, Alen, B, Blen, n, prec)
    ccall((:_arb_poly_div_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), Q, A, Alen, B, Blen, n, prec)
end

function arb_poly_div_series(Q, A, B, n, prec)
    ccall((:arb_poly_div_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), Q, A, B, n, prec)
end

function _arb_poly_div(Q, A, lenA, B, lenB, prec)
    ccall((:_arb_poly_div, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), Q, A, lenA, B, lenB, prec)
end

function _arb_poly_divrem(Q, R, A, lenA, B, lenB, prec)
    ccall((:_arb_poly_divrem, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), Q, R, A, lenA, B, lenB, prec)
end

function _arb_poly_rem(R, A, lenA, B, lenB, prec)
    ccall((:_arb_poly_rem, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), R, A, lenA, B, lenB, prec)
end

function arb_poly_divrem(Q, R, A, B, prec)
    ccall((:arb_poly_divrem, libarb), Cint, (arb_poly_t, arb_poly_t, arb_poly_t, arb_poly_t, Cint), Q, R, A, B, prec)
end

function _arb_poly_div_root(Q, R, A, len, c, prec)
    ccall((:_arb_poly_div_root, libarb), Cvoid, (arb_ptr, arb_t, arb_srcptr, Cint, arb_t, Cint), Q, R, A, len, c, prec)
end

function _arb_poly_product_roots(poly, xs, n, prec)
    ccall((:_arb_poly_product_roots, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), poly, xs, n, prec)
end

function arb_poly_product_roots(poly, xs, n, prec)
    ccall((:arb_poly_product_roots, libarb), Cvoid, (arb_poly_t, arb_srcptr, Cint, Cint), poly, xs, n, prec)
end

function _arb_poly_product_roots_complex(poly, r, rn, c, cn, prec)
    ccall((:_arb_poly_product_roots_complex, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, acb_srcptr, Cint, Cint), poly, r, rn, c, cn, prec)
end

function arb_poly_product_roots_complex(poly, r, rn, c, cn, prec)
    ccall((:arb_poly_product_roots_complex, libarb), Cvoid, (arb_poly_t, arb_srcptr, Cint, acb_srcptr, Cint, Cint), poly, r, rn, c, cn, prec)
end

function _arb_poly_tree_alloc(len)
    ccall((:_arb_poly_tree_alloc, libarb), Ptr{arb_ptr}, (Cint,), len)
end

function _arb_poly_tree_free(tree, len)
    ccall((:_arb_poly_tree_free, libarb), Cvoid, (Ptr{arb_ptr}, Cint), tree, len)
end

function _arb_poly_tree_build(tree, roots, len, prec)
    ccall((:_arb_poly_tree_build, libarb), Cvoid, (Ptr{arb_ptr}, arb_srcptr, Cint, Cint), tree, roots, len, prec)
end

function _arb_poly_taylor_shift_horner(poly, c, n, prec)
    ccall((:_arb_poly_taylor_shift_horner, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), poly, c, n, prec)
end

function arb_poly_taylor_shift_horner(g, f, c, prec)
    ccall((:arb_poly_taylor_shift_horner, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), g, f, c, prec)
end

function _arb_poly_taylor_shift_divconquer(poly, c, n, prec)
    ccall((:_arb_poly_taylor_shift_divconquer, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), poly, c, n, prec)
end

function arb_poly_taylor_shift_divconquer(g, f, c, prec)
    ccall((:arb_poly_taylor_shift_divconquer, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), g, f, c, prec)
end

function _arb_poly_taylor_shift_convolution(poly, c, n, prec)
    ccall((:_arb_poly_taylor_shift_convolution, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), poly, c, n, prec)
end

function arb_poly_taylor_shift_convolution(g, f, c, prec)
    ccall((:arb_poly_taylor_shift_convolution, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), g, f, c, prec)
end

function _arb_poly_taylor_shift(poly, c, n, prec)
    ccall((:_arb_poly_taylor_shift, libarb), Cvoid, (arb_ptr, arb_t, Cint, Cint), poly, c, n, prec)
end

function arb_poly_taylor_shift(g, f, c, prec)
    ccall((:arb_poly_taylor_shift, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint), g, f, c, prec)
end

function _arb_poly_compose(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_compose, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function arb_poly_compose(res, poly1, poly2, prec)
    ccall((:arb_poly_compose, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function _arb_poly_compose_horner(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_compose_horner, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function arb_poly_compose_horner(res, poly1, poly2, prec)
    ccall((:arb_poly_compose_horner, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function _arb_poly_compose_divconquer(res, poly1, len1, poly2, len2, prec)
    ccall((:_arb_poly_compose_divconquer, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), res, poly1, len1, poly2, len2, prec)
end

function arb_poly_compose_divconquer(res, poly1, poly2, prec)
    ccall((:arb_poly_compose_divconquer, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint), res, poly1, poly2, prec)
end

function _arb_poly_compose_series_horner(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_arb_poly_compose_series_horner, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function arb_poly_compose_series_horner(res, poly1, poly2, n, prec)
    ccall((:arb_poly_compose_series_horner, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _arb_poly_compose_series(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_arb_poly_compose_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function arb_poly_compose_series(res, poly1, poly2, n, prec)
    ccall((:arb_poly_compose_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _arb_poly_revert_series_lagrange(Qinv, Q, Qlen, n, prec)
    ccall((:_arb_poly_revert_series_lagrange, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function arb_poly_revert_series_lagrange(Qinv, Q, n, prec)
    ccall((:arb_poly_revert_series_lagrange, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _arb_poly_revert_series_newton(Qinv, Q, Qlen, n, prec)
    ccall((:_arb_poly_revert_series_newton, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function arb_poly_revert_series_newton(Qinv, Q, n, prec)
    ccall((:arb_poly_revert_series_newton, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _arb_poly_revert_series_lagrange_fast(Qinv, Q, Qlen, n, prec)
    ccall((:_arb_poly_revert_series_lagrange_fast, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function arb_poly_revert_series_lagrange_fast(Qinv, Q, n, prec)
    ccall((:arb_poly_revert_series_lagrange_fast, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _arb_poly_revert_series(Qinv, Q, Qlen, n, prec)
    ccall((:_arb_poly_revert_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), Qinv, Q, Qlen, n, prec)
end

function arb_poly_revert_series(Qinv, Q, n, prec)
    ccall((:arb_poly_revert_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), Qinv, Q, n, prec)
end

function _arb_poly_evaluate_horner(res, f, len, a, prec)
    ccall((:_arb_poly_evaluate_horner, libarb), Cvoid, (arb_t, arb_srcptr, Cint, arb_t, Cint), res, f, len, a, prec)
end

function arb_poly_evaluate_horner(res, f, a, prec)
    ccall((:arb_poly_evaluate_horner, libarb), Cvoid, (arb_t, arb_poly_t, arb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate_rectangular(y, poly, len, x, prec)
    ccall((:_arb_poly_evaluate_rectangular, libarb), Cvoid, (arb_t, arb_srcptr, Cint, arb_t, Cint), y, poly, len, x, prec)
end

function arb_poly_evaluate_rectangular(res, f, a, prec)
    ccall((:arb_poly_evaluate_rectangular, libarb), Cvoid, (arb_t, arb_poly_t, arb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate(res, f, len, a, prec)
    ccall((:_arb_poly_evaluate, libarb), Cvoid, (arb_t, arb_srcptr, Cint, arb_t, Cint), res, f, len, a, prec)
end

function arb_poly_evaluate(res, f, a, prec)
    ccall((:arb_poly_evaluate, libarb), Cvoid, (arb_t, arb_poly_t, arb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate2_horner(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2_horner, libarb), Cvoid, (arb_t, arb_t, arb_srcptr, Cint, arb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2_horner(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2_horner, libarb), Cvoid, (arb_t, arb_t, arb_poly_t, arb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_evaluate2_rectangular(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2_rectangular, libarb), Cvoid, (arb_t, arb_t, arb_srcptr, Cint, arb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2_rectangular(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2_rectangular, libarb), Cvoid, (arb_t, arb_t, arb_poly_t, arb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_evaluate2(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2, libarb), Cvoid, (arb_t, arb_t, arb_srcptr, Cint, arb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2, libarb), Cvoid, (arb_t, arb_t, arb_poly_t, arb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_evaluate_vec_iter(ys, poly, plen, xs, n, prec)
    ccall((:_arb_poly_evaluate_vec_iter, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), ys, poly, plen, xs, n, prec)
end

function arb_poly_evaluate_vec_iter(ys, poly, xs, n, prec)
    ccall((:arb_poly_evaluate_vec_iter, libarb), Cvoid, (arb_ptr, arb_poly_t, arb_srcptr, Cint, Cint), ys, poly, xs, n, prec)
end

function _arb_poly_evaluate_vec_fast_precomp(vs, poly, plen, tree, len, prec)
    ccall((:_arb_poly_evaluate_vec_fast_precomp, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Ptr{arb_ptr}, Cint, Cint), vs, poly, plen, tree, len, prec)
end

function _arb_poly_evaluate_vec_fast(ys, poly, plen, xs, n, prec)
    ccall((:_arb_poly_evaluate_vec_fast, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint), ys, poly, plen, xs, n, prec)
end

function arb_poly_evaluate_vec_fast(ys, poly, xs, n, prec)
    ccall((:arb_poly_evaluate_vec_fast, libarb), Cvoid, (arb_ptr, arb_poly_t, arb_srcptr, Cint, Cint), ys, poly, xs, n, prec)
end

function _arb_poly_interpolate_newton(poly, xs, ys, n, prec)
    ccall((:_arb_poly_interpolate_newton, libarb), Cvoid, (arb_ptr, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function arb_poly_interpolate_newton(poly, xs, ys, n, prec)
    ccall((:arb_poly_interpolate_newton, libarb), Cvoid, (arb_poly_t, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _arb_poly_interpolate_barycentric(poly, xs, ys, n, prec)
    ccall((:_arb_poly_interpolate_barycentric, libarb), Cvoid, (arb_ptr, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function arb_poly_interpolate_barycentric(poly, xs, ys, n, prec)
    ccall((:arb_poly_interpolate_barycentric, libarb), Cvoid, (arb_poly_t, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _arb_poly_interpolation_weights(w, tree, len, prec)
    ccall((:_arb_poly_interpolation_weights, libarb), Cvoid, (arb_ptr, Ptr{arb_ptr}, Cint, Cint), w, tree, len, prec)
end

function _arb_poly_interpolate_fast_precomp(poly, ys, tree, weights, len, prec)
    ccall((:_arb_poly_interpolate_fast_precomp, libarb), Cvoid, (arb_ptr, arb_srcptr, Ptr{arb_ptr}, arb_srcptr, Cint, Cint), poly, ys, tree, weights, len, prec)
end

function _arb_poly_interpolate_fast(poly, xs, ys, len, prec)
    ccall((:_arb_poly_interpolate_fast, libarb), Cvoid, (arb_ptr, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, len, prec)
end

function arb_poly_interpolate_fast(poly, xs, ys, n, prec)
    ccall((:arb_poly_interpolate_fast, libarb), Cvoid, (arb_poly_t, arb_srcptr, arb_srcptr, Cint, Cint), poly, xs, ys, n, prec)
end

function _arb_poly_derivative(res, poly, len, prec)
    ccall((:_arb_poly_derivative, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, prec)
end

function arb_poly_derivative(res, poly, prec)
    ccall((:arb_poly_derivative, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, prec)
end

function _arb_poly_integral(res, poly, len, prec)
    ccall((:_arb_poly_integral, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, prec)
end

function arb_poly_integral(res, poly, prec)
    ccall((:arb_poly_integral, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, prec)
end

function arb_poly_borel_transform(res, poly, prec)
    ccall((:arb_poly_borel_transform, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, prec)
end

function _arb_poly_borel_transform(res, poly, len, prec)
    ccall((:_arb_poly_borel_transform, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, prec)
end

function arb_poly_inv_borel_transform(res, poly, prec)
    ccall((:arb_poly_inv_borel_transform, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint), res, poly, prec)
end

function _arb_poly_inv_borel_transform(res, poly, len, prec)
    ccall((:_arb_poly_inv_borel_transform, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint), res, poly, len, prec)
end

function _arb_poly_binomial_transform_basecase(b, a, alen, len, prec)
    ccall((:_arb_poly_binomial_transform_basecase, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function arb_poly_binomial_transform_basecase(b, a, len, prec)
    ccall((:arb_poly_binomial_transform_basecase, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), b, a, len, prec)
end

function _arb_poly_binomial_transform_convolution(b, a, alen, len, prec)
    ccall((:_arb_poly_binomial_transform_convolution, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function arb_poly_binomial_transform_convolution(b, a, len, prec)
    ccall((:arb_poly_binomial_transform_convolution, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), b, a, len, prec)
end

function _arb_poly_binomial_transform(b, a, alen, len, prec)
    ccall((:_arb_poly_binomial_transform, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), b, a, alen, len, prec)
end

function arb_poly_binomial_transform(b, a, len, prec)
    ccall((:arb_poly_binomial_transform, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), b, a, len, prec)
end

function _arb_poly_pow_ui_trunc_binexp(res, f, flen, exp, len, prec)
    ccall((:_arb_poly_pow_ui_trunc_binexp, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), res, f, flen, exp, len, prec)
end

function arb_poly_pow_ui_trunc_binexp(res, poly, exp, len, prec)
    ccall((:arb_poly_pow_ui_trunc_binexp, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint, Cint), res, poly, exp, len, prec)
end

function _arb_poly_pow_ui(res, f, flen, exp, prec)
    ccall((:_arb_poly_pow_ui, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, exp, prec)
end

function arb_poly_pow_ui(res, poly, exp, prec)
    ccall((:arb_poly_pow_ui, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, poly, exp, prec)
end

function _arb_poly_pow_series(h, f, flen, g, glen, len, prec)
    ccall((:_arb_poly_pow_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), h, f, flen, g, glen, len, prec)
end

function arb_poly_pow_series(h, f, g, len, prec)
    ccall((:arb_poly_pow_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), h, f, g, len, prec)
end

function _arb_poly_pow_arb_series(h, f, flen, g, len, prec)
    ccall((:_arb_poly_pow_arb_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint, Cint), h, f, flen, g, len, prec)
end

function arb_poly_pow_arb_series(h, f, g, len, prec)
    ccall((:arb_poly_pow_arb_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint, Cint), h, f, g, len, prec)
end

function _arb_poly_binomial_pow_arb_series(h, f, flen, g, len, prec)
    ccall((:_arb_poly_binomial_pow_arb_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint, Cint), h, f, flen, g, len, prec)
end

function _arb_poly_rsqrt_series(g, h, hlen, len, prec)
    ccall((:_arb_poly_rsqrt_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_poly_rsqrt_series(g, h, n, prec)
    ccall((:arb_poly_rsqrt_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_sqrt_series(g, h, hlen, len, prec)
    ccall((:_arb_poly_sqrt_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_poly_sqrt_series(g, h, n, prec)
    ccall((:arb_poly_sqrt_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_log_series(res, f, flen, n, prec)
    ccall((:_arb_poly_log_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function arb_poly_log_series(res, f, n, prec)
    ccall((:arb_poly_log_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_log1p_series(res, f, flen, n, prec)
    ccall((:_arb_poly_log1p_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function arb_poly_log1p_series(res, f, n, prec)
    ccall((:arb_poly_log1p_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_atan_series(res, f, flen, n, prec)
    ccall((:_arb_poly_atan_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function arb_poly_atan_series(res, f, n, prec)
    ccall((:arb_poly_atan_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_asin_series(res, f, flen, n, prec)
    ccall((:_arb_poly_asin_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function arb_poly_asin_series(res, f, n, prec)
    ccall((:arb_poly_asin_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_acos_series(res, f, flen, n, prec)
    ccall((:_arb_poly_acos_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, f, flen, n, prec)
end

function arb_poly_acos_series(res, f, n, prec)
    ccall((:arb_poly_acos_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_exp_series_basecase(f, h, hlen, n, prec)
    ccall((:_arb_poly_exp_series_basecase, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), f, h, hlen, n, prec)
end

function arb_poly_exp_series_basecase(f, h, n, prec)
    ccall((:arb_poly_exp_series_basecase, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), f, h, n, prec)
end

function _arb_poly_exp_series(f, h, hlen, n, prec)
    ccall((:_arb_poly_exp_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), f, h, hlen, n, prec)
end

function arb_poly_exp_series(f, h, n, prec)
    ccall((:arb_poly_exp_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), f, h, n, prec)
end

function _arb_poly_sinh_cosh_series_basecase(s, c, h, hlen, n, prec)
    ccall((:_arb_poly_sinh_cosh_series_basecase, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function arb_poly_sinh_cosh_series_basecase(s, c, h, n, prec)
    ccall((:arb_poly_sinh_cosh_series_basecase, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _arb_poly_sinh_cosh_series_exponential(s, c, h, hlen, n, prec)
    ccall((:_arb_poly_sinh_cosh_series_exponential, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function arb_poly_sinh_cosh_series_exponential(s, c, h, n, prec)
    ccall((:arb_poly_sinh_cosh_series_exponential, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _arb_poly_sinh_cosh_series(s, c, h, hlen, n, prec)
    ccall((:_arb_poly_sinh_cosh_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), s, c, h, hlen, n, prec)
end

function arb_poly_sinh_cosh_series(s, c, h, n, prec)
    ccall((:arb_poly_sinh_cosh_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _arb_poly_sinh_series(s, h, hlen, n, prec)
    ccall((:_arb_poly_sinh_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), s, h, hlen, n, prec)
end

function arb_poly_sinh_series(s, h, n, prec)
    ccall((:arb_poly_sinh_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), s, h, n, prec)
end

function _arb_poly_cosh_series(c, h, hlen, n, prec)
    ccall((:_arb_poly_cosh_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), c, h, hlen, n, prec)
end

function arb_poly_cosh_series(c, h, n, prec)
    ccall((:arb_poly_cosh_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), c, h, n, prec)
end

function _arb_poly_sin_cos_series_basecase(s, c, h, hlen, n, prec, times_pi)
    ccall((:_arb_poly_sin_cos_series_basecase, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, n, prec, times_pi)
end

function arb_poly_sin_cos_series_basecase(s, c, h, n, prec, times_pi)
    ccall((:arb_poly_sin_cos_series_basecase, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint, Cint), s, c, h, n, prec, times_pi)
end

function _arb_poly_sin_cos_series_tangent(s, c, h, hlen, len, prec, times_pi)
    ccall((:_arb_poly_sin_cos_series_tangent, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), s, c, h, hlen, len, prec, times_pi)
end

function arb_poly_sin_cos_series_tangent(s, c, h, n, prec, times_pi)
    ccall((:arb_poly_sin_cos_series_tangent, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint, Cint), s, c, h, n, prec, times_pi)
end

function _arb_poly_sin_cos_series(s, c, h, hlen, len, prec)
    ccall((:_arb_poly_sin_cos_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), s, c, h, hlen, len, prec)
end

function arb_poly_sin_cos_series(s, c, h, n, prec)
    ccall((:arb_poly_sin_cos_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _arb_poly_sin_cos_pi_series(s, c, h, hlen, len, prec)
    ccall((:_arb_poly_sin_cos_pi_series, libarb), Cvoid, (arb_ptr, arb_ptr, arb_srcptr, Cint, Cint, Cint), s, c, h, hlen, len, prec)
end

function arb_poly_sin_cos_pi_series(s, c, h, n, prec)
    ccall((:arb_poly_sin_cos_pi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), s, c, h, n, prec)
end

function _arb_poly_sin_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_sin_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_sin_series(g, h, n, prec)
    ccall((:arb_poly_sin_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_cos_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_cos_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_cos_series(g, h, n, prec)
    ccall((:arb_poly_cos_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_sin_pi_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_sin_pi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_sin_pi_series(g, h, n, prec)
    ccall((:arb_poly_sin_pi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_cos_pi_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_cos_pi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_cos_pi_series(g, h, n, prec)
    ccall((:arb_poly_cos_pi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_cot_pi_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_cot_pi_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_cot_pi_series(g, h, n, prec)
    ccall((:arb_poly_cot_pi_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_tan_series(g, h, hlen, len, prec)
    ccall((:_arb_poly_tan_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, len, prec)
end

function arb_poly_tan_series(g, h, n, prec)
    ccall((:arb_poly_tan_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_sinc_series(g, h, hlen, n, prec)
    ccall((:_arb_poly_sinc_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), g, h, hlen, n, prec)
end

function arb_poly_sinc_series(g, h, n, prec)
    ccall((:arb_poly_sinc_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), g, h, n, prec)
end

function _arb_poly_compose_series_brent_kung(res, poly1, len1, poly2, len2, n, prec)
    ccall((:_arb_poly_compose_series_brent_kung, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_srcptr, Cint, Cint, Cint), res, poly1, len1, poly2, len2, n, prec)
end

function arb_poly_compose_series_brent_kung(res, poly1, poly2, n, prec)
    ccall((:arb_poly_compose_series_brent_kung, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_poly_t, Cint, Cint), res, poly1, poly2, n, prec)
end

function _arb_poly_evaluate_acb_horner(res, f, len, x, prec)
    ccall((:_arb_poly_evaluate_acb_horner, libarb), Cvoid, (acb_t, arb_srcptr, Cint, acb_t, Cint), res, f, len, x, prec)
end

function arb_poly_evaluate_acb_horner(res, f, a, prec)
    ccall((:arb_poly_evaluate_acb_horner, libarb), Cvoid, (acb_t, arb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate_acb_rectangular(y, poly, len, x, prec)
    ccall((:_arb_poly_evaluate_acb_rectangular, libarb), Cvoid, (acb_t, arb_srcptr, Cint, acb_t, Cint), y, poly, len, x, prec)
end

function arb_poly_evaluate_acb_rectangular(res, f, a, prec)
    ccall((:arb_poly_evaluate_acb_rectangular, libarb), Cvoid, (acb_t, arb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate_acb(res, f, len, x, prec)
    ccall((:_arb_poly_evaluate_acb, libarb), Cvoid, (acb_t, arb_srcptr, Cint, acb_t, Cint), res, f, len, x, prec)
end

function arb_poly_evaluate_acb(res, f, a, prec)
    ccall((:arb_poly_evaluate_acb, libarb), Cvoid, (acb_t, arb_poly_t, acb_t, Cint), res, f, a, prec)
end

function _arb_poly_evaluate2_acb_horner(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2_acb_horner, libarb), Cvoid, (acb_t, acb_t, arb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2_acb_horner(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2_acb_horner, libarb), Cvoid, (acb_t, acb_t, arb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_evaluate2_acb_rectangular(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2_acb_rectangular, libarb), Cvoid, (acb_t, acb_t, arb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2_acb_rectangular(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2_acb_rectangular, libarb), Cvoid, (acb_t, acb_t, arb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_evaluate2_acb(y, z, f, len, x, prec)
    ccall((:_arb_poly_evaluate2_acb, libarb), Cvoid, (acb_t, acb_t, arb_srcptr, Cint, acb_t, Cint), y, z, f, len, x, prec)
end

function arb_poly_evaluate2_acb(y, z, f, x, prec)
    ccall((:arb_poly_evaluate2_acb, libarb), Cvoid, (acb_t, acb_t, arb_poly_t, acb_t, Cint), y, z, f, x, prec)
end

function _arb_poly_lambertw_series(res, z, zlen, flags, len, prec)
    ccall((:_arb_poly_lambertw_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), res, z, zlen, flags, len, prec)
end

function arb_poly_lambertw_series(res, z, flags, len, prec)
    ccall((:arb_poly_lambertw_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint, Cint), res, z, flags, len, prec)
end

function _arb_poly_gamma_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_gamma_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_gamma_series(res, f, n, prec)
    ccall((:arb_poly_gamma_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_rgamma_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_rgamma_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_rgamma_series(res, f, n, prec)
    ccall((:arb_poly_rgamma_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_lgamma_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_lgamma_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_lgamma_series(res, f, n, prec)
    ccall((:arb_poly_lgamma_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_digamma_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_digamma_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_digamma_series(res, f, n, prec)
    ccall((:arb_poly_digamma_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, f, n, prec)
end

function _arb_poly_rising_ui_series(res, f, flen, r, trunc, prec)
    ccall((:_arb_poly_rising_ui_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint, Cint), res, f, flen, r, trunc, prec)
end

function arb_poly_rising_ui_series(res, f, r, trunc, prec)
    ccall((:arb_poly_rising_ui_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint, Cint), res, f, r, trunc, prec)
end

function _arb_poly_zeta_series(res, h, hlen, a, deflate, len, prec)
    ccall((:_arb_poly_zeta_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, arb_t, Cint, Cint, Cint), res, h, hlen, a, deflate, len, prec)
end

function arb_poly_zeta_series(res, f, a, deflate, n, prec)
    ccall((:arb_poly_zeta_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, arb_t, Cint, Cint, Cint), res, f, a, deflate, n, prec)
end

function _arb_poly_riemann_siegel_theta_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_riemann_siegel_theta_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_riemann_siegel_theta_series(res, h, n, prec)
    ccall((:arb_poly_riemann_siegel_theta_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, h, n, prec)
end

function _arb_poly_riemann_siegel_z_series(res, h, hlen, len, prec)
    ccall((:_arb_poly_riemann_siegel_z_series, libarb), Cvoid, (arb_ptr, arb_srcptr, Cint, Cint, Cint), res, h, hlen, len, prec)
end

function arb_poly_riemann_siegel_z_series(res, h, n, prec)
    ccall((:arb_poly_riemann_siegel_z_series, libarb), Cvoid, (arb_poly_t, arb_poly_t, Cint, Cint), res, h, n, prec)
end

function _arb_poly_swinnerton_dyer_ui_prec()
    ccall((:_arb_poly_swinnerton_dyer_ui_prec, libarb), Cint, ())
end

function _arb_poly_swinnerton_dyer_ui(T, n, trunc, prec)
    ccall((:_arb_poly_swinnerton_dyer_ui, libarb), Cvoid, (arb_ptr, Cint, Cint, Cint), T, n, trunc, prec)
end

function arb_poly_swinnerton_dyer_ui(poly, n, prec)
    ccall((:arb_poly_swinnerton_dyer_ui, libarb), Cvoid, (arb_poly_t, Cint, Cint), poly, n, prec)
end

function _arb_poly_newton_convergence_factor(convergence_factor, poly, len, convergence_interval, prec)
    ccall((:_arb_poly_newton_convergence_factor, libarb), Cvoid, (arf_t, arb_srcptr, Cint, arb_t, Cint), convergence_factor, poly, len, convergence_interval, prec)
end

function _arb_poly_newton_step(xnew, poly, len, x, convergence_interval, convergence_factor, prec)
    ccall((:_arb_poly_newton_step, libarb), Cint, (arb_t, arb_srcptr, Cint, arb_t, arb_t, arf_t, Cint), xnew, poly, len, x, convergence_interval, convergence_factor, prec)
end

function _arb_poly_newton_refine_root(r, poly, len, start, convergence_interval, convergence_factor, eval_extra_prec, prec)
    ccall((:_arb_poly_newton_refine_root, libarb), Cvoid, (arb_t, arb_srcptr, Cint, arb_t, arb_t, arf_t, Cint, Cint), r, poly, len, start, convergence_interval, convergence_factor, eval_extra_prec, prec)
end

function _arb_poly_root_bound_fujiwara(bound, poly, len)
    ccall((:_arb_poly_root_bound_fujiwara, libarb), Cvoid, (mag_t, arb_srcptr, Cint), bound, poly, len)
end

function arb_poly_root_bound_fujiwara(bound, poly)
    ccall((:arb_poly_root_bound_fujiwara, libarb), Cvoid, (mag_t, arb_poly_t), bound, poly)
end

function arb_poly_allocated_bytes()
    ccall((:arb_poly_allocated_bytes, libarb), Cint, ())
end

function n_zerobits(e)
    ccall((:n_zerobits, libarb), Cint, (Cint,), e)
end

function poly_pow_length()
    ccall((:poly_pow_length, libarb), Cint, ())
end
# Julia wrapper for header: arf.h
# Automatically generated using Clang.jl


function arf_rounds_down(rnd, sgnbit)
    ccall((:arf_rounds_down, libarb), Cint, (Cint, Cint), rnd, sgnbit)
end

function arf_rounds_up(rnd, sgnbit)
    ccall((:arf_rounds_up, libarb), Cint, (Cint, Cint), rnd, sgnbit)
end

function arf_rnd_to_mpfr()
    ccall((:arf_rnd_to_mpfr, libarb), Cint, ())
end

function _arf_promote(x, n)
    ccall((:_arf_promote, libarb), Cvoid, (arf_t, Cint), x, n)
end

function _arf_demote(x)
    ccall((:_arf_demote, libarb), Cvoid, (arf_t,), x)
end

function arf_init(x)
    ccall((:arf_init, libarb), Cvoid, (arf_t,), x)
end

function arf_clear(x)
    ccall((:arf_clear, libarb), Cvoid, (arf_t,), x)
end

function arf_zero(x)
    ccall((:arf_zero, libarb), Cvoid, (arf_t,), x)
end

function arf_pos_inf(x)
    ccall((:arf_pos_inf, libarb), Cvoid, (arf_t,), x)
end

function arf_neg_inf(x)
    ccall((:arf_neg_inf, libarb), Cvoid, (arf_t,), x)
end

function arf_nan(x)
    ccall((:arf_nan, libarb), Cvoid, (arf_t,), x)
end

function arf_is_special(x)
    ccall((:arf_is_special, libarb), Cint, (arf_t,), x)
end

function arf_is_zero(x)
    ccall((:arf_is_zero, libarb), Cint, (arf_t,), x)
end

function arf_is_pos_inf(x)
    ccall((:arf_is_pos_inf, libarb), Cint, (arf_t,), x)
end

function arf_is_neg_inf(x)
    ccall((:arf_is_neg_inf, libarb), Cint, (arf_t,), x)
end

function arf_is_nan(x)
    ccall((:arf_is_nan, libarb), Cint, (arf_t,), x)
end

function arf_is_normal(x)
    ccall((:arf_is_normal, libarb), Cint, (arf_t,), x)
end

function arf_is_finite(x)
    ccall((:arf_is_finite, libarb), Cint, (arf_t,), x)
end

function arf_is_inf(x)
    ccall((:arf_is_inf, libarb), Cint, (arf_t,), x)
end

function arf_one(x)
    ccall((:arf_one, libarb), Cvoid, (arf_t,), x)
end

function arf_is_one(x)
    ccall((:arf_is_one, libarb), Cint, (arf_t,), x)
end

function arf_sgn(x)
    ccall((:arf_sgn, libarb), Cint, (arf_t,), x)
end

function arf_cmp(x, y)
    ccall((:arf_cmp, libarb), Cint, (arf_t, arf_t), x, y)
end

function arf_cmpabs(x, y)
    ccall((:arf_cmpabs, libarb), Cint, (arf_t, arf_t), x, y)
end

function arf_cmpabs_ui(x, y)
    ccall((:arf_cmpabs_ui, libarb), Cint, (arf_t, Cint), x, y)
end

function arf_cmpabs_d(x, y)
    ccall((:arf_cmpabs_d, libarb), Cint, (arf_t, Cdouble), x, y)
end

function arf_cmp_si(x, y)
    ccall((:arf_cmp_si, libarb), Cint, (arf_t, Cint), x, y)
end

function arf_cmp_ui(x, y)
    ccall((:arf_cmp_ui, libarb), Cint, (arf_t, Cint), x, y)
end

function arf_cmp_d(x, y)
    ccall((:arf_cmp_d, libarb), Cint, (arf_t, Cdouble), x, y)
end

function arf_swap(y, x)
    ccall((:arf_swap, libarb), Cvoid, (arf_t, arf_t), y, x)
end

function arf_set(y, x)
    ccall((:arf_set, libarb), Cvoid, (arf_t, arf_t), y, x)
end

function arf_neg(y, x)
    ccall((:arf_neg, libarb), Cvoid, (arf_t, arf_t), y, x)
end

function arf_init_set_ui(x, v)
    ccall((:arf_init_set_ui, libarb), Cvoid, (arf_t, Cint), x, v)
end

function arf_init_set_si(x, v)
    ccall((:arf_init_set_si, libarb), Cvoid, (arf_t, Cint), x, v)
end

function arf_set_ui(x, v)
    ccall((:arf_set_ui, libarb), Cvoid, (arf_t, Cint), x, v)
end

function arf_set_si(x, v)
    ccall((:arf_set_si, libarb), Cvoid, (arf_t, Cint), x, v)
end

function arf_init_set_shallow(z, x)
    ccall((:arf_init_set_shallow, libarb), Cvoid, (arf_t, arf_t), z, x)
end

function arf_init_neg_shallow(z, x)
    ccall((:arf_init_neg_shallow, libarb), Cvoid, (arf_t, arf_t), z, x)
end

function arf_init_set_mag_shallow(y, x)
    ccall((:arf_init_set_mag_shallow, libarb), Cvoid, (arf_t, mag_t), y, x)
end

function arf_init_neg_mag_shallow(z, x)
    ccall((:arf_init_neg_mag_shallow, libarb), Cvoid, (arf_t, mag_t), z, x)
end

function arf_cmpabs_mag(x, y)
    ccall((:arf_cmpabs_mag, libarb), Cint, (arf_t, mag_t), x, y)
end

function arf_mag_cmpabs(x, y)
    ccall((:arf_mag_cmpabs, libarb), Cint, (mag_t, arf_t), x, y)
end

function arf_set_mpn(y, x, xn, sgnbit)
    ccall((:arf_set_mpn, libarb), Cvoid, (arf_t, Cint, Cint, Cint), y, x, xn, sgnbit)
end

function arf_set_mpz(y, x)
    ccall((:arf_set_mpz, libarb), Cvoid, (arf_t, Cint), y, x)
end

function arf_set_fmpz(y, x)
    ccall((:arf_set_fmpz, libarb), Cvoid, (arf_t, Cint), y, x)
end

function _arf_set_round_ui(x, v, sgnbit, prec, rnd)
    ccall((:_arf_set_round_ui, libarb), Cint, (arf_t, Cint, Cint, Cint, Cint), x, v, sgnbit, prec, rnd)
end

function _arf_set_round_uiui(z, fix, hi, lo, sgnbit, prec, rnd)
    ccall((:_arf_set_round_uiui, libarb), Cint, (arf_t, Ptr{Cint}, Cint, Cint, Cint, Cint, Cint), z, fix, hi, lo, sgnbit, prec, rnd)
end

function _arf_set_round_mpn(y, exp_shift, x, xn, sgnbit, prec, rnd)
    ccall((:_arf_set_round_mpn, libarb), Cint, (arf_t, Ptr{Cint}, Cint, Cint, Cint, Cint, Cint), y, exp_shift, x, xn, sgnbit, prec, rnd)
end

function arf_set_round_ui(x, v, prec, rnd)
    ccall((:arf_set_round_ui, libarb), Cint, (arf_t, Cint, Cint, Cint), x, v, prec, rnd)
end

function arf_set_round_si(x, v, prec, rnd)
    ccall((:arf_set_round_si, libarb), Cint, (arf_t, Cint, Cint, Cint), x, v, prec, rnd)
end

function arf_set_round_mpz(y, x, prec, rnd)
    ccall((:arf_set_round_mpz, libarb), Cint, (arf_t, Cint, Cint, Cint), y, x, prec, rnd)
end

function arf_set_round_fmpz(y, x, prec, rnd)
    ccall((:arf_set_round_fmpz, libarb), Cint, (arf_t, Cint, Cint, Cint), y, x, prec, rnd)
end

function arf_set_round(y, x, prec, rnd)
    ccall((:arf_set_round, libarb), Cint, (arf_t, arf_t, Cint, Cint), y, x, prec, rnd)
end

function arf_neg_round(y, x, prec, rnd)
    ccall((:arf_neg_round, libarb), Cint, (arf_t, arf_t, Cint, Cint), y, x, prec, rnd)
end

function arf_get_fmpr(y, x)
    ccall((:arf_get_fmpr, libarb), Cvoid, (fmpr_t, arf_t), y, x)
end

function arf_set_fmpr(y, x)
    ccall((:arf_set_fmpr, libarb), Cvoid, (arf_t, fmpr_t), y, x)
end

function arf_get_mpfr(x, y, rnd)
    ccall((:arf_get_mpfr, libarb), Cint, (Cint, arf_t, Cint), x, y, rnd)
end

function arf_set_mpfr(x, y)
    ccall((:arf_set_mpfr, libarb), Cvoid, (arf_t, Cint), x, y)
end

function arf_equal(x, y)
    ccall((:arf_equal, libarb), Cint, (arf_t, arf_t), x, y)
end

function arf_equal_si(x, y)
    ccall((:arf_equal_si, libarb), Cint, (arf_t, Cint), x, y)
end

function arf_min(z, a, b)
    ccall((:arf_min, libarb), Cvoid, (arf_t, arf_t, arf_t), z, a, b)
end

function arf_max(z, a, b)
    ccall((:arf_max, libarb), Cvoid, (arf_t, arf_t, arf_t), z, a, b)
end

function arf_abs(y, x)
    ccall((:arf_abs, libarb), Cvoid, (arf_t, arf_t), y, x)
end

function arf_bits()
    ccall((:arf_bits, libarb), Cint, ())
end

function arf_bot(e, x)
    ccall((:arf_bot, libarb), Cvoid, (Cint, arf_t), e, x)
end

function arf_is_int(x)
    ccall((:arf_is_int, libarb), Cint, (arf_t,), x)
end

function arf_is_int_2exp_si(x, e)
    ccall((:arf_is_int_2exp_si, libarb), Cint, (arf_t, Cint), x, e)
end

function arf_cmp_2exp_si(x, e)
    ccall((:arf_cmp_2exp_si, libarb), Cint, (arf_t, Cint), x, e)
end

function arf_cmpabs_2exp_si(x, e)
    ccall((:arf_cmpabs_2exp_si, libarb), Cint, (arf_t, Cint), x, e)
end

function arf_set_si_2exp_si(x, man, exp)
    ccall((:arf_set_si_2exp_si, libarb), Cvoid, (arf_t, Cint, Cint), x, man, exp)
end

function arf_set_ui_2exp_si(x, man, exp)
    ccall((:arf_set_ui_2exp_si, libarb), Cvoid, (arf_t, Cint, Cint), x, man, exp)
end

function arf_mul_2exp_si(y, x, e)
    ccall((:arf_mul_2exp_si, libarb), Cvoid, (arf_t, arf_t, Cint), y, x, e)
end

function arf_mul_2exp_fmpz(y, x, e)
    ccall((:arf_mul_2exp_fmpz, libarb), Cvoid, (arf_t, arf_t, Cint), y, x, e)
end

function arf_set_round_fmpz_2exp(y, x, exp, prec, rnd)
    ccall((:arf_set_round_fmpz_2exp, libarb), Cint, (arf_t, Cint, Cint, Cint, Cint), y, x, exp, prec, rnd)
end

function arf_abs_bound_lt_2exp_fmpz(b, x)
    ccall((:arf_abs_bound_lt_2exp_fmpz, libarb), Cvoid, (Cint, arf_t), b, x)
end

function arf_abs_bound_le_2exp_fmpz(b, x)
    ccall((:arf_abs_bound_le_2exp_fmpz, libarb), Cvoid, (Cint, arf_t), b, x)
end

function arf_abs_bound_lt_2exp_si()
    ccall((:arf_abs_bound_lt_2exp_si, libarb), Cint, ())
end

function arf_frexp(man, exp, x)
    ccall((:arf_frexp, libarb), Cvoid, (arf_t, Cint, arf_t), man, exp, x)
end

function arf_get_fmpz_2exp(man, exp, x)
    ccall((:arf_get_fmpz_2exp, libarb), Cvoid, (Cint, Cint, arf_t), man, exp, x)
end

function _arf_get_integer_mpn(y, x, xn, exp)
    ccall((:_arf_get_integer_mpn, libarb), Cint, (Cint, Cint, Cint, Cint), y, x, xn, exp)
end

function _arf_set_mpn_fixed(z, xp, xn, fixn, negative, prec, rnd)
    ccall((:_arf_set_mpn_fixed, libarb), Cint, (arf_t, Cint, Cint, Cint, Cint, Cint, Cint), z, xp, xn, fixn, negative, prec, rnd)
end

function arf_get_fmpz(z, x, rnd)
    ccall((:arf_get_fmpz, libarb), Cint, (Cint, arf_t, Cint), z, x, rnd)
end

function arf_get_si()
    ccall((:arf_get_si, libarb), Cint, ())
end

function arf_get_fmpz_fixed_fmpz(y, x, e)
    ccall((:arf_get_fmpz_fixed_fmpz, libarb), Cint, (Cint, arf_t, Cint), y, x, e)
end

function arf_get_fmpz_fixed_si(y, x, e)
    ccall((:arf_get_fmpz_fixed_si, libarb), Cint, (Cint, arf_t, Cint), y, x, e)
end

function arf_set_fmpz_2exp(x, man, exp)
    ccall((:arf_set_fmpz_2exp, libarb), Cvoid, (arf_t, Cint, Cint), x, man, exp)
end

function arf_floor(z, x)
    ccall((:arf_floor, libarb), Cvoid, (arf_t, arf_t), z, x)
end

function arf_ceil(z, x)
    ccall((:arf_ceil, libarb), Cvoid, (arf_t, arf_t), z, x)
end

function arf_debug(x)
    ccall((:arf_debug, libarb), Cvoid, (arf_t,), x)
end

function arf_fprint(file, x)
    ccall((:arf_fprint, libarb), Cvoid, (Ptr{Cint}, arf_t), file, x)
end

function arf_fprintd(file, y, d)
    ccall((:arf_fprintd, libarb), Cvoid, (Ptr{Cint}, arf_t, Cint), file, y, d)
end

function arf_print(x)
    ccall((:arf_print, libarb), Cvoid, (arf_t,), x)
end

function arf_printd(y, d)
    ccall((:arf_printd, libarb), Cvoid, (arf_t, Cint), y, d)
end

function arf_randtest(x, state, bits, mag_bits)
    ccall((:arf_randtest, libarb), Cvoid, (arf_t, Cint, Cint, Cint), x, state, bits, mag_bits)
end

function arf_randtest_not_zero(x, state, bits, mag_bits)
    ccall((:arf_randtest_not_zero, libarb), Cvoid, (arf_t, Cint, Cint, Cint), x, state, bits, mag_bits)
end

function arf_randtest_special(x, state, bits, mag_bits)
    ccall((:arf_randtest_special, libarb), Cvoid, (arf_t, Cint, Cint, Cint), x, state, bits, mag_bits)
end

function arf_mul_special(z, x, y)
    ccall((:arf_mul_special, libarb), Cvoid, (arf_t, arf_t, arf_t), z, x, y)
end

function arf_mul_via_mpfr(z, x, y, prec, rnd)
    ccall((:arf_mul_via_mpfr, libarb), Cint, (arf_t, arf_t, arf_t, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_rnd_any(z, x, y, prec, rnd)
    ccall((:arf_mul_rnd_any, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_rnd_down(z, x, y, prec)
    ccall((:arf_mul_rnd_down, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint), z, x, y, prec)
end

function arf_neg_mul(z, x, y, prec, rnd)
    ccall((:arf_neg_mul, libarb), Cint, (arf_t, arf_t, arf_t, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_ui(z, x, y, prec, rnd)
    ccall((:arf_mul_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_si(z, x, y, prec, rnd)
    ccall((:arf_mul_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_mpz(z, x, y, prec, rnd)
    ccall((:arf_mul_mpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_mul_fmpz(z, x, y, prec, rnd)
    ccall((:arf_mul_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function _arf_add_mpn(z, xp, xn, xsgnbit, xexp, yp, yn, ysgnbit, shift, prec, rnd)
    ccall((:_arf_add_mpn, libarb), Cint, (arf_t, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), z, xp, xn, xsgnbit, xexp, yp, yn, ysgnbit, shift, prec, rnd)
end

function arf_add(z, x, y, prec, rnd)
    ccall((:arf_add, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_add_si(z, x, y, prec, rnd)
    ccall((:arf_add_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_add_ui(z, x, y, prec, rnd)
    ccall((:arf_add_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_add_fmpz(z, x, y, prec, rnd)
    ccall((:arf_add_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_add_fmpz_2exp(z, x, y, exp, prec, rnd)
    ccall((:arf_add_fmpz_2exp, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint, Cint), z, x, y, exp, prec, rnd)
end

function arf_sub(z, x, y, prec, rnd)
    ccall((:arf_sub, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_sub_si(z, x, y, prec, rnd)
    ccall((:arf_sub_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_sub_ui(z, x, y, prec, rnd)
    ccall((:arf_sub_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_sub_fmpz(z, x, y, prec, rnd)
    ccall((:arf_sub_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_addmul(z, x, y, prec, rnd)
    ccall((:arf_addmul, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_addmul_ui(z, x, y, prec, rnd)
    ccall((:arf_addmul_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_addmul_si(z, x, y, prec, rnd)
    ccall((:arf_addmul_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_addmul_mpz(z, x, y, prec, rnd)
    ccall((:arf_addmul_mpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_addmul_fmpz(z, x, y, prec, rnd)
    ccall((:arf_addmul_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_submul(z, x, y, prec, rnd)
    ccall((:arf_submul, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_submul_ui(z, x, y, prec, rnd)
    ccall((:arf_submul_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_submul_si(z, x, y, prec, rnd)
    ccall((:arf_submul_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_submul_mpz(z, x, y, prec, rnd)
    ccall((:arf_submul_mpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_submul_fmpz(z, x, y, prec, rnd)
    ccall((:arf_submul_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_sosq(z, x, y, prec, rnd)
    ccall((:arf_sosq, libarb), Cint, (arf_t, arf_t, arf_t, Cint, Cint), z, x, y, prec, rnd)
end

function arf_div(z, x, y, prec, rnd)
    ccall((:arf_div, libarb), Cint, (arf_ptr, arf_srcptr, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_div_ui(z, x, y, prec, rnd)
    ccall((:arf_div_ui, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_ui_div(z, x, y, prec, rnd)
    ccall((:arf_ui_div, libarb), Cint, (arf_ptr, Cint, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_div_si(z, x, y, prec, rnd)
    ccall((:arf_div_si, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_si_div(z, x, y, prec, rnd)
    ccall((:arf_si_div, libarb), Cint, (arf_ptr, Cint, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_div_fmpz(z, x, y, prec, rnd)
    ccall((:arf_div_fmpz, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_fmpz_div(z, x, y, prec, rnd)
    ccall((:arf_fmpz_div, libarb), Cint, (arf_ptr, Cint, arf_srcptr, Cint, Cint), z, x, y, prec, rnd)
end

function arf_fmpz_div_fmpz(z, x, y, prec, rnd)
    ccall((:arf_fmpz_div_fmpz, libarb), Cint, (arf_ptr, Cint, Cint, Cint, Cint), z, x, y, prec, rnd)
end

function arf_sqrt(z, x, prec, rnd)
    ccall((:arf_sqrt, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint), z, x, prec, rnd)
end

function arf_sqrt_ui(z, x, prec, rnd)
    ccall((:arf_sqrt_ui, libarb), Cint, (arf_t, Cint, Cint, Cint), z, x, prec, rnd)
end

function arf_sqrt_fmpz(z, x, prec, rnd)
    ccall((:arf_sqrt_fmpz, libarb), Cint, (arf_t, Cint, Cint, Cint), z, x, prec, rnd)
end

function arf_rsqrt(z, x, prec, rnd)
    ccall((:arf_rsqrt, libarb), Cint, (arf_ptr, arf_srcptr, Cint, Cint), z, x, prec, rnd)
end

function arf_root(z, x, k, prec, rnd)
    ccall((:arf_root, libarb), Cint, (arf_t, arf_t, Cint, Cint, Cint), z, x, k, prec, rnd)
end

function arf_get_mag(y, x)
    ccall((:arf_get_mag, libarb), Cvoid, (mag_t, arf_t), y, x)
end

function arf_get_mag_lower(y, x)
    ccall((:arf_get_mag_lower, libarb), Cvoid, (mag_t, arf_t), y, x)
end

function arf_set_mag(y, x)
    ccall((:arf_set_mag, libarb), Cvoid, (arf_t, mag_t), y, x)
end

function mag_init_set_arf(y, x)
    ccall((:mag_init_set_arf, libarb), Cvoid, (mag_t, arf_t), y, x)
end

function mag_fast_init_set_arf(y, x)
    ccall((:mag_fast_init_set_arf, libarb), Cvoid, (mag_t, arf_t), y, x)
end

function arf_mag_fast_add_ulp(z, x, y, prec)
    ccall((:arf_mag_fast_add_ulp, libarb), Cvoid, (mag_t, mag_t, arf_t, Cint), z, x, y, prec)
end

function arf_mag_add_ulp(z, x, y, prec)
    ccall((:arf_mag_add_ulp, libarb), Cvoid, (mag_t, mag_t, arf_t, Cint), z, x, y, prec)
end

function arf_mag_set_ulp(z, y, prec)
    ccall((:arf_mag_set_ulp, libarb), Cvoid, (mag_t, arf_t, Cint), z, y, prec)
end

function arf_get_fmpq(y, x)
    ccall((:arf_get_fmpq, libarb), Cvoid, (Cint, arf_t), y, x)
end

function arf_set_fmpq(y, x, prec, rnd)
    ccall((:arf_set_fmpq, libarb), Cint, (arf_t, Cint, Cint, Cint), y, x, prec, rnd)
end

function arf_complex_mul(e, f, a, b, c, d, prec, rnd)
    ccall((:arf_complex_mul, libarb), Cint, (arf_t, arf_t, arf_t, arf_t, arf_t, arf_t, Cint, Cint), e, f, a, b, c, d, prec, rnd)
end

function arf_complex_mul_fallback(e, f, a, b, c, d, prec, rnd)
    ccall((:arf_complex_mul_fallback, libarb), Cint, (arf_t, arf_t, arf_t, arf_t, arf_t, arf_t, Cint, Cint), e, f, a, b, c, d, prec, rnd)
end

function arf_complex_sqr(e, f, a, b, prec, rnd)
    ccall((:arf_complex_sqr, libarb), Cint, (arf_t, arf_t, arf_t, arf_t, Cint, Cint), e, f, a, b, prec, rnd)
end

function arf_sum(s, terms, len, prec, rnd)
    ccall((:arf_sum, libarb), Cint, (arf_t, arf_srcptr, Cint, Cint, Cint), s, terms, len, prec, rnd)
end

function arf_get_d(x, rnd)
    ccall((:arf_get_d, libarb), Cdouble, (arf_t, Cint), x, rnd)
end

function arf_set_d(x, v)
    ccall((:arf_set_d, libarb), Cvoid, (arf_t, Cdouble), x, v)
end

function arf_allocated_bytes()
    ccall((:arf_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: bernoulli.h
# Automatically generated using Clang.jl


function bernoulli_cache_compute(n)
    ccall((:bernoulli_cache_compute, libarb), Cvoid, (Cint,), n)
end

function bernoulli_denom_size()
    ccall((:bernoulli_denom_size, libarb), Cint, ())
end

function bernoulli_zeta_terms()
    ccall((:bernoulli_zeta_terms, libarb), Cint, ())
end

function bernoulli_power_prec()
    ccall((:bernoulli_power_prec, libarb), Cint, ())
end

function bernoulli_global_prec()
    ccall((:bernoulli_global_prec, libarb), Cint, ())
end

function bernoulli_rev_init(iter, nmax)
    ccall((:bernoulli_rev_init, libarb), Cvoid, (bernoulli_rev_t, Cint), iter, nmax)
end

function bernoulli_rev_next(numer, denom, iter)
    ccall((:bernoulli_rev_next, libarb), Cvoid, (Cint, Cint, bernoulli_rev_t), numer, denom, iter)
end

function bernoulli_rev_clear(iter)
    ccall((:bernoulli_rev_clear, libarb), Cvoid, (bernoulli_rev_t,), iter)
end

function bernoulli_bound_2exp_si()
    ccall((:bernoulli_bound_2exp_si, libarb), Cint, ())
end

function _bernoulli_fmpq_ui_zeta(num, den, n)
    ccall((:_bernoulli_fmpq_ui_zeta, libarb), Cvoid, (Cint, Cint, Cint), num, den, n)
end

function _bernoulli_fmpq_ui(num, den, n)
    ccall((:_bernoulli_fmpq_ui, libarb), Cvoid, (Cint, Cint, Cint), num, den, n)
end

function bernoulli_fmpq_ui(b, n)
    ccall((:bernoulli_fmpq_ui, libarb), Cvoid, (Cint, Cint), b, n)
end
# Julia wrapper for header: bool_mat.h
# Automatically generated using Clang.jl



                                                                                
                                                                                

function bool_mat_get_entry(mat, i, j)
    ccall((:bool_mat_get_entry, libarb), Cint, (bool_mat_t, Cint, Cint), mat, i, j)
end

function bool_mat_set_entry(mat, i, j, value)
    ccall((:bool_mat_set_entry, libarb), Cvoid, (bool_mat_t, Cint, Cint, Cint), mat, i, j, value)
end

function bool_mat_init(mat, r, c)
    ccall((:bool_mat_init, libarb), Cvoid, (bool_mat_t, Cint, Cint), mat, r, c)
end

function bool_mat_clear(mat)
    ccall((:bool_mat_clear, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_swap(mat1, mat2)
    ccall((:bool_mat_swap, libarb), Cvoid, (bool_mat_t, bool_mat_t), mat1, mat2)
end

function bool_mat_set(dest, src)
    ccall((:bool_mat_set, libarb), Cvoid, (bool_mat_t, bool_mat_t), dest, src)
end

function bool_mat_randtest(mat, state)
    ccall((:bool_mat_randtest, libarb), Cvoid, (bool_mat_t, Cint), mat, state)
end

function bool_mat_randtest_diagonal(mat, state)
    ccall((:bool_mat_randtest_diagonal, libarb), Cvoid, (bool_mat_t, Cint), mat, state)
end

function bool_mat_randtest_nilpotent(mat, state)
    ccall((:bool_mat_randtest_nilpotent, libarb), Cvoid, (bool_mat_t, Cint), mat, state)
end

function bool_mat_fprint(file, mat)
    ccall((:bool_mat_fprint, libarb), Cvoid, (Ptr{Cint}, bool_mat_t), file, mat)
end

function bool_mat_print(mat)
    ccall((:bool_mat_print, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_equal(mat1, mat2)
    ccall((:bool_mat_equal, libarb), Cint, (bool_mat_t, bool_mat_t), mat1, mat2)
end

function bool_mat_any(mat)
    ccall((:bool_mat_any, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_all(mat)
    ccall((:bool_mat_all, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_diagonal(mat)
    ccall((:bool_mat_is_diagonal, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_lower_triangular(mat)
    ccall((:bool_mat_is_lower_triangular, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_transitive(mat)
    ccall((:bool_mat_is_transitive, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_nilpotent(mat)
    ccall((:bool_mat_is_nilpotent, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_empty(mat)
    ccall((:bool_mat_is_empty, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_is_square(mat)
    ccall((:bool_mat_is_square, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_zero(mat)
    ccall((:bool_mat_zero, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_one(mat)
    ccall((:bool_mat_one, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_directed_path(mat)
    ccall((:bool_mat_directed_path, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_directed_cycle(mat)
    ccall((:bool_mat_directed_cycle, libarb), Cvoid, (bool_mat_t,), mat)
end

function bool_mat_transpose(mat1, mat2)
    ccall((:bool_mat_transpose, libarb), Cvoid, (bool_mat_t, bool_mat_t), mat1, mat2)
end

function bool_mat_complement(mat1, mat2)
    ccall((:bool_mat_complement, libarb), Cvoid, (bool_mat_t, bool_mat_t), mat1, mat2)
end

function bool_mat_add(res, mat1, mat2)
    ccall((:bool_mat_add, libarb), Cvoid, (bool_mat_t, bool_mat_t, bool_mat_t), res, mat1, mat2)
end

function bool_mat_mul(res, mat1, mat2)
    ccall((:bool_mat_mul, libarb), Cvoid, (bool_mat_t, bool_mat_t, bool_mat_t), res, mat1, mat2)
end

function bool_mat_mul_entrywise(res, mat1, mat2)
    ccall((:bool_mat_mul_entrywise, libarb), Cvoid, (bool_mat_t, bool_mat_t, bool_mat_t), res, mat1, mat2)
end

function bool_mat_pow_ui(B, A, exp)
    ccall((:bool_mat_pow_ui, libarb), Cvoid, (bool_mat_t, bool_mat_t, Cint), B, A, exp)
end

function bool_mat_sqr(B, A)
    ccall((:bool_mat_sqr, libarb), Cvoid, (bool_mat_t, bool_mat_t), B, A)
end

function bool_mat_trace(mat)
    ccall((:bool_mat_trace, libarb), Cint, (bool_mat_t,), mat)
end

function bool_mat_nilpotency_degree()
    ccall((:bool_mat_nilpotency_degree, libarb), Cint, ())
end

function bool_mat_transitive_closure(dest, src)
    ccall((:bool_mat_transitive_closure, libarb), Cvoid, (bool_mat_t, bool_mat_t), dest, src)
end

function bool_mat_get_strongly_connected_components()
    ccall((:bool_mat_get_strongly_connected_components, libarb), Cint, ())
end

function bool_mat_all_pairs_longest_walk()
    ccall((:bool_mat_all_pairs_longest_walk, libarb), Cint, ())
end
# Julia wrapper for header: dirichlet.h
# Automatically generated using Clang.jl


function dirichlet_group_size()
    ccall((:dirichlet_group_size, libarb), Cint, ())
end

function dirichlet_group_num_primitive()
    ccall((:dirichlet_group_num_primitive, libarb), Cint, ())
end

function dirichlet_group_init(G, q)
    ccall((:dirichlet_group_init, libarb), Cvoid, (dirichlet_group_t, Cint), G, q)
end

function dirichlet_subgroup_init(H, G, h)
    ccall((:dirichlet_subgroup_init, libarb), Cvoid, (dirichlet_group_t, dirichlet_group_t, Cint), H, G, h)
end

function dirichlet_group_clear(G)
    ccall((:dirichlet_group_clear, libarb), Cvoid, (dirichlet_group_t,), G)
end

function dirichlet_group_dlog_precompute(G, num)
    ccall((:dirichlet_group_dlog_precompute, libarb), Cvoid, (dirichlet_group_t, Cint), G, num)
end

function dirichlet_group_dlog_clear(G)
    ccall((:dirichlet_group_dlog_clear, libarb), Cvoid, (dirichlet_group_t,), G)
end

function dirichlet_conductor_ui()
    ccall((:dirichlet_conductor_ui, libarb), Cint, ())
end

function dirichlet_parity_ui(G, a)
    ccall((:dirichlet_parity_ui, libarb), Cint, (dirichlet_group_t, Cint), G, a)
end

function dirichlet_order_ui()
    ccall((:dirichlet_order_ui, libarb), Cint, ())
end

function dirichlet_char_init(x, G)
    ccall((:dirichlet_char_init, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t), x, G)
end

function dirichlet_char_clear(x)
    ccall((:dirichlet_char_clear, libarb), Cvoid, (dirichlet_char_t,), x)
end

function dirichlet_char_print(G, x)
    ccall((:dirichlet_char_print, libarb), Cvoid, (dirichlet_group_t, dirichlet_char_t), G, x)
end

function dirichlet_char_set(x, G, y)
    ccall((:dirichlet_char_set, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, dirichlet_char_t), x, G, y)
end

function dirichlet_char_eq(x, y)
    ccall((:dirichlet_char_eq, libarb), Cint, (dirichlet_char_t, dirichlet_char_t), x, y)
end

function dirichlet_char_eq_deep(G, x, y)
    ccall((:dirichlet_char_eq_deep, libarb), Cint, (dirichlet_group_t, dirichlet_char_t, dirichlet_char_t), G, x, y)
end

function dirichlet_parity_char(G, x)
    ccall((:dirichlet_parity_char, libarb), Cint, (dirichlet_group_t, dirichlet_char_t), G, x)
end

function dirichlet_conductor_char()
    ccall((:dirichlet_conductor_char, libarb), Cint, ())
end

function dirichlet_order_char()
    ccall((:dirichlet_order_char, libarb), Cint, ())
end

function dirichlet_char_log(x, G, m)
    ccall((:dirichlet_char_log, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, Cint), x, G, m)
end

function dirichlet_char_exp()
    ccall((:dirichlet_char_exp, libarb), Cint, ())
end

function _dirichlet_char_exp()
    ccall((:_dirichlet_char_exp, libarb), Cint, ())
end

function dirichlet_char_index(x, G, j)
    ccall((:dirichlet_char_index, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, Cint), x, G, j)
end

function dirichlet_index_char()
    ccall((:dirichlet_index_char, libarb), Cint, ())
end

function dirichlet_char_one(x, G)
    ccall((:dirichlet_char_one, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t), x, G)
end

function dirichlet_char_first_primitive(x, G)
    ccall((:dirichlet_char_first_primitive, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t), x, G)
end

function dirichlet_char_next(x, G)
    ccall((:dirichlet_char_next, libarb), Cint, (dirichlet_char_t, dirichlet_group_t), x, G)
end

function dirichlet_char_next_primitive(x, G)
    ccall((:dirichlet_char_next_primitive, libarb), Cint, (dirichlet_char_t, dirichlet_group_t), x, G)
end

function dirichlet_char_mul(c, G, a, b)
    ccall((:dirichlet_char_mul, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, dirichlet_char_t, dirichlet_char_t), c, G, a, b)
end

function dirichlet_char_pow(c, G, a, n)
    ccall((:dirichlet_char_pow, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, dirichlet_char_t, Cint), c, G, a, n)
end

function dirichlet_char_lower(y, H, x, G)
    ccall((:dirichlet_char_lower, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, dirichlet_char_t, dirichlet_group_t), y, H, x, G)
end

function dirichlet_char_lift(y, G, x, H)
    ccall((:dirichlet_char_lift, libarb), Cvoid, (dirichlet_char_t, dirichlet_group_t, dirichlet_char_t, dirichlet_group_t), y, G, x, H)
end

function dirichlet_pairing()
    ccall((:dirichlet_pairing, libarb), Cint, ())
end

function dirichlet_pairing_char()
    ccall((:dirichlet_pairing_char, libarb), Cint, ())
end

function dirichlet_char_is_principal(G, chi)
    ccall((:dirichlet_char_is_principal, libarb), Cint, (dirichlet_group_t, dirichlet_char_t), G, chi)
end

function dirichlet_char_is_real(G, chi)
    ccall((:dirichlet_char_is_real, libarb), Cint, (dirichlet_group_t, dirichlet_char_t), G, chi)
end

function dirichlet_char_is_primitive(G, chi)
    ccall((:dirichlet_char_is_primitive, libarb), Cint, (dirichlet_group_t, dirichlet_char_t), G, chi)
end

function dirichlet_chi()
    ccall((:dirichlet_chi, libarb), Cint, ())
end

function dirichlet_vec_set_null(v, G, nv)
    ccall((:dirichlet_vec_set_null, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, Cint), v, G, nv)
end

function dirichlet_chi_vec_loop(v, G, chi, nv)
    ccall((:dirichlet_chi_vec_loop, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint), v, G, chi, nv)
end

function dirichlet_chi_vec_primeloop(v, G, chi, nv)
    ccall((:dirichlet_chi_vec_primeloop, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint), v, G, chi, nv)
end

function dirichlet_chi_vec(v, G, chi, nv)
    ccall((:dirichlet_chi_vec, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint), v, G, chi, nv)
end

function dirichlet_chi_vec_loop_order(v, G, chi, order, nv)
    ccall((:dirichlet_chi_vec_loop_order, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint, Cint), v, G, chi, order, nv)
end

function dirichlet_chi_vec_primeloop_order(v, G, chi, order, nv)
    ccall((:dirichlet_chi_vec_primeloop_order, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint, Cint), v, G, chi, order, nv)
end

function dirichlet_chi_vec_order(v, G, chi, order, nv)
    ccall((:dirichlet_chi_vec_order, libarb), Cvoid, (Ptr{Cint}, dirichlet_group_t, dirichlet_char_t, Cint, Cint), v, G, chi, order, nv)
end
# Julia wrapper for header: dlog.h
# Automatically generated using Clang.jl


function apow_cmp(x, y)
    ccall((:apow_cmp, libarb), Cint, (Ptr{apow_t}, Ptr{apow_t}), x, y)
end

function dlog_precomp_modpe_init(pre, a, p, e, pe, num)
    ccall((:dlog_precomp_modpe_init, libarb), Cvoid, (dlog_precomp_t, Cint, Cint, Cint, Cint, Cint), pre, a, p, e, pe, num)
end

function dlog_precomp_small_init(pre, a, mod, n, num)
    ccall((:dlog_precomp_small_init, libarb), Cvoid, (dlog_precomp_t, Cint, Cint, Cint, Cint), pre, a, mod, n, num)
end

function dlog_precomp_n_init(pre, a, mod, n, num)
    ccall((:dlog_precomp_n_init, libarb), Cvoid, (dlog_precomp_t, Cint, Cint, Cint, Cint), pre, a, mod, n, num)
end

function dlog_precomp_p_init(pre, a, mod, p, num)
    ccall((:dlog_precomp_p_init, libarb), Cvoid, (dlog_precomp_t, Cint, Cint, Cint, Cint), pre, a, mod, p, num)
end

function dlog_precomp_pe_init(pre, a, mod, p, e, pe, num)
    ccall((:dlog_precomp_pe_init, libarb), Cvoid, (dlog_precomp_t, Cint, Cint, Cint, Cint, Cint, Cint), pre, a, mod, p, e, pe, num)
end

function dlog_precomp_clear(pre)
    ccall((:dlog_precomp_clear, libarb), Cvoid, (dlog_precomp_t,), pre)
end

function dlog_precomp()
    ccall((:dlog_precomp, libarb), Cint, ())
end

function dlog_order23_init()
    ccall((:dlog_order23_init, libarb), Cint, ())
end

function dlog_table_init()
    ccall((:dlog_table_init, libarb), Cint, ())
end

function dlog_crt_init()
    ccall((:dlog_crt_init, libarb), Cint, ())
end

function dlog_power_init()
    ccall((:dlog_power_init, libarb), Cint, ())
end

function dlog_modpe_init()
    ccall((:dlog_modpe_init, libarb), Cint, ())
end

function dlog_bsgs_init()
    ccall((:dlog_bsgs_init, libarb), Cint, ())
end

function dlog_1modpe_init(t, a1, p, e, pe)
    ccall((:dlog_1modpe_init, libarb), Cvoid, (dlog_1modpe_t, Cint, Cint, Cint, Cint), t, a1, p, e, pe)
end

function dlog_rho_init(t, a, mod, n)
    ccall((:dlog_rho_init, libarb), Cvoid, (dlog_rho_t, Cint, Cint, Cint), t, a, mod, n)
end

function dlog_once()
    ccall((:dlog_once, libarb), Cint, ())
end

function dlog_order23_clear(t)
    ccall((:dlog_order23_clear, libarb), Cvoid, (dlog_order23_t,), t)
end

function dlog_table_clear(t)
    ccall((:dlog_table_clear, libarb), Cvoid, (dlog_table_t,), t)
end

function dlog_crt_clear(t)
    ccall((:dlog_crt_clear, libarb), Cvoid, (dlog_crt_t,), t)
end

function dlog_power_clear(t)
    ccall((:dlog_power_clear, libarb), Cvoid, (dlog_power_t,), t)
end

function dlog_modpe_clear(t)
    ccall((:dlog_modpe_clear, libarb), Cvoid, (dlog_modpe_t,), t)
end

function dlog_bsgs_clear(t)
    ccall((:dlog_bsgs_clear, libarb), Cvoid, (dlog_bsgs_t,), t)
end

function dlog_rho_clear(t)
    ccall((:dlog_rho_clear, libarb), Cvoid, (dlog_rho_t,), t)
end

function dlog_bsgs_size()
    ccall((:dlog_bsgs_size, libarb), Cint, ())
end

function dlog_order23()
    ccall((:dlog_order23, libarb), Cint, ())
end

function dlog_table()
    ccall((:dlog_table, libarb), Cint, ())
end

function dlog_crt()
    ccall((:dlog_crt, libarb), Cint, ())
end

function dlog_power()
    ccall((:dlog_power, libarb), Cint, ())
end

function dlog_modpe()
    ccall((:dlog_modpe, libarb), Cint, ())
end

function dlog_bsgs()
    ccall((:dlog_bsgs, libarb), Cint, ())
end

function dlog_rho()
    ccall((:dlog_rho, libarb), Cint, ())
end

function dlog_1modpe_1modp()
    ccall((:dlog_1modpe_1modp, libarb), Cint, ())
end

function dlog_1modpe()
    ccall((:dlog_1modpe, libarb), Cint, ())
end

function dlog_mod2e_1mod4()
    ccall((:dlog_mod2e_1mod4, libarb), Cint, ())
end

function dlog_mod2e()
    ccall((:dlog_mod2e, libarb), Cint, ())
end

function dlog_n_factor_group(fac, bound)
    ccall((:dlog_n_factor_group, libarb), Cvoid, (Ptr{Cint}, Cint), fac, bound)
end

function dlog_vec_pindex_factorgcd()
    ccall((:dlog_vec_pindex_factorgcd, libarb), Cint, ())
end

function dlog_vec_fill(v, nv, x)
    ccall((:dlog_vec_fill, libarb), Cvoid, (Ptr{Cint}, Cint, Cint), v, nv, x)
end

function dlog_vec_set_not_found(v, nv, mod)
    ccall((:dlog_vec_set_not_found, libarb), Cvoid, (Ptr{Cint}, Cint, Cint), v, nv, mod)
end

function dlog_vec_loop(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_loop, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_loop_add(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_loop_add, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_eratos_add(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_eratos_add, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_eratos(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_eratos, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_sieve_add(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_sieve_add, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_sieve(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_sieve, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_add(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec_add, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec(v, nv, a, va, mod, na, order)
    ccall((:dlog_vec, libarb), Cvoid, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), v, nv, a, va, mod, na, order)
end

function dlog_vec_sieve_precomp(v, nv, pre, a, va, mod, na, order)
    ccall((:dlog_vec_sieve_precomp, libarb), Cvoid, (Ptr{Cint}, Cint, dlog_precomp_t, Cint, Cint, Cint, Cint, Cint), v, nv, pre, a, va, mod, na, order)
end

function dlog_vec_sieve_add_precomp(v, nv, pre, a, va, mod, na, order)
    ccall((:dlog_vec_sieve_add_precomp, libarb), Cvoid, (Ptr{Cint}, Cint, dlog_precomp_t, Cint, Cint, Cint, Cint, Cint), v, nv, pre, a, va, mod, na, order)
end

function dlog_vec_add_precomp(v, nv, pre, a, va, mod, na, order)
    ccall((:dlog_vec_add_precomp, libarb), Cvoid, (Ptr{Cint}, Cint, dlog_precomp_t, Cint, Cint, Cint, Cint, Cint), v, nv, pre, a, va, mod, na, order)
end
# Julia wrapper for header: fmpr.h
# Automatically generated using Clang.jl


                                                                                
                                                                                
                                                                                

function rounds_up(rnd, negative)
    ccall((:rounds_up, libarb), Cint, (Cint, Cint), rnd, negative)
end

function rnd_to_mpfr()
    ccall((:rnd_to_mpfr, libarb), Cint, ())
end

function fmpr_init(x)
    ccall((:fmpr_init, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_clear(x)
    ccall((:fmpr_clear, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_zero(x)
    ccall((:fmpr_zero, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_is_zero(x)
    ccall((:fmpr_is_zero, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_special(x)
    ccall((:fmpr_is_special, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_normal(x)
    ccall((:fmpr_is_normal, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_inf(x)
    ccall((:fmpr_is_inf, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_pos_inf(x)
    ccall((:fmpr_is_pos_inf, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_neg_inf(x)
    ccall((:fmpr_is_neg_inf, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_nan(x)
    ccall((:fmpr_is_nan, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_finite(x)
    ccall((:fmpr_is_finite, libarb), Cint, (fmpr_t,), x)
end

function fmpr_pos_inf(x)
    ccall((:fmpr_pos_inf, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_neg_inf(x)
    ccall((:fmpr_neg_inf, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_nan(x)
    ccall((:fmpr_nan, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_is_one(x)
    ccall((:fmpr_is_one, libarb), Cint, (fmpr_t,), x)
end

function fmpr_one(x)
    ccall((:fmpr_one, libarb), Cvoid, (fmpr_t,), x)
end

function _fmpr_normalise_naive()
    ccall((:_fmpr_normalise_naive, libarb), Cint, ())
end

function fmpr_set(y, x)
    ccall((:fmpr_set, libarb), Cvoid, (fmpr_t, fmpr_t), y, x)
end

function fmpr_swap(x, y)
    ccall((:fmpr_swap, libarb), Cvoid, (fmpr_t, fmpr_t), x, y)
end

function _fmpr_set_round()
    ccall((:_fmpr_set_round, libarb), Cint, ())
end

function _fmpr_normalise()
    ccall((:_fmpr_normalise, libarb), Cint, ())
end

function fmpr_set_round_naive()
    ccall((:fmpr_set_round_naive, libarb), Cint, ())
end

function fmpr_set_round()
    ccall((:fmpr_set_round, libarb), Cint, ())
end

function fmpr_set_round_fmpz_2exp()
    ccall((:fmpr_set_round_fmpz_2exp, libarb), Cint, ())
end

function fmpr_set_round_fmpz()
    ccall((:fmpr_set_round_fmpz, libarb), Cint, ())
end

function _fmpr_set_round_mpn()
    ccall((:_fmpr_set_round_mpn, libarb), Cint, ())
end

function fmpr_set_round_ui_2exp_fmpz()
    ccall((:fmpr_set_round_ui_2exp_fmpz, libarb), Cint, ())
end

function fmpr_set_round_uiui_2exp_fmpz()
    ccall((:fmpr_set_round_uiui_2exp_fmpz, libarb), Cint, ())
end

function fmpr_ulp(u, x, prec)
    ccall((:fmpr_ulp, libarb), Cvoid, (fmpr_t, fmpr_t, Cint), u, x, prec)
end

function fmpr_check_ulp(result, r, prec)
    ccall((:fmpr_check_ulp, libarb), Cint, (fmpr_t, Cint, Cint), result, r, prec)
end

function fmpr_equal(x, y)
    ccall((:fmpr_equal, libarb), Cint, (fmpr_t, fmpr_t), x, y)
end

function fmpr_sgn(x)
    ccall((:fmpr_sgn, libarb), Cint, (fmpr_t,), x)
end

function fmpr_cmp(x, y)
    ccall((:fmpr_cmp, libarb), Cint, (fmpr_t, fmpr_t), x, y)
end

function fmpr_cmpabs(x, y)
    ccall((:fmpr_cmpabs, libarb), Cint, (fmpr_t, fmpr_t), x, y)
end

function fmpr_cmpabs_ui(x, y)
    ccall((:fmpr_cmpabs_ui, libarb), Cint, (fmpr_t, Cint), x, y)
end

function fmpr_randtest(x, state, bits, exp_bits)
    ccall((:fmpr_randtest, libarb), Cvoid, (fmpr_t, Cint, Cint, Cint), x, state, bits, exp_bits)
end

function fmpr_randtest_not_zero(x, state, bits, exp_bits)
    ccall((:fmpr_randtest_not_zero, libarb), Cvoid, (fmpr_t, Cint, Cint, Cint), x, state, bits, exp_bits)
end

function fmpr_randtest_special(x, state, bits, exp_bits)
    ccall((:fmpr_randtest_special, libarb), Cvoid, (fmpr_t, Cint, Cint, Cint), x, state, bits, exp_bits)
end

function fmpr_get_mpfr(x, y, rnd)
    ccall((:fmpr_get_mpfr, libarb), Cint, (Cint, fmpr_t, Cint), x, y, rnd)
end

function fmpr_set_mpfr(x, y)
    ccall((:fmpr_set_mpfr, libarb), Cvoid, (fmpr_t, Cint), x, y)
end

function fmpr_get_d(x, rnd)
    ccall((:fmpr_get_d, libarb), Cdouble, (fmpr_t, Cint), x, rnd)
end

function fmpr_set_d(x, v)
    ccall((:fmpr_set_d, libarb), Cvoid, (fmpr_t, Cdouble), x, v)
end

function fmpr_set_ui(x, c)
    ccall((:fmpr_set_ui, libarb), Cvoid, (fmpr_t, Cint), x, c)
end

function fmpr_set_si(x, c)
    ccall((:fmpr_set_si, libarb), Cvoid, (fmpr_t, Cint), x, c)
end

function fmpr_set_fmpz(x, c)
    ccall((:fmpr_set_fmpz, libarb), Cvoid, (fmpr_t, Cint), x, c)
end

function _fmpr_add_eps()
    ccall((:_fmpr_add_eps, libarb), Cint, ())
end

function _fmpr_add_mpn()
    ccall((:_fmpr_add_mpn, libarb), Cint, ())
end

function _fmpr_add_1x1()
    ccall((:_fmpr_add_1x1, libarb), Cint, ())
end

function fmpr_add_naive()
    ccall((:fmpr_add_naive, libarb), Cint, ())
end

function _fmpr_mul_mpn()
    ccall((:_fmpr_mul_mpn, libarb), Cint, ())
end

function _fmpr_mul_1x1()
    ccall((:_fmpr_mul_1x1, libarb), Cint, ())
end

function fmpr_mul_naive()
    ccall((:fmpr_mul_naive, libarb), Cint, ())
end

function fmpr_mul()
    ccall((:fmpr_mul, libarb), Cint, ())
end

function fmpr_mul_ui()
    ccall((:fmpr_mul_ui, libarb), Cint, ())
end

function fmpr_mul_si()
    ccall((:fmpr_mul_si, libarb), Cint, ())
end

function fmpr_mul_fmpz()
    ccall((:fmpr_mul_fmpz, libarb), Cint, ())
end

function fmpr_add()
    ccall((:fmpr_add, libarb), Cint, ())
end

function fmpr_add_ui()
    ccall((:fmpr_add_ui, libarb), Cint, ())
end

function fmpr_add_si()
    ccall((:fmpr_add_si, libarb), Cint, ())
end

function fmpr_add_fmpz()
    ccall((:fmpr_add_fmpz, libarb), Cint, ())
end

function fmpr_sub()
    ccall((:fmpr_sub, libarb), Cint, ())
end

function fmpr_sub_ui()
    ccall((:fmpr_sub_ui, libarb), Cint, ())
end

function fmpr_sub_si()
    ccall((:fmpr_sub_si, libarb), Cint, ())
end

function fmpr_sub_fmpz()
    ccall((:fmpr_sub_fmpz, libarb), Cint, ())
end

function fmpr_div()
    ccall((:fmpr_div, libarb), Cint, ())
end

function fmpr_div_ui()
    ccall((:fmpr_div_ui, libarb), Cint, ())
end

function fmpr_ui_div()
    ccall((:fmpr_ui_div, libarb), Cint, ())
end

function fmpr_div_si()
    ccall((:fmpr_div_si, libarb), Cint, ())
end

function fmpr_si_div()
    ccall((:fmpr_si_div, libarb), Cint, ())
end

function fmpr_div_fmpz()
    ccall((:fmpr_div_fmpz, libarb), Cint, ())
end

function fmpr_fmpz_div()
    ccall((:fmpr_fmpz_div, libarb), Cint, ())
end

function fmpr_fmpz_div_fmpz()
    ccall((:fmpr_fmpz_div_fmpz, libarb), Cint, ())
end

function fmpr_addmul()
    ccall((:fmpr_addmul, libarb), Cint, ())
end

function fmpr_addmul_ui()
    ccall((:fmpr_addmul_ui, libarb), Cint, ())
end

function fmpr_addmul_si()
    ccall((:fmpr_addmul_si, libarb), Cint, ())
end

function fmpr_addmul_fmpz()
    ccall((:fmpr_addmul_fmpz, libarb), Cint, ())
end

function fmpr_submul()
    ccall((:fmpr_submul, libarb), Cint, ())
end

function fmpr_submul_ui()
    ccall((:fmpr_submul_ui, libarb), Cint, ())
end

function fmpr_submul_si()
    ccall((:fmpr_submul_si, libarb), Cint, ())
end

function fmpr_submul_fmpz()
    ccall((:fmpr_submul_fmpz, libarb), Cint, ())
end

function fmpr_sqrt()
    ccall((:fmpr_sqrt, libarb), Cint, ())
end

function fmpr_sqrt_ui()
    ccall((:fmpr_sqrt_ui, libarb), Cint, ())
end

function fmpr_sqrt_fmpz()
    ccall((:fmpr_sqrt_fmpz, libarb), Cint, ())
end

function fmpr_rsqrt()
    ccall((:fmpr_rsqrt, libarb), Cint, ())
end

function fmpr_root()
    ccall((:fmpr_root, libarb), Cint, ())
end

function fmpr_log()
    ccall((:fmpr_log, libarb), Cint, ())
end

function fmpr_log1p()
    ccall((:fmpr_log1p, libarb), Cint, ())
end

function fmpr_exp()
    ccall((:fmpr_exp, libarb), Cint, ())
end

function fmpr_expm1()
    ccall((:fmpr_expm1, libarb), Cint, ())
end

function fmpr_neg(y, x)
    ccall((:fmpr_neg, libarb), Cvoid, (fmpr_t, fmpr_t), y, x)
end

function fmpr_neg_round()
    ccall((:fmpr_neg_round, libarb), Cint, ())
end

function fmpr_abs(y, x)
    ccall((:fmpr_abs, libarb), Cvoid, (fmpr_t, fmpr_t), y, x)
end

function fmpr_set_error_result(err, result, rret)
    ccall((:fmpr_set_error_result, libarb), Cvoid, (fmpr_t, fmpr_t, Cint), err, result, rret)
end

function fmpr_add_error_result(err, err_in, result, rret, prec, rnd)
    ccall((:fmpr_add_error_result, libarb), Cvoid, (fmpr_t, fmpr_t, fmpr_t, Cint, Cint, Cint), err, err_in, result, rret, prec, rnd)
end

function fmpr_print(x)
    ccall((:fmpr_print, libarb), Cvoid, (fmpr_t,), x)
end

function fmpr_printd(x, digits)
    ccall((:fmpr_printd, libarb), Cvoid, (fmpr_t, Cint), x, digits)
end

function fmpr_mul_2exp_si(y, x, e)
    ccall((:fmpr_mul_2exp_si, libarb), Cvoid, (fmpr_t, fmpr_t, Cint), y, x, e)
end

function fmpr_mul_2exp_fmpz(y, x, e)
    ccall((:fmpr_mul_2exp_fmpz, libarb), Cvoid, (fmpr_t, fmpr_t, Cint), y, x, e)
end

function fmpr_get_fmpq(y, x)
    ccall((:fmpr_get_fmpq, libarb), Cvoid, (Cint, fmpr_t), y, x)
end

function fmpr_set_fmpq()
    ccall((:fmpr_set_fmpq, libarb), Cint, ())
end

function fmpr_get_fmpz(z, x, rnd)
    ccall((:fmpr_get_fmpz, libarb), Cvoid, (Cint, fmpr_t, Cint), z, x, rnd)
end

function fmpr_get_si()
    ccall((:fmpr_get_si, libarb), Cint, ())
end

function fmpr_set_fmpz_2exp(x, man, exp)
    ccall((:fmpr_set_fmpz_2exp, libarb), Cvoid, (fmpr_t, Cint, Cint), x, man, exp)
end

function fmpr_get_fmpz_2exp(man, exp, x)
    ccall((:fmpr_get_fmpz_2exp, libarb), Cvoid, (Cint, Cint, fmpr_t), man, exp, x)
end

function fmpr_get_fmpz_fixed_fmpz(y, x, e)
    ccall((:fmpr_get_fmpz_fixed_fmpz, libarb), Cint, (Cint, fmpr_t, Cint), y, x, e)
end

function fmpr_get_fmpz_fixed_si(y, x, e)
    ccall((:fmpr_get_fmpz_fixed_si, libarb), Cint, (Cint, fmpr_t, Cint), y, x, e)
end

function fmpr_set_si_2exp_si(x, man, exp)
    ccall((:fmpr_set_si_2exp_si, libarb), Cvoid, (fmpr_t, Cint, Cint), x, man, exp)
end

function fmpr_set_ui_2exp_si(x, man, exp)
    ccall((:fmpr_set_ui_2exp_si, libarb), Cvoid, (fmpr_t, Cint, Cint), x, man, exp)
end

function fmpr_cmp_2exp_si(x, e)
    ccall((:fmpr_cmp_2exp_si, libarb), Cint, (fmpr_t, Cint), x, e)
end

function fmpr_cmpabs_2exp_si(x, e)
    ccall((:fmpr_cmpabs_2exp_si, libarb), Cint, (fmpr_t, Cint), x, e)
end

function fmpr_min(z, a, b)
    ccall((:fmpr_min, libarb), Cvoid, (fmpr_t, fmpr_t, fmpr_t), z, a, b)
end

function fmpr_max(z, a, b)
    ccall((:fmpr_max, libarb), Cvoid, (fmpr_t, fmpr_t, fmpr_t), z, a, b)
end

function fmpr_bits()
    ccall((:fmpr_bits, libarb), Cint, ())
end

function fmpr_is_int(x)
    ccall((:fmpr_is_int, libarb), Cint, (fmpr_t,), x)
end

function fmpr_is_int_2exp_si(x, e)
    ccall((:fmpr_is_int_2exp_si, libarb), Cint, (fmpr_t, Cint), x, e)
end

function fmpr_pow_sloppy_fmpz(y, b, e, prec, rnd)
    ccall((:fmpr_pow_sloppy_fmpz, libarb), Cvoid, (fmpr_t, fmpr_t, Cint, Cint, Cint), y, b, e, prec, rnd)
end

function fmpr_pow_sloppy_ui(y, b, e, prec, rnd)
    ccall((:fmpr_pow_sloppy_ui, libarb), Cvoid, (fmpr_t, fmpr_t, Cint, Cint, Cint), y, b, e, prec, rnd)
end

function fmpr_pow_sloppy_si(y, b, e, prec, rnd)
    ccall((:fmpr_pow_sloppy_si, libarb), Cvoid, (fmpr_t, fmpr_t, Cint, Cint, Cint), y, b, e, prec, rnd)
end

function _fmpr_vec_init(n)
    ccall((:_fmpr_vec_init, libarb), fmpr_ptr, (Cint,), n)
end

function _fmpr_vec_clear(v, n)
    ccall((:_fmpr_vec_clear, libarb), Cvoid, (fmpr_ptr, Cint), v, n)
end
# Julia wrapper for header: fmpz_extras.h
# Automatically generated using Clang.jl


function fmpz_add_inline(z, x, y)
    ccall((:fmpz_add_inline, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_add_si(z, x, y)
    ccall((:fmpz_add_si, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_sub_si(z, x, y)
    ccall((:fmpz_sub_si, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_add_si_inline(z, x, y)
    ccall((:fmpz_add_si_inline, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_sub_si_inline(z, x, y)
    ccall((:fmpz_sub_si_inline, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_add_ui_inline(z, x, y)
    ccall((:fmpz_add_ui_inline, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_add2_fmpz_si_inline(z, x, y, c)
    ccall((:fmpz_add2_fmpz_si_inline, libarb), Cvoid, (Cint, Cint, Cint, Cint), z, x, y, c)
end

function fmpz_set_mpn_large(z, src, n, negative)
    ccall((:fmpz_set_mpn_large, libarb), Cvoid, (Cint, Cint, Cint, Cint), z, src, n, negative)
end

function fmpz_adiv_q_2exp(z, x, exp)
    ccall((:fmpz_adiv_q_2exp, libarb), Cvoid, (Cint, Cint, Cint), z, x, exp)
end

function _fmpz_set_si_small(x, v)
    ccall((:_fmpz_set_si_small, libarb), Cvoid, (Cint, Cint), x, v)
end

function _fmpz_sub_small_large()
    ccall((:_fmpz_sub_small_large, libarb), Cint, ())
end

function _fmpz_sub_small()
    ccall((:_fmpz_sub_small, libarb), Cint, ())
end

function _fmpz_size()
    ccall((:_fmpz_size, libarb), Cint, ())
end

function fmpz_ui_mul_ui(r, a, b)
    ccall((:fmpz_ui_mul_ui, libarb), Cvoid, (Cint, Cint, Cint), r, a, b)
end

function fmpz_ui_pow_ui(x, b, e)
    ccall((:fmpz_ui_pow_ui, libarb), Cvoid, (Cint, Cint, Cint), x, b, e)
end

function fmpz_max(z, x, y)
    ccall((:fmpz_max, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_min(z, x, y)
    ccall((:fmpz_min, libarb), Cvoid, (Cint, Cint, Cint), z, x, y)
end

function fmpz_lshift_mpn(z, d, dn, sgnbit, shift)
    ccall((:fmpz_lshift_mpn, libarb), Cvoid, (Cint, Cint, Cint, Cint, Cint), z, d, dn, sgnbit, shift)
end

function fmpz_allocated_bytes()
    ccall((:fmpz_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: hypgeom.h
# Automatically generated using Clang.jl


function hypgeom_init(hyp)
    ccall((:hypgeom_init, libarb), Cvoid, (hypgeom_t,), hyp)
end

function hypgeom_clear(hyp)
    ccall((:hypgeom_clear, libarb), Cvoid, (hypgeom_t,), hyp)
end

function hypgeom_precompute(hyp)
    ccall((:hypgeom_precompute, libarb), Cvoid, (hypgeom_t,), hyp)
end

function hypgeom_estimate_terms()
    ccall((:hypgeom_estimate_terms, libarb), Cint, ())
end

function hypgeom_bound()
    ccall((:hypgeom_bound, libarb), Cint, ())
end

function arb_hypgeom_sum(P, Q, hyp, n, prec)
    ccall((:arb_hypgeom_sum, libarb), Cvoid, (arb_t, arb_t, hypgeom_t, Cint, Cint), P, Q, hyp, n, prec)
end

function arb_hypgeom_infsum(P, Q, hyp, target_prec, prec)
    ccall((:arb_hypgeom_infsum, libarb), Cvoid, (arb_t, arb_t, hypgeom_t, Cint, Cint), P, Q, hyp, target_prec, prec)
end
# Julia wrapper for header: mag.h
# Automatically generated using Clang.jl


function _fmpz_set_fast(f, g)
    ccall((:_fmpz_set_fast, libarb), Cvoid, (Cint, Cint), f, g)
end

function _fmpz_add_fast(z, x, c)
    ccall((:_fmpz_add_fast, libarb), Cvoid, (Cint, Cint, Cint), z, x, c)
end

function _fmpz_add2_fast(z, x, y, c)
    ccall((:_fmpz_add2_fast, libarb), Cvoid, (Cint, Cint, Cint, Cint), z, x, y, c)
end

function _fmpz_sub2_fast(z, x, y, c)
    ccall((:_fmpz_sub2_fast, libarb), Cvoid, (Cint, Cint, Cint, Cint), z, x, y, c)
end

function mag_init(x)
    ccall((:mag_init, libarb), Cvoid, (mag_t,), x)
end

function mag_init_set(x, y)
    ccall((:mag_init_set, libarb), Cvoid, (mag_t, mag_t), x, y)
end

function mag_clear(x)
    ccall((:mag_clear, libarb), Cvoid, (mag_t,), x)
end

function mag_swap(x, y)
    ccall((:mag_swap, libarb), Cvoid, (mag_t, mag_t), x, y)
end

function mag_set(x, y)
    ccall((:mag_set, libarb), Cvoid, (mag_t, mag_t), x, y)
end

function mag_zero(x)
    ccall((:mag_zero, libarb), Cvoid, (mag_t,), x)
end

function mag_one(x)
    ccall((:mag_one, libarb), Cvoid, (mag_t,), x)
end

function mag_is_special(x)
    ccall((:mag_is_special, libarb), Cint, (mag_t,), x)
end

function mag_is_zero(x)
    ccall((:mag_is_zero, libarb), Cint, (mag_t,), x)
end

function mag_inf(x)
    ccall((:mag_inf, libarb), Cvoid, (mag_t,), x)
end

function mag_is_inf(x)
    ccall((:mag_is_inf, libarb), Cint, (mag_t,), x)
end

function mag_is_finite(x)
    ccall((:mag_is_finite, libarb), Cint, (mag_t,), x)
end

function mag_equal(x, y)
    ccall((:mag_equal, libarb), Cint, (mag_t, mag_t), x, y)
end

function mag_mul(z, x, y)
    ccall((:mag_mul, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_mul_lower(z, x, y)
    ccall((:mag_mul_lower, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_addmul(z, x, y)
    ccall((:mag_addmul, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_add_2exp_fmpz(z, x, e)
    ccall((:mag_add_2exp_fmpz, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_add(z, x, y)
    ccall((:mag_add, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_add_lower(z, x, y)
    ccall((:mag_add_lower, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_add_ui(z, x, y)
    ccall((:mag_add_ui, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_add_ui_lower(res, x, y)
    ccall((:mag_add_ui_lower, libarb), Cvoid, (mag_t, mag_t, Cint), res, x, y)
end

function mag_add_ui_2exp_si(z, x, y, e)
    ccall((:mag_add_ui_2exp_si, libarb), Cvoid, (mag_t, mag_t, Cint, Cint), z, x, y, e)
end

function mag_div(z, x, y)
    ccall((:mag_div, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_div_lower(z, x, y)
    ccall((:mag_div_lower, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_inv(res, x)
    ccall((:mag_inv, libarb), Cvoid, (mag_t, mag_t), res, x)
end

function mag_inv_lower(res, x)
    ccall((:mag_inv_lower, libarb), Cvoid, (mag_t, mag_t), res, x)
end

function mag_mul_2exp_si(z, x, y)
    ccall((:mag_mul_2exp_si, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_mul_2exp_fmpz(z, x, y)
    ccall((:mag_mul_2exp_fmpz, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_sub(z, x, y)
    ccall((:mag_sub, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_sub_lower(z, x, y)
    ccall((:mag_sub_lower, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_fast_init_set(x, y)
    ccall((:mag_fast_init_set, libarb), Cvoid, (mag_t, mag_t), x, y)
end

function mag_fast_zero(x)
    ccall((:mag_fast_zero, libarb), Cvoid, (mag_t,), x)
end

function mag_fast_is_zero(x)
    ccall((:mag_fast_is_zero, libarb), Cint, (mag_t,), x)
end

function mag_fast_mul(z, x, y)
    ccall((:mag_fast_mul, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_fast_mul_2exp_si(z, x, y)
    ccall((:mag_fast_mul_2exp_si, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_fast_addmul(z, x, y)
    ccall((:mag_fast_addmul, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_fast_add_2exp_si(z, x, e)
    ccall((:mag_fast_add_2exp_si, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_set_d(z, x)
    ccall((:mag_set_d, libarb), Cvoid, (mag_t, Cdouble), z, x)
end

function mag_set_d_lower(z, x)
    ccall((:mag_set_d_lower, libarb), Cvoid, (mag_t, Cdouble), z, x)
end

function mag_set_d_2exp_fmpz(z, c, exp)
    ccall((:mag_set_d_2exp_fmpz, libarb), Cvoid, (mag_t, Cdouble, Cint), z, c, exp)
end

function mag_set_d_2exp_fmpz_lower(z, c, exp)
    ccall((:mag_set_d_2exp_fmpz_lower, libarb), Cvoid, (mag_t, Cdouble, Cint), z, c, exp)
end

function mag_set_fmpz_2exp_fmpz(z, man, exp)
    ccall((:mag_set_fmpz_2exp_fmpz, libarb), Cvoid, (mag_t, Cint, Cint), z, man, exp)
end

function mag_set_fmpr(x, y)
    ccall((:mag_set_fmpr, libarb), Cvoid, (mag_t, fmpr_t), x, y)
end

function mag_get_fmpr(x, r)
    ccall((:mag_get_fmpr, libarb), Cvoid, (fmpr_t, mag_t), x, r)
end

function mag_randtest_special(x, state, expbits)
    ccall((:mag_randtest_special, libarb), Cvoid, (mag_t, Cint, Cint), x, state, expbits)
end

function mag_randtest(x, state, expbits)
    ccall((:mag_randtest, libarb), Cvoid, (mag_t, Cint, Cint), x, state, expbits)
end

function mag_fprint(file, x)
    ccall((:mag_fprint, libarb), Cvoid, (Ptr{Cint}, mag_t), file, x)
end

function mag_fprintd(file, x, d)
    ccall((:mag_fprintd, libarb), Cvoid, (Ptr{Cint}, mag_t, Cint), file, x, d)
end

function mag_print(x)
    ccall((:mag_print, libarb), Cvoid, (mag_t,), x)
end

function mag_printd(x, d)
    ccall((:mag_printd, libarb), Cvoid, (mag_t, Cint), x, d)
end

function mag_get_fmpq(y, x)
    ccall((:mag_get_fmpq, libarb), Cvoid, (Cint, mag_t), y, x)
end

function mag_get_fmpz(res, x)
    ccall((:mag_get_fmpz, libarb), Cvoid, (Cint, mag_t), res, x)
end

function mag_get_fmpz_lower(res, x)
    ccall((:mag_get_fmpz_lower, libarb), Cvoid, (Cint, mag_t), res, x)
end

function mag_cmp(x, y)
    ccall((:mag_cmp, libarb), Cint, (mag_t, mag_t), x, y)
end

function mag_cmp_2exp_si(x, e)
    ccall((:mag_cmp_2exp_si, libarb), Cint, (mag_t, Cint), x, e)
end

function mag_min(z, x, y)
    ccall((:mag_min, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_max(z, x, y)
    ccall((:mag_max, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function _mag_vec_init(n)
    ccall((:_mag_vec_init, libarb), mag_ptr, (Cint,), n)
end

function _mag_vec_clear(v, n)
    ccall((:_mag_vec_clear, libarb), Cvoid, (mag_ptr, Cint), v, n)
end

function mag_get_d(z)
    ccall((:mag_get_d, libarb), Cdouble, (mag_t,), z)
end

function mag_get_d_log2_approx(x)
    ccall((:mag_get_d_log2_approx, libarb), Cdouble, (mag_t,), x)
end

function mag_d_log_upper_bound(x)
    ccall((:mag_d_log_upper_bound, libarb), Cdouble, (Cdouble,), x)
end

function mag_d_log_lower_bound(x)
    ccall((:mag_d_log_lower_bound, libarb), Cdouble, (Cdouble,), x)
end

function mag_log1p(z, x)
    ccall((:mag_log1p, libarb), Cvoid, (mag_t, mag_t), z, x)
end

function mag_log_ui(t, n)
    ccall((:mag_log_ui, libarb), Cvoid, (mag_t, Cint), t, n)
end

function mag_log(z, x)
    ccall((:mag_log, libarb), Cvoid, (mag_t, mag_t), z, x)
end

function mag_log_lower(z, x)
    ccall((:mag_log_lower, libarb), Cvoid, (mag_t, mag_t), z, x)
end

function mag_neg_log(z, x)
    ccall((:mag_neg_log, libarb), Cvoid, (mag_t, mag_t), z, x)
end

function mag_neg_log_lower(z, x)
    ccall((:mag_neg_log_lower, libarb), Cvoid, (mag_t, mag_t), z, x)
end

function mag_exp(y, x)
    ccall((:mag_exp, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_exp_lower(y, x)
    ccall((:mag_exp_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_expinv(res, x)
    ccall((:mag_expinv, libarb), Cvoid, (mag_t, mag_t), res, x)
end

function mag_expinv_lower(y, x)
    ccall((:mag_expinv_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_expm1(y, x)
    ccall((:mag_expm1, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_exp_tail(z, x, N)
    ccall((:mag_exp_tail, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, N)
end

function mag_sinh(y, x)
    ccall((:mag_sinh, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_sinh_lower(y, x)
    ccall((:mag_sinh_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_cosh(y, x)
    ccall((:mag_cosh, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_cosh_lower(y, x)
    ccall((:mag_cosh_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_pow_ui(z, x, e)
    ccall((:mag_pow_ui, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_pow_ui_lower(z, x, e)
    ccall((:mag_pow_ui_lower, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_pow_fmpz(z, x, e)
    ccall((:mag_pow_fmpz, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_pow_fmpz_lower(z, x, e)
    ccall((:mag_pow_fmpz_lower, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, e)
end

function mag_const_pi(res)
    ccall((:mag_const_pi, libarb), Cvoid, (mag_t,), res)
end

function mag_const_pi_lower(res)
    ccall((:mag_const_pi_lower, libarb), Cvoid, (mag_t,), res)
end

function mag_atan(res, x)
    ccall((:mag_atan, libarb), Cvoid, (mag_t, mag_t), res, x)
end

function mag_atan_lower(res, x)
    ccall((:mag_atan_lower, libarb), Cvoid, (mag_t, mag_t), res, x)
end

function mag_fac_ui(z, n)
    ccall((:mag_fac_ui, libarb), Cvoid, (mag_t, Cint), z, n)
end

function mag_rfac_ui(z, n)
    ccall((:mag_rfac_ui, libarb), Cvoid, (mag_t, Cint), z, n)
end

function mag_bin_uiui(res, n, k)
    ccall((:mag_bin_uiui, libarb), Cvoid, (mag_t, Cint, Cint), res, n, k)
end

function mag_bernoulli_div_fac_ui(z, n)
    ccall((:mag_bernoulli_div_fac_ui, libarb), Cvoid, (mag_t, Cint), z, n)
end

function mag_set_fmpz_2exp_fmpz_lower(z, man, exp)
    ccall((:mag_set_fmpz_2exp_fmpz_lower, libarb), Cvoid, (mag_t, Cint, Cint), z, man, exp)
end

function mag_sqrt(y, x)
    ccall((:mag_sqrt, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_sqrt_lower(y, x)
    ccall((:mag_sqrt_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_rsqrt(y, x)
    ccall((:mag_rsqrt, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_rsqrt_lower(y, x)
    ccall((:mag_rsqrt_lower, libarb), Cvoid, (mag_t, mag_t), y, x)
end

function mag_root(y, x, n)
    ccall((:mag_root, libarb), Cvoid, (mag_t, mag_t, Cint), y, x, n)
end

function mag_hypot(z, x, y)
    ccall((:mag_hypot, libarb), Cvoid, (mag_t, mag_t, mag_t), z, x, y)
end

function mag_binpow_uiui(b, m, n)
    ccall((:mag_binpow_uiui, libarb), Cvoid, (mag_t, Cint, Cint), b, m, n)
end

function mag_polylog_tail(u, z, sigma, d, N)
    ccall((:mag_polylog_tail, libarb), Cvoid, (mag_t, mag_t, Cint, Cint, Cint), u, z, sigma, d, N)
end

function mag_geom_series(res, x, n)
    ccall((:mag_geom_series, libarb), Cvoid, (mag_t, mag_t, Cint), res, x, n)
end

function mag_hurwitz_zeta_uiui(res, s, a)
    ccall((:mag_hurwitz_zeta_uiui, libarb), Cvoid, (mag_t, Cint, Cint), res, s, a)
end

function mag_set_ui(z, x)
    ccall((:mag_set_ui, libarb), Cvoid, (mag_t, Cint), z, x)
end

function mag_set_ui_lower(z, x)
    ccall((:mag_set_ui_lower, libarb), Cvoid, (mag_t, Cint), z, x)
end

function mag_set_ui_2exp_si(z, v, e)
    ccall((:mag_set_ui_2exp_si, libarb), Cvoid, (mag_t, Cint, Cint), z, v, e)
end

function mag_set_fmpz(z, x)
    ccall((:mag_set_fmpz, libarb), Cvoid, (mag_t, Cint), z, x)
end

function mag_set_fmpz_lower(z, x)
    ccall((:mag_set_fmpz_lower, libarb), Cvoid, (mag_t, Cint), z, x)
end

function mag_mul_ui(z, x, y)
    ccall((:mag_mul_ui, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_mul_ui_lower(z, x, y)
    ccall((:mag_mul_ui_lower, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_mul_fmpz(z, x, y)
    ccall((:mag_mul_fmpz, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_mul_fmpz_lower(z, x, y)
    ccall((:mag_mul_fmpz_lower, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_div_ui(z, x, y)
    ccall((:mag_div_ui, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_div_fmpz(z, x, y)
    ccall((:mag_div_fmpz, libarb), Cvoid, (mag_t, mag_t, Cint), z, x, y)
end

function mag_allocated_bytes()
    ccall((:mag_allocated_bytes, libarb), Cint, ())
end
# Julia wrapper for header: partitions.h
# Automatically generated using Clang.jl


function partitions_rademacher_bound(b, n, N)
    ccall((:partitions_rademacher_bound, libarb), Cvoid, (arf_t, Cint, Cint), b, n, N)
end

function partitions_hrr_sum_arb(x, n, N0, N, use_doubles)
    ccall((:partitions_hrr_sum_arb, libarb), Cvoid, (arb_t, Cint, Cint, Cint, Cint), x, n, N0, N, use_doubles)
end

function partitions_fmpz_fmpz(p, n, use_doubles)
    ccall((:partitions_fmpz_fmpz, libarb), Cvoid, (Cint, Cint, Cint), p, n, use_doubles)
end

function partitions_fmpz_ui(p, n)
    ccall((:partitions_fmpz_ui, libarb), Cvoid, (Cint, Cint), p, n)
end

function partitions_fmpz_ui_using_doubles(p, n)
    ccall((:partitions_fmpz_ui_using_doubles, libarb), Cvoid, (Cint, Cint), p, n)
end

function partitions_leading_fmpz(res, n, prec)
    ccall((:partitions_leading_fmpz, libarb), Cvoid, (arb_t, Cint, Cint), res, n, prec)
end
