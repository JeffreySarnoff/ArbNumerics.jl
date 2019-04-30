using Libdl
 
iswindows64() = (Sys.iswindows() ? true : false) && (Int == Int64)

const pkgdir = realpath(joinpath(dirname(@__DIR__), ".."))
const libdir = joinpath(pkgdir, "deps", "usr", "lib")
const bindir = joinpath(pkgdir, "deps", "usr", "bin")

if Sys.iswindows()
   const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dll")))
   const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dll")))
   const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dll")))
   const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dll")))
else
   const LibGMP = Symbol(realpath(joinpath(libdir, "libgmp.so")))
   const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr.so")))
   const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.so")))
   const LibArb = Symbol(realpath(joinpath(libdir, "libarb.so")))
end

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
