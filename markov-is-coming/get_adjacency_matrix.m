function [Adj] = get_adjacency_matrix (Labyrinth)
	[rows, cols] = size(Labyrinth);
	% number of nodes + win and lose
	nr_nodes = rows * cols + 2;
	Adj = sparse(nr_nodes, nr_nodes);

	% win and lose are on the last 2 contours
	win_state = rows * cols + 1;
	lose_state = rows * cols + 2;

	Adj(win_state, win_state) = 1;
	Adj(lose_state, lose_state) = 1;

	for r = 1:rows
		for c = 1:cols
			% calculate the index of the cell
			curr_node = (r - 1) * cols + c;
			cell_code = Labyrinth(r, c);

			% transform the element into 4 bits
			bits = zeros(1, 4);
			for i = 4:-1:1
				bits(i) = mod(cell_code, 2);
				cell_code = floor(cell_code / 2);
			end
			b3 = bits(1); % North wall
			b2 = bits(2); % South wall
			b1 = bits(3); % East wall
			b0 = bits(4); % West wall

			% add neighbors to the adjacency matrix

			% North
			if b3 == 0 && r > 1
				north = (r - 2) * cols + c;
				Adj(curr_node, north) = 1;
				Adj(north, curr_node) = 1; % bidirectional
			end

			% South
			if b2 == 0 && r < rows
				south = r * cols + c;
				Adj(curr_node, south) = 1;
				Adj(south, curr_node) = 1;
			end

			% East
			if b1 == 0 && c < cols
				east = (r - 1) * cols + (c + 1);
				Adj(curr_node, east) = 1;
				Adj(east, curr_node) = 1;
			end

			% West
			if b0 == 0 && c > 1
				west = (r - 1) * cols + (c - 1);
				Adj(curr_node, west) = 1;
				Adj(west, curr_node) = 1;
			end

			% check if I am to reach the win state
			  if (r == 1 && b3 == 0) || (r == rows && b2 == 0)
				Adj(curr_node, win_state) = 1;
			end

			% check if I am to reach the lose state
			if (c == 1 && b0 == 0) || (c == cols && b1 == 0)
				Adj(curr_node, lose_state) = 1;
			end
		end
	end
end