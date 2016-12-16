function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%
#{
The K-means algorithm is as follows:

% Initialize centroids

centroids = zeros(K, size(X, 2));

#}

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%
#{
The code belwo first randomly permutes the indices of the examples (using randperm). 
Then, it selects the first K examples based on the random
permutation of the indices. This allows the examples to be selected at random 
without the risk of selecting the same example twice.
#}
% Initialize the centroids to be random examples
% Randomly reorder the indices of examples
randidx = randperm(size(X, 1));
% Take the first K examples as centroids
centroids = X(randidx(1:K), :);
% =============================================================

end

