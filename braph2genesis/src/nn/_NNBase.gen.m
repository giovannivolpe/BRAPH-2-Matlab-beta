%% ¡header!
NNBase < ConcreteElement (nn, neural network) comprises a neural network model with a dataset.

%%% ¡description!
A neural network base (NNBase) comprises a neural network model with a specific dataset.
 Instances of this class should not be created. Use one of its subclasses instead.

Its subclasses need to implement the props MODEL, INPUTS and TARGETS.
 Each subclass is typically optimized to work with the subclasses of NNDataPoint in the prop DP_CLASSES.

To train a neural network nn use: nn.get('TRAIN')
To obtain the prediction on a dataset D use: predictions = nn.get('PREDICT', D)

%%% ¡seealso!
NNDataPoint, NNDataset, NNEvaluator

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the nerual network base.
%%%% ¡default!
'NNBase'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the nerual network base.
%%%% ¡default!
'A neural network base (NNBase) comprises a neural network model with a specific dataset. Instances of this class should not be created. Use one of its subclasses instead. Its subclasses need to implement the props MODEL, INPUTS and TARGETS.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the nerual network base.
%%%% ¡settings!
'NNBase'

%%% ¡prop!
ID (data, string) is a few-letter code for the nerual network base.
%%%% ¡default!
'NNBase ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the nerual network base.
%%%% ¡default!
'NNBase label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the nerual network base.
%%%% ¡default!
'NNBase notes'
    
%% ¡props!

%%% ¡prop!
D (data, item) is the dataset to train the neural network model, and its data point class DP_CLASS defaults to one of the compatible classes within the set of DP_CLASSES.
%%%% ¡settings!
'NNDataset'
%%%% ¡default!
NNDataset('DP_CLASS', 'NNDataPoint')
%%%% ¡check_value!
check = ismember(value.get('DP_CLASS'), nn.get('DP_CLASSES'));

%%% ¡prop!
DP_CLASSES (parameter, classlist) is the list of compatible data points.
%%%% ¡default!
{'NNDataPoint'}

%%% ¡prop!
EPOCHS (parameter, scalar) is the maximum number of epochs.
%%%% ¡default!
20

%%% ¡prop!
BATCH (parameter, scalar) is the size of the mini-batch used for each training iteration.
%%%% ¡default!
8

%%% ¡prop!
SHUFFLE (parameter, option) is an option for data shuffling.
%%%% ¡settings!
{'once' 'never' 'every-epoch'}

%%% ¡prop!
SOLVER (parameter, option) is an option for the solver.
%%%% ¡settings!
{'adam' 'sgdm' 'rmsprop'}

%%% ¡prop!
MODEL (result, net) is a trained neural network model with the given dataset.
%%%% ¡calculate!
value = network();

%%% ¡prop!
INPUTS (query, cell) constructs the cell array of the data.
%%%% ¡calculate!
% inputs = nn.get('inputs', D) returns a cell array with the
%  inputs for all data points in dataset D.
value = {};

%%% ¡prop!
TARGETS (query, cell) constructs the cell array of the targets.
%%%% ¡calculate!
% targets = nn.get('PREDICT', D) returns a cell array with the
%  targets for all data points in dataset D.
value = {};

%%% ¡prop!
TRAIN (query, empty) trains the neural network model with the given dataset.
%%%% ¡calculate!
nn.memorize('MODEL');
value = [];

%%% ¡prop!
VERBOSE (parameter, logical) is an indicator to display training progress information.
%%%% ¡default!
false

%%% ¡prop!
PLOT_TRAINING (parameter, option) determines whether to plot the training progress.
%%%% ¡settings!
{'none' 'training-progress'}

%%% ¡prop!
PREDICT (query, cell) returns the predictions of the trained neural network for a dataset.
%%%% ¡calculate!
% PREDICTIONS = nn.get('PREDICT', D) returns a cell array with the
%  predictions for all data points in dataset D.
if isempty(varargin)
    value = {};
    return
end

d = varargin{1};
inputs = nn.get('INPUTS', d);
if isempty(cell2mat(inputs))
    predictions = {};
else
    net = nn.get('MODEL');
    predictions = {net.predict(cell2mat(inputs))};
end
value = predictions;

%%% ¡prop!
CELL_FLATTEN (query, rvector) flattens a cell array into a single vector.
%%%% ¡calculate!
% flattened_vector = nn.get('FLATTEN', cell_array) returns a flattened 
%  vector within the input cell (cell_array)
if isempty(varargin)
    value = [];
    return
end

cell_array = varargin{1};
flattened_vector = [];
for i = 1:numel(cell_array)
    cell_data = cell_array{i};
    if iscell(cell_data)
        % Flatten nested cell arrays recursively
        nested_vector = nn.get('CELL_FLATTEN', cell_data);
        flattened_vector = [flattened_vector; nested_vector];
    else
        % Append numeric or other data to the vector
        flattened_vector = [flattened_vector; cell_data(:)];
    end
end

value = flattened_vector;

%%% ¡prop!
MAP_TO_CELL (query, cell)  maps a single vector back to the original cell array structure.
%%%% ¡calculate!
% mapped_cell = nn.get('MAP_TO_CELL', flattened_vector, cell_array_temp) maps
%  the flattened vector back to the original cell array structure (cell_array).
if isempty(varargin) || length(varargin) < 2
    value = {};
    return
end

flattened_vector = varargin{1}
cell_array_temp = varargin{2};
mapped_cell_array = cell_array_temp;
index = 1;
for i = 1:numel(cell_array_temp)
    cell_data = cell_array_temp{i};
    if iscell(cell_data)
        % Map the vector to nested cell arrays recursively
        nested_vector = nn.get('MAP_TO_CELL', flattened_vector(index:end), cell_data);
        mapped_cell_array{i} = nested_vector;
        index = index + sum(cell2mat(cellfun(@(x) numel(x), nested_vector, 'Uniformoutput', false)));
    else
        % Assign elements from the vector to cells
        numElements = numel(cell_data);
        mapped_cell_array{i} = reshape(flattened_vector(index:index + numElements-1), size(cell_data));
        index = index + numElements;
    end
end

value = mapped_cell_array;

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example usage of flattening a cell array to a vector and map the flattened vector back to the cell array structure
%%%% ¡code!
cell_array = {{[1 2] [3 4]}, {4 50.8667}, {rand(90)}};

% Flatten the cell array into a single vector
flattened_vector = nn.get('CELL_FLATTEN', value);

% Map the flattened vector back to the original cell array structure
mapped_cell_array = nn.get('MAP_TO_CELL', flattened_vector, value);

assert(isequal(cell_array, mapped_cell_array), ...
    [BRAPH2.STR ':NNBase:' BRAPH2.FAIL_TEST], ...
    'NNBase does not flatten and map back a cell array correctly.' ...
    )