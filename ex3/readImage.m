%example does not work-need more work!

X = ('xyz.png');
%X = reshape(sin(1:7), 1, 7);
D = imread('xyz.png');
D = D .* 255;
Theta1 = reshape(sin(0 : 0.5 : 5.9), 4, 3);
Theta2 = reshape(sin(0 : 0.3 : 5.9), 4, 5);
predict(Theta1, Theta2, D(:)');


%displayData(sel);
%displayData(X,:)