using NewtonsMethod
using Test


@testset "NewtonsMethod.jl" begin
    # Testing a well known functions
        # f(x) = (x-2)^2, f'(x) = 2(x-2), root = 2
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 2
    @test NewtonsMethod.newtonroot(f)[1] ≈ 2

        # f(x) = (x-1)^7, f'(x) = 7(x-1)^6, root = 1
    f(x)  =  (x - 1)^7
    df(x) = 7(x - 1)^6
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 1
    @test NewtonsMethod.newtonroot(f)[1] ≈ 1

        # f(x) = log(x), f'(x) = 1/x, root = 1
    f(x)  =  log(x)
    df(x) = 1 / x
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 1
    @test NewtonsMethod.newtonroot(f)[1] ≈ 1

    # Testing a non-converging function
        # f(x) = x^2 +2, f'(x) = 2x
    f(x)  =  x^2 + 2
    df(x) = 2x
    @test NewtonsMethod.newtonroot(f, df)[1] === nothing
    @test NewtonsMethod.newtonroot(f)[1] === nothing

    # Testing maxiter. I will choose an arbitrarily small maxiter, so the function should not converge in the first test and converge in the second.
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test NewtonsMethod.newtonroot(f, df; maxiter=5)[1] === nothing
    @test NewtonsMethod.newtonroot(f; maxiter=5)[1]  === nothing

    f(x)  =  2x
    df(x) = 2
    @test NewtonsMethod.newtonroot(f, df; maxiter=5)[1] ≈ 0
    @test NewtonsMethod.newtonroot(f; maxiter=5)[1] ≈ 0

    # Testing the tolerance. I will choose a very slack tolerance (1e-4) in order to have a ``bad'' solution.
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test !(NewtonsMethod.newtonroot(f, df; tolerance=1e-4)[1] ≈ 2)
    @test !(NewtonsMethod.newtonroot(f; tolerance=1e-4)[1]  ≈ 2)

    f(x)  =  2x
    df(x) = 2
    @test NewtonsMethod.newtonroot(f, df; maxiter=5)[1] ≈ 0
    @test NewtonsMethod.newtonroot(f; maxiter=5)[1] ≈ 0

    # Testing the initial value.
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test NewtonsMethod.newtonroot(f, df; x0=10)[1] ≈ 2 # x0 = 10
    @test NewtonsMethod.newtonroot(f, df; x0=-10)[1] ≈ 2 # x0 = -10
    @test NewtonsMethod.newtonroot(f, df; x0=0)[1] ≈ 2 # x0 = 0

    @test NewtonsMethod.newtonroot(f; x0=10)[1]  ≈ 2 # x0 = 10
    @test NewtonsMethod.newtonroot(f; x0=-10)[1]  ≈ 2 # x0 = -10
    @test NewtonsMethod.newtonroot(f; x0=0)[1]  ≈ 2 # x0 = 0

    # Testing BigFloat.
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test BigFloat(NewtonsMethod.newtonroot(f, df)[1]) ≈ BigFloat(2.0)
    @test BigFloat(NewtonsMethod.newtonroot(f; tolerance=1e-13)[1]) ≈ 2


    # Breaking something on purpose:
    f(x)  =  (x - 2)^2
    df(x) = 2(x - 2)
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 3
    @test NewtonsMethod.newtonroot(f)[1]  ≈ 3 

end