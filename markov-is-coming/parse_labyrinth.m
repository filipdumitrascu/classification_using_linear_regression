function [Labyrinth] = parse_labyrinth(file_path)
  % Checks if the input file can be opened
  fid = fopen(file_path, 'r');
  if fid == -1
    disp('Cannot open the input file');
  endif
  
  % Reads matrix dimensions
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);

  % Initialize Labyrinth matrix 
  Labyrinth = zeros(m, n);
  
  % Transposes the fscanf return value from columns to rows 
  Labyrinth = fscanf(fid, "%d", [n, m])';

  % Closes the input file
  fclose(fid);
endfunction
