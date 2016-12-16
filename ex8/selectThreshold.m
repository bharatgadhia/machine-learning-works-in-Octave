function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

#{
Now that you have estimated the Gaussian parameters, you can investigate
which examples have a very high probability given this distribution and which
examples have a very low probability. The low probability examples are
more likely to be the anomalies in our dataset. One way to determine which
examples are anomalies is to select a threshold based on a cross validation set.

In this part of the exercise, you will implement an algorithm to select
the threshold (episioln)(- using the F1 score on a cross validation set.

For this, we will use a cross validation set pval.
where the label y = 1 corresponds to an anomalous example, 
and y = 0 corresponds to a normal example.
For each cross validation example, we will compute p(x_cv(i).
The vector of all of these probabilities p_cv(x(1))... p_cv(x(m))
is passed to selectThreshold.m in the vector pval.

The corresponding labels y_cv(1)...y_cv(m)is passed to the same function in the vector yval.

The function selectThreshold.m should return two values; the first is
the selected threshold (episioln)(-. If an example x has a low probability p(x) < episioln,
then it is considered to be an anomaly. The function should also return the
F1 score, which tells you how well you're doing on finding the ground truth
anomalies given a certain threshold.

For many different values of episioln, you will compute the resulting 
F1 score by computing how many examples the current threshold classifies correctly and incorrectly.

. tp is the number of true positives: the ground truth label says it's an
  anomaly and our algorithm correctly classified it as an anomaly.
• fp is the number of false positives: the ground truth label says it's not
  an anomaly, but our algorithm incorrectly classified it as an anomaly.
• fn is the number of false negatives: the ground truth label says it's an
  anomaly, but our algorithm incorrectly classified it as not being anomalous.
#}
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

%---------------------
%Test
%yval = [1 0 0 1 1]'; %Ground Truth Labels
%pval = [0.1 0.2 0.3 0.4 0.5]';  %Probability


%Currently employed- loop version
%For many different values of Epsilon, you will compute the resulting 
%F1 score by computing how many examples the current threshold classifies correctly and incorrectly.

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    

    cvPredictions=pval<epsilon;
    f_p = sum((cvPredictions==1) & (yval==0));
    t_p = sum((cvPredictions==1) & (yval==1));
    f_n = sum((cvPredictions==0) & (yval==1));
    if((t_p+f_p) > 0) % initially (t_p+f_p) may be zero
    prec = t_p/(t_p+f_p);   
    rec = t_p/(t_p+f_n);    
    F1 = 2*prec*rec/(prec+rec);
    end
    % =============================================================
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
