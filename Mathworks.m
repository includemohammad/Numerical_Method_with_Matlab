% Create a meshgrid for plotting
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);

% Define the Z values using the peaks function
Z = peaks(X, Y);

% Create the surface plot
figure;
surf(X, Y, Z);

% Add title and labels
title('3D Surface Plot');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

% Add colorbar for reference
colorbar;

% Set the view angle for better visualization
view(60, 30);
