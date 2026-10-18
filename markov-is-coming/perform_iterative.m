function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	for i = 1:max_steps
		x_new = G * x0 + c;
		err = norm(x_new - x0);

		if err < tol
			x = x_new;
			steps = i;
			return;
		end

		x0 = x_new;
	end

	% if the error was not less than the tolerance,
	% return the last approximation and calculate
	% the error based on it
	x = x0;
	steps = max_steps;
	err = norm(G * x0 + c - x0);
end
