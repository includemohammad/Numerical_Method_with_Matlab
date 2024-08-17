% Define the function
f = @(x) x.^3 + 2*x.^2 - 4*x;

% Initial guesses for the interval [x1, x2]
x1 = 5;
x2 = 10;

% Tolerance and maximum iterations
tol = 1e-6;
max_iter = 100;

% Initialize the iteration counter and error
iter = 0;
error = abs(x2 - x1);

% Initialize arrays to store iteration data for plotting
x1_vals = [];
x2_vals = [];
x3_vals = [];

% Regula Falsi method
while error > tol && iter < max_iter
    % Compute the new point using Regula Falsi formula
    x3 = ((x1*f(x2))-(x2*f(x1)))/(f(x2)-f(x1));
    
    % Store values for plotting
    x1_vals(end+1) = x1;
    x2_vals(end+1) = x2;
    x3_vals(end+1) = x3;
    
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

% Plot the function
fplot(f, [min(x1_vals), max(x2_vals)]);
hold on;

% Plot the iterations of x1, x2, and x3
for i = 1:length(x3_vals)
    % Plot the line connecting x1 and x2
    plot([x1_vals(i), x2_vals(i)], [f(x1_vals(i)), f(x2_vals(i))], 'b--');
    
    % Plot the point x3 on the x-axis
    plot(x3_vals(i), 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    
    % Plot the vertical line from x3 to f(x3)
    plot([x3_vals(i), x3_vals(i)], [0, f(x3_vals(i))], 'g--');
end

% Highlight the final root
plot(root, f(root), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% Graph settings
xlabel('x');
ylabel('f(x)');
title('Regula Falsi Method');
grid on;
hold off;
