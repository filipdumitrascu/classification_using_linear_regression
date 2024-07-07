function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % Checks if the input file can be opened
  fid = fopen(file_path, 'r');
  if fid == -1
    disp('Cannot open the input file');
  endif
  
  % Reads matrix dimensions
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);
  
  % Initializes InitialMatrix as Y + itself
  InitialMatrix = cell(m, n + 1);
  
  % Reads as strings all values line by line
  InitialMatrix = textscan(fid, repmat('%s', m, n + 1), 'delimiter', ' ');
  
  % Closes the input file
  fclose(fid);
  
  % First column goes to Y converted to double and the rest to InitialMatrix
  Y = str2double(InitialMatrix{1});
  InitialMatrix = [InitialMatrix{2 : n + 1}];
  
endfunction
