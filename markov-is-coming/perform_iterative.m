function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  steps = 0;
  
  % Repetitive structure is run at least once, so do until is preferred
  do
    x = G * x0 + c;
    err = norm(x - x0);
    steps++;
    x0 = x;
  until steps == max_steps || err < tol

endfunction
