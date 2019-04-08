# from flint2/flint.h

if Int == Int64
    const FLINT_BITS = 64
    const FLINT_D_BITS = 53
    const FLINT64 = 1

    const UWORD_MAX = typemax(UInt64)
    const UWORD_MIN = typemin(UInt64)
    const WORD_MAX  = typemax(Int64)
    const WORD_MIN  = typemin(Int64)
else 
    const FLINT_BITS = 32
    const FLINT_D_BITS = 31
    
    const UWORD_MAX = typemax(UInt32)
    const UWORD_MIN = typemin(UInt32)
    const WORD_MAX  = typemax(Int32)
    const WORD_MIN  = typemin(Int32)
end

const fmpr_rnd_t = Int32

const COEFF_MAX = ((Int(1) << (FLINT_BITS - 2)) - Int(1))
const COEFF_MIN = (-((Int(1) << (FLINT_BITS - 2)) - Int(1)))

# const flint_abort = abort
const flint_abort = -1

const FLINT_TLS_PREFIX = ""

const FLINT_DLL = "libflint"

# Automatically generated using Clang.jl


# Skipping MacroDefinition: ACB_INLINE static __inline__
# Skipping MacroDefinition: acb_realref ( x ) ( & ( x ) -> real )
# Skipping MacroDefinition: acb_imagref ( x ) ( & ( x ) -> imag )

const ACB_LAMBERTW_LEFT = 2
const ACB_LAMBERTW_MIDDLE = 4

struct mantissa_noptr_struct
    d::NTuple{2, Cint}
end

struct mantissa_struct
    noptr::mantissa_noptr_struct
end

struct arf_struct
    exp::Cint
    size::Cint
    d::mantissa_struct
end

struct mag_struct
    exp::Cint
    man::Cint
end

struct arb_struct
    mid::arf_struct
    rad::mag_struct
end

struct acb_struct
    real::arb_struct
    imag::arb_struct
end

const acb_t = NTuple{1, acb_struct}
const acb_ptr = Ptr{acb_struct}
const acb_srcptr = Ptr{acb_struct}
const acb_calc_func_t = Ptr{Cvoid}

struct acb_calc_integrate_opt_struct
    deg_limit::Cint
    eval_limit::Cint
    depth_limit::Cint
    use_heap::Cint
    verbose::Cint
end

const acb_calc_integrate_opt_t = NTuple{1, acb_calc_integrate_opt_struct}

# Skipping MacroDefinition: ACB_DFT_INLINE static __inline__

const CRT_MAX = 15
const DFT_VERB = 0

struct crt_struct
    num::Cint
    n::Cint
    m::NTuple{15, Cint}
    M::NTuple{15, Cint}
    vM::NTuple{15, Cint}
end

const crt_t = NTuple{1, crt_struct}

struct acb_dft_rad2_struct
    e::Cint
    n::Cint
    dv::Cint
    nz::Cint
    z::acb_ptr
end

const acb_dft_rad2_t = NTuple{1, acb_dft_rad2_struct}

struct ANONYMOUS1_t
    rad2::acb_dft_rad2_t
end

struct acb_dft_pre_struct
    n::Cint
    type::Cint
    t::ANONYMOUS1_t
end

const acb_dft_pre_t = NTuple{1, acb_dft_pre_struct}

struct acb_dft_step_struct
    m::Cint
    M::Cint
    dv::Cint
    z::acb_srcptr
    dz::Cint
    pre::acb_dft_pre_t
end

const acb_dft_step_ptr = Ptr{acb_dft_step_struct}

struct acb_dft_cyc_struct
    n::Cint
    z::acb_ptr
    zclear::Cint
    num::Cint
    cyc::acb_dft_step_ptr
end

const acb_dft_cyc_t = NTuple{1, acb_dft_cyc_struct}

struct acb_dft_bluestein_struct
    n::Cint
    dv::Cint
    z::acb_ptr
    g::acb_ptr
    rad2::acb_dft_rad2_t
end

const acb_dft_bluestein_t = NTuple{1, acb_dft_bluestein_struct}

struct acb_dft_prod_struct
    n::Cint
    num::Cint
    cyc::acb_dft_step_ptr
end

const acb_dft_prod_t = NTuple{1, acb_dft_prod_struct}

struct acb_dft_crt_struct
    n::Cint
    c::crt_t
    dv::Cint
    cyc::acb_dft_step_ptr
end

const acb_dft_crt_t = NTuple{1, acb_dft_crt_struct}

struct acb_dft_naive_struct
    n::Cint
    dv::Cint
    zclear::Cint
    z::acb_ptr
    dz::Cint
end

const acb_dft_naive_t = NTuple{1, acb_dft_naive_struct}

# Skipping MacroDefinition: ACB_DIRICHLET_INLINE static __inline__

struct acb_dirichlet_hurwitz_precomp_struct
    s::acb_struct
    err::mag_struct
    coeffs::acb_ptr
    deflate::Cint
    A::Cint
    N::Cint
    K::Cint
end

const acb_dirichlet_hurwitz_precomp_t = NTuple{1, acb_dirichlet_hurwitz_precomp_struct}

struct acb_dirichlet_roots_struct
    order::Cint
    reduced_order::Cint
    z::acb_t
    size::Cint
    depth::Cint
    Z::Ptr{acb_ptr}
    use_pow::Cint
end

const acb_dirichlet_roots_t = NTuple{1, acb_dirichlet_roots_struct}
const ACB_HYPGEOM_2F1_REGULARIZED = 1
const ACB_HYPGEOM_2F1_AB = 2
const ACB_HYPGEOM_2F1_AC = 4
const ACB_HYPGEOM_2F1_BC = 8
const ACB_HYPGEOM_2F1_ABC = 16

# Skipping MacroDefinition: ACB_MAT_INLINE static __inline__
# Skipping MacroDefinition: acb_mat_entry ( mat , i , j ) ( ( mat ) -> rows [ i ] + ( j ) )
# Skipping MacroDefinition: acb_mat_nrows ( mat ) ( ( mat ) -> r )
# Skipping MacroDefinition: acb_mat_ncols ( mat ) ( ( mat ) -> c )

struct acb_mat_struct
    entries::acb_ptr
    r::Cint
    c::Cint
    rows::Ptr{acb_ptr}
end

const acb_mat_t = NTuple{1, acb_mat_struct}

struct psl2z_struct
    a::Cint
    b::Cint
    c::Cint
    d::Cint
end

const psl2z_t = NTuple{1, psl2z_struct}

# Skipping MacroDefinition: ACB_POLY_INLINE static __inline__
# Skipping MacroDefinition: acb_poly_get_coeff_ptr ( poly , n ) ( ( n ) < ( poly ) -> length ? ( poly ) -> coeffs + ( n ) : NULL )

struct acb_poly_struct
    coeffs::acb_ptr
    length::Cint
    alloc::Cint
end

const acb_poly_t = NTuple{1, acb_poly_struct}

# Skipping MacroDefinition: ARB_INLINE static __inline__
# Skipping MacroDefinition: arb_midref ( x ) ( & ( x ) -> mid )
# Skipping MacroDefinition: arb_radref ( x ) ( & ( x ) -> rad )
# Skipping MacroDefinition: ARB_IS_LAGOM ( x ) ( ARF_IS_LAGOM ( arb_midref ( x ) ) && MAG_IS_LAGOM ( arb_radref ( x ) ) )

const FMPR_RND_DOWN = 0
const ARF_RND_DOWN = FMPR_RND_DOWN
const ARB_RND = ARF_RND_DOWN

# Skipping MacroDefinition: ARB_STR_MORE UWORD ( 1 )
# Skipping MacroDefinition: ARB_STR_NO_RADIUS UWORD ( 2 )
# Skipping MacroDefinition: ARB_STR_CONDENSE UWORD ( 16 )
# Skipping MacroDefinition: ARB_DEF_CACHED_CONSTANT ( name , comp_func ) TLS_PREFIX slong name ## _cached_prec = 0 ; TLS_PREFIX arb_t name ## _cached_value ; void name ## _cleanup ( void ) { arb_clear ( name ## _cached_value ) ; name ## _cached_prec = 0 ; } void name ( arb_t x , slong prec ) { if ( name ## _cached_prec < prec ) { if ( name ## _cached_prec == 0 ) { arb_init ( name ## _cached_value ) ; flint_register_cleanup_function ( name ## _cleanup ) ; } comp_func ( name ## _cached_value , prec + 32 ) ; name ## _cached_prec = prec ; } arb_set_round ( x , name ## _cached_value , prec ) ; }

const ARB_ATAN_TAB1_BITS = 8
const ARB_ATAN_TAB1_PREC = 512
const ARB_ATAN_TAB1_LIMBS = ARB_ATAN_TAB1_PREC / FLINT_BITS
const ARB_ATAN_TAB21_BITS = 5
const ARB_ATAN_TAB22_BITS = 5
const ARB_ATAN_TAB2_PREC = 4608
const ARB_ATAN_TAB2_LIMBS = ARB_ATAN_TAB2_PREC / FLINT_BITS
const ARB_LOG_TAB11_BITS = 7
const ARB_LOG_TAB12_BITS = 7
const ARB_LOG_TAB1_PREC = 512
const ARB_LOG_TAB1_LIMBS = ARB_LOG_TAB1_PREC / FLINT_BITS
const ARB_LOG_TAB21_BITS = 5
const ARB_LOG_TAB22_BITS = 5
const ARB_LOG_TAB2_PREC = 4608
const ARB_LOG_TAB2_LIMBS = ARB_LOG_TAB2_PREC / FLINT_BITS
const ARB_EXP_TAB1_NUM = 178
const ARB_EXP_TAB1_BITS = 8
const ARB_EXP_TAB1_PREC = 512
const ARB_EXP_TAB1_LIMBS = ARB_EXP_TAB1_PREC / FLINT_BITS
const ARB_EXP_TAB21_NUM = 23
const ARB_EXP_TAB21_BITS = 5
const ARB_EXP_TAB22_BITS = 5
const ARB_EXP_TAB22_NUM = 1 << ARB_EXP_TAB22_BITS
const ARB_EXP_TAB2_PREC = 4608
const ARB_EXP_TAB2_LIMBS = ARB_EXP_TAB2_PREC / FLINT_BITS
const ARB_SIN_COS_TAB1_NUM = 203
const ARB_SIN_COS_TAB1_BITS = 8
const ARB_SIN_COS_TAB1_PREC = 512
const ARB_SIN_COS_TAB1_LIMBS = ARB_SIN_COS_TAB1_PREC / FLINT_BITS
const ARB_SIN_COS_TAB21_NUM = 26
const ARB_SIN_COS_TAB21_BITS = 5
const ARB_SIN_COS_TAB22_BITS = 5
const ARB_SIN_COS_TAB22_NUM = 1 << ARB_SIN_COS_TAB22_BITS
const ARB_SIN_COS_TAB2_PREC = 4608
const ARB_SIN_COS_TAB2_LIMBS = ARB_SIN_COS_TAB2_PREC / FLINT_BITS
const ARB_PI4_TAB_LIMBS = 4608 / FLINT_BITS
const arb_t = NTuple{1, arb_struct}
const arb_ptr = Ptr{arb_struct}
const arb_srcptr = Ptr{arb_struct}
const ARB_CALC_SUCCESS = 0
const ARB_CALC_IMPRECISE_INPUT = 1
const ARB_CALC_NO_CONVERGENCE = 2
const arb_calc_func_t = Ptr{Cvoid}

struct arf_interval_struct
    a::arf_struct
    b::arf_struct
end

const arf_interval_t = NTuple{1, arf_interval_struct}
const arf_interval_ptr = Ptr{arf_interval_struct}
const arf_interval_srcptr = Ptr{arf_interval_struct}

# Skipping MacroDefinition: ARB_FMPZ_POLY_INLINE static __inline__

const ARB_FMPZ_POLY_ROOTS_VERBOSE = 1

# Skipping MacroDefinition: ARB_MAT_INLINE static __inline__
# Skipping MacroDefinition: arb_mat_entry ( mat , i , j ) ( ( mat ) -> rows [ i ] + ( j ) )
# Skipping MacroDefinition: arb_mat_nrows ( mat ) ( ( mat ) -> r )
# Skipping MacroDefinition: arb_mat_ncols ( mat ) ( ( mat ) -> c )

struct arb_mat_struct
    entries::arb_ptr
    r::Cint
    c::Cint
    rows::Ptr{arb_ptr}
end

const arb_mat_t = NTuple{1, arb_mat_struct}

# Skipping MacroDefinition: ARB_POLY_INLINE static __inline__
# Skipping MacroDefinition: arb_poly_get_coeff_ptr ( poly , n ) ( ( n ) < ( poly ) -> length ? ( poly ) -> coeffs + ( n ) : NULL )
# Skipping MacroDefinition: NEWTON_INIT ( from , to ) { slong __steps [ FLINT_BITS ] , __i , __from , __to ; __steps [ __i = 0 ] = __to = ( to ) ; __from = ( from ) ; while ( __to > __from ) __steps [ ++ __i ] = ( __to = ( __to + 1 ) / 2 ) ;
# Skipping MacroDefinition: NEWTON_BASECASE ( bc_to ) { slong bc_to = __to ;
# Skipping MacroDefinition: NEWTON_LOOP ( step_from , step_to ) { for ( __i -- ; __i >= 0 ; __i -- ) { slong step_from = __steps [ __i + 1 ] ; slong step_to = __steps [ __i ] ;
# Skipping MacroDefinition: NEWTON_END_LOOP } }

struct arb_poly_struct
    coeffs::arb_ptr
    length::Cint
    alloc::Cint
end

const arb_poly_t = NTuple{1, arb_poly_struct}

# Skipping MacroDefinition: ARF_INLINE static __inline__

const arf_rnd_t = fmpr_rnd_t
const FMPR_RND_UP = 1
const ARF_RND_UP = FMPR_RND_UP
const FMPR_RND_FLOOR = 2
const ARF_RND_FLOOR = FMPR_RND_FLOOR
const FMPR_RND_CEIL = 3
const ARF_RND_CEIL = FMPR_RND_CEIL
const FMPR_RND_NEAR = 4
const ARF_RND_NEAR = FMPR_RND_NEAR
const ARF_PREC_EXACT = WORD_MAX

# Skipping MacroDefinition: ARF_PREC_ADD ( prec , extra ) ( ( prec ) == ARF_PREC_EXACT ? ARF_PREC_EXACT : ( prec ) + ( extra ) )

const ARF_RESULT_EXACT = 0
const ARF_RESULT_INEXACT = 1
const MAG_MAX_LAGOM_EXP = COEFF_MAX / 4
const ARF_MAX_LAGOM_EXP = MAG_MAX_LAGOM_EXP
const MAG_MIN_LAGOM_EXP = -MAG_MAX_LAGOM_EXP
const ARF_MIN_LAGOM_EXP = MAG_MIN_LAGOM_EXP
const ARF_EXP_ZERO = 0
const ARF_EXP_NAN = COEFF_MIN
const ARF_EXP_POS_INF = COEFF_MIN + 1
const ARF_EXP_NEG_INF = COEFF_MIN + 2

# Skipping MacroDefinition: ARF_EXP ( x ) ( ( x ) -> exp )
# Skipping MacroDefinition: ARF_EXPREF ( x ) ( & ( x ) -> exp )
# Skipping MacroDefinition: ARF_IS_LAGOM ( x ) ( ARF_EXP ( x ) >= ARF_MIN_LAGOM_EXP && ARF_EXP ( x ) <= ARF_MAX_LAGOM_EXP )
# Skipping MacroDefinition: ARF_HAS_PTR ( x ) ( ( x ) -> size > ( ( 2 << 1 ) + 1 ) )
# Skipping MacroDefinition: ARF_XSIZE ( x ) ( ( x ) -> size )
# Skipping MacroDefinition: ARF_MAKE_XSIZE ( size , sgnbit ) ( ( ( ( mp_size_t ) size ) << 1 ) | sgnbit )
# Skipping MacroDefinition: ARF_SIZE ( x ) ( ARF_XSIZE ( x ) >> 1 )
# Skipping MacroDefinition: ARF_SGNBIT ( x ) ( ARF_XSIZE ( x ) & 1 )
# Skipping MacroDefinition: ARF_NEG ( x ) ( ARF_XSIZE ( x ) ^= 1 )

const ARF_NOPTR_LIMBS = 2

# Skipping MacroDefinition: ARF_NOPTR_D ( x ) ( ( x ) -> d . noptr . d )
# Skipping MacroDefinition: ARF_PTR_D ( x ) ( ( x ) -> d . ptr . d )
# Skipping MacroDefinition: ARF_PTR_ALLOC ( x ) ( ( x ) -> d . ptr . alloc )
# Skipping MacroDefinition: ARF_IS_SPECIAL ( x ) ( ARF_XSIZE ( x ) == 0 )
# Skipping MacroDefinition: ARF_IS_POW2 ( x ) ( ARF_SIZE ( x ) == 1 ) && ( ARF_NOPTR_D ( x ) [ 0 ] == LIMB_TOP )
# Skipping MacroDefinition: ARF_MAKE_SPECIAL ( x ) do { fmpz_clear ( ARF_EXPREF ( x ) ) ; ARF_DEMOTE ( x ) ; ARF_XSIZE ( x ) = 0 ; } while ( 0 )
# Skipping MacroDefinition: ARF_DEMOTE ( x ) do { if ( ARF_HAS_PTR ( x ) ) _arf_demote ( x ) ; } while ( 0 )
# Skipping MacroDefinition: ARF_GET_MPN_READONLY ( xptr , xn , x ) do { xn = ARF_SIZE ( x ) ; if ( xn <= ARF_NOPTR_LIMBS ) xptr = ARF_NOPTR_D ( x ) ; else xptr = ARF_PTR_D ( x ) ; } while ( 0 )
# Skipping MacroDefinition: ARF_GET_TOP_LIMB ( lmb , x ) do { mp_srcptr __xptr ; mp_size_t __xn ; ARF_GET_MPN_READONLY ( __xptr , __xn , ( x ) ) ; ( lmb ) = __xptr [ __xn - 1 ] ; } while ( 0 )
# Skipping MacroDefinition: ARF_GET_MPN_WRITE ( xptr , xn , x ) do { mp_size_t __xn = ( xn ) ; if ( ( __xn ) <= ARF_NOPTR_LIMBS ) { ARF_DEMOTE ( x ) ; xptr = ARF_NOPTR_D ( x ) ; } else { if ( ! ARF_HAS_PTR ( x ) ) { _arf_promote ( x , __xn ) ; } else if ( ARF_PTR_ALLOC ( x ) < ( __xn ) ) { ARF_PTR_D ( x ) = ( mp_ptr ) flint_realloc ( ARF_PTR_D ( x ) , ( xn ) * sizeof ( mp_limb_t ) ) ; ARF_PTR_ALLOC ( x ) = ( __xn ) ; } xptr = ARF_PTR_D ( x ) ; } ARF_XSIZE ( x ) = ARF_MAKE_XSIZE ( __xn , 0 ) ; } while ( 0 )
# Skipping MacroDefinition: UI_ABS_SI ( x ) ( ( ( slong ) ( x ) < 0 ) ? ( - ( ulong ) ( x ) ) : ( ( ulong ) ( x ) ) )

const MUL_MPFR_MIN_LIMBS = 25
const MUL_MPFR_MAX_LIMBS = 10000

# Skipping MacroDefinition: nn_mul_2x1 ( r2 , r1 , r0 , a1 , a0 , b0 ) do { mp_limb_t t1 ; umul_ppmm ( r1 , r0 , a0 , b0 ) ; umul_ppmm ( r2 , t1 , a1 , b0 ) ; add_ssaaaa ( r2 , r1 , r2 , r1 , 0 , t1 ) ; } while ( 0 )
# Skipping MacroDefinition: nn_mul_2x2 ( r3 , r2 , r1 , r0 , a1 , a0 , b1 , b0 ) do { mp_limb_t t1 , t2 , t3 ; umul_ppmm ( r1 , r0 , a0 , b0 ) ; umul_ppmm ( r2 , t1 , a1 , b0 ) ; add_ssaaaa ( r2 , r1 , r2 , r1 , 0 , t1 ) ; umul_ppmm ( t1 , t2 , a0 , b1 ) ; umul_ppmm ( r3 , t3 , a1 , b1 ) ; add_ssaaaa ( r3 , t1 , r3 , t1 , 0 , t3 ) ; add_ssaaaa ( r2 , r1 , r2 , r1 , t1 , t2 ) ; r3 += r2 < t1 ; } while ( 0 )
# Skipping MacroDefinition: ARF_MPN_MUL ( _z , _x , _xn , _y , _yn ) if ( ( _xn ) == ( _yn ) ) { if ( ( _xn ) == 1 ) { umul_ppmm ( ( _z ) [ 1 ] , ( _z ) [ 0 ] , ( _x ) [ 0 ] , ( _y ) [ 0 ] ) ; } else if ( ( _xn ) == 2 ) { mp_limb_t __arb_x1 , __arb_x0 , __arb_y1 , __arb_y0 ; __arb_x0 = ( _x ) [ 0 ] ; __arb_x1 = ( _x ) [ 1 ] ; __arb_y0 = ( _y ) [ 0 ] ; __arb_y1 = ( _y ) [ 1 ] ; nn_mul_2x2 ( ( _z ) [ 3 ] , ( _z ) [ 2 ] , ( _z ) [ 1 ] , ( _z ) [ 0 ] , __arb_x1 , __arb_x0 , __arb_y1 , __arb_y0 ) ; } else if ( ( _x ) == ( _y ) ) { mpn_sqr ( ( _z ) , ( _x ) , ( _xn ) ) ; } else { mpn_mul_n ( ( _z ) , ( _x ) , ( _y ) , ( _xn ) ) ; } } else if ( ( _xn ) > ( _yn ) ) { if ( ( _yn ) == 1 ) ( _z ) [ ( _xn ) + ( _yn ) - 1 ] = mpn_mul_1 ( ( _z ) , ( _x ) , ( _xn ) , ( _y ) [ 0 ] ) ; else mpn_mul ( ( _z ) , ( _x ) , ( _xn ) , ( _y ) , ( _yn ) ) ; } else { if ( ( _xn ) == 1 ) ( _z ) [ ( _xn ) + ( _yn ) - 1 ] = mpn_mul_1 ( ( _z ) , ( _y ) , ( _yn ) , ( _x ) [ 0 ] ) ; else mpn_mul ( ( _z ) , ( _y ) , ( _yn ) , ( _x ) , ( _xn ) ) ; }

const ARF_MUL_STACK_ALLOC = 40
const ARF_MUL_TLS_ALLOC = 1000

# Skipping MacroDefinition: ARF_MUL_TMP_DECL mp_limb_t tmp_stack [ ARF_MUL_STACK_ALLOC ] ;
# Skipping MacroDefinition: ARF_MUL_TMP_ALLOC ( tmp , alloc ) if ( alloc <= ARF_MUL_STACK_ALLOC ) { tmp = tmp_stack ; } else if ( alloc <= ARF_MUL_TLS_ALLOC ) { if ( __arf_mul_alloc < alloc ) { if ( __arf_mul_alloc == 0 ) { flint_register_cleanup_function ( _arf_mul_tmp_cleanup ) ; } __arf_mul_tmp = flint_realloc ( __arf_mul_tmp , sizeof ( mp_limb_t ) * alloc ) ; __arf_mul_alloc = alloc ; } tmp = __arf_mul_tmp ; } else { tmp = flint_malloc ( sizeof ( mp_limb_t ) * alloc ) ; }
# Skipping MacroDefinition: ARF_MUL_TMP_FREE ( tmp , alloc ) if ( alloc > ARF_MUL_TLS_ALLOC ) flint_free ( tmp ) ;
# Skipping MacroDefinition: arf_mul ( z , x , y , prec , rnd ) ( ( rnd == FMPR_RND_DOWN ) ? arf_mul_rnd_down ( z , x , y , prec ) : arf_mul_rnd_any ( z , x , y , prec , rnd ) )

const ARF_ADD_STACK_ALLOC = 40
const ARF_ADD_TLS_ALLOC = 1000

# Skipping MacroDefinition: ARF_ADD_TMP_DECL mp_limb_t tmp_stack [ ARF_ADD_STACK_ALLOC ] ;
# Skipping MacroDefinition: ARF_ADD_TMP_ALLOC ( tmp , alloc ) if ( alloc <= ARF_ADD_STACK_ALLOC ) { tmp = tmp_stack ; } else if ( alloc <= ARF_ADD_TLS_ALLOC ) { if ( __arf_add_alloc < alloc ) { if ( __arf_add_alloc == 0 ) { flint_register_cleanup_function ( _arf_add_tmp_cleanup ) ; } __arf_add_tmp = flint_realloc ( __arf_add_tmp , sizeof ( mp_limb_t ) * alloc ) ; __arf_add_alloc = alloc ; } tmp = __arf_add_tmp ; } else { tmp = flint_malloc ( sizeof ( mp_limb_t ) * alloc ) ; }
# Skipping MacroDefinition: ARF_ADD_TMP_FREE ( tmp , alloc ) if ( alloc > ARF_ADD_TLS_ALLOC ) flint_free ( tmp ) ;

struct mantissa_ptr_struct
    alloc::Cint
    d::Cint
end

const arf_t = NTuple{1, arf_struct}
const arf_ptr = Ptr{arf_struct}
const arf_srcptr = Ptr{arf_struct}
const BERNOULLI_REV_MIN = 32

# Skipping MacroDefinition: BERNOULLI_ENSURE_CACHED ( n ) do { slong __n = ( n ) ; if ( __n >= bernoulli_cache_num ) bernoulli_cache_compute ( __n + 1 ) ; } while ( 0 ) ;

struct bernoulli_rev_struct
    alloc::Cint
    prec::Cint
    max_power::Cint
    powers::Ptr{Cint}
    pow_error::Cint
    prefactor::arb_t
    two_pi_squared::arb_t
    n::Cint
end

const bernoulli_rev_t = NTuple{1, bernoulli_rev_struct}

# Skipping MacroDefinition: BOOL_MAT_INLINE static __inline__

# Skipping MacroDefinition: bool_mat_nrows ( mat ) ( ( mat ) -> r )
# Skipping MacroDefinition: bool_mat_ncols ( mat ) ( ( mat ) -> c )

struct bool_mat_struct
    entries::Ptr{Cint}
    r::Cint
    c::Cint
    rows::Ptr{Ptr{Cint}}
end

const bool_mat_t = NTuple{1, bool_mat_struct}

# Skipping MacroDefinition: DIRICHLET_INLINE static __inline__

const MAX_FACTORS = 15
const DIRICHLET_CHI_NULL = UWORD_MAX

struct dlog_table_struct
    mod::Cint
    table::Ptr{Cint}
end

const dlog_table_t = NTuple{1, dlog_table_struct}

struct ANONYMOUS2_t
    table::dlog_table_t
end

struct dlog_precomp_struct
    type::Cint
    cost::Cint
    t::ANONYMOUS2_t
end

struct dirichlet_prime_group_struct
    p::Cint
    e::Cint
    pe::Cint
    phi::Cint
    g::Cint
    dlog::Ptr{dlog_precomp_struct}
end

struct dirichlet_group_struct
    q::Cint
    q_even::Cint
    mod::Cint
    rad_q::Cint
    phi_q::Cint
    neven::Cint
    num::Cint
    expo::Cint
    P::Ptr{dirichlet_prime_group_struct}
    generators::Ptr{Cint}
    PHI::Ptr{Cint}
end

const dirichlet_group_t = NTuple{1, dirichlet_group_struct}

struct dirichlet_char_struct
    n::Cint
    log::Ptr{Cint}
end

const dirichlet_char_t = NTuple{1, dirichlet_char_struct}

# Skipping MacroDefinition: DLOG_INLINE static __inline__

const DLOG_SMALL_LIM = 50
const DLOG_TABLE_LIM = 50
const DLOG_TABLE_P_LIM = 50
const DLOG_TABLE_MODPE_LIM = 50
const DLOG_TABLE_PE_LIM = 50
const DLOG_TABLE_N_LIM = 50
const DLOG_BSGS_LIM = 500
const DLOG_LOOP_MAX_FACTOR = 6
const DLOG_G_SMALL = 0
const DLOG_G_BIG = 1
const DLOG_NOT_FOUND = UWORD_MAX
const DLOG_NONE = UWORD_MAX
const dlog_precomp_ptr = Ptr{dlog_precomp_struct}

struct dlog_1modpe_struct
    inv1p::Cint
    invloga1::Cint
end

const dlog_1modpe_t = NTuple{1, dlog_1modpe_struct}

struct dlog_modpe_struct
    p::Cint
    e::Cint
    pe1::Cint
    inva::Cint
    pe::Cint
    modp::Ptr{dlog_precomp_struct}
    modpe::dlog_1modpe_t
end

const dlog_modpe_t = NTuple{1, dlog_modpe_struct}

struct apow
    k::Cint
    ak::Cint
end

const apow_t = apow

struct dlog_bsgs_struct
    mod::Cint
    m::Cint
    am::Cint
    g::Cint
    table::Ptr{apow_t}
end

const dlog_bsgs_t = NTuple{1, dlog_bsgs_struct}

struct dlog_rho_struct
    a::Cint
    n::Cint
    mod::Cint
    nisprime::Cint
end

const dlog_rho_t = NTuple{1, dlog_rho_struct}

struct dlog_crt_struct
    mod::Cint
    n::Cint
    num::Cint
    expo::Ptr{Cint}
    crt_coeffs::Ptr{Cint}
    pre::dlog_precomp_ptr
end

const dlog_crt_t = NTuple{1, dlog_crt_struct}

struct dlog_power_struct
    mod::Cint
    p::Cint
    e::Cint
    apk::Ptr{Cint}
    pre::Ptr{dlog_precomp_struct}
end

const dlog_power_t = NTuple{1, dlog_power_struct}
const dlog_order23_t = NTuple{1, Cint}

struct ANONYMOUS3_t
    table::dlog_table_t
end

const dlog_precomp_t = NTuple{1, dlog_precomp_struct}
const TLS_PREFIX = FLINT_TLS_PREFIX
const ARB_DLL = FLINT_DLL

# Skipping MacroDefinition: fmpr_manref ( x ) ( & ( x ) -> man )
# Skipping MacroDefinition: fmpr_expref ( x ) ( & ( x ) -> exp )

const FMPR_RESULT_EXACT = WORD_MAX
const FMPR_PREC_EXACT = WORD_MAX

# Skipping MacroDefinition: FMPR_PREC_ADD ( prec , extra ) ( ( prec ) == FMPR_PREC_EXACT ? FMPR_PREC_EXACT : ( prec ) + ( extra ) )
# Skipping MacroDefinition: FMPR_EXP_POS_INF WORD ( 1 )
# Skipping MacroDefinition: FMPR_EXP_NEG_INF WORD ( 2 )
# Skipping MacroDefinition: FMPR_EXP_NAN WORD ( 3 )
# Skipping MacroDefinition: CALL_MPFR_FUNC ( r , func , y , x , prec , rnd ) do { mpfr_t __t , __u ; mpfr_rnd_t __rnd ; __rnd = rnd_to_mpfr ( rnd ) ; mpfr_init2 ( __t , 2 + fmpz_bits ( fmpr_manref ( x ) ) ) ; mpfr_init2 ( __u , FLINT_MAX ( 2 , prec ) ) ; mpfr_set_emin ( MPFR_EMIN_MIN ) ; mpfr_set_emax ( MPFR_EMAX_MAX ) ; fmpr_get_mpfr ( __t , x , MPFR_RNDD ) ; r = func ( __u , __t , __rnd ) ; if ( mpfr_overflow_p ( ) || mpfr_underflow_p ( ) ) { flint_printf ( "exception: mpfr overflow\n" ) ; flint_abort ( ) ; } fmpr_set_mpfr ( y , __u ) ; if ( r == 0 ) r = FMPR_RESULT_EXACT ; else r = prec - fmpz_bits ( fmpr_manref ( y ) ) ; mpfr_clear ( __t ) ; mpfr_clear ( __u ) ; } while ( 0 ) ;
# Skipping MacroDefinition: CALL_MPFR_FUNC_K ( r , func , y , x , k , prec , rnd ) do { mpfr_t __t , __u ; mpfr_rnd_t __rnd ; __rnd = rnd_to_mpfr ( rnd ) ; mpfr_init2 ( __t , 2 + fmpz_bits ( fmpr_manref ( x ) ) ) ; mpfr_init2 ( __u , FLINT_MAX ( 2 , prec ) ) ; mpfr_set_emin ( MPFR_EMIN_MIN ) ; mpfr_set_emax ( MPFR_EMAX_MAX ) ; fmpr_get_mpfr ( __t , x , MPFR_RNDD ) ; r = func ( __u , __t , k , __rnd ) ; if ( mpfr_overflow_p ( ) || mpfr_underflow_p ( ) ) { flint_printf ( "exception: mpfr overflow\n" ) ; flint_abort ( ) ; } fmpr_set_mpfr ( y , __u ) ; if ( r == 0 ) r = FMPR_RESULT_EXACT ; else r = prec - fmpz_bits ( fmpr_manref ( y ) ) ; mpfr_clear ( __t ) ; mpfr_clear ( __u ) ; } while ( 0 ) ;
# Skipping MacroDefinition: CALL_MPFR_FUNC_2X1 ( r1 , r2 , func , y1 , y2 , x , prec , rnd ) do { mpfr_t __t , __u , __v ; mpfr_rnd_t __rnd ; __rnd = rnd_to_mpfr ( rnd ) ; mpfr_init2 ( __t , 2 + fmpz_bits ( fmpr_manref ( x ) ) ) ; mpfr_init2 ( __u , FLINT_MAX ( 2 , prec ) ) ; mpfr_init2 ( __v , FLINT_MAX ( 2 , prec ) ) ; mpfr_set_emin ( MPFR_EMIN_MIN ) ; mpfr_set_emax ( MPFR_EMAX_MAX ) ; fmpr_get_mpfr ( __t , x , MPFR_RNDD ) ; func ( __u , __v , __t , __rnd ) ; if ( mpfr_overflow_p ( ) || mpfr_underflow_p ( ) ) { flint_printf ( "exception: mpfr overflow\n" ) ; flint_abort ( ) ; } fmpr_set_mpfr ( y1 , __u ) ; r1 = prec - fmpz_bits ( fmpr_manref ( y1 ) ) ; fmpr_set_mpfr ( y2 , __v ) ; r2 = prec - fmpz_bits ( fmpr_manref ( y2 ) ) ; mpfr_clear ( __t ) ; mpfr_clear ( __u ) ; mpfr_clear ( __v ) ; } while ( 0 ) ;

struct fmpr_struct
    man::Cint
    exp::Cint
end

const fmpr_t = NTuple{1, fmpr_struct}
const fmpr_ptr = Ptr{fmpr_struct}
const fmpr_srcptr = Ptr{fmpr_struct}

# Skipping MacroDefinition: FMPZ_GET_MPN_READONLY ( zsign , zn , zptr , ztmp , zv ) if ( ! COEFF_IS_MPZ ( zv ) ) { ( zsign ) = ( zv ) < 0 ; ( ztmp ) = FLINT_ABS ( zv ) ; ( zptr ) = & ( ztmp ) ; ( zn ) = 1 ; } else { __mpz_struct * ___zz = COEFF_TO_PTR ( zv ) ; ( zptr ) = ___zz -> _mp_d ; ( zn ) = ___zz -> _mp_size ; ( zsign ) = ( zn ) < 0 ; ( zn ) = FLINT_ABS ( zn ) ; }

const mag_t = NTuple{1, mag_struct}

struct hypgeom_struct
    A::Cint
    B::Cint
    P::Cint
    Q::Cint
    have_precomputed::Cint
    r::Cint
    boundC::Cint
    boundD::Cint
    boundK::Cint
    MK::mag_t
end

const hypgeom_t = NTuple{1, hypgeom_struct}

# Skipping MacroDefinition: MAG_INLINE static __inline__
# Skipping MacroDefinition: LIMB_ONE ( ( mp_limb_t ) 1 )
# Skipping MacroDefinition: LIMB_ONES ( - ( mp_limb_t ) 1 )
# Skipping MacroDefinition: LIMB_TOP ( ( ( mp_limb_t ) 1 ) << ( FLINT_BITS - 1 ) )
# Skipping MacroDefinition: MASK_LIMB ( n , c ) ( ( n ) & ( LIMB_ONES << ( c ) ) )

const ADD2_FAST_MAX = COEFF_MAX / 4
const ADD2_FAST_MIN = -ADD2_FAST_MAX
const MAG_EXP_POS_INF = COEFF_MIN + 1

# Skipping MacroDefinition: MAG_IS_LAGOM ( x ) ( MAG_EXP ( x ) >= MAG_MIN_LAGOM_EXP && MAG_EXP ( x ) <= MAG_MAX_LAGOM_EXP )
# Skipping MacroDefinition: MAG_EXPREF ( x ) ( & ( x ) -> exp )
# Skipping MacroDefinition: MAG_EXP ( x ) ( ( x ) -> exp )
# Skipping MacroDefinition: MAG_MAN ( x ) ( ( x ) -> man )

const MAG_BITS = 30

# Skipping MacroDefinition: MAG_ONE_HALF ( UWORD ( 1 ) << ( MAG_BITS - 1 ) )
# Skipping MacroDefinition: MAG_FIXMUL ( x , y ) __mag_fixmul32 ( ( x ) , ( y ) )
# Skipping MacroDefinition: MAG_CHECK_BITS ( rr ) if ( MAG_MAN ( rr ) != 0 && FLINT_BIT_COUNT ( MAG_MAN ( rr ) ) != MAG_BITS ) { flint_printf ( "FAIL: wrong number of bits in mantissa!\n" ) ; flint_abort ( ) ; }
# Skipping MacroDefinition: MAG_ADJUST_ONE_TOO_LARGE ( x ) do { mp_limb_t __t = MAG_MAN ( x ) >> MAG_BITS ; MAG_MAN ( x ) = ( MAG_MAN ( x ) >> __t ) + ( __t & MAG_MAN ( x ) ) ; if ( __t ) fmpz_add_ui ( MAG_EXPREF ( x ) , MAG_EXPREF ( x ) , __t ) ; } while ( 0 )
# Skipping MacroDefinition: MAG_FAST_ADJUST_ONE_TOO_LARGE ( x ) do { mp_limb_t __t = MAG_MAN ( x ) >> MAG_BITS ; MAG_MAN ( x ) = ( MAG_MAN ( x ) >> __t ) + ( __t & MAG_MAN ( x ) ) ; MAG_EXP ( x ) += __t ; } while ( 0 )
# Skipping MacroDefinition: MAG_ADJUST_ONE_TOO_SMALL ( x ) do { mp_limb_t __t = ! ( MAG_MAN ( x ) >> ( MAG_BITS - 1 ) ) ; MAG_MAN ( x ) = ( MAG_MAN ( x ) << __t ) ; if ( __t ) fmpz_sub_ui ( MAG_EXPREF ( x ) , MAG_EXPREF ( x ) , __t ) ; } while ( 0 )
# Skipping MacroDefinition: MAG_FAST_ADJUST_ONE_TOO_SMALL ( x ) do { mp_limb_t __t = ! ( MAG_MAN ( x ) >> ( MAG_BITS - 1 ) ) ; MAG_MAN ( x ) = ( MAG_MAN ( x ) << __t ) ; MAG_EXP ( x ) -= __t ; } while ( 0 )
# Skipping MacroDefinition: MAG_SET_D_2EXP ( man , exp , x , xexp ) do { int __cexp ; double __x ; int __fix ; mp_limb_t __man ; __x = frexp ( ( x ) , & __cexp ) ; __man = ( mp_limb_t ) ( __x * ( double ) ( LIMB_ONE << MAG_BITS ) ) + 1 ; __fix = __man >> ( MAG_BITS ) ; __man = ( __man >> __fix ) + __fix ; ( man ) = __man ; ( exp ) = ( xexp ) + __cexp + __fix ; } while ( 0 ) ;
# Skipping MacroDefinition: MAG_SET_D_2EXP_LOWER ( man , exp , x , xexp ) do { int __cexp ; double __x ; int __fix ; mp_limb_t __man ; __x = frexp ( ( x ) , & __cexp ) ; __man = ( mp_limb_t ) ( __x * ( double ) ( LIMB_ONE << MAG_BITS ) ) - 1 ; __fix = __man < MAG_ONE_HALF ; __man = ( __man << __fix ) ; ( man ) = __man ; ( exp ) = ( xexp ) + __cexp - __fix ; } while ( 0 ) ;

const mag_ptr = Ptr{mag_struct}
const mag_srcptr = Ptr{mag_struct}
