function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

%Test Case
%X =[1 2 3; 1 3 4; 1 4 5; 1 5 6];
%y = [7;6;5;4];
%theta = [0.1;0.2;0.3];

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
% 
%data = load('ex1data1.txt'); % read comma separated data
%X = data(:, 1); 
%y = data(:, 2);
%You should set J to the cost.

%======================Correct Calculations for ex1====================================== 
predictions = X*theta;              % predictions of hypothesis on examples
sqrErrors   = (predictions - y).^2; % squared errors

J = 1/(2*m) * sum(sqrErrors);
% =========================================================================

end
