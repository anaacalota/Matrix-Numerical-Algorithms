function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
	% InitialMatrix -> the matrix that must be transformed
	% FeatureMatrix -> the matrix with all training examples

	% takes the dimensions of the initial matrix and initializes FeatureMatrix
	dimensions = size(InitialMatrix);
	rows = dimensions(1);
	cols = dimensions(2);
	FeatureMatrix = zeros(rows, cols + 1);

	for i = 1:rows
		curr_col = 1;
		% change the fields from InitialMatrix into the specific encodings
		for j = 1:cols
			if strcmp(InitialMatrix{i, j}, "no")
				FeatureMatrix(i, curr_col) = 0;
			elseif strcmp(InitialMatrix{i, j}, "yes")
				FeatureMatrix(i, curr_col) = 1;
			elseif strcmp(InitialMatrix{i, j}, "semi-furnished")
				FeatureMatrix(i, curr_col) = 1;
				FeatureMatrix(i, curr_col + 1) = 0;
				curr_col++; % adds 2 values on 2 different columns
			elseif strcmp(InitialMatrix{i, j}, "unfurnished")
				FeatureMatrix(i, curr_col) = 0;
				FeatureMatrix(i, curr_col + 1) = 1;
				curr_col++;
			elseif strcmp(InitialMatrix{i, j}, "furnished")
				FeatureMatrix(i, curr_col) = 0;
				FeatureMatrix(i, curr_col + 1) = 0;
				curr_col++;
			else
				FeatureMatrix(i, curr_col) = str2num(InitialMatrix{i, j});
			end
			curr_col++;
		end
	end
end
