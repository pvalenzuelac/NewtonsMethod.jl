using ForwardDiff
using LinearAlgebra

function newtonroot(f, f_prime; x0=0.8, tolerance=1.0E-7, maxiter=1000)
    v_old = x0
    normdiff = Inf
    iter = 1
    
    while (normdiff > tolerance) && (iter < maxiter)
        v_new = v_old - (f(v_old) / f_prime(v_old))
        normdiff = norm(v_new - v_old)
        
        # replace and continue
        v_old = v_new
        iter = iter + 1
    end
    return(value = v_old, normdiff = normdiff, iter = iter)
end



function newtonroot(f; x0=0.8, tolerance=1.0E-7, maxiter=1000)
    
    v_old = x0
    normdiff = Inf
    iter = 1
    
    D(f) = x -> ForwardDiff.derivative(f, x)
    f_prime = D(f)
    
    while (normdiff > tolerance) && (iter < maxiter)
        v_new = v_old - (f(v_old) / f_prime(v_old))
        normdiff = norm(v_new - v_old)
        
        # replace and continue
        v_old = v_new
        iter = iter + 1
    end
    return(value = v_old, normdiff = normdiff, iter = iter)
end
