function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% tol -> the learning rate
	% iter -> the number of iterations
	% tol -> the tolerance level for convergence of the conjugate gradient method

	% Theta -> the vector of weights

	% calculating the system matrix and checking if it is positive definite
	A = FeatureMatrix' * FeatureMatrix;

	dimensions = size(FeatureMatrix);
	cols = dimensions(2);

	if (issymmetric(A))
		eigenvalues = eig(A);
		for i = 1:length(eigenvalues)
			if eigenvalues(i) < 0
				Theta = zeros(size(A, 1), 1);
				return;
			end
		end
	end

	% applying the conjugate gradient method
	x0 = zeros(cols, 1);
	b = FeatureMatrix' * Y;
	r = b - A * x0;
	v = r;
	x = x0;
	tol_squared = tol^2;
	k = 1;

	while k <= iter && (r' * r) > tol_squared
		tk = (r' * r) / (v' * A * v);
		x = x + tk * v;
		
		% calculate the new residual r(k)
		new_r = r - tk * A * v;

		sk = (new_r' * new_r) / (r' * r);
		v = new_r + sk * v;
		
		% update the residual
		r = new_r;

		k++;
	end

	Theta = [0; x];
end