function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.


#{
The Gradient Descent method is an approximation to the Normal Equations solution. 
But you can get the approximation to be as close as you want by experimenting 
with the learning rate (alpha) and the number of iterations. 
With well chosen values, you can get the two numbers to agree to 6 decimal places in < 100 iterations.

#}

data = load('ex1data2.txt'); % read comma separated data
X = data(:, 1);
y = data(:, 2);

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------




% -------------------------------------------------------------
theta = ((X'*X)^-1)*X'*y;

% ============================================================

end
