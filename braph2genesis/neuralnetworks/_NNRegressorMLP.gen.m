%% ¡header!
NNRegressorMLP < NNBase (nn, multi-layer perceptron regressor) comprises a multi-layer perceptron regressor model and a given dataset.

%%% ¡description!
A neural network multi-layer perceptron regressor (NNRegressorMLP) comprises a multi-layer perceptron regressor model and a given dataset.
NNRegressorMLP trains the multi-layer perceptron regressor with a formatted inputs ("CB", channel and batch) derived from the given dataset.

%%% ¡seealso!
NNDataPoint_CON_REG, NNEvaluator_REG

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the neural network multi-layer perceptron regressor.
%%%% ¡default!
'NNRegressorMLP'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the neural network multi-layer perceptron regressor.
%%%% ¡default!
'A neural network multi-layer perceptron regressor (NNRegressorMLP) comprises a multi-layer perceptron regressor model and a given dataset. NNRegressorMLP trains the multi-layer perceptron regressor with a formatted inputs ("CB", channel and batch) derived from the given dataset.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the neural network multi-layer perceptron regressor.
%%%% ¡settings!
'NNRegressorMLP'

%%% ¡prop!
ID (data, string) is a few-letter code for the neural network multi-layer perceptron regressor.
%%%% ¡default!
'NNRegressorMLP ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the neural network multi-layer perceptron regressor.
%%%% ¡default!
'NNRegressorMLP label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the neural network multi-layer perceptron regressor.
%%%% ¡default!
'NNRegressorMLP notes'

%%% ¡prop!
INPUTS (query, cell) constructs the data in the CB (channel-batch) format.
%%%% ¡calculate!
inputs = nn.get('D').get('INPUTS');
if isempty(inputs)
    value = {};
else
    data = [];
    for i = 1:1:length(inputs)
        input = cell2mat(inputs{i});
        data = [data; input(:)'];
    end
    value = {data};
end

%%% ¡prop!
TARGETS (query, cell) constructs the targets in the CB (channel-batch) format.
%%%% ¡calculate!
targets = nn.get('D').get('TARGETS');
if isempty(targets)
    value = {};
else
    response = [];
    for i = 1:1:length(targets)
        target = cell2mat(targets{i});
        response = [response; target(:)'];
    end
    value = {response};
end

%%% ¡prop!
MODEL (result, net) is a trained neural network model.
%%%% ¡calculate!
inputs = nn.get('INPUTS');
targets = nn.get('TARGETS');
if isempty(inputs) || isempty(targets)
    value = network();
else
    number_features = size(inputs, 2);
    number_targets = size(targets, 2);
    layers = nn.get('LAYERS');
    
    nn_architecture = [featureInputLayer(number_features, 'Name', 'Input')];
    for i = 1:1:length(layers)
        nn_architecture = [nn_architecture
            fullyConnectedLayer(layers(i), 'Name', ['Dense_' num2str(i)])
            batchNormalizationLayer('Name', ['BatchNormalization_' num2str(i)])
            dropoutLayer('Name', ['Dropout_' num2str(i)])
            ];
    end
    nn_architecture = [nn_architecture
        reluLayer('Name', 'Relu_output')
        fullyConnectedLayer(num_responses, 'Name', 'Dense_output')
        regressionLayer('Name', 'output')
        ];

    % specify training options
    if nn.get('PLOT_TRAINING')
        plot_training = 'training-progress';
    else
        plot_training = 'none';
    end

    options = trainingOptions( ...
        nn.get('SOLVER'), ...
        'MiniBatchSize', nn.get('BATCH'), ...
        'MaxEpochs', nn.get('EPOCHS'), ...
        'Shuffle', nn.get('SHUFFLE'), ...
        'Plots', plot_training, ...
        'Verbose', nn.get('VERBOSE') ...
        );

    % train the neural network
    value = trainNetwork(inputs, targets, nn_architecture, options);
end

%% ¡props!

%%% ¡prop!
LAYERS (data, rvector) defines the number of layers and their neurons.
%%%% ¡default!
[32 32]

%% ¡tests!

%%% ¡test!
%%%% ¡name!
train the regressor with example data
%%%% ¡code!

% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_CON_REG')) filesep 'Example data NN REG CON XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_CON_REG % create example files
end

% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_REG')) filesep 'Example data NN REG CON XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

% Load Groups of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_REG')) filesep 'Example data NN REG CON XLS' filesep 'CON_Group_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

% create a item list of NNDataPoint_CON_REG
it_list = cellfun(@(x) NNDataPoint_CON_REG( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
    gr.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create a NNDataPoint_CON_REG DICT
dp_list = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNData containing the NNDataPoint_CON_REG DICT
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_REG', ...
    'DP_DICT', dp_list ...
    );

nn = NNRegressorMLP('D', d, 'DENSE_LAYERS', [20 20]);
trained_model = nn.get('MODEL');

% Check whether the number of fully-connected layer matches (excluding fc_output layer)
assert(length(nn.get('DENSE_LAYERS')) == sum(contains({trained_model.Layers.Name}, 'fc')) - 1, ...
    [BRAPH2.STR ':NNRegressorMLP:' BRAPH2.FAIL_TEST], ...
    'NNRegressorMLP does not construct the layers correctly. The number of the inputs should be the same as the length of dense layers the property.' ...
    )
