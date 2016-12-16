function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%
%   PCA consists of two computational steps: 
%   First, you compute the covariance matrix of the data. 
%   Then use SVD function to compute the eigenvectors U1; U2; : : : ;Un. 
%   These will correspond to the principal components of variation in the data.

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%
%After normalizing the data, run PCA to compute the principal components.

Sigma = 1/m.*X'*X;  %covariance matrix of the data
%compute the principal components,here 
%U will contain the principal components and 
%S will contain a diagonal matrix and eigenvalues (on diagonal) in S
%V is a collection of all eigenvectros
%The script will also output the top principal component (eigenvector) found.
[U, S, V] = svd( Sigma );








% =========================================================================

end
