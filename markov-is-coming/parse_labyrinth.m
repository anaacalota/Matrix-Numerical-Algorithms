function [Labyrinth] = parse_labyrinth (file_path)
	file = fopen(file_path, "r");
	if file == -1
		fprintf("nu s-a putut deschide fisierul\n");
		return;
	end

	first_line = fgetl(file);
	dimensions = sscanf(first_line, "%d%d");
	rows = dimensions(1);
	cols = dimensions(2);
	Labyrinth = zeros(rows, cols);

	for i = 1:rows
		rec = fgetl(file);
		Labyrinth(i, :) = sscanf(rec, "%d");
	end

	fclose(file);
end