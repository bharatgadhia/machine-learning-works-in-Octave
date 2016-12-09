function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% ============ Test Cases ===============
%Test Case 1
%theta = [-2; -1; 1; 2];
%X = [ones(5,1) reshape(1:15,5,3)/10];
%y = [1;0;1;0;1] >= 0.5;       % creates a logical array
%lambda = 3;
% ============ End Test Cases =============
% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%===>>
%You will be using multiple one-vs-all logistic regression models to build a multi-class classifier.
%Since there are 10 classes, you will need to train 10 separate logistic regression classifiers. 
%To make this training efficient, it is important to ensure that your code is well vectorized.
%===>>

% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
#{
Vectorizing code can sometimes be tricky. One common strategy for debugging 
is to print out the sizes of the matrices you are working with using the 
size function. For example, given a data matrix X 
of size 100X20 (100 examples, 20 features) and Theta, a vector with
dimensions 20X1, you can observe that X*Theta is a valid multiplication oper-
ation, while Theta*X is not. Furthermore, if you have a non-vectorized version
of your code, you can compare the output of your vectorized code and
non-vectorized code to make sure that they produce the same outputs.
#}
%
% =============================================================
J =(1/m)*sum(-y'*log(sigmoid(X*theta))-(1-y')*log(1-sigmoid(X*theta)));

%temp = theta;
%temp(1) = 0; % because we don't add anything for j = 0 
%thetaSqr = temp.^2;
%s =sum(thetaSqr) OR
%s1 = sum(theta(2:end).^2)
%d =lambda/(2*m);
%regEx= d*s;
%J = J + regEx;


#{
When implementing the vectorization for reg-
ularized logistic regression, you might often want to only sum and update
certain elements of Theta. In Octave/MATLAB, you can index into the matri-
ces to access and update only certain elements. For example, A(:, 3:5)
= B(:, 1:3) will replaces the columns 3 to 5 of A with the columns 1 to
3 from B. One special keyword you can use in indexing is the end keyword
in indexing. This allows us to select columns (or rows) until the end of the
matrix. For example, A(:, 2:end) will only return elements from the 2nd
to last column of A. Thus, you could use this together with the sum and
.^ operations to compute the sum of only the elements you are interested
in (e.g., sum(z(2:end).^2)).
#}
J = J + (lambda/(2*m))*sum(theta(2:end).^2); %Cost Function
grad = (1/m)*(sigmoid(X*theta)-y)'*X; %partial derivatives explicitly for all j(theta)
grad = grad + [0 (lambda*theta(2:size(theta),1)')/m];%you should not be regularizing Theta0 which is used for the bias term.
grad = grad(:); %will return a column vector. This line guarantees that the grad value is returned as a column vector.
end

