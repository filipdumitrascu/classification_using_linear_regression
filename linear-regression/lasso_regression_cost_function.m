function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)  
  % Initialises Theta and Y dimensions
  Theta = Theta(2 : end);
  m = length(Y);
  
  % Prediction function
  prediction = FeatureMatrix * Theta;
  
  % Calculates error using lasso formula
  Error = (1 / m) * sum((Y - prediction) .^ 2) + lambda * norm(Theta, 1);
endfunction
