function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % Initializes Theta array and puts ones on the first column of FeatureMatrix
  Theta = zeros(n + 1, 1);
  FeatureMatrix = [ones(m, 1), FeatureMatrix];
  
  i = 1;
  while i <= iter
    % Prediction function
    prediction = FeatureMatrix * Theta;
    
    % Calculates the gradient with difference between prediction and real value
    gr = (1 / m) * (FeatureMatrix' * (prediction - Y));
    
    % Theta value after the iteration
    Theta -= alpha * gr;
    
    i++;
  endwhile

  % Knowing that the first element is not taken into account sets it 0
  Theta(1) = 0;

endfunction
