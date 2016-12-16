function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

#{
In this exercise, you will implement an anomaly detection algorithm to detect
anomalous behavior in server computers. The features measure the through-
put (mb/s) and latency (ms) of response of each server. While your servers
were operating, you collected m = 307 examples of how they were behaving,
and thus have an unlabeled dataset {x(1); : : : ; x(m)}. You suspect that the
vast majority of these examples are \normal" (non-anomalous) examples of
the servers operating normally, but there might also be some examples of
servers acting anomalously within this dataset.
You will use a Gaussian model to detect anomalous examples in your
dataset. You will first start on a 2D dataset that will allow you to visualize
what the algorithm is doing. On that dataset you will fit a Gaussian dis-
tribution and then find values that have very low probability and hence can
be considered anomalies. After that, you will apply the anomaly detection
algorithm to a larger dataset with many dimensions. You will be using ex8.m
for this part of the exercise.

Given a training set {x(1); :::; x(m)} (where x(i) (- 2 Rn), you want to esti-
mate the Gaussian distribution for each of the features xi. For each feature
i = 1 : : : n, you need to find parameters mui and Square of Sigma that fit the data in the
i-th dimension {x_i(1)...x_i(m)}(the i-th dimension of each example).

This function takes as input the data matrix X and should output 
an n-dimension vector mu that holds the mean of all the n features 
and another n-dimension vector sigma2 that holds the variances of all the features.
#}

%Test case
%X = sin(magic(4));
%X = X(:,1:3);

% Useful variables
[m, n] = size(X);  %Original Input

% You should return these values correctly
mu = zeros(n, 1); %Original Input
sigma2 = zeros(n, 1);  %Original Input

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%

%for i=1:n,
#    mu(i) = 1/m*sum(X(:,i));
#    sigma2(i) = 1/m*sum(((X(:,i).-mu(i)).*(X(:,i).-mu(i))));
#end;


%Vecotorized implementation
mu = (1/m)*sum(X);
sigma2 = (1/m)*sum(((X.-mu).*(X.-mu)));

% =============================================================
end
