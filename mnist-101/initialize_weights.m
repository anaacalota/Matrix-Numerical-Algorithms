function [matrix] = initialize_weights(L_prev, L_next)
	% L_prev -> the number of units in the previous layer
	% L_next -> the number of units in the next layer

	% matrix -> the matrix with random values from -e0 to e0

	% calculate epsilon using the given formula
	e0 = sqrt(6) / sqrt(L_prev + L_next);

	% the matrix is initialized with random values between -e0 and e0
	matrix = zeros(L_next, L_prev + 1);
	matrix = 2 * rand(L_next, L_prev + 1) * e0 - e0;
end
