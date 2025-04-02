% ========================================================================
%  MATLAB Code
%  Author      : Mohammad Dehbozorgi (MO.DBZ)
%  Created on  : [1404/01/13]
%  Description : [This is for curve fittng by nuralnetwork from Numerical Method in chemical En /Manocher_Nikazar and Riaz_kharat]
%  [Problem 8 from book chapter 5 ]
% ========================================================================
%  License:
%  This code is provided as-is without any warranty. 
%  You are free to use, modify, and distribute it for educational 
%  and research purposes, provided that proper credit is given to 
%  the original author: Mohammad Dehbozorgi (MO.DBZ).
% ========================================================================
clc;
clearvars;
close all;

% Matrix for four Reactor CSTR
A = [1100 0 0 0;
    1000 -1400 100 0;
    0 1100 -1240 100;
    0 0 110 -1250];

B = [1000; 0; 0; 0];

% Check if the system has a unique solution
if det(A) == 0
    error('This problem does not have a unique solution.');
end

% Perform Gaussian elimination
[n, ~] = size(A);

for j = 1:n-1
    for i = j+1:n
        if A(j,j) == 0
            error('Pivot element is zero, Gaussian elimination cannot proceed.');
        end
        factor = A(i,j) / A(j,j);
        A(i,:) = A(i,:) - factor * A(j,:);
        B(i) = B(i) - factor * B(j);
    end
end

% Perform back substitution
X = zeros(n,1);
X(n) = B(n) / A(n,n);
for i = n-1:-1:1
    X(i) = (B(i) - A(i,i+1:n) * X(i+1:n)) / A(i,i);
end

% Display result
disp('Solution X:');
disp(X);







