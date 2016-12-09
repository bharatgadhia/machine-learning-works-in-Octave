function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
%data = load('ex1data2.txt');
%X = data(:, 1); 
%y = data(:, 2);
%X = [ones(m, 1), data(:,1)];
%theta = zeros(2, 1);        
%alpha = 0.001;
%num_feat = size(X, 2) % number of features

%TestCase
%X = [ 2 1 3; 7 1 9; 1 8 1; 3 7 4 ];
%y = [2 ; 5 ; 5 ; 6];
%theta =zeros(3,1);
%alpha  = 0.01;
%num_iters = 100;

m = length(y); % number of training examples
J_history = zeros(num_iters, 2);
%J_history = zeros(50,2);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
#{
The vectorization is to transpose (X * theta) - y) which gives you a 1*n matrix 
which when multiplied by X (an n*2 matrix) will basically aggregate both (h(x)-y)x0 and (h(x)-y)x1. 
By definition both thetas are done at the same time. 
This results in a 1*2 matrix of my new theta's which 
I just transpose again to flip around the vector to be the same dimensions 
as the theta vector. I can then do a simple scalar multiplication by alpha and vector subtraction with theta. 
#}   
    % number of features.
%for iter = 1:50 %num_iters    
%    theta = theta -((1/m)*((X*theta) - y)' * X)' * alpha;
%end

    theta_prev = theta;

    % number of features.
    p = size(X, 2);

    for j = 1:p
        % calculate dJ/d(theta_j)
        deriv = ((X*theta_prev - y)'*X(:, j))/m;

        % % update theta_j
        theta(j) = theta_prev(j)-(alpha*deriv);
end
    %theta = ((X'*X)^-1)*X'*y;   % Using normal form of equation
    % ============================================================
    
    % Save the cost J in every iteration         
    J_history(iter,:) = computeCostMulti(X, y, theta);

end

end
