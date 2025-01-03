using Clang.Generators
#using Clang.LibFlint3.Flint3_jll
using Clang.LibClang.Clang_jll

pth = s"c:/test/ArbNumerics.jl/src/clang"
cd(pth)

#include_dir = normpath(Clang_jll.artifact_dir, "include")
include_dir = normpath(pwd(), "include")
clang_dir = joinpath(include_dir, "")

# wrapper generator options
options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()
push!(args, "-I$include_dir")

headers = [joinpath(clang_dir, header) for header in readdir(clang_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(clang_dir, args)

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)
