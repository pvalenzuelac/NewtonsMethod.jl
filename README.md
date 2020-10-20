# NewtonsMethod

[![Build Status](https://travis-ci.com/pvalenzuelac/NewtonsMethod.jl.svg?branch=master)](https://travis-ci.com/pvalenzuelac/NewtonsMethod.jl)
[![Coverage](https://codecov.io/gh/pvalenzuelac/NewtonsMethod.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/pvalenzuelac/NewtonsMethod.jl)

This repository contains a function with two methods to calculate the roots of an univariate function. The proposed solution follows the Newton's Method: 

Starting with a $ x_0 $ guess, a function $ f(\cdot) $ and the first-derivative $ f'(\cdot) $, the algorithm is to repeat

$$
x^{n+1} = x^n - \frac{f(x^n)}{f'(x^n)}
$$

until $ | x^{n+1} - x^n| $ is below a tolerance level previously defined. More information about the algorithm can be found [here](https://en.wikipedia.org/wiki/Newton's_method).


## Documentation
The documentation of the program is:

```julia

                newtonroot(f[, f']; x0 = 0.8, tolerance = 1.e-13, maxiter = 1000)
```

This function computes the local root of a univariate smooth function `f(x)` using the Newton's Method. This method starts with a  `x_0` guess, a function `f(x)` and the first-derivative  `f'(x)`. The algorithm follows: `` x^{n+1} = x^n - f(x^n)/f'(x^n) `` until `` |x^{n+1} - x^n|`` is below the tolerance level.
 
...
### Arguments
- `f(x)::Function`: the function you are trying to solve.
- `f'(x)::Function`: the first derivative of the function you are trying to solve. If it is not given the program estimate `f'(x)` using ForwardDiff.
- `x0::Float64`: the initial value for the algorithm. The default value is 0.8.
- `tolerance::Float64` : the minimum tolerance for the algorithm to converge. The default value is 1.0e-13.
- `maxiter::Int64`: the maximum number of iterations allowed. The default value is 1000.
---
### Examples
```julia
julia> f(x)  =  (x - 2)^2
f (generic function with 1 method)

julia> df(x) = 2(x - 2)
df (generic function with 1 method)

julia> newtonroot(f,df)
(value = 1.9999999999999318, normdiff = 6.816769371198461e-14, iter = 45)

julia> a = newtonroot(f)[1]
1.9999999999999318

julia> newtonroot(f)[1] ≈ 2
true
```

## Breaks for Travis.

The Exercise asked to push a commit to the repository which breaks one of the test and to see what Travis CI reports. I did that but then I commented those errors in order to make my code nicer :). Here I present the Screenshots of the Travis Report when the program didn't pass all the tests.
![image](/screenshots/ss1.png)

![image](/screenshots/ss2.png)

