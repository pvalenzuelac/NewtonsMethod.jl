
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
