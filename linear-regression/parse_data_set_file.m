function [Y, InitialMatrix] = parse_data_set_file(file_path)
	% path -> a relative path to the .txt file
	% Y -> the vector with all actual values
	% InitialMatrix -> the matrix that must be transformed

	file = fopen(file_path, "r");
	if file == -1
		fprintf("nu s a putut deschide fisierul\n");
		return;
	end

	% matrix dimensions
	first_line = fgetl(file);
	dimensions = sscanf(first_line, "%d%d");
	rows = dimensions(1);
	cols = dimensions(2);

	% initialisation
	InitialMatrix = cell(rows, cols);
	Y = zeros(rows, 1);

	for i = 1:rows
		Y(i) = fscanf(file, "%d", 1);
		for j = 1:cols
			InitialMatrix{i,j} = fscanf(file, "%s", 1);
		end
	end

	fclose(file);
end
