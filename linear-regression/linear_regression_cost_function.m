function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples

	% Error -> the error of the regularized cost function

	% FeatureMatrix dimensions
	dimensions = size(FeatureMatrix);
	rows = dimensions(1);
	cols = dimensions(2);
	error_sum = 0;

	for i = 1:rows
		h0 = Theta(1);  % theta0

		% calculate the dot product for h0(x) = theta0 + theta1 * x1 + ...
		for j = 1:cols
			h0 = h0 + Theta(j + 1) * FeatureMatrix(i, j);
		end

		% the error for the current example
		err = h0 - Y(i);

		% add the square of the error
		error_sum += err^2;
	end

	Error = error_sum / (2 * rows);
end
