% Newton-Raphson Method with Tangent Line Visualization

syms x;  % Define symbolic variable
f_sym = x^3 - 2*x - 5;  % Define the symbolic function

f = matlabFunction(f_sym);  % Convert symbolic function to MATLAB function handle
df_sym = diff(f_sym);  % Compute the derivative symbolically
df = matlabFunction(df_sym);  % Convert symbolic derivative to MATLAB function handle

% Initial guess
x0 = 2;  % You can change this value based on your problem

% Tolerance and maximum number of iterations
tol = 1e-6;     % Tolerance level
max_iter = 10;  % Maximum number of iterations

% Range for plotting
x_range = linspace(-3, 3, 100);  % Adjust this range based on your function

% Newton-Raphson iteration with visualization
figure;
hold on;
fplot(f_sym, [min(x_range), max(x_range)], 'LineWidth', 2);  % Plot the function
title('Newton-Raphson Method Visualization');
xlabel('x');
ylabel('f(x)');
grid on;

for i = 1:max_iter
    % Calculate the next approximation
    x1 = x0 - f(x0)/df(x0);    % Newton-Raphson formula

    % Plot the tangent line at the current approximation
    tangent_line = @(x) df(x0)*(x - x0) + f(x0);
    fplot(tangent_line, [min(x_range), max(x_range)], '--r', 'LineWidth', 1.5);
    plot(x0, f(x0), 'ro', 'MarkerFaceColor', 'r');  % Mark the point of tangency
    
    % Update the guess
    x0 = x1;

    % Pause to visualize each iteration
    pause(1);
    
    % Check for convergence
    if abs(f(x1)) < tol
        fprintf('Root found: %.6f\n', x1);
        break;
    end
end

if i == max_iter
    fprintf('The method did not converge within the maximum number of iterations.\n');
end

hold off;
