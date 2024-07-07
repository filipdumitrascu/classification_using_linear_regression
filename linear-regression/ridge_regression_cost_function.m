function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % In addition to the linear formula adds the specific term
  Error = linear_regression_cost_function(Theta, Y, FeatureMatrix);

  Error += lambda * sum((Theta) .^ 2);

endfunction