function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values

%X = [[1 1 1]' magic(3)];
%y = [7 6 5]';
%theta = [0.1 0.2 0.3 0.4]';
%lambda = 7;

%For debugging purpose use following example
%X = [1 2 3 4];
%y = 5;
%theta = [0.1 0.2 0.3 0.4]';
%lambda = 7;

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

%---------UnRegularized Cost and Grad calculations------------------

%J = 1/(2*m)*sum(sqrErrors) + (lambda/2*m)*sum(theta.^2);

%grad =  (1/m)*sum((h - y).*X) + (lambda/m)*theta;

%grad = grad(:);

%---------Regularized Cost and Grad calculations------------------
#{
You only need the first three steps of the gradientDescent() tutorial, 
plus scaling by 1/m. That's gives us the gradient. 
Since we let fmincg() perform gradient descent for us, 
we just have to compute the cost and gradient. 
We don't use a for-loop over the number of iterations, or use any learning rate. 
The fmincg() function does that for us in trainLinearReg.m script.
#}
%Original calculations
h = X*theta;   %hypothesis on examples
sqrErrors = (h - y).^2;
diff = X*theta - y;

%For the cost regularization:
%Set theta(1) to 0.
theta(1) = 0;
%Cost
%Compute the sum of all of the theta values squared. 
%One handy way to do this is sum(theta.^2). 
%Since theta(1) has been forced to zero, it doesn't add to the regularization term.
%Now scale this value by lambda / (2*m), and add it to the unregularized cost.
%Use sum() when you use element-wise multiplication.
%When you use a vector multiplication, the sum is included automatically.
%v = [1 ; 2 ;3]
%sum(v.^2)
%v'*v
%Both methods work.
J = sum(sqrErrors)/(2*m) + sum(lambda*theta.^2)/(2*m);

%For the gradient regularization:
%The regularized gradient term is theta scaled by (lambda / m). 
%Again, since theta(1) has been set to zero, 
%it does not contribute to the regularization term.
%Add this vector to the unregularized portion.
% calculate grads
grad = (X'*diff+lambda*theta)/m;

grad = grad(:);


