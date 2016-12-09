function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logisitc regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i


%Test input:
%X = [magic(3) ; sin(1:3); cos(1:3)];
%y = [1; 2; 2; 1; 3];
%num_labels = 3;
%lambda = 0.1;
%theta = [-2; -1; 1; 2];

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
[all_theta] = zeros(num_labels, n + 1);

%Add ones to the X data matrix.
%Because the first column of X should be the bias units.
%Add one extra column to all rows of X and initiaze them 1.
X = [ones(m, 1) X];


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell user 
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%
%Comment on fminunc
%fminunc is an optimization solver that finds the minimum of an unconstrained function.
%Constrfminuncaints in optimization often refer to constraints on the parameters, for example,
%constraints that bound the possible values theta can take (e.g.,theta < 1). 
%Logistic regression does not have such constraints since theta is allowed to take any real value.
#{
Concretely, you are going to use fminunc to finnd the best parameters theta
for the logistic regression cost function, given a fixed dataset (of X and yvalues). 
You will pass to fminunc the following inputs:

1.The initial values of the parameters we are trying to optimize.

2. A function that, when given the training set and a particular theta, computes
the logistic regression cost and gradient with respect to theta for the dataset (X, y)

Furthermore, you will be using fmincg for this exercise (instead of fminunc).
fmincg works similarly to fminunc, but is more more efficient for dealing with
a large number of parameters.

#}
% =========================================================================

%We set the GradObj option to on, which tells fminunc that our
%function returns both the cost and the gradient. This allows fminunc to
%use the gradient when minimizing the function.

%To specify the actual function we are minimizing, we use a short-hand"
%for specifying functions with the @(t) ( costFunction(t, X, y) )
%This creates a function, with argument t, which calls your costFunction. This
%allows us to wrap the costFunction for use with fminunc.

#{
Logical arrays in Octave/MATLAB are arrays
which contain binary (0 or 1) elements. In Octave/MATLAB, evaluating
the expression a == b for a vector a (of size mX1) and scalar b will return
a vector of the same size as a with ones at positions where the elements
of a are equal to b and zeroes where they are different. To see how this
works for yourself, try the following code in Octave/MATLAB:
a = 1:10; % Create a and b
b = 3;
a == b % You should try different values of b here; in following at (y == c)

How to copy a vector into a matrix:
Q = zeros(5,3)      % create a test matrix of all-zeros
v = [1 2 3]'        % create a column vector(even for row vector,without trnasposing v it works)
Q(2,:) = v          % copy v into the 2nd row of Q(The syntax "(2,:)" means "use all columns of the 2nd row".)
#}

initial_theta = zeros(n+1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 50);
%Only you need to do that for 10 different logistic regressions simultaneously 
%since that is what our Neural Network is doing 
for c=1:num_labels
  all_theta(c,:) = fmincg(@(t)(lrCostFunction(t, X, (y == c), lambda)),initial_theta, options)(:)';
end
end
