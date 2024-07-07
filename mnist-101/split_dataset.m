function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % Shuffles the examples and assigns them as dataset
  m = size(X, 1);
  idx = randperm(m);
  X = X(idx, :);
  y = y(idx, :);

  % Splits the dataset in a fraction into training and test sets
  fraction_of_examples = round(m * percent);
  
  X_train = X(1 : fraction_of_examples, :);
  X_test = X(fraction_of_examples + 1 : end, :);
  
  y_train = y(1 : fraction_of_examples, :);
  y_test = y(fraction_of_examples + 1 : end, :);
  
endfunction
