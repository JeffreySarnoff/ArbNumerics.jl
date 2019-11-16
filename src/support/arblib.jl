using Libdl
 
iswindows64() = (Sys.iswindows() ? true : false) && (Int == Int64)

const pkgdir = realpath(joinpath(dirname(@__DIR__), ".."))
const libdir = joinpath(pkgdir, "deps", "usr", "lib")
const bindir = joinpath(pkgdir, "deps", "usr", "bin")

if isdir(bindir)
  bindirexts = (x->splitext(x)[2]).(readdir(bindir))
else
  bindirexts = [""]
end

if isdir(libdir)
  libdirexts = (x->splitext(x)[2]).(readdir(bindir))
else
  libdirexts = [""]
end

libdirdlls = sum(".dll" .=== libdirexts)
libdirdylibs = sum(".dylib" .=== libdirexts)
libdirsos = sum(".so" .=== libdirexts)
bindirdlls = sum(".dll" .=== libdirexts)
bindirdylibs = sum(".dylib" .=== libdirexts)
bindirsos = sum(".so" .=== libdirexts)
dlls = libdirdlls + bindirdlls
dylibs = libdirdylibs + bindirdylibs
sos = libdirsos + bindirsos

const UseDlls = dlls >= dylibs && dlls >= sos
const UseDylibs = dylibs >= dlls && dylibs >= sos
const UseSos = sos >= dlls && sos >= dylibs

if UseDlls
  UseBinDir = libdirdlls <= bindirdlls
elseif UseDylibs
  UseBinDir = libdirdylibs <= bindirdylibs
else
  UseBinDir = libdirsos <= bindirsos
end

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
  elseif UseDylibs
    const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dylib")))
    const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dylib")))
    const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dylib")))
    const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dylib")))
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
  elseif UseDylibs
    const LibGMP = Symbol(realpath(joinpath(libdir,  "libgmp-10.dylib")))
    const LibMPFR = Symbol(realpath(joinpath(libdir, "libmpfr-6.dylib")))
    const LibFlint = Symbol(realpath(joinpath(libdir, "libflint.dylib")))
    const LibArb = Symbol(realpath(joinpath(libdir,  "libarb.dylib")))
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
   const LibGMP = Symbol(realpath(joinpath(bindir,  "libgmp-10.dylib")))
   const LibMPFR = Symbol(realpath(joinpath(bindir, "libmpfr-6.dylib")))
   const LibFlint = Symbol(realpath(joinpath(bindir, "libflint.dylib")))
   const LibArb = Symbol(realpath(joinpath(bindir,  "libarb.dylib")))
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
