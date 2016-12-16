function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%
%The K-means algorithm is a method to automatically cluster similar data examples together.
%Group the data into a few cohesive "clusters".
%In the "cluster assignment" phase of the K-means algorithm, the algorithm
%assigns every training example x(i) to its closest centroid, given the current
%positions of centroids.

#{
The intuition behind K-means is an iterative procedure that starts by guessing the initial centroids, 
and then refines this guess by repeatedly assigning
examples to their closest centroids and then recomputing the centroids based
on the assignments.

The K-means algorithm is as follows:

% Initialize centroids in kMeansInitCentroids

centroids = kMeansInitCentroids(X, K);

for iter = 1:iterations

% Cluster assignment step: 
  Assign each data point to the closest centroid.
% idx(i) corresponds to cˆ(i), the index of the centroid assigned to example i

% Move centroid step: 
  Compute means(for-loop over the examples to compute this) based on centroid assignments
  %Set K
  K = size(centroids, 1);  %given in example

  centroids = computeMeans(X, idx, K);

Task is to complete the code in findClosestCentroids.m. This
function takes the data matrix X and the locations of all centroids inside
centroids and should output a one-dimensional array idx that holds the
index (a value in {1..K}, where K is total number of centroids) of the
closest centroid to every training example.

You can get a selection of all of the indexes for each centroid with:
sel = find(idx == i) % i ranges from 1 to K
#}

%Test input
%training set {(x_1),(x_2),(x_3)...}
%example 1 - three examples, two features, two centroids
X = [0 1; 5 5; -1 8];
centroids = [7 6; -2 2];

%example 2 - 10 examples, five features, four centroids
%X = reshape(sin(1:50), 10, 5);
%centroids = X(7:10,:); %start from 7th row and all columns of those rows

%original
%Set K
K = size(centroids, 1);  %given in example

dist = zeros(size(X,1),K);

% You need to return the following variables correctly.
%original
idx = zeros(size(X,1), 1); %given in example

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
#{
The inner-loop of the algorithm repeatedly carries out two steps: 
(i) Assigning each training example x(i) to its closest centroid, and 
(ii) Recomputing the mean of each centroid using the points assigned to it. 
The K-means algorithm will always converge to some final set of means for the centroids.

Inf OR Inf() OR inf
Return a scalar, matrix or N-dimensional array whose elements are
all equal to the IEEE representation for positive infinity.
When called with no arguments, return a scalar with the value `Inf'.
When called with a single argument, return a square matrix with the dimension specified.

The K-means algorithm will always converge to some final set of means for the centroids.

Note that the converged solution may not always be ideal and depends on the
initial setting of the centroids. Therefore, in practice the K-means algorithm
is usually run a few times with different random initializations. One way to
choose between these different solutions from different random initializations
is to choose the one with the lowest cost function value (distortion).

Use of bxsfun function
This computes the sum of the squares of the differences between each row of a matrix and a single vector.
Q = magic(3) % matrix
v = [1 2 3] % single vector
diffs = bsxfun(@minus, Q, v) % differences between each row of a matrix and a single vector
sum(diffs.^2, 2) % sum of the squares of the diffs
#}


%--using at present-----------
%For Test example answer is correcr but ex7 does give wrong answer
#{
for i = 1:size(X, 1)
  min_d = Inf();
  idx(i)=1;
 for k = 1:K    
    dist = sum((X(i, 1) - centroids(k, 1)).^2);
    %d = dist'*dist; %Original --->Not used
     if (dist < min_d) 
     min_d = dist;
     idx(i) = k;            
     end    
  end
end
#}
%----------New----------------
%Correct answers for all cases

for i=1:size(X,1),
    min_sum= Inf();
    idx(i)=1;
    for j=1:K,
        sum_j=sum( power( X(i,:).-centroids(j,:),2 ) );
        if (sum_j<=min_sum)
            min_sum=sum_j;
            idx(i)=j; %selection of all of the indexes for each centroid
        endif;
    end;
end;
sel
%------------------------
% =============================================================

end

