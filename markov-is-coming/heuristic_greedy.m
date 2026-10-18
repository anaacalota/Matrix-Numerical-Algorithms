function [path] = heuristic_greedy (start_position, probabilities, Adj)
	n = length(probabilities);
	% 0 = unvisited, 1 = visited
	visited = zeros(1, n);

	% start from the start position
	path = start_position;
	path_length = length(path);

	% mark the start node as visited
	visited(start_position) = 1;

	while path_length > 0
		position = path(path_length);
		
		% if it reached the win position
		if position == n - 1
			return;
		end

		max_probability = -1;
		neigh = -1;
		for i = 1:n
			if visited(i) == 0 && Adj(position, i) == 1
				if probabilities(i) > max_probability
					neigh = i;
					max_probability = probabilities(i);
				end
			end
		end

		% if no unvisited neighbor was found
		if neigh == -1
			% remove the last node from the path
			path = path(1:path_length-1);
		else
			% add the neighbor to the path and mark it as visited
			visited(neigh) = 1;
			path = [path, neigh];
		end

		% update the length of the path
		path_length = length(path);
	end
end
