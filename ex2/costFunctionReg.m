function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values

% =============Test Cases=========
%test case 1
%X = [ones(3,1) magic(3)];
%y = [1 0 1]';
%theta = [-2 -1 1 2]';
%lambda = 3;

%test case 2
%X = [ones(3,1) magic(3)];
%y = [1 0 1]';
%theta = [-2 -1 1 2]';
%lambda = 5; %3;
% =============End Test Cases=========

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
[J, grad] = costFunction(theta, X, y);%Without Regulariation
tmp = J(1);

J += (lambda/(2*m))*sum(theta(2:end).^2);%With Regulariation

%Note that you should not regularize the parameter theta(1),(which corresponds to theta0).
% theta(1) = 0 
grad += [0 (lambda*theta(2:size(theta),1)')/m]; %With Regulariation

#{
Another way of calculation
Do exactly what you did in costFunction.m, 
then set theta(1) = 0 and compute the regularization terms for J and gradient. 
Then add the regularization terms to J and gradien
Do exactly what you did in costFunction.m, then set theta(1) = 0 
and compute the regularization terms for J and gradient. 
Then add the regularization terms to J and gradient

h = sigmoid stuff
J = unregularized part
theta(1) = 0
J = J + regularized part
#}
% =============================================================

end
