function vocabList = getVocabList()
%GETVOCABLIST reads the fixed vocabulary list in vocab.txt and returns a
%cell array of the words
%   vocabList = GETVOCABLIST() reads the fixed vocabulary list in vocab.txt 
%   and returns a cell array of the words in vocabList.

%After preprocessing the emails, we have a list of words for each email.
%This step is to choose which words to use in classifier and which to leave out.
%only the most frequently occuring words are chosen as words considered (the vocabulary list). 
%Since words that occur rarely in the training set are only in a few emails, they might cause the
%model to overfit the training set.The complete vocabulary list is in the file "vocab.txt"


%% Read the fixed vocabulary list
fid = fopen('vocab.txt');

% Store all dictionary words in cell array vocab{}
n = 1899;  % Total number of words in the dictionary

% For ease of implementation, we use a struct to map the strings => integers
% In practice, you'll want to use some form of hashmap
%
#{
'cell' is a built-in function
   If invoked with a single scalar integer argument, return a square
   NxN cell array.  If invoked with two or more scalar integer
   arguments, or a vector of integer values, return an array with the
   given dimensions.
#}
vocabList = cell(n, 1);
for i = 1:n
    % Word Index (can ignore since it will be = i)
    %'fscanf' is a built-in function
    fscanf(fid, '%d', 1);
    % Actual Word
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
