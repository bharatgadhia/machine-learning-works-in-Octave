function e = TestFunction()
y = [1 3 4 2];
eye_matrix(4);
num_labels = 4;
%The syntax "y_matrix = eye(num_labels)(y,:)" is a vector addressing trick. 
%For each row of 'y', the statement is executed once. 
%The 'y' value is an index into the identity matrix. 
%Essentially, 'y,:' causes the appropriate row of the identity matrix to be copied entirely and placed in y_matrix.
y_1 = eye_matrix(y,:)

y_2 = eye(num_labels)(y,:)