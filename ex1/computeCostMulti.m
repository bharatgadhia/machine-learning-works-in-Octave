function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

%Test Case1
%X =[1 2 3; 1 3 4; 1 4 5; 1 5 6];
%y = [7;6;5;4];
%theta = [0.1;0.2;0.3];


%Test Case2
%data = load('ex1data2.txt'); % read comma separated data
%X = data(:, 1);
%y = data(:, 2);

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%You should set J to the cost.
%(X,2) is number of bed rooms(  a feature)
    dif = X*theta - y;
    J = (dif'*dif)/(2*m);
    
    %J = 1/(2*m)*(X*theta -y)*(X*theta -y)';

% =========================================================================

end
