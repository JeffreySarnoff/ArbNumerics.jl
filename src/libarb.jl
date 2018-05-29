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

NemoLibsDir = abspath(joinpath( package_directory("Nemo"), "local/lib"))
libFiles = readdir(NemoLibsDir)

libarb = library_filepath( NemoLibsDir, libFiles, "libarb" )
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
    
if hasnemo

    NemoLibsDir = abspath(joinpath( package_directory("Nemo"), "local/lib"))
    libFiles = readdir(NemoLibsDir)

    const LibArb = library_filepath( NemoLibsDir, libFiles, "libarb" )

elseif hasarb
    
    const LibArb = realpath(libdirpath("arb"))

else

   throw(ErrorException("You must first add Nemo.jl or get and compile the Arb C library"))

end


# @ccall(@libarb(library_function), ReturnType, (arg types), args)
macro libarb(libraryfunction)
    (:($libraryfunction), LibArb)
end
