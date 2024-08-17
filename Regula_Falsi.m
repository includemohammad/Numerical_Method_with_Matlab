% Define the function
f = @(x) x.^3+2*x.^2-4*x;

% Initial guesses for the interval [x1, x2]
x1 = 5;
x2 = 10;

% Tolerance and maximum iterations
tol = 1e-6;
max_iter = 100;

% Initialize the iteration counter and error
iter = 0;
error = abs(x2 - x1);

% Regula Falsi method
while error > tol && iter < max_iter
    % Compute the new point using Regula Falsi formula
    x3 = ((x1*f(x2))-(x2*f(x1)))/(f(x2)-f(x1));
    
    % Update the interval
    if f(x1) * f(x3) < 0
        x2 = x3;
    else
        x1 = x3;
    end
    
    % Update error and iteration count
    error = abs(f(x3));
    iter = iter + 1;
end

% Display the found root
root = x3;
disp(['Root found at: ', num2str(root)]);
disp(['Number of iterations: ', num2str(iter)]);

% Plot the function and the root
fplot(f, [x1, x2]);
hold on;
plot(root, f(root), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('f(x)');
title('Regula Falsi Method');
grid on;
hold off;
