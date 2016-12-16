function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
#{
You can think of the Gaussian kernel as a similarity function 
that measures the distance" between a pair of examples,(x(i); x(j)).
The Gaussian kernel is also parameterized by a bandwidth parameter, sigma, 
which determines how fast the similarity metric decreases (to 0) as the examples are further apart.
#}
%Test input
%x1 = [1 2 3];
%x2 = [2 4 6];
%sigma = 3;

%std =  3;


x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%
#{
The method is similar to that used for sigmoid.m in ex2. 
The numerator is the sum of the squares of the difference of two vectors. 
That's just like computing the linear regression cost function. 
Use exp() and scale by the value given in the formula
#}
% =============================================================
%std = sigma;
%s1 = 2*(std*std);
%s2 = sum(abs(x1-x2).^2);
%sim = exp(-s2/s1)

sim = exp(-1*(x1-x2)'*(x1-x2)/(2*sigma*sigma));

end
