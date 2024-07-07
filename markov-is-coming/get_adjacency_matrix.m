function [Adj] = get_adjacency_matrix (Labyrinth)
  % Initializes the Labyrinth matrix dimensions
  [m, n] = size(Labyrinth); 
  
  % Initializes the adjacency matrix
  Adj = sparse(m * n + 2, m * n + 2);

  % Iterates through the Labyrinth matrix and works with each binary number
  for i = 1 : m
    for j = 1 : n
      binary = dec2bin(Labyrinth(i, j), 4);

      % If there is no wall to the left of the element in the Labyrinth matrix
      if str2double(binary(4)) == 0
        if j == 1
          Adj(n * (i - 1) + j, m * n + 2) = 1;
        else
          Adj(n * (i - 1) + j, n * (i - 1) + j - 1) = 1;
        endif
      endif
      
      % If there is no wall to the right of the element in the Labyrinth matrix
      if str2double(binary(3)) == 0
        if j == n
          Adj(n * (i - 1) + j, m * n + 2) = 1;
        else 
          Adj(n * (i - 1) + j, n * (i - 1) + j + 1) = 1;
        endif
      endif
      
      % If there is no wall under the element in the Labyrinth matrix
      if str2double(binary(2)) == 0
        if i == m
          Adj(n * (i - 1) + j, m * n + 1) = 1;
        else
          Adj(n * (i - 1) + j, n * i + j) = 1;
        endif
      endif
      
      % If there is no wall above the element in the Labyrinth matrix
      if str2double(binary(1)) == 0
        if i == 1
          Adj(j, m * n + 1) = 1;
        else
          Adj(n * (i - 1) + j, n * (i - 2) + j) = 1;
        endif
      endif
      
    endfor
  endfor
  
  % Sets 1 for Win and Lose 
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
endfunction
