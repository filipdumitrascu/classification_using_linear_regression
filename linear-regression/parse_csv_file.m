function [Y, InitialMatrix] = parse_csv_file(file_path)
  % Checks if the input file can be opened
  fid = fopen(file_path, 'r');
  if fid == -1
    disp('Cannot open the input file');
  endif
  
  % Substracts the header of the table
  header = fgetl(fid);
  
  % Calculates the number of elements per line
  number = textscan(header, "%s", 'delimiter', ',');
  n = length(number{1});
  
  % Reads as strings all values and puts them on one row cell matrix
  InitialMatrix = textscan(fid, repmat('%s', 1, n), 'delimiter', ',');
  
  % Closes the input file
  fclose(fid);
  
  % First column goes to Y converted to double and the rest to InitialMatrix
  Y = str2double(InitialMatrix{1});
  InitialMatrix = [InitialMatrix{2 : n}];
  
endfunction
