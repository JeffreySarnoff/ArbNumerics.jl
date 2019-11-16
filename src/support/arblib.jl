using Libdl
 
iswindows64() = (Sys.iswindows() ? true : false) && (Int == Int64)

const pkgdir = realpath(joinpath(dirname(@__DIR__), ".."))
const libdir = joinpath(pkgdir, "deps", "usr", "lib")
const bindir = joinpath(pkgdir, "deps", "usr", "bin")

libdirexts = (x->splitext(x)[2]).(readdir(ArbNumerics.libdir))
bindirexts = (x->splitext(x)[2]).(readdir(ArbNumerics.bindir))
libdirdlls = sum(".dll" .=== libdirexts)
libdirdynlibs = sum(".dynlib" .=== libdirexts)
libdirdsos = sum(".so" .=== libdirexts)
bindirdlls = sum(".dll" .=== libdirexts)
bindirdynlibs = sum(".dynlib" .=== libdirexts)
bindirdsos = sum(".so" .=== libdirexts)
dlls = libdirdlls + bindirdlls
dynlibs = libdirdynlibs + bindirdynlibs
sos = libdirsos + bindirsos

const UseBinDir = libdirdlls+libdirdynlibs+libdirsos <= bindirdlls+bindirdynlibs+bindirsos
const UseDlls = dlls >= dynlibs && dlls >= sos
const UseDynlibs = dynlibs >= dlls && dynlibs >= sos
const UseSos = sos >= dlls && sos >= dynlibs

if UseBinDir
  if UseDlls
    const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dll")))
    const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dll")))
    const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dll")))
    const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dll")))
  elseif UseSos
    const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.so")))
    const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.so")))
    const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.so")))
    const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.so")))
  elseif UseDynlibs
    const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dynlib")))
    const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dynlib")))
    const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dynlib")))
    const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dynlib")))
  else
    throw(ErrorException("Compiled library files were not found"))
  end
else
  if UseDlls
    const LibGMP = Symbol(realpath(joinpath(libdir,  "libgmp-10.dll")))
    const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr-6.dll")))
    const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.dll")))
    const LibArb = Symbol(realpath(joinpath(libdir,  "libarb.dll")))
  elseif UseSos
    const LibGMP = Symbol(realpath(joinpath(libdir,  "libgmp-10.so")))
    const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr-6.so")))
    const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.so")))
    const LibArb = Symbol(realpath(joinpath(libdir,  "libarb.so")))
  elseif UseDynlibs
    const LibGMP = Symbol(realpath(joinpath(libdir,  "libgmp-10.dynlib")))
    const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr-6.dynlib")))
    const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.dynlib")))
    const LibArb = Symbol(realpath(joinpath(libdir,  "libarb.dynlib")))
  else
    throw(ErrorException("Compiled library files were not found"))
  end
end

#=
if Sys.iswindows()
   const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dll")))
   const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dll")))
   const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dll")))
   const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dll")))
elseif Sys.isapple()
   const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dynlib")))
   const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dynlib")))
   const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dynlib")))
   const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dynlib")))
else
   const LibGMP = Symbol(realpath(joinpath(libdir, "libgmp.so")))
   const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr.so")))
   const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.so")))
   const LibArb = Symbol(realpath(joinpath(libdir, "libarb.so")))
end
=#

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
