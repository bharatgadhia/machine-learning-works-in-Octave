function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
data = load('ex1data2.txt'); % read comma separated data
X = data(:, 1)

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
#{
featureNormalize() is only used on the training set.
It returns the mu and sigma values. 
ex1_multi.m does this for you, see around line 55.
You use mu and sigma to normalize the features of a new predictions.

Normalized value = Value after applying feature scaling + mean normalization
#}
%       
% Parameter X: Any real mxn matrix 
%      Return: mu = 1xn row vector
%              sigma = 1xn row vector sigma
%              X_norm = mxn matrix which has been normalized 
%                       with mu and sigma
numberOfColumnsInX_norm = columns(X_norm);
% works with input matrix X of any size
for i = 1:numberOfColumnsInX_norm, 
	meanOfCurrentFeatureInX = mean(X(:, i));
	mu(:, i) = meanOfCurrentFeatureInX;
%".-" notation, because subtraction is automatically element-wise. 
	X_norm(:, i) = X_norm(:, i) .- mu(:, i);

	standardDeviationOfCurrentFeatureInX = std(X(:, i));
	sigma(:, i) = standardDeviationOfCurrentFeatureInX;
% element-wise division does need the "./" operator.
	X_norm(:, i) = X_norm(:, i) ./ sigma(:, i);
end

% ============================================================

end
