%% Machine Learning Online Class
%  Exercise 7 | Principle Component Analysis and K-Means Clustering
%
%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  exercise. You will need to complete the following functions:
%
%     pca.m
%     projectData.m
%     recoverData.m
%     computeCentroids.m
%     findClosestCentroids.m
%     kMeansInitCentroids.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% ================= Part 1: Find Closest Centroids ====================
%  To help you implement K-Means, we have divided the learning algorithm 
%  into two functions -- findClosestCentroids and computeCentroids. In this
%  part, you shoudl complete the code in the findClosestCentroids function. 
%
fprintf('Finding closest centroids.\n\n');

% Load an example dataset that we will be using
load('ex7data2.mat');

% Select an initial set of centroids
K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5];

% Find the closest centroids for the examples using the
% initial_centroids
idx = findClosestCentroids(X, initial_centroids);

fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1:3));
fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ===================== Part 2: Compute Means =========================
%  After implementing the closest centroids function, you should now
%  complete the computeCentroids function.
%
fprintf('\nComputing centroids means.\n\n');

%  Compute means based on the closest centroids found in the previous part.
centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');
fprintf('\n(the centroids should be\n');
fprintf('   [ 2.428301 3.157924 ]\n');
fprintf('   [ 5.813503 2.633656 ]\n');
fprintf('   [ 7.119387 3.616684 ]\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== Part 3: K-Means Clustering ======================
%  After you have completed the two functions computeCentroids and
%  findClosestCentroids, you have all the necessary pieces to run the
%  kMeans algorithm. In this part, you will run the K-Means algorithm on
%  the example dataset we have provided. 
%
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
load('ex7data2.mat');

% Settings for running K-Means
K = 3;
max_iters = 10;

% For consistency, here we set centroids to specific values
% but in practice you want to generate them automatically, such as by
% settings them to be random examples (as can be seen in
% kMeansInitCentroids).
initial_centroids = [3 3; 6 2; 8 5];

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Done.\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: K-Means Clustering on Pixels ===============
%  In this exercise, you will use K-Means to compress an image. To do this,
%  you will first run K-Means on the colors of the pixels in the image and
%  then you will map each pixel on to it's closest centroid.
%  
%  You should now complete the code in kMeansInitCentroids.m
%
#{
In this exercise, you will apply K-means to image compression. In a
straightforward 24-bit color representation of an image,
each pixel is represented as three 8-bit unsigned integers (ranging from 0 to 255) that specify
the red, green and blue intensity values. This encoding is often refered to as
the RGB encoding. Our image contains thousands of colors, and in this part
of the exercise, you will reduce the number of colors to 16 colors.
By making this reduction, it is possible to represent (compress) the photo
in an efficient way. Specifically, you only need to store the RGB values of
the 16 selected colors, and for each pixel in the image you now need to only
store the index of the color at that location (where only 4 bits are necessary
to represent 16 possibilities). In this exercise, you will use the 
K-means algorithm to select the 16 colors that will be used to represent the compressed image.
Concretely, you will treat every pixel in the original image as a data example and use the K-means
algorithm to find the 16 colors that best group (cluster) the pixels in the 3-dimensional RGB space. 
Once you have computed the cluster centroids on
the image, you will then use the 16 colors to replace the pixels in the original image.
#}

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image of a bird(Load 128x128 color image)
#{
This creates a three-dimensional matrix A whose first two indices identify
a pixel position and whose last index represents red, green, or blue. For
example, A(50, 33, 3) gives the blue intensity of the pixel at row 50 and
column 33.
#}
%A = double(imread('bird_small.png'));

A = double(imread('Marble Statue 2.png'));

% If imread does not work for you, you can try instead
%   load ('bird_small.mat');

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

% Size of the image
img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gives us our dataset matrix X that we will use K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

% Run your K-Means algorithm on this data
% You should try different values of K and max_iters here
K = 16; 
max_iters = 10;

% When using K-Means, it is important the initialize the centroids
% randomly. 
% You should complete the code in kMeansInitCentroids.m before proceeding
initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 5: Image Compression ======================
%  In this part of the exercise, you will use the clusters of K-Means to
%  compress an image. To do this, we first find the closest clusters for
%  each example. After that, we 

fprintf('\nApplying K-Means to compress an image.\n\n');

% Find closest cluster members
idx = findClosestCentroids(X, centroids);

% Essentially, now we have represented the image X as in terms of the
% indices in idx. 

% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by it's index in idx) to the centroid value
X_recovered = centroids(idx,:);

% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf('Program paused. Press enter to continue.\n');
pause;

