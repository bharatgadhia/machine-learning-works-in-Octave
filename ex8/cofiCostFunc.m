function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies,num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies,num_features, lambda) 
%   returns the cost and gradient for the collaborative filtering problem.
%
%Unfold the U and W matrices from params


%Display and input params----------
%printf ("params--") params
%display ("params--") params

%Tests input:

%Example 1 - Collaborative Filtering Cost & Collaborative Filtering Gradient
%input:

%params = [ 1:14 ] / 10;
%Y: a matrix of movie ratings: Dimensions are (movies x users) 
%Y = magic(4); %(num movies*num users matrix, stores the ratings Y(i;j))
%Y = Y(:,1:3);
%R: a matrix of observations (binary values). Dimensions are (movies x users) 
%R is logical(R is an binary-valued indicator matrix,user j gave rating i)
%R(i; j) = 1 if user j gave a rating to movie i, and R(i; j) = 0 otherwise.
%objective of collaborative filtering is to predict movie ratings with the entries with R(i; j) = 0.
%R = [1 0 1; 1 1 1; 0 0 1; 1 1 0] > 0.5; 
%num_users = 3; 
%num_movies = 4;
%num_features = 2;
%lambda = 0;


%Example 2 - Regularized Cost & Gradient with regularization
%input:
#{
params = [ 1:14 ] / 10;
Y = magic(4);
Y = Y(:,1:3);
R = [1 0 1; 1 1 1; 0 0 1; 1 1 0] > 0.5;     % R is logical
num_users = 3;
num_movies = 4;
num_features = 2;
lambda = 6;
#}

#{
%Example 3 - a user with no reviews:
%input:
params = [ 1:14 ] / 10;
Y = magic(4);
Y = Y(:,1:3);
R = [1 0 1; 1 1 1; 0 0 0; 1 1 0] > 0.5;     % R is logical
num_users = 3;
num_movies = 4;
num_features = 2;
lambda = 6;
#}

%End display and Test input----------

%Original code snippets-------
#{
X corresponds to the feature vector x(i) for the i-th movie,
and the j-th row of Theta which corresponds to one parameter vector theta(j), for the j-th user. 
Both x(i) and theta(j) are n-dimensional vectors.
#}

%X: a matrix of movie features (0 to 5): Dimensions are (movies x features) 
X = reshape(params(1:num_movies*num_features), num_movies, num_features);

%Theta: a matrix of feature weights: Dimensions are (users x features) 
Theta = reshape(params(num_movies*num_features+1:end),num_users, num_features);
           
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));
%End Original code snippets-------
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
#{
Compute the "predicted" movie ratings for all users using the product of X and Theta. 
A transposition may be needed. Dimensions of the result should be (movies x users). 
Compute the movie "rating error" by subtracting Y from the predicted ratings.
Compute the "error_factor" my multiplying the movie rating error by the R matrix. 
The error factor will be 0 for movies that a user has not rated. 
Use the type of multiplication by R (vector or element-wise) 
so the size of the error factor matrix remains unchanged (movies x users). 
#}

%predictions = X * Theta';
%rating_error = (predictions.-Y).^2;
%error_factor = rating_error.*R
%The "error factor" will be 0 for movies that a user has not rated(where R=0)
#{
Calculate the unregularized cost as a scaled sum of the squares of all of the terms in error_factor. 
The result should be a scalar. 
#}

%Calculate the unregularized cost : C (Vectorized implementation)
C = ((X * Theta').-Y).^2.*R;
Theta2=Theta.*Theta;
S1 = (lambda/2) * sum(Theta2(:));
X2 = X.*X;
S2 = lambda/2 * sum(X2(:));
J = 1/2*sum(C(:)) + S1 + S2;

#{
Note that X grad should be a matrix of the same size as X 
and similarly, 
Theta grad is a matrix of the same size as Theta.

Note that the function returns the gradient for both sets of variables
by unrolling them into a single vector.

If your implementation is correct, you should find that the analytical
and numerical gradients match up closely.
#}

for i=1:num_movies,
    idx = find(R(i,:)==1);
    Y_tmp=Y(i,idx);
    Theta_tmp=Theta(idx,:);
    %unrolling
    X_grad(i,:)=(X(i,:)*Theta_tmp'-Y_tmp)*Theta_tmp .+ lambda*X(i,:);
end;


for j=1:num_users,
    idx = find(R(:,j)==1);
    Y_tmp=Y(idx,j);
    X_tmp=X(idx,:);
    %unrolling
    Theta_grad(j,:)=(X_tmp*Theta(j,:)'-Y_tmp)'*X_tmp .+ lambda*Theta(j,:);    
end;









% =============================================================

%Original code
grad = [X_grad(:); Theta_grad(:)];

end
