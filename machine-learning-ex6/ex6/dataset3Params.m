function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
ctest = [0.01;0.1;0.3;1;3;10;30];
sig = [0.01;0.1;0.3;1;3;10;30];
m = size(ctest);
s = size(sig);
error = 110000 ;
cerror = 0
for i=1:m
    for j=1:s
        model = svmTrain(X, y, ctest(i), @(x1, x2) gaussianKernel(x1, x2, sig(j)));
        predict = svmPredict(model, Xval);
        cerror = mean(double(predict ~= yval));
        if cerror<error
            C = ctest(i);
            sigma = sig(j);
            error = cerror;
        end
    end
end






% =========================================================================

end
