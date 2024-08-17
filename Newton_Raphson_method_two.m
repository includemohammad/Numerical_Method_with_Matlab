% Newton-Raphson Method Script
% Define the function and its derivative here
f = @(x) x^3 - 2*x - 5;    % Example function: f(x) = x^3 - 2x - 5
df = @(x) 3*x^2 - 2;       % Derivative of the function: f'(x) = 3x^2 - 2

% Initial guess
x0 = 2;    % You can change this value based on your problem

% Tolerance and maximum number of iterations
tol = 1e-6;     % Tolerance level
max_iter = 100; % Maximum number of iterations

% Newton-Raphson iteration
fprintf('Iteration    x         f(x)\n')
for i = 1:max_iter
    x1 = x0 - f(x0)/df(x0);    % Newton-Raphson formula  ????? ??????? ?????? 
    fprintf('%3d         %.6f   %.6f\n', i, x1, f(x1));
    
    if abs(x1 - x0) < tol       % Check for convergence
        fprintf('Root found: %.6f\n', x1);
        break;
    end
    
    x0 = x1;  % Update the guess
end

if i == max_iter
    fprintf('The method did not converge within the maximum number of iterations.\n');
end
