function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples
	% lambda -> regularization parameter that controls the amount of 
	%           shrinkage applied to the regression coefficients

	% Error -> the error of the regularized cost function

	Error = 0;
	m = size(FeatureMatrix, 1);
	
	Error = (1 / (2 * m)) * sum((FeatureMatrix * Theta(2:end, :) - Y) .^ 2) + ...
					lambda * sum(Theta(2:end, :) .^ 2);
end
