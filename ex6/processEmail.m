function word_indices = processEmail(email_contents)
%PROCESSEMAIL preprocesses a the body of an email and
%returns a list of word_indices 
%   word_indices = PROCESSEMAIL(email_contents) preprocesses 
%   the body of an email and returns a list of indices of the 
%   words contained in the email. 
%

% Load Vocabulary
vocabList = getVocabList();

% Init return value
word_indices = [];

% ========================== Preprocess Email ===========================
#{
In processEmail.m, we have implemented the following email prepro-
cessing and normalization steps:
1.Lower-casing: The entire email is converted into lower case, so
that captialization is ignored (e.g., IndIcaTE is treated the same as
Indicate).
2.Stripping HTML: All HTML tags are removed from the emails.
Many emails often come with HTML formatting; we remove all the
HTML tags, so that only the content remains.
3.Normalizing URLs: All URLs are replaced with the text "httpaddr".
4.Normalizing Email Addresses: All email addresses are replaced with the text "emailaddr".
5.Normalizing Numbers: All numbers are replaced with the text"number".
6.Normalizing Dollars: All dollar signs ($) are replaced with the text "dollar".
7.Word Stemming: Words are reduced to their stemmed form. For ex-
ample, "discount", "discounts", "discounted" and "discounting" are all
replaced with "discount". Sometimes, the Stemmer actually strips off
additional characters from the end, so "include", "includes", "included",
and "including" are all replaced with "includ".
8.Removal of non-words: Non-words and punctuation have been re-
moved. All white spaces (tabs, newlines, spaces) have all been trimmed
to a single space character.

This form turns out to be much easier to work with for performing feature extraction.

strcmp() returns a logical vector, with a 1 marking each location where a word occurs in the list. 
If there is no match, all of the logical values are 0's
Here is an example using the strcmp() function showing how to find the index of a word in a cell array of words:
small_list = {'alpha', 'bravo', 'charlie', 'delta', 'echo'}
match = strcmp('bravo', small_list)

The find() function returns a list of the non-zero elements in "match". 
find(match)->position that word in list

You can add these index values to the word_indices list by concatenation.
word_indices = [ word_indices ; i];

Note that if there is no match, find() returns a null vector, 
and this can be concatenated to the word list without any problems.
#}

% Find the Headers ( \n\n and remove )
% Uncomment the following lines if you are working with raw emails with the
% full headers

% hdrstart = strfind(email_contents, ([char(10) char(10)]));
% email_contents = email_contents(hdrstart(1):end);

% Lower case
email_contents = lower(email_contents);

% Strip all HTML
% Looks for any expression that starts with < and ends with > and replace
% and does not have any < or > in the tag it with a space
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');

% Handle Numbers
% Look for one or more characters between 0-9
email_contents = regexprep(email_contents, '[0-9]+', 'number');

% Handle URLS
% Look for strings starting with http:// or https://
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');

% Handle Email Addresses
% Look for strings with @ in the middle
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

% Handle $ sign
email_contents = regexprep(email_contents, '[$]+', 'dollar');


% ========================== Tokenize Email ===========================

% Output the email to screen as well
fprintf('\n==== Processed Email ====\n\n');

% Process file
l = 0;

while ~isempty(email_contents)

    % Tokenize and also get rid of any punctuation
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word 
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end;

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end

    % Look up the word in the dictionary and add to word_indices if
    % found
    % ====================== YOUR CODE HERE ======================
    % Instructions: Fill in this function to add the index of str to
    %               word_indices if it is in the vocabulary. At this point
    %               of the code, you have a stemmed word from the email in
    %               the variable str. You should look up str in the
    %               vocabulary list (vocabList). If a match exists, you
    %               should add the index of the word to the word_indices
    %               vector. Concretely, if str = 'action', then you should
    %               look up the vocabulary list to find where in vocabList
    %               'action' appears. For example, if vocabList{18} =
    %               'action', then, you should add 18 to the word_indices 
    %               vector (e.g., word_indices = [word_indices ; 18]; ).
    % 
    % Note: vocabList{idx} returns a the word with index idx in the
    %       vocabulary list.
    % 
    % Note: You can use strcmp(str1, str2) to compare two strings (str1 and
    %       str2). It will return 1 only if the two strings are equivalent.
    %
    % =============================================================
    
    #{
    In Octave/MATLAB, you can compare two
    strings with the strcmp function. For example, strcmp(str1, str2) will
    return 1 only when both strings are equal.
    
    vocabList is a "cell-array" containing the words in the vocabulary.
    a cell-array is just like a normal array (i.e., a vector),
    except that its elements can also be strings (which they can't in a normal
    Octave/MATLAB matrix/vector), and you index into them using curly
    braces instead of square brackets.
    
    Specifically, to get the word at index i, you can use vocabListfig. 
    You can also use length(vocabList) to get the number of words in the vocabulary.
    #}

    % Code added here
    for i = 1:length(vocabList)
      if(strcmp(str, vocabList{i}))
        word_indices = [ word_indices ; i];
      end
    end  
    %Code end  
    
    % Print to screen, ensuring that the output lines are not too long
    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;

end
% Print footer
fprintf('\n\n=========================\n');
end
