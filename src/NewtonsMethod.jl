module NewtonsMethod

using ForwardDiff
using LinearAlgebra

greet() = print("Hello World!")

include("newtonroot.jl")

export newtonroot
end
