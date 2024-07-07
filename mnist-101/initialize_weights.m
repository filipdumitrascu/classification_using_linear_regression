function [matrix] = initialize_weights(L_prev, L_next)
  % Calculates epsilon
  epsilon = sqrt(6) / sqrt(L_prev + L_next);

  % Initializes parameters with random values
  matrix = epsilon * (rand(L_next, L_prev + 1) * 2 - 1);

endfunction
