function [J, grad] = TestlinearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values

%X = [[1 1 1]' magic(3)];
%y = [7 6 5]';
%theta = [0.1 0.2 0.3 0.4]';
%lambda = 0;


m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% =========================================================================
h = X*theta; %hypothesis on examples
err_Vec   = (h - y).^2 % errors vector
theta_change = (1/m)*sum(X'*h)
theta = theta - theta_change

%J = 1/(2*m) * sum(sqrErrors);

%for iter = 1:num_iters
%J_history(iter) = computeCost(X, y, theta);
%end

grad = grad(:);

end