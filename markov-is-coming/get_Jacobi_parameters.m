function [G, c] = get_Jacobi_parameters (Link)
  % Initializes the Link matrix dimensions
  [m, n] = size(Link);
  
  % Assigns the values of G 
  G = Link(1 : m - 2, 1 : n - 2); 
  
  % Assigns the values of c
  c = Link(1 : m - 2, n - 1);
endfunction
