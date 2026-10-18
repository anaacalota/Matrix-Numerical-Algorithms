function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
	% X -> the loaded dataset with all training examples
	% y -> the corresponding labels
	% percent -> fraction of training examples to be put in training dataset
	
	% X_[train|test] -> the datasets for training and test respectively
	% y_[train|test] -> the corresponding labels
	
	% Example: [X, y] has 1000 training examples with labels and percent = 0.85
	%           -> X_train will have 850 examples
	%           -> X_test will have the other 150 examples

	% shuffle the indices
	perm = randperm(size(X, 1));

	% shuffle X and y based on the generated permutation
	X = X(perm, :);
	y = y(perm, :);

	% calculate the number of examples for training
	integer_part = floor(percent * size(X, 1));

	X_train = X(1:integer_part, :);
	y_train = y(1:integer_part, :);
	X_test = X(integer_part + 1:end, :);
	y_test = y(integer_part + 1:end, :);
end
