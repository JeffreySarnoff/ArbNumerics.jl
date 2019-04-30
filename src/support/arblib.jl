using Libdl
 
iswindows64() = (Sys.iswindows() ? true : false) && (Int == Int64)

const pkgdir = realpath(joinpath(dirname(@__DIR__), ".."))
const libdir = joinpath(pkgdir, "deps", "usr", "lib")
const bindir = joinpath(pkgdir, "deps", "usr", "bin")

println(libdir);println("")
println(bindir);println("")

if Sys.iswindows()
   const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10")))
   const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6")))
   const LibFlint = Symbol(realpath(joinpath(bindir, "libflint")))
   const LibArb = Symbol(realpath(joinpath(bindir,  "libarb")))
else
   const LibGMP = Symbol(realpath(joinpath(libdir, "libgmp")))
   const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr")))
   const LibFlint = Symbol(realpath(joinpath(libdir, "libflint")))
   const LibArb = Symbol(realpath(joinpath(pkgdir, "deps", "usr", "lib", "libarb")))
end

println(LibArb);println("")

macro libarb(libraryfunction)
    (:($libraryfunction), LibArb)
end

macro libflint(libraryfunction)
    (:($libraryfunction), LibFlint)
end

macro libgmp(libraryfunction)
    (:($libraryfunction), LibGMP)
end

macro libmpfr(libraryfunction)
    (:($libraryfunction), LibMPFR)
end


#=
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
    println("libstr = ", libstr);println("")
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

 
    
const LibsDir = abspath(normpath(joinpath(@__DIR__,"..","..","deps","usr","lib")))
println("LibsDir = ",LibsDir);println("")

libnames = readdir(LibsDir)

haslibarb   = any(startswith(x,"libarb") for x in libnames)
haslibflint = any(startswith(x,"libflint") for x in libnames)

if !(haslibarb)
   throw(ErrorException(string("the Arb C library was not found in ",LibsDir)))
elseif !(haslibflint)
   throw(ErrorException(string("the Flint C library was not found in ",LibsDir)))
end


const LibArb   = library_filepath( LibsDir, libnames, "libarb"   )
const LibFlint = library_filepath( LibsDir, libnames, "libflint" )
println(LibArb);println("");

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
=#
