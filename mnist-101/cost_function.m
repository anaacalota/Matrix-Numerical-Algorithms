function [J, grad] = cost_function(params, X, y, lambda, ...
			 input_layer_size, hidden_layer_size, ...
			 output_layer_size)

	% build the matrices for linear transformations
	s1 = input_layer_size;
	s2 = hidden_layer_size;
	s3 = output_layer_size;
	theta1 = reshape(params(1:s2 * (s1 + 1)), s2, (s1 + 1));
	theta2 = reshape(params((1 + (s2 * (s1 + 1))):end), s3, (s2 + 1));

	% number of examples
	m = size(X, 1);
	y_eye = eye(s3);
	% transpose to get a matrix of shape s3 x m
	y_eye = y_eye(y,:)';

	% forward propagation
	a1 = [ones(1, m); X'];
	z2 = theta1 * a1;
	a2 = [ones(1, m); sigmoid(z2)];
	z3 = theta2 * a2;
	a3 = sigmoid(z3);

	% backpropagation
	J = 1 / m * sum(sum(-y_eye .* log(a3) - (1 - y_eye) .* log(1 - a3))) + ...
		lambda / (2 * m) * ...
		(sum(sum(theta1(:, 2:end) .^ 2)) + sum(sum(theta2(:, 2:end) .^ 2)));

	Error3 = a3 - y_eye;
	Error2 = (theta2(:,2:end)' * Error3) .* sigmoid(z2) .* (1 - sigmoid(z2));

	delta1 = Error2 * a1';
	delta2 = Error3 * a2';

	grad_theta1 = delta1 / m;
	grad_theta2 = delta2 / m;

	grad_theta1(:, 2:end) += (lambda / m) * theta1(:, 2:end);
	grad_theta2(:, 2:end) += (lambda / m) * theta2(:, 2:end);

	% the gradients are stored as a vector
	grad = [grad_theta1(:); grad_theta2(:)];
end
