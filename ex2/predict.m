function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

% =============Test Cases=========
%Test Case 1
%X = [ones(3,1) magic(3)];
%y = [1 0 1]';
%theta = [-2 -1 1 2]';

%Test Case 2
%X = [1 1 ; 1 2.5 ; 1 3 ; 1 4];
%theta = [-3.5 ; 1.3];

%Test Case 3
%theta = [4 ; 3 ; -8];
%X = magic(3);
% =============End Test Cases=========

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);
 
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%

p = sigmoid(X*theta)>= 0.5; %The it is a positive case

% =========================================================================


end
