function [Link] = get_link_matrix (Labyrinth)
	% creates the adjacency matrix of the labyrinth
	Adj = get_adjacency_matrix(Labyrinth);
	n = size(Adj, 1);
	Link = sparse(n, n);

	for i = 1:n
		k = 0;

		% calculate the number of neighbors for the current node
		for j = 1:n
			if Adj(i, j) == 1
				k++;
			end
		end

		% divide 1 by the number of neighbors, if it has any
		for j = 1:n
			if Adj(i, j) == 1
				Link(i, j) = 1 / k;
			end
		end
	end
end
