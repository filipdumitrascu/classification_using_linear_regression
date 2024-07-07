function [decoded_path] = decode_path (path, lines, cols)
	% Declares the decoded_path array
  decoded_path = zeros(length(path) - 1, 2);
  
  % Decodes each state excepting the win one 
  for i = 1 : (length(path) - 1)
    if mod(path(i), cols) == 0
      decoded_path(i, 1) = floor(path(i) / cols);
      decoded_path(i, 2) = cols; 
    else
      decoded_path(i, 1) = floor(path(i) / cols) + 1;
      decoded_path(i, 2) = mod(path(i), cols); 
    endif
  endfor
  
endfunction
