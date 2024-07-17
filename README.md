# Numerical Methods Project 1

The project aims to adapt linear regression to be used in image classification.

#### Contributor: Dumitrascu Filip Teodor

## Task1 - Markov is coming ...
	
### function [Labyrinth] = parse_labyrinth(file_path)
The function receives as input a file and reads from it the dimensions of a matrix and the matrix itself. Knowing the syntax of fscanf in octave it is possible to read the matrix without using a loop in the loop.


### function [Adj] = get_adjacency_matrix(Labyrinth)
What differs from a normal adjacency matrix is the addition of rows and columns for win and lose states. Thus for each element in the Labyrinth matrix it is taken into account that it can be on the edge or inside. This treats both the case where the position would be adjacent to win/lose and the case where the position is adjacent to a neighbour in the matrix. Another difference addressed by the adjacency matrix is that in the adjacency matrix when the position is found to be adjacent to a neighbour the value 1 is assigned in the matrix for both the position-neighbour adjacency and the neighbour-position adjacency. In this case, since the implementation is chosen to iterate through all the elements of the Labyrinth matrix, for the bit sequence check the neighbour-position adjacency is checked anyway, so the value 1 is assigned only for the position-neighbour. 

### function [Link] = get_link_matrix(Labyrinth)
Since the parameter for the function is given as the Labyrinth matrix instead of the adjacency matrix, the previous function is called to start the completion of the link matrix on an adjacency matrix. Understanding that the link matrix is a stochastic matrix on lines and reading the sparse matrices documentation, the nnz function is used to return the number of nenule elements on each line. This avoids using a loop and incrementing a counter by the number of nenule elements. It divides on finding each 1 by the number of nenule elements and finds the probability in that position to continue.


### function [G, c] = get_Jacobi_parameters(Link)
Extracts G and c from the link matrix separating the lines and columns of the win/lose states for G and for c selecting only the win state column.


### function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
Calculates the probability of winning in a repetitive function taking into account the number of steps and the tolerance.


### function [path] = heuristic_greedy(start_position, probabilities, Adj)
For the state in which the robot is, the maximum probability of winning is calculated for the unvisited neighbours in a loop. If this does not change from a dummy value -1 it means that there is no unvisited neighbour for the robot to continue on. Otherwise, in the loop, the neighbour with the maximum probability is stored and the robot continues on it. Repeat the procedure until the state win.

### function [decoded_path] = decode_path(path, lines, cols)
By taking the number of rows and columns of the Labyrinth matrix, uses the remainder and the quotient of the division of each state by the number of rows/columns to find exactly where the state is located in the Labyrinth matrix It is executed for each state from start position to the last excepting the win state.


## Task2 - Linear Regression

### function [Y, InitialMatrix] = parse_data_set_file(file_path)
InitialMatrix being a cell array, the textscan function is used to read data from the file. (Note: textscan was hard to use because his return value was changed from vm's octave version to the newest one). In the Initial matrix it is also stored the column for the Y array and at the end, the data is split and converted to double (Note: even though it was known that double values were stored in the first column for the Y array, the array could not be read separately with fscanf "%d" because it would be read from the elements of the cell array, not just the elements in the first column).

### function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
Iterates through the entire array and changes the strings to binary value. The difficulty arises when furnished strings are found in the middle of the matrix because it requires in this case to insert a column with the 2nd binary value. This way, a parameter j_f is used to determine the column where the binary value is added to/from the initial matrix and the parameter j_i where the string checks if the resulting matrix is done. Increments j_f to jump over the element just added.

### function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
Initialises Theta and the number of rows for the prediction function Calculates the error using the linear formula.
	
### function [Y, InitialMatrix] = parse_csv_file(file_path)
Similar to reading from parse_set_file, texscan is used because it has the ability to specify the delimiter between elements. This selects the comma and in order to know how many elements texscan reads, textscan is used at first on the header(extracted with fgetl) and memorizes the number of elements (columns) of the header. The second texscan repeats the same string n times horizontally and forms a row of cells in the Initial Matrix, each containing the column data. It is accessed by splitting at the end of the function (similar to the previous read function).

### function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
Calculates the Theta in a repetitive function taking into account the number of iterations.

### function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
An alternative to the precedent function but another exit condition is implicated, the norm being less than the tolerance. Also it is important to check if the matrix is positive definite. It is preffered the eigen values method because the chol function is harder to use.
	
### function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
It is calculated using the formula, different from the linear one.
	
### function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
In addition to the linear one, the error gets the specific term so  linear regression is called at first, then the specidic term is added.
	
	
## Task3 - MNIST 101

### function [X, y] = load_dataset(path)
Uses the load function to extract relevant variables and assigns them with structure operator.


### function [x_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
Shuffles the examples randomly(with a random permutation of 1:m) and splits the dataset into training sets and test sets.
	
	
### function [matrix] = initialize_weights(L_prev, L_next)
Calculates random values (in a matrix uniformly distributed on the interval (0, 1)) and with epsilon formula assigns them in a new matrix.

### function [grad, J] = cost_function(params, X, y, lambda, input_layer_size hidden_layer_size, output_layer_size).
The function follows step by step the procedure described in  theorethical brief. Thus: 
	
- params array is reshaped talking into account the input, hidden and output
layer sizes 

- forward propagation is aplied in order to calculate the ouput layer

- an unit matrix is obtained with y (example labels) array and with output- 
layer dimensions. This matrix is used in the cost formula and the regular term
is added

- backpropagation is applied and the gradient is unrolled (both matrixes become column arrays using :) .


### function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
In addition to the reshape and forward propagation from the cost calculation, the max syntax is used to assign indices for the maximum probability.  Max is aplied on every row and the second result which represents the index is returned to classes.


## Documentation used
To perform the tasks I used the function documentation provided by both the 'help function' in the command window and the octave website https://docs.octave.org. From there I took information like 

- return value fscanf, 
- use of sparse, 
- use of nnz, 
- use of cell, 
- use and return value textscan with or without repmat, 
- use of fgetl, 
- eigen values method, 
- use of load, 
- use of randperm and rand, 
- use of reshape 
- use of max       (In addition to what I already knew)
