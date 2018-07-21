using Pkg
using BinDeps
using Libdl

const pathsep = Sys.iswindows() ? "\\" : "/"

# get the complete directory path an library filename

function libdirpath(libname::String, prefix_lib::Bool=true)
    if !startswith(libname, "lib") && prefix_lib
       libname = string("lib", libname)
    end

    libstr = Libdl.find_library(libname)
    length(libstr) === 0 && throw(ErrorException("lib$libname not found"))
    libstr = dlpath(libstr)
    return abspath(libstr)
end


function package_directory(pkgName::String)
    pkgdir = Base.find_package(pkgName)
    return abspath(joinpath(split(pkgdir, pkgName)[1], pkgName))
end

function library_filepath(libsdir::String, filenames::Vector{String}, libname::String)
    libfile = filenames[ findfirst([startswith(x,libname) for x in filenames]) ]
    return joinpath( libsdir, libfile )
end

hasnemo =
    try
        Pkg.status("Nemo"); true
    catch
        false
    end

hasarb =
    try
        libdirpath("arb"); true
    catch
        false
    end

hasflint =
    try
        libdirpath("flint"); true
    catch
        false
    end

if hasarb
    const LibArbBall = realpath(libdirpath("arb"))
end    

if hasflint
    const LibFlint = realpath(libdirpath("flint"))
end

if hasnemo

    NemoLibsDir = abspath(joinpath( package_directory("Nemo"), "local/lib"))
    libFiles = readdir(NemoLibsDir)

    if !hasarb
        const LibArbBall = library_filepath( NemoLibsDir, libFiles, "libarb" )
    end
    if !hasflint
        const LibFlint = library_filepath( NemoLibsDir, libFiles, "libflint" )
    end

end

if !@isdefined LibArbBall
   throw(ErrorException("You must first add Nemo.jl or get and compile the ArbBall and Flint C libraries"))
end

if !@isdefined LibFlint
   throw(ErrorException("You must first add Nemo.jl or get and compile the Flint C library"))
end

# @ccall(@libarb(library_function), ReturnType, (arg types), args)

macro libarb(libraryfunction)
    (:($libraryfunction), LibArbBall)
end

macro libflint(libraryfunction)
    (:($libraryfunction), LibFlint)
end




#=
# get the complete directory path an library filename

function libdirpath(libname::String, prefix_lib::Bool=true)
    if !startswith(libname, "lib") && prefix_lib
       libname = string("lib", libname)
    end

    libstr = Libdl.find_library(libname)
    length(libstr) === 0 && throw(ErrorException("lib$libname not found"))
    libstr = dlpath(libstr)
    return abspath(libstr)
end


function package_directory(pkgName::String)
    pkgdir = Base.find_package(pkgName)
    return abspath(joinpath(split(pkgdir, pkgName)[1], pkgName))
end

function library_filepath(libsdir::String, filenames::Vector{String}, libname::String)
    libfile = filenames[ findfirst([startswith(x,libname) for x in filenames]) ]
    return joinpath( libsdir, libfile )
end


println(string("atdir = ",@__DIR__))
println(string("atdir.. = ",normpath(joinpath(@__DIR__,".."))))
println(string("atdir../.. = ",normpath(joinpath(@__DIR__,"..",".."))))
    
const ArbLibsDir = ENV["ARBLIBDIR"]; #abspath(normpath(joinpath(@__DIR__,"../../local/lib")))

libFiles = readdir(ArbLibsDir)

const LibArb = library_filepath( ArbLibsDir, libFiles, "libarb" )
const LibFlint = library_filepath( ArbLibsDir, libFiles, "libflint" )


# @ccall(@libarb(library_function), ReturnType, (arg types), args)

macro libarb(libraryfunction)
    (:($libraryfunction), LibArbReal)
end

macro libflint(libraryfunction)
    (:($libraryfunction), LibFlint)
end
=#
