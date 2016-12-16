function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%
%input
%Test example 1

%idx is a vector with one entry for each example in X, 
%which tells you which centroids each example is assigned to. 
%The values range from 1 to K.

%Test example 1
%X = [0 1; 5 5; -1 8];
%idx = [2 1 2]'; % idx is initialized here
%K = 2;

%Test example 1
%X = [magic(3) ; magic(3) ; [8 1 7]];
%idx = [1 2 3 2 3 1 1]';
%K = 3;

%computeCentroids() always returns 'K' centroids.
#{
The key component of my approach is to first construct an m by K Category Matrix Cat such that:
Cat[i][k] = 1 if x(i) belongs to centroid k else Cat[i][k] = 0.
For instance I now have 4 examples(X) and have already categorized them to 2 centroids in the previous iteration. 
Suppose the idx vector is [1,2,2,1]' which means that 
example 1 and example 4 belong to centroid 1 
while example 2 and exmaple 3 belong to centroid 2. 
Then in this case Cat will be:
Cat = [1 0;0 1;0 1;1 0]
The real tricky part is how you derive matrix Cat from vector idx.
Cat = (repmat(idx,[1,K])==[1:K]);
#}

% Useful variables
[m n] = size(X);  %given in example

% You need to return the following variables correctly.

%Do not use following while running ex7(their are initialized in runkMeans.m file)
%centroids = zeros(K, n);  %given in example
%K = size(centroids, 1);
%idx = zeros(size(X,1), 1); % idx if not givne then is initialized here

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

for i=1:K,
    x_count=0;
    centroids(i,:)=zeros(1,n);
    for j=1:m,
        if (idx(j)==i)
            x_count=x_count+1;
            centroids(i,:)=centroids(i,:).+X(j,:);
        endif;
    end;
    centroids(i,:)=centroids(i,:)./x_count;
end;






% =============================================================


end

