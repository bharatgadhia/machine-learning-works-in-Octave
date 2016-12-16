function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%
#{
Dimensionality Reduction with PCA
After computing the principal components, you can use them to reduce the
feature dimension of your dataset by projecting each example onto a lower
dimensional space, x(i) -> z(i) (e.g., projecting the data from 2D to 1D). In
this part of the exercise, you will use the eigenvectors returned by PCA and
project the example dataset into a 1-dimensional space.
In practice, if you were using a learning algorithm such as linear regression
or perhaps neural networks, you could now use the projected data instead
of the original data. By using the projected data, you can train your model
faster as there are less dimensions in the input.
#}
% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:,1:k);
%
%Note that the top K components in U are given by
%the first K columns of U, that is U reduce = U(:, 1:K).
U_reduce = U(:,1:K);
Z = (U_reduce'*X')';

#{
In Figure,the original data points are
indicated with the blue circles, while the projected data points are indicated
with the red circles. The projection effectively only retains the information
in the direction given by U1.
#}

% =============================================================

end
