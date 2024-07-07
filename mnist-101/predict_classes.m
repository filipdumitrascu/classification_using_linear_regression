function [classes] = predict_classes(X, weights, input_layer_size, 
                                     hidden_layer_size, output_layer_size)
  
  % Reshape weights array in matrices for linear transformations
  Theta1 = reshape(weights(1 : hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(weights((1 + (hidden_layer_size * ...
                   (input_layer_size + 1))) : end), output_layer_size, ...
                   (hidden_layer_size + 1));

  % Forward propagation
  m = size(X, 1);
  a_1 = [ones(m, 1), X]'; % bias term to input_layer
  z_2 = Theta1 * a_1; % hidden_layer
  a_2 = [ones(1, m); sigmoid(z_2)]; % bias term to hidden_layer
  z_3 = Theta2 * a_2; % output_layer
  a_3 = sigmoid(z_3);

  % Returns the maximum indexes
  [prob, classes] = max(a_3', [], 2);

endfunction
