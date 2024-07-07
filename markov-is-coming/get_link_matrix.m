function [Link] = get_link_matrix (Labyrinth)
  % Declares the matrix of links as an adjacency matrix at first
  Link = get_adjacency_matrix(Labyrinth);
  
  % Initializes the Link matrix dimensions
  [m, n] = size(Link); 
  
  % For each line except the last 2 divides the ones by the number of nenules
  for i = 1 : m - 2
    nenule_numbers = nnz(Link(i, :));
    for j = 1 : n
      if Link(i, j) == 1
        Link(i, j) /= nenule_numbers;
      endif
    endfor
  endfor

endfunction
