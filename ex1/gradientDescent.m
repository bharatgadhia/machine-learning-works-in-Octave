function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

%Test Case 1

%X =[1 2 3; 1 3 4; 1 4 5; 1 5 6];
%y = [1 6 4 2]';
%theta = [0 0]';
%alpha = 0.01;
%num_iters = 1000;

%Test Case 2
%X = [1 5; 1 2];
%y = [1 6]';
%theta = [.5 .5]';
%alpha = 0.1;
%num_iters = 10;

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters,1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % ============================================================   
    %x = X(:,2);
    %h = theta(1) + (theta(2)*x);
    %theta_zero = theta(1) - alpha * (1/m) * sum(h-y);
    %theta_one  = theta(2) - alpha * (1/m) * sum((h - y) .* x);
    %theta = [theta_zero; theta_one];
    % ============================================================          
 
% ============================================================      
#{
1 - The hypothesis is a vector, formed by multiplying the X matrix and the theta vector. 
X has size (m x n), and theta is (n x 1), so the product is (m x 1). 
That's good, because it's the same size as 'y'. Call this hypothesis vector 'h'.
2 - The "errors vector" is the difference between the 'h' vector and the 'y' vector.
3 - The change in theta (the "gradient") is the sum of the product of X 
and the "errors vector", scaled by alpha and 1/m. Since X is (m x n), 
and the error vector is (m x 1), and the result you want is the same size as theta (which is (n x 1), 
you need to transpose X before you can multiply it by the error vector.
The vector multiplication automatically includes calculating the sum of the products.
When you're scaling by alpha and 1/m, be sure you use enough sets of parenthesis to get the factors correct.
4 - Subtract this "change in theta" from the original value of theta. A line of code like this will do it:
#}
% ======================Correct Calculations for ex1====================================== 
    h =  X*theta;
    err_vec = h - y;
    theta_temp = alpha*(1/m)*(X'*err_vec);
    theta = theta - theta_temp;
   
    % Save the cost J in every iteration 
    J_history(iter) = computeCost(X, y, theta);
end

end
