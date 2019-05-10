function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%{
Function that estimates the root of a given function by using False Position

ERROR FOUND: IF YOU WANT TO ADD MAXITER BUT NOT ES as an input, IT CAN'T BE DONE

Inputs:
    func - the finction being evaluated
    xl - the lower guess
    xu - the upper guess
    es - the desired relative error (should default to 0.0001%)
    maxiter - the number of iterations desired (should default to 200)

Outputs:
    root - the estimated root location
    fx - the function evalueated at the root location
    ea - the approximate relative error %
    iter - how many iterations were performed
%}

format long

%To have es and maxiter default to 0.0001% and 200
    if nargin == 3
         es = 0.0001;
         maxiter = 200;
    elseif nargin == 4
        maxiter = 200;
    end

%To make sure that there are a proper amount of input arguments
    if nargin < 3
        error('You need to to have at least 3 inputs: falsePosition(func,xl,xu,es,maxiter)')
    elseif nargin > 5
        error('You cannot exceed having more than 5 inputs: falsePosition(func,xl,xu,es,maxiter)')
    end

%Checking bounds to make sure that they work

    if xl >= xu
        error('you are an idiot, select proper bounds')
    end
    if func(xl)*func(xu) > 0
        error('the bounds selected do not have opposite signs')
    end
    
%Checking if the bounds are the roots
    if func(xl) == 0
       root = xl;
    elseif func(xu) == 0
       root = xu;
    end
    
%FALSE POSITION METHOD
    er = 100; %er = approximate relative error
    xr = 0; %xr = root value after calculation
    iter = 0; %iter = number of iterations

    while er > es && iter < maxiter
        iter = iter + 1;
        xrpre = xr;
        xr = xu - ((func(xu)*(xl - xu))/(func(xl) - func(xu))); %False position function
        
            if iter > 1
                er = abs(((xr-xrpre)/xr)*100); %Approximate relative error function
            end
            
            if func(xr)*func(xl) > 0 %Determining the roots based on the bounds
                xl = xr;
            elseif func(xr)*func(xu) > 0
                xu = xr;
            end
    end

%Finding root of function
    fx = func(xr);
    ea = er;
    root = xr;
    
%Display the outcome
fprintf('Number of Iterations: %f\n',iter)
fprintf('Approximate Relative Error: %f\n',ea)
fprintf('Function Evaluated at the Root: %f\n',fx)
fprintf('Estimated Root: %f\n',root)
end