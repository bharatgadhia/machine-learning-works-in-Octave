function unittests()

% =============Test Cases=========
%Test Case 1
%sigmoid([4 5 6]);
%!shared tol
%tol = 0;%5e-05;%with tol = 0 you get assertion error!!
%assert (sigmoid([4 5 6]), [0.9820 0.9933 0.9975], tol);

%Test Case 2
%assert (sigmoid(1200000), 1)%with 0 you get assertion error!!

% =============End Test Cases=========
