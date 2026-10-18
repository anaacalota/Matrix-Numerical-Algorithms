function [decoded_path] = decode_path (path, lines, cols)
	path_length = length(path);
	decoded_path = zeros(path_length, 2);
	pos = 1;

	for i = 1:path_length
		current = path(i);

		% if it's not a win state
		if current != lines * cols + 1
			row = 1;
			% last index of the current row
			stop_point = cols;
			while current > stop_point
				% go to the next row
				row++;
				% final column
				stop_point = stop_point + cols;
			end
			decoded_path(pos, 1) = row;
			row_start = (row - 1) * cols;
			% calculate the column by subtracting how many elements are before the row
			decoded_path(pos, 2) = current - row_start;
			pos++;
		end
	end
	% remove the extra zeros where there are no elements
	decoded_path = decoded_path(1:pos - 1, :);
end
