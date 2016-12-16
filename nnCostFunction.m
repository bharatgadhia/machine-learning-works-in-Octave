function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)),hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
#{
Tutorial:-
Glossary:
Each of these variables will have a subscript, noting which NN layer it is associated with. 
Θ:A Theta matrix of weights to compute the inner values of the neural network. 
When we used a vector theta, it was noted with the lower-case theta character θ. 

z : is the result of multiplying a data vector with a Θ matrix. A typical variable name would be "z2".

a : The "activation" output from a neural layer. 
This is always generated using a sigmoid function g() on a z value. 
A typical variable name would be "a2".

δ : lower-case delta is used for the "error" term in each layer. 
A typical variable name would be "d2".

Δ : upper-case delta is used to hold the sum of the product of a δ value 
with the previous layer's a value. 
In the vectorized solution, these sums are calculated automatically 
though the magic of matrix algebra. A typical variable name would be "Delta2".

Θ_gradient : This is the thing we're solving for, the partial derivative of theta. 
There is one of these variables associated with each Δ. 
These values are returned by nnCostFunction(), 
so the variable names must be "Theta1_grad" and "Theta2_grad".

g() is the sigmoid function.

g′() is the sigmoid gradient function. 

Tip: One handy method for excluding a column of bias units is to use the notation SomeMatrix(:,2:end). 
This selects all of the rows of a matrix, and omits the entire first column.

A note regarding bias units, regularization, and back-propagation:

There are two methods for handing exclusion of the bias units in the 
Theta matrices in the back-propagation and gradient calculations. 
I've described only one of them here, it's the one that I understood the best. 
Both methods work, choose the one that makes sense to you and avoids dimension errors. 
It matters not a whit whether the bias unit is excluded before or after it is calculated - 
both methods give the same results, though the order of operations and transpositions required may be different.

Forward Propagation:
We'll start by outlining the forward propagation process. 
Though this was already accomplished once during Exercise 3, 
you'll need to duplicate some of that work because computing the gradients 
requires some of the intermediate results from forward propagation. 
Also, the y values in ex4 are a matrix, instead of a vector. 
This changes the method for computing the cost J.

1 - Expand the 'y' output values into a matrix of single values. 
This is most easily done using an eye() matrix of size num_labels, 
with vectorized indexing by 'y'. A useful variable name would be "y_matrix", as this
y_matrix = eye(num_labels)(y,:) 

2 - Perform the forward propagation:
a1 equals the X input matrix with a column of 1's added (bias units) as the first column.
z2 equals the product of a1 and Θ1
a2 is the result of passing z2 through g()
Then add a column of bias units to a2 (as the first column). 
NOTE: Be sure you DON'T add the bias units as a new row of Theta.
z3 equals the product of a2 and Θ2
a3 is the result of passing z3 through g()

Cost Function, non-regularized:
3 - Compute the unregularized cost according to ex4.pdf (top of Page 5), 
using a3, your y_matrix, and m (the number of training examples). 
Note that the 'h' argument inside the log() function is exactly a3. 
Cost should be a scalar value. Since y_matrix and a3 are both matrices, 
you need to compute the double-sum.
Remember to use element-wise multiplication with the log() function. 
Also, we're using the natural log, not log10().
Now you can run ex4.m to check the unregularized cost is correct, 
then you can submit this portion to the grader.

Cost Regularization:
4 - Compute the regularized component of the cost according to ex4.pdf Page 6, 
using Θ1 and Θ2 (excluding the Theta columns for the bias units), 
along with λ, and m. The easiest method to do this is to compute 
the regularization terms separately, then add them to the unregularized cost from Step 3. 
#}

% -------------------------------------------------------------

% =========================================================================
%Test input
%il = 2;              % input layer
%hl = 2;              % hidden layer
%nl = 4;              % number of labels
%nn = [ 1:18 ] / 10;  % nn_params, Unroll parameters 1 to 18 in 10 parts
%X = cos([1 2 ; 3 4 ; 5 6]);
%y = [4; 2; 3];
%lambda = 4;
%m = size(X, 1);
%num_labels = 4;

%Theta1 = reshape(nn(1:hl * (il + 1)), hl, (il + 1));
%Theta2 = reshape(nn((1 + (hl * (il + 1))):end),num_labels, (hl + 1));

%J = 0;
%Theta1_grad = zeros(size(Theta1));
%Theta2_grad = zeros(size(Theta2));
% ==========
I = eye(num_labels);
Y = zeros(m, num_labels);

%Expand the 'y' output values into a matrix of single values.
%Vecotrized implementation as follows.
%We're training multiple classifiers, so we want the output for every training example to be a set of values, 
%where one is a '1' and all the others are '0's
%y_matrix = eye(num_labels)(y,:) -> No looping needed, it gives 10X3 matrix for test input.

%original-->Not used
%for i=1:m
%  Y(i, :)= I(y(i), :);
%end

%num_labels the number of classifiers.
%It can be called the number of labels, the number of classes, or the number of NN outputs.
%used this. No looping needed.
Y = eye(num_labels)(y,:);

%----Perform the forward propagation:-----
%First complete the forward propagation. 
%This gives you the a3, a2, z2, and a1 values you need for backpropagation. 

%computing the gradients requires some of the intermediate results from forward propagation.
a1 = [ones(m,1),X];
%z2 equals the product of a1 and Θ1
z2 = a1*Theta1';

#{
a : The "activation" output from a neural layer. 
This is always generated using a sigmoid function g() on a z value. 
A typical variable name would be "a2".
#}
a2 = sigmoid(z2);
%Then add a column of bias units to a2 (as the first column). 
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];

%z3 equals the product of a2 and Θ2
z3 = a2*Theta2';
%a3 is the result of passing z3 through g(),where g() is the sigmoid function.
a3 = sigmoid(z3);
%----End Forward Propogation-----


%Note that the 'h' argument inside the log() function is exactly a3. 
h = a3;

%Unregularized Cost Function J. Cost should be a scalar value. 
%Since Y and a3 are both matrices, you need to compute the double-sum.
%use element-wise multiplication with the log() function
J = (1/m)*(sum(sum((-(Y).*log(h) - (1-Y).*(log(1-h))))));


% calculte penalty
p  = sum(sum(Theta1(:, 2:end).^2, 2))+sum(sum(Theta2(:, 2:end).^2, 2));

%Since Y and a3 are both matrices, you need to compute the double-sum.
%(Matrix multiplication is difficult to use in the NN cost function, 
%because the only elements of the product that should be included in the cost summation 
%are those on the diagonal of the product matrix.
%Instead, using element-wise multiplication and a double-sum() is a reasonably efficient method.)

%use element-wise multiplication with the log() function
% calculate J
J = sum(sum((-Y).*log(h) - (1-Y).*log(1-h), 2))/m + lambda*p/(2*m);

%----Perform the back propagation:-----
% calculate sigmas
%d3 is the difference between a3 and the y_matrix. 
%The dimensions are the same as both, (m x r).
d3 = a3.-Y;

%d2 is tricky.It uses the (:,2:end) columns of Theta2.
%d2 is the product of d3 and Theta2(no bias), 
%then element-wise scaled by sigmoid gradient of z2. 
%The size is (m x r)*(r x h) --> (m x h). The size is the same as z2, as must be.
%There are two methods to deal with the bias units in Theta2. 
%You can either exclude them before computing d2, 
%or you can include them in the product, and then exclude the first column of the result. 
%Both methods work.
d2 = (d3*Theta2).*sigmoidGradient([ones(size(z2, 1), 1) z2]);
d2 = d2(:, 2:end);

% accumulate gradients
%delta:lower-case delta is used for the "error" term in each layer. 
%A typical variable name would be "delta".
%Delta1 is the product of d2 and a1. The size is (h x m) ⋅ (m x n) --> (h x n)
delta_1 = (d2'*a1); 
%Delta2 is the product of d3 and a2. The size is (r x m) ⋅ (m x [h+1]) --> (r x [h+1])
delta_2 = (d3'*a2);

% calculate regularized gradient
%excluding the Theta columns for the bias units
%To regularize the gradients, for each Delta matrix add its Theta matrix scaled by lambda/m.
p1 = (lambda/m)*[zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
p2 = (lambda/m)*[zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

%Θ_gradient : This is the thing we're solving for, the partial derivative of theta.
%Each Variable is associated with each delta. 
%Theta1_grad and Theta2_grad are the same size as their respective Deltas, just scaled by 1/m
Theta1_grad = delta_1./m + p1;
Theta2_grad = delta_2./m + p2;

%%----End back Propogation-----

% Unroll gradients(The grad variable is a vector that contains both Theta matrices unrolled).
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
