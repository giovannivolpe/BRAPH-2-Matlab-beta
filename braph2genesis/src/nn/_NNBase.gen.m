%% ¡header!
NNBase < ConcreteElement (nn, neural network) trains a neural network model with a given dataset.

%%% ¡description!

%%% ¡seealso!
NNDataPoint, NNData, NNEvaluator

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the trainor for neural network analysis.
%%%% ¡default!
'NNBase'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the trainor for neural network analysis.
%%%% ¡default!
'...'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the trainor for neural network analysis.
%%%% ¡settings!
'NNBase'

%%% ¡prop!
ID (data, string) is a few-letter code for the trainor for neural network analysis.
%%%% ¡default!
'NNBase ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the trainor for neural network analysis.
%%%% ¡default!
'NNBase label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the trainor for neural network analysis.
%%%% ¡default!
'NNBase notes'
    
%% ¡props!

%%% ¡prop!
BATCH (parameter, scalar) is the size of the mini-batch to use for each training iteration.
%%%% ¡default!
8

%%% ¡prop!
EPOCHS (parameter, scalar) is a maximum number of epochs.
%%%% ¡default!
20

%%% ¡prop!
SHUFFLE (parameter, option) is an option for data shuffling.
%%%% ¡settings!
{'once' 'never' 'every-epoch'}

%%% ¡prop!
VERBOSE (parameter, logical) is an indicator to display training progress information.
%%%% ¡default!
false

%%% ¡prop!
SOLVER (parameter, option) is an option for the solver.
%%%% ¡settings!
{'adam' 'sgdm' 'rmsprop'}

%%% ¡prop!
PLOT_TRAINING (parameter, logical) is an option for the plot of training-progress.
%%%% ¡default!
false

%%% ¡prop!
D (data, item) is the dataset to train the NN.
%%%% ¡settings!
'NNDataset'

%%% ¡prop!
DATA_FORMAT (parameter, string) specifies the format of the data that flows through the network.

%%% ¡prop!
DATA_CONSTRUCT (query, cell) constructs the data based on specified data format that flows through the network.

%%% ¡prop!
RESPONSE_CONSTRUCT (query, cell) constructs the response based on specified data_format that flows through the network.

%%% ¡prop!
MODEL (result, net) is a trained neural network model.

%%% ¡prop!
MODEL_TRAIN (query, empty) trains the model with the given neural network dataset.
%%%% ¡calculate!
nn.memorize('MODEL');