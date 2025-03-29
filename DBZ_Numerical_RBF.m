% ========================================================================
%  MATLAB Code
%  Author      : Mohammad Dehbozorgi (MO.DBZ)
%  Created on  : [1404/01/08]
%  Description : [This is for curve fittng by nuralnetwork from Numerical Method in chemical En /Manocher_Nikazar and Riaz_kharat]
%  [Problem 18 from book chapter 1 ]
% ========================================================================
%  License:
%  This code is provided as-is without any warranty. 
%  You are free to use, modify, and distribute it for educational 
%  and research purposes, provided that proper credit is given to 
%  the original author: Mohammad Dehbozorgi (MO.DBZ).
% ========================================================================
clc;
clear;
close all;

% Input data (row vector for one input feature)
X = [1.1 3 3.7 5.2 6.5 7.1 8.3 9.5 10.2 11.7];  % One input feature

% Multi-output data (each row is an output variable, each column is a sample)
Y = [
    0.1   1.1   8.182  12.445  24.582  38.409  45.1  50.3  55.2  60.1;
    0.4   0.864  6.429  9.779   19.341  30.179  35.2  39.8  43.5  47.9;
    0.6   0.756  5.625  8.556   16.900  26.406  30.0  34.7  37.9  41.5;
    0.9   0.637  4.737  7.205   14.232  22.237  26.3  29.9  33.4  36.8;
    1.4   0.550  4.091  6.233   12.291  19.205  22.9  26.1  28.8  31.7
];

% Convert X to a row vector (if it's not already)
inputs = X;

% Define RBF Network parameters
Goal = 0;       % Error goal
spread = 0.21;     % Spread of radial basis functions
MaxNeuron = 100; % Maximum number of neurons
DisplayAt = 1;  % Display frequency

% Train the RBF Network
net = newrb(inputs, Y, Goal, spread, MaxNeuron, DisplayAt);  

% Test the trained network
outputs = net(inputs);

% Compute errors
errors = gsubtract(Y, outputs);
performance = perform(net, Y, outputs);
ploterrhist(errors);
plotregression(Y,outputs);
figure, plotfit(net,X,Y);
% Plot results for each output
num_outputs = size(Y, 1);  % Number of outputs
figure;
for i = 1:num_outputs
    subplot(num_outputs, 1, i);
    plot(inputs, Y(i, :), 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Actual output
    hold on;
    plot(inputs, outputs(i, :), 'b-', 'LineWidth', 2); % Predicted output
    legend(sprintf('Real Output %d', i), sprintf('NN Output %d', i));
    xlabel('Input (X)');
    ylabel(sprintf('Output %d', i));
    title(sprintf('RBF Neural Network - Output %d', i));
    grid on;
    hold off;
end

% Find the linear equation for each output
for i = 1:num_outputs
    p = polyfit(inputs, outputs(i, :), 1); % Linear fit for each output
    fprintf('Equation for Output %d: Y%d = %.4f * X + %.4f\n', i, i, p(1), p(2));
end
