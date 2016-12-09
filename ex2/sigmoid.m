function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% =============Test Cases=========
%Test Case 1
%z = 1200000;
%Test Case 2
%z = -25000;
%Test Case 3
%z = 0;

%For a matrix,it performs the sigmoid function on every element.
%Test Case 4
%z = [4 5 6];
%Test Case 5
%z = magic(3);
%Test Case 6
%z = eye(2);
% =============End Test Cases=========

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
% vector or scalar).

%My way to do the same
%z = exp(z);
%denom = (1+z);
%g = 1./(denom);

%We use the sigmoid function because it maps all real input values into the range of 0 to 1.
%This is handy because we use 0 and 1 to represent the 'false' and 'true' conditions.
%Sugessted way by Prof Andrwe Ng.

g = 1./(1+exp(-z));

% =============================================================

end
