function [G, c] = get_Jacobi_parameters (Link)
	% retain the size of the link matrix
	dimensions = size(Link);
	n = dimensions(1);

	% G is the submatrix of Link from which we eliminate the win and lose states
	G = Link(1:n-2, 1:n-2);

	% c is the vector towards the win state
	c = Link(1:n-2, n-1);
end
