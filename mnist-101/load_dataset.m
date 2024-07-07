function [X, y] = load_dataset(path)
  % Loads and extract relevant variables
  X = load(path).X;
  y = load(path).y;

endfunction
