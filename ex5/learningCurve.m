function [error_train, error_val] = learningCurve(X, y, Xval, yval, lambda)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%
%Test input
%training examples
%X = [1 2; 1 3; 1 4; 1 5];
%y =  [7;6;5;4];

%cross validation set
%Xval = [1 7; 1 -2;];
%yval = [2; 12];

%theta = [0.1 0.2 0.3 0.4]';
%lambda = 7;

%Another test case
%X = [ones(5,1) reshape(-5:4,5,2)];
%y = [-2:2]';

%Xval=[X;X]/10;
%yval=[y;y]/10;

%theta = [0.1 0.2 0.3 0.4]';
%lambda = 1;

% Number of training examples
m = size(X, 1);
% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               i.e., error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the cross-validation error, you should instead evaluate on
%       the _entire_ cross validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and cross validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
% Hint: You can loop over the examples with the following:
%
%       for i = 1:m
%           % Compute train/cross validation errors using training examples 
%           % X(1:i, :) and y(1:i), storing the result in 
%           % error_train(i) and error_val(i)
%           ....
%           
%       end
%

% =========================================================================
%Genral concept:-
#{
learningCurve.m should call trainLinearReg(). 
trainLinearReg() uses fmincg() to call your cost function, 
and it returns the final theta value to learninCurve.m.
return from learningCurve() is the two vectors of training set cost and validation set cost.
#}
%1.you should train a new theta vector for every possible size of training set (1:m)
%2.use the lambda that is in the learningCurve() parameter list every time you train to obtain theta.
%3.do not set lambda = 0 inside the learningCurve() function. 
%4.use your cost function for computing the training error Jtrain and validation error Jcv.
%5.when you compute Jtrain and Jcv, use your cost function with a zero for the lambda parameter.
%6.use the same subset of X for training theta and measuring the training error.
%7.use the entire validation set to measure the validation error.
%=========
%The traditional way to do this exercise is to use a for-loop that 
%increments the size of the training set from 1 to m. 
%So with m = 4 in the test case, you'd have 4 results.
%The advice about "do not use regularization..." 
%means to pass a value of 0 for the regularlization parameter 
%when you use your cost function to compute Jtrain and Jcv.

%Note: When using very high-order polynomials, some of your results for Jtrain and Jcv may differ. 
%With high-order polynomials, the solution is very sensitive to the details 
%of your implementation of the cost function.
%=========

for i= 1:m
    theta          = trainLinearReg(X(1:i,:), y(1:i), lambda);
    error_train(i) = linearRegCostFunction(X(1:i,:)   , y(1:i)   , theta, 0); %training errors in error_train
    error_val(i)   = linearRegCostFunction(Xval, yval, theta, 0) %cross validation errors in error_val
end
