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

 
    
const ArbLibsDir = abspath(normpath(joinpath(@__DIR__,"..","..","local","lib")))

libnames = readdir(ArbLibsDir)

haslibarb   = any(startswith(x,"libarb") for x in libnames)
haslibflint = any(startswith(x,"libflint") for x in libnames)

if !(haslibarb)
   throw(ErrorException(string("the Arb C library was not found in ",ArbLibsDir)))
elseif !(haslibflint)
   throw(ErrorException(string("the Flint C library was not found in ",ArbLibsDir)))
end


const LibArb   = library_filepath( ArbLibsDir, libnames, "libarb"   )
const LibFlint = library_filepath( ArbLibsDir, libnames, "libflint" )

const LibArbHandle   = dlopen(LibArb)
const LibFlintHandle = dlopen(LibFlint)

# @ccall(@libarb(library_function), ReturnType, (arg types), args)

macro libarb(libraryfunction)
    (:($libraryfunction), LibArb)
end

macro libflint(libraryfunction)
    (:($libraryfunction), LibFlint)
end

macro arblib(libraryfunction)
    :(dlsym(LibArbHandle, $libraryfunction))
end

macro flintlib(libraryfunction)
    :(dlsym(LibFlintHandle, $libraryfunction))
end
