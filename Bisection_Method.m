% Define the function
f = @(x) x^3 - 4*x^2 - 7;

% Set the initial interval [a, b]
a = 1;
b = 5;

% Tolerance (accuracy)
tol = 1e-6;

% Maximum number of iterations
max_iter = 100;

% Check initial condition
if f(a) * f(b) >= 0
    error('The function must have opposite signs at a and b.');
end

% Start the Bisection process
for iter = 1:max_iter
    % Calculate the midpoint
    c = (a + b) / 2;
    
    % Check the stopping condition
    if abs(f(c)) < tol || (b - a) / 2 < tol
        fprintf('Root found at c = %.6f\n', c);
        break;
    end
    
    % Update the interval
    if f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
    
    % Display iteration information
    fprintf('Iteration %d: a = %.6f, b = %.6f, c = %.6f, f(c) = %.6f\n', iter, a, b, c, f(c));
end

% Check if the root was found or the maximum iterations were reached
if iter == max_iter
    fprintf('Maximum number of iterations reached. Approximate root at c = %.6f\n', c);
end
