function [lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval)
%VALIDATIONCURVE Generate the train and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. You are given the training set (X,
%       y) and validation set (Xval, yval).
%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';


% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               you the errors obtained after training with 
%               lambda = lambda_vec(i)
%
% Note: You can loop over lambda_vec with the following:
%
%       for i = 1:length(lambda_vec)
%           lambda = lambda_vec(i);
%           % Compute train / val errors when training linear 
%           % regression with regularization parameter lambda
%           % You should store the result in error_train(i)
%           % and error_val(i)
%           ....
%           
%       end
%
%

% =========================================================================
%Test input
%X = [1 2 ; 1 3 ; 1 4 ; 1 5];
%y = [7 6 5 4]';
%Xval = [1 7 ; 1 -2];
%yval = [2 12]';

%For validationCurve(), you always use the entire training set, and the entire validation set. 
%The only item you are varying is the value of lambda when you compute theta on the training set.
#{
When training the system, you do use regularization in computing the theta values that minimize the training cost.
When you measure how well that system works, you don't use regularization with the cost function. 
Regularization is already baked-in to the set of theta values, and you want to measure how well they fit the data. 
Including the regularization terms would simply add additional penalty values based purely on the numerical values of theta - 
and that's not what you want in measuring the system performance.

Using the whole set of training examples gives you the best measurement of cost. 
If you had a massive dataset, you could then perhaps use a randomly-selected subset, 
just to speed up the process. That's not an issue in this exercise.

In learningCurve, we only used a subset of the training examples specifically 
because we were demonstrating how cost varies with the size of the training set. 
The lesson learned there is that larger data sets give better results.
#}
%==============
for i = 1:length(lambda_vec) %already provided
    lambda = lambda_vec(i) % already provided
    theta          = trainLinearReg(X, y, lambda)
    error_train(i) = linearRegCostFunction(X, y, theta, 0);
    error_val(i)   = linearRegCostFunction(Xval, yval, theta, 0);
end
