% Define the function with elementwise power operation
f = @(x) x.^3 - 4*x.^2 - 7;

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

% Plot the function
x = linspace(a, b, 1000);
y = f(x);
plot(x, y, 'r', 'LineWidth', 2);
hold on;

% Start the False Position process
for iter = 1:max_iter
    % Calculate the false position (c)
    c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    
    % Plotting the lines and points
    plot([a b], [f(a) f(b)], 'b--'); % Line connecting a and b
    plot(c, 0, 'bo', 'MarkerFaceColor', 'b'); % Point c on the x-axis
    plot([c c], [0 f(c)], 'g--'); % Vertical line from c to curve f(c)
    
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

% Graph settings
xlabel('x');
ylabel('f(x)');
grid on;
title('False Position Method for Root Finding');
hold off;
