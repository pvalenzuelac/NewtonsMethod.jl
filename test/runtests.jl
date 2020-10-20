using NewtonsMethod
using Test


@testset "NewtonsMethod.jl" begin
   # f(x) = (x-2)^2, f'(x) = 2(x-2), root = 2
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 2
    @test NewtonsMethod.newtonroot(f)[1] ≈ 2
    
end