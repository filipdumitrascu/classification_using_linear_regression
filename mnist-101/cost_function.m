function [J, grad] = cost_function(params, X, y, lambda, ...
                                   input_layer_size, hidden_layer_size, ...
                                   output_layer_size)

  % Reshape params array in matrices for linear transformations
  Theta1 = reshape(params(1 : hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(params((1 + (hidden_layer_size * ...
                   (input_layer_size + 1))) : end), output_layer_size, ...
                   (hidden_layer_size + 1));
  
  % Forward propagation
  m = size(X, 1);
  a_1 = [ones(m, 1), X]'; % bias term to input_layer
  z_2 = Theta1 * a_1; % hidden_layer
  a_2 = [ones(1, m); sigmoid(z_2)]; % bias term to hidden_layer
  z_3 = Theta2 * a_2; % output_layer
  a_3 = sigmoid(z_3);
  
  % Computes the cost
  Y = eye(output_layer_size)(y, :)'; % unit matrix
  J = (1 / m) * (sum(sum(-Y .* log(a_3) - (1 - Y) .* log(1 - a_3))));

  % Adds regularization term to it
  J += lambda / (2 * m) * (sum(sum(Theta1(:, 2 : end) .^ 2)) + ...
       sum(sum(Theta2(:, 2 : end) .^ 2)));

  % Backpropagation
  delta_2 = (a_3 - Y) * a_2';
  intermediary_err = (Theta2(:, 2 : end)' * (a_3 - Y)) .* sigmoidGrad(z_2);
  delta_1 = intermediary_err * a_1';

  % Adds regularization term to gradient
  Theta1_gr = zeros(size(Theta1));
  Theta2_gr = zeros(size(Theta2));
  
  Theta1_gr = (1 / m) * (delta_1 + lambda * [zeros(size(Theta1, 1), 1), ...
               Theta1(:, 2 : end)]);
  Theta2_gr = (1 / m) * (delta_2 + lambda * [zeros(size(Theta2, 1), 1), ...
               Theta2(:, 2 : end)]);

  % Unrolls gradient
  grad = [Theta1_gr(:); Theta2_gr(:)];

endfunction

function [sg] = sigmoidGrad(z)

  sg = sigmoid(z) .* (1 - sigmoid(z));

endfunction
