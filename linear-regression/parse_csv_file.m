function [Y, InitialMatrix] = parse_csv_file(file_path)
	% path -> a relative path to the .csv file
	% Y -> the vector with all actual values
	% InitialMatrix -> the matrix that must be transformed

	file = fopen(file_path, "r");
	if file == -1
		fprintf("nu s-a putut deschide fisierul\n");
		return;
	end

	% initialisation
	Y = [];
	InitialMatrix = {};
	row = 1;

	% read the first line and ignore it
	line = fgetl(file);

	while ~feof(file)
		line = fgetl(file);
		col = 1; % current column index
		value = ''; % current value from the file
		values = {}; % values vector

		for i = 1:length(line)
			if line(i) == ','
				% when a comma is found, save the value
				values{col} = value;
				value = ''; % the current value is reset
				col++; % moves to the next column
			else
				value = [value line(i)]; % add character by character to the string
			end
		end

		% save the last value that does not end with a comma
		values{col} = value;
		% first value belongs to the Y vector
		Y(row, 1) = str2num(values{1});
		% the rest of the values belong to InitialMatrix
		for j = 2:length(values)
			InitialMatrix{row, j-1} = values{j};
		end
		row++;
	end

	fclose(file);
end
