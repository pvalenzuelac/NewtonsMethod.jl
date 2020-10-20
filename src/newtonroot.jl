
"""
newtonroot(f[, f']; x0 = 0.8, tolerance = 1.e-13, maxiter = 1000)
This function find the local root of a univariate smooth function `f(x)` using the Newton's Method. This method starts with    Starting with an $$ x_0 $$ guess, a function $$ f(\cdot) $$ and the first-derivative $$ f'(\cdot) $$, the algorithm is to repeat

    $$
    x^{n+1} = x^n - \frac{f(x^n)}{f'(x^n)}
    $$
...
# Arguments
- `f(x)::Function`: the function you are trying to solve.
- `f'(x)::Function`: the first derivative of the function you are trying to solve. If it is not given the program estimated `f'(x)` via ForwardDiff.
- `x0::Float64`: the initial value for the algorithm. The default value is 0.8.
- `tolerance::Float64` : the minimimum tolerance for the algorithm to converge. The default value is 1.0e-13.
- `maxiter::Int64`: the maximum number of iterations allowed. The default value is 1000.
---
# Examples
```julia
julia> f(x)  =  (x - 2)^2
f (generic function with 1 method)

julia> df(x) = 2(x - 2)
df (generic function with 1 method)

julia> newtonroot(f,df)
(value = 1.9999999999999318, normdiff = 6.816769371198461e-14, iter = 45)

julia> a = newtonroot(f)[1]
1.9999999999999318
```
...

"""
function newtonroot(f, f_prime; x0=0.8, tolerance=1.0E-13, maxiter=1000)
    # Initial values
    v_old = x0
    normdiff = Inf
    iter = 1
    
    # Running the algorithm 
    while (normdiff > tolerance)  && (iter < maxiter)
        if !(f_prime(v_old) == 0)
            v_new = v_old - (f(v_old) / f_prime(v_old))
            normdiff = norm(v_new - v_old)
            # replace and continue
            v_old = v_new
            iter = iter + 1
        else
            return(value = nothing, normdiff = nothing, iter = nothing)
        end
    end
    if (iter < maxiter)
        return(value = v_old, normdiff = normdiff, iter = iter)
    else
        return(value = nothing, normdiff = nothing, iter = nothing)
    end
end

function newtonroot(f; x0=0.8, tolerance=1.0E-13, maxiter=1000)
    # Initial values
    v_old = x0
    normdiff = Inf
    iter = 1
    
    # Taking the derivative
    D(f) = x -> ForwardDiff.derivative(f, x)
    f_prime = D(f)

    # Running the algorithm 

    while (normdiff > tolerance)  && (iter < maxiter)
        if !(f_prime(v_old) == 0)
            v_new = v_old - (f(v_old) / f_prime(v_old))
            normdiff = norm(v_new - v_old)
            # replace and continue
            v_old = v_new
            iter = iter + 1
        else
            return(value = nothing, normdiff = nothing, iter = nothing)
        end
    end
    if (iter < maxiter)
        return(value = v_old, normdiff = normdiff, iter = iter)
    else
        return(value = nothing, normdiff = nothing, iter = nothing)
    end
end
