%% ¡header!
NNBase < ConcreteElement (nn, neural network) comprises a neural network model with a given dataset.

%%% ¡description!
A neural network base (NNBase) comprises a neural network model with a specific dataset, along with the required options for training the model.
Instances of this class should not be created. Use one of its subclasses instead.
Its subclasses shall be specifically designed to cater to different use cases such as a classifier, a regressor, or a generative model.

%%% ¡seealso!
NNDataPoint, NNData, NNEvaluator

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the nerual network base.
%%%% ¡default!
'NNBase'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the nerual network base.
%%%% ¡default!
'A neural network base (NNBase) comprises a neural network model with a specific dataset, along with the required options for training the model. Instances of this class should not be created. Use one of its subclasses instead. Its subclasses shall be specifically designed to cater to different use cases such as a classifior, a regressor or a generative model.'

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
BATCH (parameter, scalar) is the size of the mini-batch to use for each training iteration.
%%%% ¡default!
8

%%% ¡prop!
EPOCHS (parameter, scalar) is the maximum number of epochs.
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
D (data, item) is the dataset to train the neural network model.
%%%% ¡settings!
'NNDataset'

%%% ¡prop!
DATA_FORMAT (parameter, string) specifies the format of the data that flows through the neural network model.

%%% ¡prop!
DATA_CONSTRUCT (query, cell) constructs the data based on the data format that flows through the neural network model.

%%% ¡prop!
RESPONSE_CONSTRUCT (query, cell) constructs the responses based on specified data format that flows through the neural network model.

%%% ¡prop!
MODEL (result, net) is a trained neural network model with the given dataset.
%%%% ¡calculate!
value = network();

%%% ¡prop!
MODEL_TRAIN (query, empty) trains the model with the given dataset.
%%%% ¡calculate!
nn.memorize('MODEL');
value = {};