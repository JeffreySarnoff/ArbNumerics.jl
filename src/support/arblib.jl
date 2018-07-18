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

println(string("atdir = ",@__DIR__))
println(string("atdir.. = ",normpath(joinpath(@__DIR__,"..")))
println(string("atdir../.. = ",normpath(joinpath(@__DIR__,"..","..")))
    
const ArbLibsDir = abspath(normpath(joinpath(@__DIR__,"../../local/lib")))

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

