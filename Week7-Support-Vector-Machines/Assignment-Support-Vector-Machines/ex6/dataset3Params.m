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

min_error = 100000000;

for C_loop = [0.01 0.03 0.1 0.3 1, 3, 10 30]
	for sigma_loop = [0.01 0.03 0.1 0.3 1, 3, 10 30]
		model = svmTrain(X, y, C_loop, @(x1, x2) gaussianKernel(x1, x2, sigma_loop));	% train SVM model
		predictions = svmPredict(model, Xval);	% compute predictions
		prediction_error = mean(double(predictions ~= yval));	% compute prediction_error
		if(prediction_error <= min_error)	% calculate minimum error & assign best values for C & sigma
			min_error = prediction_error;	
			best_C = C_loop;
			best_sigma = sigma_loop;
		end
	end
end

C = best_C;
sigma = best_sigma;


% =========================================================================

end
