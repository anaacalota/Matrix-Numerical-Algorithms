function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% n -> the number of predictors
	% m -> the number of trainings
	% alpha -> the learning rate
	% iter -> the number of iterations

	% Theta -> the vector of weights
	Theta = zeros(n, 1);

	for nr_iter = 1 : iter
		for j = 1 : n
			partial_derivative = sum((FeatureMatrix * Theta - Y) .* ...
																FeatureMatrix(:, j));
			gradient = 1 / m * partial_derivative;
			Theta(j) = Theta(j) - alpha * gradient;
		end
	end

	% add theta_0, considered 0
	Theta = [0; Theta];

end
