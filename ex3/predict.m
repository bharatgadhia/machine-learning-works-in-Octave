function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
%Theta1 = reshape(sin(0 : 0.5 : 5.9), 4, 3);
%Theta2 = reshape(sin(0 : 0.3 : 5.9), 4, 5);
%X = reshape(sin(1:16), 8, 2);


m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
%Logistic regression cannot form more complex hypotheses as it is only a linear classifier.
%The neural network will be able to represent complex models that form non-linear hypotheses.
%Goal is to implement the feedforward propagation algorithm to use our weights for prediction.
#{
Our neural network has 3 layers an input layer, a hidden layer and an output layer. 
Recall that our inputs are pixel values of digit images. 
Since the images are of size 20X20, this gives us 400 input layer
units (excluding the extra bias unit which always outputs +1). 
As before,the training data will be loaded into the variables X and y.
Theta1 and Theta2 The parameters have dimensions
that are sized for a neural network with 25 units in the second layer and 10
output units (corresponding to the 10 digit classes).
#}
% =========================================================================
%backpropagation algorithm for learning the neural network parameters.
% Theta1 has size 25 x 401; 25 units in the second layer
% Theta2 has size 10 x 26; 10 output units
#{
Implementation Note: The matrix X contains the examples in rows.
you will need to add the column of 1's to the matrix. The matrices Theta1 and Theta2 contain
the parameters for each unit in rows. Specifically, the first row of Theta1
corresponds to the first hidden unit in the second layer. In Octave/MAT-
LAB, when you compute z(2) = Theta(1)a(1), be sure that you index (and if
necessary, transpose) X correctly so that you get a(l) as a column vector.

For the input layer you should start with a matrix of size 5000x401
from there you have to calculate the fist activation layer a1, 
where the size of the resultant matrix should be 5000x26
then you need to calculate the next activation a2 (output layer), 
where the size of that matrix should be a 5000x10 matrix
#}
a1 = [ones(m,1),X];

z2 = sigmoid(a1*Theta1');
m2 = size(z2);
a2 = [ones(m2,1),z2];

a3 = sigmoid(a2*Theta2');
%use the max() function to select the correct classifier.
[x,ix] = max(a3,[],2);
p = ix;
end
