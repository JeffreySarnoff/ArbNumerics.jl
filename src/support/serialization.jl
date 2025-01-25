#=

import ArbNumerics: @libarb, @libflint

setworkingprecision(ArbFloat, 53)

af, bf = sqrt(ArbFloat(2)), 1/cbrt(ArbFloat(3))
ar, br = sqrt(ArbReal(2)), 1/(ArbReal(3)^(1//3))
ac  = ArbComplex(ar, -br)
# ERROR cbrt(ArbComplex(3))


julia> setworkingprecision(ArbFloat, 53)
53

julia> 

julia> af, bf = sqrt(ArbFloat(2)), 1/cbrt(ArbFloat(3))
(1.4142135623731, 0.693361274350635)

julia> ar, br = sqrt(ArbReal(2)), 1/(ArbReal(3)^(1//3))
(1.41421356237309, 0.693361274350635)

julia> ac  = ArbComplex(ar, -br)
1.41421356237309 - 0.693361274350635im

julia> afstr = arbfloat2cstr(af)
Cstring(0x00000116068e3f20)
julia> len = Int64(ccall(:strlen, Csize_t, (Cstring,), afstr)) + 1
19

julia> arstr = arbreal2cstr(ar)
Cstring(0x00000116068e3da0)
julia> len = Int64(ccall(:strlen, Csize_t, (Cstring,), arstr)) + 1
24

using Serialization
using Serialization: serialize_type

setworkingprecision(ArbFloat, 500)
af, bf = sqrt(ArbFloat(2)), 1/cbrt(ArbFloat(3))
ar, br = sqrt(ArbReal(2)), 1/(ArbReal(3)^(1//3))
ac  = ArbComplex(ar, -br)

julia> afstr = arbfloat2cstr(af)
Cstring(0x000001161d93d570)

julia> arstr = arbreal2cstr(ar)
Cstring(0x000001161d3c7180)


julia>     len = Int64(ccall(:strlen, Csize_t, (Cstring,), afstr)) + 1
19
julia>     len = Int64(ccall(:strlen, Csize_t, (Cstring,), arstr)) + 1
24


-----------------

using ArbNumerics
using Arblib

# Create an ArbComplex value
z = ArbComplex(1.5, 2.5)

# Convert the ArbComplex value to a string with specified precision
precision = 64  # Specify the precision (in bits)
arb_str = arb_dump_str(z, precision)  # Get the string representation directly from Arb

# Manually add a null terminator to create a C-style string
c_string = join([unsafe_string(arb_str), "\0"])  # Combine the string with a null terminator

# Print the resulting C-style string
println("C string representation: $c_string")

# Optional: View raw bytes for verification
raw_bytes = collect(c_string)
println("Raw bytes: ", raw_bytes)

using ArbNumerics

# Initialize an ArbComplex value
z = ArbComplex(1.5, 2.5)  # A complex number with real and imaginary parts

# Convert the ArbComplex value to a string representation
precision = 64  # Specify the desired precision (bits)
arb_str = string(z, precision)  # Convert ArbComplex to a Julia string

# Manually create a C-compatible null-terminated string
c_str = join(arb_str, '\0')  # Append null byte to the string

# Print the C-compatible string
println("C string representation: $c_str")

# Access the raw bytes if needed for passing to a C library
bytes = collect(c_str)
println("Raw bytes: ", bytes)

The resulting string format will be compatible with Arb's 
expected format for complex numbers, e.g., "(1.5, 2.5)".

    using ArbNumerics
using Arblib

# Create an ArbComplex and dump it as a C string
z = ArbComplex(1.5, 2.5)
precision = 64
c_str = arb_dump_str(z, precision)  # Simulating a dumped C string from Arb

# Convert the C string to a Julia String manually (mimicking the conversion)
julia_str = unsafe_string(c_str)  # Convert the C string to a regular Julia string

# Parse the string to reconstruct the ArbComplex value
# The ArbComplex string format from Arb is usually "(real, imag)"
parsed_values = parse.(ArbReal, split(julia_str[2:end-1], ","))  # Extract real and imaginary parts
reconstructed_z = ArbComplex(parsed_values[1], parsed_values[2])

# Print the reconstructed ArbComplex value
println("Reconstructed ArbComplex value: $reconstructed_z")


using Arblib
using ArbNumerics

# Create an ArbComplex and dump it as a C string
z = ArbComplex(1.5, 2.5)

precision = 64
dumped_cstr = arb_dump_str(z, precision)  # Get a C string representation of the ArbComplex

# Create an uninitialized ArbComplex
reconstructed_z = Acb()

# Use acb_set_str to parse the C string directly into the ArbComplex
acb_set_str(reconstructed_z, unsafe_string(dumped_cstr), precision)

# Print the reconstructed ArbComplex
println("Reconstructed ArbComplex: ", reconstructed_z)

=#
using Serialization
using Serialization: serialize_type

function arbfloat2cstr(x::ArbFloat{P}) where {P}
    ccall(@libarb(arf_dump_str), Cstring, (Ref{ArbFloat},), x)
end
function cstr2arbfloat(x::ArbFloat{P}, s::Cstring) where {P}
    ccall(@libarb(arf_load_str), Cint, (Ref{ArbFloat}, Ref{Cstring}), x, s)
end
arbfloat_from_cstring(x::ArbFloat{P}, s::Cstring) where {P} = cstr2arbfloat((x), s)

function arbreal2cstr(x::ArbReal{P}) where {P}
    ccall(@libarb(arb_dump_str), Cstring, (Ref{ArbReal},), x)
end
function cstr2arbreal(x::ArbReal{P}, s::Cstring) where {P}
    ccall(@libarb(arb_load_str), Cint, (Ref{ArbReal}, Ref{Cstring}), x, s)
end

function arbcomplex2cstr(x::ArbComplex{P}) where {P}
    xre = real(x)
    xim = imag(x)
    
    re_str = arbreal2cstr(xre)
    im_str = arbreal2cstr(xim)

    re_len = Int64(ccall(:strlen, Csize_t, (Cstring,), re_str)) + 1
    im_len = Int64(ccall(:strlen, Csize_t, (Cstring,), im_str)) + 1
    
    ((re_str, im_str), (re_len, im_len))
end

function cstr2arbcomplex(x::ArbComplex{P}, s::Cstring) where {P}
    ccall(@libarb(arb_load_str), Cint, (Ref{ArbReal}, Ref{Cstring}), x, s)
end

#=
# Initialize an acb value
z = Acb(1.5, 2.5)  # acb is a complex number with real and imaginary parts

# Convert acb to string with specified precision
arb_str = string(af)  # Convert acb value to a Julia string

# Convert the string to a C string
c_str = LibC.Cstring(arb_str)

# Print the CString
println("C string: ", c_str)

# If necessary, pass c_str to C functions


using Arblib
using LibC

# Example C string representing a complex number
c_str = LibC.Cstring("(1.5, 2.5)")  # Format: (real, imag)

# Create an uninitialized acb value
z = Acb()

# Convert C string to acb
precision = 64  # Specify the precision (in bits)
acb_set_str(z, unsafe_string(c_str), precision)

# Display the result
println("Converted acb value: ", z)
=#

# thanks Steven G. Johnson

# function Serialization.serialize(s::AbstractSerializer, x::ArbFloat)
function serializer(s::AbstractSerializer, x::ArbFloat)
    Serialization.serialize_type(s, typeof(x))
    unsafestr = ccall(@libarb(arf_dump_str), Cstring, (Ref{ArbFloat},), x)
    len = Int64(ccall(:strlen, Csize_t, (Cstring,), unsafestr)) + 1
    write(s.io, len)
    unsafe_write(s.io, pointer(unsafestr), len)
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return nothing
end

#=

/* Note: may also be hardcoded in a few places. */
#define ARF_NOPTR_LIMBS 2
 
typedef struct
{
    mp_limb_t d[ARF_NOPTR_LIMBS];
}
mantissa_noptr_struct;
 
typedef struct
{
    mp_size_t alloc;
    mp_ptr d;
}
mantissa_ptr_struct;
 
typedef union
{
    mantissa_noptr_struct noptr;
    mantissa_ptr_struct ptr;
}
mantissa_struct;
 
typedef struct
{
    fmpz exp;
    mp_size_t size;
    mantissa_struct d;
}
arf_struct;
 
typedef arf_struct arf_t[1];
typedef arf_struct * arf_ptr;
typedef const arf_struct * arf_srcptr;
 
#define ARF_HAS_PTR	(x)	   ((x)->size > ((2 << 1) + 1))

=#

arf_has_ptr(x) = (x.size) > ((2 << 1) + 1)

# setprecision(ArbFloat, 64)
x = sqrt(ArbFloat(2))
#filename = joinpath(abspath("C:/test/ArbNumerics.jl/test"),"serial"); fil = open(filename,"w")
s = Serializer(IOBuffer())
serialize_type(s, typeof(x))
unsafestr = ccall(@libarb(arf_dump_str), Cstring, (Ref{ArbFloat},), x)
len = Int64(ccall(:strlen, Csize_t, (Cstring,), unsafestr)) + 1
write(s.io, len)
unsafe_write(s.io, pointer(unsafestr), len)
# str = String(take!(s.io))

filename = joinpath(abspath("C:/test/ArbNumerics.jl/test"),"serial"); fil = open(filename,"r")
s = Serializer(fil)

#=
function Serialization.deserialize(s::AbstractSerializer, ::Type{ArbFloat{P}}) where {P}
    len = read(s.io, Int64)::Int64
    str = Serialization.deserialize_string(s, Int(len))
    str
end

str = deserialize(s, typeof(x))
=#

#=
for (T,F) in ((:ArbFloat, :arf_dump_str), (:ArbReal, :arb_dump_str))
  @eval begin
    function Serialization.serialize(s::AbstractSerializer, x::$T)
        serialize_type(s, typeof(x))
        unsafestr = ccall(@libarb($F), Cstring, (Ref{$T},), x)
        len = Int64(ccall(:strlen, Csize_t, (Cstring,), unsafestr)) + 1
        write(s.io, len)
        unsafe_write(s.io, pointer(unsafestr), len)
        ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
        return nothing
    end
  end
end
=#

#=
# Define the structs
struct Inner
    x::Int
    y::Int
end

struct Outer
    ptr::Ref{Inner}  # Using Ref as a pointer
    value::Int
end

# Custom serialization function
function serialize_with_pointers(io::IO, obj::Outer)
    # Serialize the pointed-to Inner struct first
    inner = obj.ptr[]  # Dereference the pointer
    serialize(io, inner.x)
    serialize(io, inner.y)
    
    # Serialize the remaining field
    serialize(io, obj.value)
end

# Custom deserialization function
function deserialize_with_pointers(io::IO)
    # Deserialize the Inner struct components
    x = deserialize(io)
    y = deserialize(io)
    inner = Inner(x, y)
    
    # Deserialize the value
    value = deserialize(io)
    
    # Create and return the Outer struct
    return Outer(Ref(inner), value)
end

# Create test data
inner = Inner(1, 2)
obj = Outer(Ref(inner), 42)

# Serialize
io = IOBuffer()
serialize_with_pointers(io, obj)

# Deserialize
seekstart(io)
restored = deserialize_with_pointers(io)
=#

#=
char *arf_dump_str(const arf_t x)
  Allocates a string and writes a binary representation of x
  to it that can be read by arf_load_str(). 
  The returned string needs to be deallocated with flint_free.

int arf_load_str(arf_t x, const char *str)¶
  Parses str into x. Returns a nonzero value if str is not formatted correctly.
=#

#=
for (T,F) in ((:ArbFloat, :arf_load_str), (:ArbReal, :arb_load_str))
  @eval begin
    function Serialization.deserialize(s::AbstractSerializer, ::Type{$T{P}}) where {P}
        len = read(s.io, Int64)::Int64
        str = Serialization.deserialize_string(s, Int(len))
        # TODO: call arb_load_str to constuct arb_t from str

        return nothing
    end
  end
end

function Serialization.serialize(s::AbstractSerializer, x::ArbComplex)
    serialize_type(s, typeof(x))
    xreal = real(x)
    ximag = imag(x)    
    unsafestr_real = ccall(@libarb(arb_dump_str), Cstring, (Ref{ArbReal},), xreal)
    unsafestr_imag = ccall(@libarb(arb_dump_str), Cstring, (Ref{ArbReal},), ximag)
    unsafestr = unsafestr_real * " " * unsafestr_imag
    len = Int64(ccall(:strlen, Csize_t, (Cstring,), unsafestr)) + 1
    write(s.io, len)
    unsafe_write(s.io, pointer(unsafestr), len)
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return nothing
end
=#

#=
function Serialization.serialize(
    s::Serialization.AbstractSerializer,
    x::Union{mag_struct,arf_struct,arb_struct},
)
    Serialization.serialize_type(s, typeof(x))
    Serialization.serialize(s, dump_string(x))
end

function Serialization.serialize(s::Serialization.AbstractSerializer, x::acb_struct)
    Serialization.serialize_type(s, typeof(x))
    str = dump_string(Arblib.realref(x)) * " " * dump_string(Arblib.imagref(x))
    Serialization.serialize(s, str)
end
=#

#=
Serialization.deserialize(
    s::Serialization.AbstractSerializer,
    T::Type{<:Union{mag_struct,arf_struct,arb_struct}},
) = Arblib.load_string!(T(), Serialization.deserialize(s))

function Serialization.deserialize(s::Serialization.AbstractSerializer, T::Type{acb_struct})
    str = Serialization.deserialize(s)
    # Three spaces in the real part, so we are looking for
    spaces = findall(" ", str)
    @assert length(spaces) == 7

    real_str = str[1:spaces[4].start-1]
    imag_str = str[spaces[4].stop+1:end]

    res = acb_struct()
    Arblib.load_string!(Arblib.realref(res), real_str)
    Arblib.load_string!(Arblib.imagref(res), imag_str)
    return res
end

=#

function Serialization.serialize(s::AbstractSerializer, x::ArbReal)
    serialize_type(s, typeof(x))
    unsafestr = ccall(@libarb(arb_dump_str), Cstring, (Ref{ArbReal},), x)
    len = Int64(ccall(:strlen, Csize_t, (Cstring,), unsafestr)) + 1
    write(s.io, len)
    unsafe_write(s.io, pointer(unsafestr), len)
    ccall(@libflint(flint_free), Cvoid, (Cstring,), unsafestr)
    return nothing
end

# It uses unsafe_write, which allows it to directly write 
# the arb_dump_str buffer contents to the serialization stream;
# I'm being a little low-level here because serialization is
# often performance-critical and so I want to avoid unnecessary
# copies of the string data. 

# The inverse deserialize function should look something like:
function Serialization.deserialize(s::AbstractSerializer, ::Type{ArbFloat{P}}) where {P}
    len = read(s.io, Int64)::Int64
    str = Serialization.deserialize_string(s, Int(len))

    # TODO: call arb_load_str to constuct arb_t from str

    return nothing
end

#=
void arf_init(arf_t x)¶
Initializes the variable x for use. Its value is set to zero.

    function ArbReal{P}() where {P}
        minprec(P, ArbReal)
        z = new{P}(0, 0, 0, 0, 0, 0)
        ccall(@libarb(arb_init), Cvoid, (Ref{ArbReal},), z)
        finalizer(arb_clear, z)
        return z
    end

=#
# This seems like it will require a new low-level constructor 
# to use arb_load_str instead of arb_init.




#=


=#

#=
# deepseek

struct MyStruct
    data::Vector{Int}
    c_ptr::Ptr{Cvoid}  # Pointer to a C struct
end

using Serialization

#=
You need to write a custom serialization function that handles the C pointer appropriately.
     Since you can't directly serialize the pointer, you might need to serialize the data that the pointer points
=#

function serialize_custom(s::AbstractSerializer, obj::MyStruct)
    # Serialize the Julia data
    serialize(s, obj.data)
    
    # Handle the C pointer
    if obj.c_ptr != C_NULL
        # Assuming you have a function to serialize the C struct data
        c_data = get_c_struct_data(obj.c_ptr)
        serialize(s, c_data)
    else
        serialize(s, nothing)
    end
end

#=
a custom deserialization function to reconstruct the object, including the C pointer.
=#

function deserialize_custom(s::AbstractSerializer, ::Type{MyStruct})
    # Deserialize the Julia data
    data = deserialize(s)
    
    # Deserialize the C struct data
    c_data = deserialize(s)
    
    # Reconstruct the C pointer
    if c_data !== nothing
        c_ptr = create_c_struct(c_data)
    else
        c_ptr = C_NULL
    end
    
    return MyStruct(data, c_ptr)
end

# You need to implement the helper functions 
# get_c_struct_data and create_c_struct to handle the C struct data:

function get_c_struct_data(c_ptr::Ptr{Cvoid})
    # Assuming you have a function to extract data from the C struct
    # This is highly dependent on the actual C struct and how you interact with it
    # For example, if the C struct is an array of integers:
    c_data = unsafe_wrap(Array, c_ptr, 3)  # Assuming the C struct contains 3 integers
    return copy(c_data)  # Return a copy to avoid issues with unsafe_wrap
end

function create_c_struct(c_data::Vector{Int})
    # Assuming you have a function to create a C struct from data
    # This is highly dependent on the actual C struct and how you interact with it
    # For example, if the C struct is an array of integers:
    c_ptr = Libc.malloc(sizeof(Int) * length(c_data))
    unsafe_copyto!(c_ptr, pointer(c_data), length(c_data))
    return c_ptr
end

# You need to register these custom serialization functions with the Serialization module

Serialization.serializer(::Type{MyStruct}) = serialize_custom
Serialization.deserializer(::Type{MyStruct}) = deserialize_custom

# example usage

# Example C struct creation (assuming you have a function to create it)
c_ptr = create_c_struct([1, 2, 3])

# Create an instance of MyStruct
my_struct = MyStruct([1, 2, 3], c_ptr)

# Serialize the struct
serialized_data = serialize(my_struct)

# Deserialize the struct
deserialized_struct = deserialize(serialized_data)


=#

#=
# deepseek think

# 1. Define a Julia struct mirroring the C struct's layout
# Assume you have a C struct PointC with two integers:

typedef struct {
    int x;
    int y;
} PointC;

# Define its Julia counterpart:

struct PointC
    x::Cint
    y::Cint
end

# 2. Define the Custom Julia Struct with a Pointer

mutable struct MyStruct
    point_ptr::Ptr{Cvoid}
    function MyStruct(ptr::Ptr{Cvoid})
        obj = new(ptr)
        # Attach a finalizer to free the allocated memory
        finalizer(obj) do x
            Libc.free(x.point_ptr)
            x.point_ptr = C_NULL
        end
        obj
    end
end

# 3. Implement Custom Serialization
# Serialize the C struct's data stored at the pointer:

function Serialization.serialize(s::AbstractSerializer, m::MyStruct)
    # Load C struct data into a Julia struct
    point_data = unsafe_load(reinterpret(Ptr{PointC}, m.point_ptr))
    # Serialize the Julia struct
    Serialization.serialize_type(s, MyStruct)
    serialize(s, point_data)
end

# 4. Implement Custom Deserialization
# Reconstruct the C struct from serialized data and allocate new memory:

function Serialization.deserialize(s::AbstractSerializer, ::Type{MyStruct})
    # Deserialize the saved PointC data
    point_data = deserialize(s)::PointC
    # Allocate memory for the C struct
    ptr = Libc.malloc(sizeof(PointC))
    # Store the data into the new memory
    unsafe_store!(reinterpret(Ptr{PointC}, ptr), point_data)
    # Create MyStruct with the new pointer
    return MyStruct(ptr)
end

# example

# Create a C struct instance
c_point = PointC(10, 20)
ptr = Libc.malloc(sizeof(PointC))
unsafe_store!(reinterpret(Ptr{PointC}, ptr), c_point)

# Create MyStruct instance
my_struct = MyStruct(ptr)

# Serialize to a file
open("data.jls", "w") do io
    Serialization.serialize(io, my_struct)
end

# Deserialize from the file
open("data.jls", "r") do io
    loaded = Serialization.deserialize(io)
    # Access the deserialized C data
    loaded_data = unsafe_load(reinterpret(Ptr{PointC}, loaded.point_ptr))
    println("Deserialized: x=$(loaded_data.x), y=$(loaded_data.y)")
end

notes

Memory Management: The finalizer ensures allocated memory is freed 
                   when MyStruct is garbage collected.

Struct Layout: The Julia struct PointC must match the memory layout of the C struct.

Pointer Ownership: This example assumes MyStruct owns the C pointer. 
                    Adjust finalization if the pointer is managed externally.

Complex Structs: For nested or dynamic C structs, extend the serialization logic 
                   to handle all referenced data recursively.

This approach ensures that the C struct's data is correctly preserved across serialization and deserialization, avoiding invalid pointer issues.

=#


#=
using Seriaization.jl and using serialize_type show me julia functions 
that serialize and deserialize a custom type given as a julia struct 
    holding a C union of two C structs: one C struct holds a 64bit unsigned integer , 
    the other C struct holds a pointer to memory.

# Assume the C union is defined as follows in C:

union MyUnion {
    uint64_t uint64_value;
    void* ptr_value;
};

# In Julia, you can represent this union using a struct with 
# a Ptr{Cvoid} and a UInt64 field, 
# and use a tag to distinguish between the two cases:

struct MyUnion
    is_uint64::Bool         # Tag to indicate whether the union holds a UInt64 or a pointer
    uint64_value::UInt64
    ptr_value::Ptr{Cvoid}
end

# Assume the custom Julia struct holds the union:

struct MyStruct
    union_data::MyUnion
end

# Serialization Function
# You need to write a custom serialization function for MyStruct and MyUnion. 
#    Since the union can hold either a UInt64 or a pointer, 
#    you must serialize the tag (is_uint64) and the appropriate value.

using Serialization

function Serialization.serialize(s::AbstractSerializer, obj::MyUnion)
    # Serialize the tag to indicate whether the union holds a UInt64 or a pointer
    serialize(s, obj.is_uint64)
    
    if obj.is_uint64
        # Serialize the UInt64 value
        serialize(s, obj.uint64_value)
    else
        # Serialize the memory pointed to by the pointer
        # Assuming the pointer points to an array of bytes
        if obj.ptr_value != C_NULL
            # Get the size of the memory (you need to know this or store it somewhere)
            mem_size = get_memory_size(obj.ptr_value)
            serialize(s, mem_size)
            
            # Serialize the memory content
            mem_data = unsafe_wrap(Array, obj.ptr_value, mem_size)
            serialize(s, mem_data)
        else
            # Serialize nothing if the pointer is null
            serialize(s, nothing)
        end
    end
end


# 4. Deserialization Function
# You need to write a custom deserialization function to reconstruct the union and the struct.

function Serialization.deserialize(s::AbstractSerializer, ::Type{MyUnion})
    # Deserialize the tag
    is_uint64 = deserialize(s)
    
    if is_uint64
        # Deserialize the UInt64 value
        uint64_value = deserialize(s)
        return MyUnion(true, uint64_value, C_NULL)
    else
        # Deserialize the memory size
        mem_size = deserialize(s)
        
        if mem_size !== nothing
            # Deserialize the memory content
            mem_data = deserialize(s)
            
            # Allocate memory and copy the data
            ptr_value = Libc.malloc(mem_size)
            unsafe_copyto!(ptr_value, pointer(mem_data), mem_size)
            return MyUnion(false, 0, ptr_value)
        else
            # Return a union with a null pointer
            return MyUnion(false, 0, C_NULL)
        end
    end
end


# You need to implement a helper function to determine the size 
#  of the memory pointed to by the pointer. 
#  This is highly dependent on your specific use case.

function get_memory_size(ptr::Ptr{Cvoid})
    # This is a placeholder function. You need to know the size of the memory
    # pointed to by the pointer. For example, you might store the size elsewhere.
    return 5  # Example: Assume the memory size is 5 bytes
end


# Serialize and Deserialize the Custom Struct
# For the custom struct MyStruct, you can rely on the default serialization mechanism 
# since it only contains a MyUnion, which already has custom serialization methods.

# Example usage
function example()
    # Create a MyUnion holding a UInt64
    union_uint64 = MyUnion(true, 123456789, C_NULL)
    my_struct_uint64 = MyStruct(union_uint64)
    
    # Serialize the struct
    serialized_data = serialize(my_struct_uint64)
    
    # Deserialize the struct
    deserialized_struct = deserialize(serialized_data)
    println("Deserialized UInt64 union: ", deserialized_struct.union_data)
    
    # Create a MyUnion holding a pointer to memory
    mem_data = UInt8[1, 2, 3, 4, 5]
    ptr_value = pointer(mem_data)
    union_ptr = MyUnion(false, 0, ptr_value)
    my_struct_ptr = MyStruct(union_ptr)
    
    # Serialize the struct
    serialized_data = serialize(my_struct_ptr)
    
    # Deserialize the struct
    deserialized_struct = deserialize(serialized_data)
    println("Deserialized pointer union: ", deserialized_struct.union_data)
end

example()

=#


#=
# DEEPSEEK THOUGHT

# Here's a solution for serializing/deserializing a Julia struct containing a C union
# (two structs: one with a uint64_t, another with a pointer), 
# using memory layout preservation and pointer management:

using Serialization, Libc

# C struct/union definitions (mirroring C layout)
struct UInt64Struct
    value::UInt64
end

struct PtrStruct
    ptr::Ptr{Cvoid}
end

struct CUnion
    storage::NTuple{8, UInt8}  # 64-bit storage for union
end

# Julia wrapper with type tagging
mutable struct CustomType
    tag::Symbol  # :uint64 or :pointer
    union_data::CUnion
    
    function CustomType(tag::Symbol, data)
        u = if tag === :uint64
            CUnion(reinterpret(NTuple{8, UInt8}, (data,)))
        elseif tag === :pointer
            CUnion(reinterpret(NTuple{8, UInt8}, (data,)))
        else
            error("Invalid tag")
        end
        new(tag, u)
    end
end

# Helper functions
get_uint64(ct::CustomType) = reinterpret(UInt64, ct.union_data.storage)[1]
get_ptr(ct::CustomType) = reinterpret(Ptr{Cvoid}, ct.union_data.storage)[1]

# Serialization logic
function Serialization.serialize(s::AbstractSerializer, ct::CustomType)
    Serialization.serialize_type(s, CustomType)
    serialize(s, ct.tag)
    
    if ct.tag === :uint64
        serialize(s, get_uint64(ct))
    else
        # Serialize pointer content (example: 10-byte buffer)
        ptr = get_ptr(ct)
        data = unsafe_wrap(Vector{UInt8}, ptr, 10)  # Adjust size as needed
        serialize(s, data)
    end
end

# Deserialization logic
function Serialization.deserialize(s::AbstractSerializer, ::Type{CustomType})
    tag = deserialize(s)
    
    if tag === :uint64
        value = deserialize(s)::UInt64
        return CustomType(tag, value)
    else
        # Reconstruct pointer data
        data = deserialize(s)::Vector{UInt8}
        ptr = Libc.malloc(length(data))
        unsafe_copyto!(ptr, pointer(data), length(data))
        
        # Create finalizer to clean up memory
        obj = CustomType(tag, ptr)
        finalizer(obj) do x
            x.tag === :pointer && Libc.free(get_ptr(x))
        end
        return obj
    end
end

# Usage example
# Create instance with uint64
ct_uint = CustomType(:uint64, 0x123456789abcdef0)

# Create instance with pointer (example: 10-byte buffer)
buffer = collect(reinterpret(UInt8, [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a]))
ptr = Libc.malloc(10)
unsafe_copyto!(ptr, pointer(buffer), 10)
ct_ptr = CustomType(:pointer, ptr)

# Serialize both versions
open("data.jls", "w") do io
    serialize(io, ct_uint)
    serialize(io, ct_ptr)
end

# Deserialize and verify
open("data.jls", "r") do io
    loaded_uint = deserialize(io)
    @assert loaded_uint.tag === :uint64
    @assert get_uint64(loaded_uint) == 0x123456789abcdef0

    loaded_ptr = deserialize(io)
    @assert loaded_ptr.tag === :pointer
    loaded_data = unsafe_wrap(Vector{UInt8}, get_ptr(loaded_ptr), 10)
    @assert loaded_data == buffer
end

# Memory Layout Preservation: CUnion uses fixed 8-byte storage matching typical 64-bit system union size

Type Tagging: CustomType tracks which union member is active

Pointer Management:

Serialization captures pointer content (adjust buffer size as needed)

Deserialization allocates new memory and copies data

Finalizers ensure proper cleanup of allocated memory

Flexible Content Handling:

For uint64: Directly stores/retrieves numeric value

For pointers: Serializes/deserializes buffer contents

Adjustments needed for your use case:

Change buffer size in pointer handling (currently 10 bytes)

Modify pointer content serialization if different data structure

Add version handling if serialization format might change

Consider endianness if cross-platform compatibility is needed

This approach safely handles the C memory layout while maintaining Julia's serialization capabilities.

=#