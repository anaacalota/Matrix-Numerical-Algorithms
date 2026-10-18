function [classes] = predict_classes(X, weights, ...
									input_layer_size, hidden_layer_size, ...
									output_layer_size)
	% X -> m x n matrix (m examples, n features)
	% weights -> unrolled weight vector to reshape
	% classes -> m x 1 vector of predicted class labels

	% building the matrices
	s1 = input_layer_size;
	s2 = hidden_layer_size;
	s3 = output_layer_size;
	theta1 = reshape(weights(1:s2 * (s1 + 1)), s2, (s1 + 1));
	theta2 = reshape(weights((1 + (s2 * (s1 + 1))):end), s3, (s2 + 1));

	% number of examples
	m = size(X, 1);
	classes = zeros(m, 1);

	% forward propagation
	for i = 1:m
		a1 = [1; X(i, :)'];
		z2 = theta1 * a1;
		a2 = sigmoid(z2);
		a2 = [1; a2];
		z3 = theta2 * a2;
		a3 = sigmoid(z3);

		% max
		max_val = a3(1);
		max_index = 1;
		for j = 2:length(a3)
			if a3(j) > max_val
				max_val = a3(j);
				max_index = j;
			end
		end

		classes(i) = max_index;
	end
end
