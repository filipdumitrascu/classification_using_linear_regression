function [path] = heuristic_greedy (start_position, probabilities, Adj)
  % Declares a variable with the highest probability of an unvisited neighbour 
  max = -1;
  
  % Declares the sizes of the Labyrinth
  [m, n] = size(Adj);
  
  % Declares the path and visited arrays
  path = start_position;
  visited = sparse(1, m);
  visited(start_position) = 1;
  
  while ~isempty(path)
    position = path(length(path));
    
    % If position is the WIN state returns the path
    if position == n - 1
      path = path';
      return;
    endif
    
    % Determines the unvisited neighbour with the maximum probability
    for j = 1 : n
      if Adj(position, j) == 1 && visited(j) == 0
        if probabilities(j) > max
          max = probabilities(j);
          neigh = j;
        endif
      endif
    endfor
    
    % If position has no unvisited neighbours erases position from the path
    if max == -1
      path = path(1 : length(path) - 1);
    else 
      visited(neigh) = 1;
      path = [path, neigh];
    endif
    
    % Resets the max value
    max = -1;
  endwhile
  % In decode function path is a column array so transposes it
  path = path';
endfunction
