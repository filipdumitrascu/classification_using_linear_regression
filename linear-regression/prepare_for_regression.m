function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % Initializes the InitialMatrix dimensions
  [m, n] = size(InitialMatrix); 
  
  % Declares FeatureMatrix
  FeatureMatrix = zeros(m, n + 1);
  
  % Iterates through InitialMatrix and assigns values to FeatureMatrix
  i = 1;
  while i <= m
    j_i = j_f = 1;
    while j_i <= n
      if strcmp(InitialMatrix(i, j_i), 'yes')
        FeatureMatrix(i, j_f) = 1;
        
      elseif strcmp(InitialMatrix(i, j_i), 'no') 
        FeatureMatrix(i, j_f) = 0;
      
      elseif strcmp(InitialMatrix(i, j_i), 'semi-furnished') 
        FeatureMatrix(i, j_f) = 1;
        FeatureMatrix(i, j_f + 1) = 0;
        j_f++;

      elseif strcmp(InitialMatrix(i, j_i), 'unfurnished')
        FeatureMatrix(i, j_f) = 0;
        FeatureMatrix(i, j_f + 1) = 1;
        j_f++;

      elseif strcmp(InitialMatrix(i, j_i), 'furnished')
        FeatureMatrix(i, j_f) = FeatureMatrix(i, j_f + 1) = 0;
        j_f++;

      else
        FeatureMatrix(i, j_f) = str2double(InitialMatrix(i, j_i));
      endif

    j_f++;
    j_i++;
    endwhile

  i++;
  endwhile

endfunction
