function x = emailFeatures(word_indices)
%EMAILFEATURES takes in a word_indices vector and produces a feature vector
%from the word indices. Feature extraction that converts each email into a vector in Rn.
%Specifically, the feature x(i) (- {0,1} for an email corresponds to whether
%the i-th word in the dictionary occurs in the email. That is, x(i) = 1 if the i-th
%word is in the email and x(i) = 0 if the i-th word is not present in the email.

%   x = EMAILFEATURES(word_indices) takes in a word_indices vector and 
%   produces a feature vector from the word indices. 

% Total number of words in the dictionary
n = 1899;

% You need to return the following variables correctly.
x = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return a feature vector for the
%               given email (word_indices). To help make it easier to 
%               process the emails, we have already pre-processed each
%               email and converted each word in the email into an index in
%               a fixed dictionary (of 1899 words). The variable
%               word_indices contains the list of indices of the words
%               which occur in one email.
% 
%               Concretely, if an email has the text:
%
%                  The quick brown fox jumped over the lazy dog.
%
%               Then, the word_indices vector for this text might look 
%               like:
%               
%                   60  100   33   44   10     53  60  58   5
%
%               where, we have mapped each word onto a number, for example:
%
%                   the   -- 60
%                   quick -- 100
%                   ...
%
%              (note: the above numbers are just an example and are not the
%               actual mappings).
%
%              Your task is take one such word_indices vector and construct
%              a binary feature vector that indicates whether a particular
%              word occurs in the email. That is, x(i) = 1 when word i
%              is present in the email. Concretely, if the word 'the' (say,
%              index 60) appears in the email, then x(60) = 1. The feature
%              vector should look like:
%
%              x = [ 0 0 0 0 1 0 0 0 ... 0 0 0 0 1 ... 0 0 0 1 0 ..];
%
%

% =========================================================================
#{
You're given a list of word indexes.
For each index in that list, set the corresponding entries in an 'x' array to the value '1'.

A couple of different methods could be used:
Loop through the list of word indexes, and use each index to set the corresponding value in the 'x' array to 1.
Take advantage of vectorized indexing, and do the same operation in one line of code without the loop.
#} 
x(word_indices) = 1;


% for i=1:size(word_indices)(1)
%  x(word_indices(i)) = 1;
%  end
  
end
