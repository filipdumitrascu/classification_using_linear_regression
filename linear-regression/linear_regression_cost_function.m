function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Initialises Theta and the number of rows
  Theta = Theta(2 : end);
  m = length(Y);

  % Prediction function
  prediction = FeatureMatrix * Theta;
  
  % Calculates error using linear formula
  Error = (1 / (2 * m)) * sum((prediction - Y) .^ 2);
endfunction
