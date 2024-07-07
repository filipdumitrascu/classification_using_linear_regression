function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % Checks if the Matrix is positive definite with eigen values
  if ~all(eig(FeatureMatrix' * FeatureMatrix) >= 0)
    Theta = zeros(size(FeatureMatrix, 2) + 1, 1);
    return;
  endif

  A = FeatureMatrix' * FeatureMatrix;
  x = zeros(size(A, 1), 1);
  v = r = FeatureMatrix' * Y - A * x;
  alpha = r' * r;

  % Calculates the x till the conditions are met 
  i = 1;
  while i <= iter && norm(r) >= tol 
    t = alpha / (v' * A * v);
    
    x += t * v;
    r -= t * A * v;

    s = (r' * r) / alpha;
    v = r + s * v;
    alpha = r' * r;
    
    i++;
  endwhile
  
  Theta = x;
  Theta = [0; Theta];
endfunction
