function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%
%Test cases
%X=[1:3]% in stpes of one upto 3 (1,2,3)-row vector
%X=[1:5]'; - column vector
%p=4;

% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 
% =========================================================================

m=size(X,1);
X=ones(p,1)*X'; % repeats X for in 4(p) rows.(if X is a row vector then no need to transpose, otherwise transpose X
X_poly=X'.^(1:p); %each element is by itself from 1 to p 
end

#{
multiply by a column vector of 1's, explained here
v = [1 2 3]
ones(3,1) * % multiply 3 rows of 1s with v,which is a row vector
Multiplying by a column vector of 1's is one method of duplicating the rows of a vector, 
so that it is the same size as the X matrix.
#}