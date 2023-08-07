%% ¡header!
NNClassifierMLP < NNBase (nn, multi-layer perceptron classifier) comprises a multi-layer perceptron classifier model and a given dataset.

%%% ¡description!
A neural network multi-layer perceptron classifier (NNClassifierMLP) comprises a multi-layer perceptron classifier model and a given dataset.
NNClassifierMLP trains the multi-layer perceptron classifier with a formatted inputs ("CB", channel and batch) derived from the given dataset.

%%% ¡seealso!
NNDataPoint_CON_CLA, NNEvaluator_CLA

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the neural network multi-layer perceptron classifier.
%%%% ¡default!
'NNClassifierMLP'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the neural network multi-layer perceptron classifier.
%%%% ¡default!
'A neural network multi-layer perceptron classifier (NNClassifierMLP) comprises a multi-layer perceptron classifier model and a given dataset. NNClassifierMLP trains the multi-layer perceptron classifier with a formatted inputs ("CB", channel and batch) derived from the given dataset.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the neural network multi-layer perceptron classifier.
%%%% ¡settings!
'NNClassifierMLP'

%%% ¡prop!
ID (data, string) is a few-letter code for the neural network multi-layer perceptron classifier.
%%%% ¡default!
'NNClassifierMLP ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the neural network multi-layer perceptron classifier.
%%%% ¡default!
'NNClassifierMLP label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the neural network multi-layer perceptron classifier.
%%%% ¡default!
'NNClassifierMLP notes'
    
%%% ¡prop!
DATA_FORMAT (data, string) specifies the format of the data that flows through the neural network model. In this case, it maps "CB" (channel and batch) data.
%%%% ¡default!
'CB'

%%% ¡prop!
DATA_CONSTRUCT (query, cell) constructs the data based on the data format that flows through the neural network model.
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
RESPONSE_CONSTRUCT (query, cell) constructs the responses with a cell containing a string array as the output of the neural network model.
%%%% ¡calculate!
targets = nn.get('D').get('TARGETS');
if isempty(targets)
    value = {};
else
    response = [];
    for i = 1:1:length(targets)
        target = targets{i};
        response = [response; target];
    end
    value = {response};
end

%%% ¡prop!
MODEL (result, net) is a trained neural network model with the given dataset.
%%%% ¡calculate!
data = cell2mat(nn.get('DATA_CONSTRUCT'));
responses = nn.get('RESPONSE_CONSTRUCT');
if isempty(data) || isempty(responses)
    value = network();
else
    data_format = nn.get('DATA_FORMAT');
    ind_channel = find(data_format == 'C');
    size_data = size(data);
    num_features = size_data(end);
    responses = categorical(responses{1}); % converting responses to a categorical array from a single string array containing all responses
    num_classes = numel(categories(responses));
    numLayers = nn.get('DENSE_LAYERS');
    layers = [featureInputLayer(num_features, 'Name', 'input')];
    for i = 1:1:length(numLayers)
        layers = [layers
            fullyConnectedLayer(numLayers(i), 'Name', ['fc' num2str(i)])
            batchNormalizationLayer('Name', ['batchNormalization' num2str(i)])
            dropoutLayer('Name', ['dropout' num2str(i)])
            ];
    end
    layers = [layers
        reluLayer('Name', 'relu1')
        fullyConnectedLayer(num_classes, 'Name', 'fc_output')
        softmaxLayer
        classificationLayer('Name', 'output')
        ];

    % specify trianing options
    if nn.get('PLOT_TRAINING')
        plot_training = 'training-progress';
    else
        plot_training = 'none';
    end

    options = trainingOptions(nn.get('SOLVER'), ...
        'MiniBatchSize', nn.get('BATCH'), ...
        'MaxEpochs', nn.get('EPOCHS'), ...
        'Shuffle', nn.get('SHUFFLE'), ...
        'Plots', plot_training, ...
        'Verbose', nn.get('VERBOSE'));

    % train the neural network
    value = trainNetwork(data, responses, layers, options);
end

%% ¡props!

%%% ¡prop!
DENSE_LAYERS (data, rvector) is user defined neural network layers.

%% ¡tests!

%%% ¡test!
%%%% ¡name!
train the classifier with example data
%%%% ¡code!

% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_CON_CLA % create example files
end

% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

% Load Groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'CON_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'CON_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

% create item lists of NNDataPoint_CON_CLA
[~, group_folder_name] = fileparts(im_gr1.get('DIRECTORY'));
it_list1 = cellfun(@(x) NNDataPoint_CON_CLA( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', {group_folder_name}), ...
    gr1.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

[~, group_folder_name] = fileparts(im_gr2.get('DIRECTORY'));
it_list2 = cellfun(@(x) NNDataPoint_CON_CLA( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', {group_folder_name}), ...
    gr2.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create NNDataPoint_CON_CLA DICT items
dp_list1 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_CLA', ...
        'IT_LIST', it_list1 ...
        );

dp_list2 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_CLA', ...
        'IT_LIST', it_list2 ...
        );

% create a NNDataset containing the NNDataPoint_CON_CLA DICT
d1 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_CLA', ...
    'DP_DICT', dp_list1 ...
    );

d2 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_CLA', ...
    'DP_DICT', dp_list2 ...
    );

% combine the two datasets
d = NNDatasetCombine('D_LIST', {d1, d2}).get('D');

nn = NNClassifierMLP('D', d, 'DENSE_LAYERS', [10 10 10]);
trained_model = nn.get('MODEL');

% Check whether the number of fully-connected layer matches (excluding fc_output layer)
assert(length(nn.get('DENSE_LAYERS')) == sum(contains({trained_model.Layers.Name}, 'fc')) - 1, ...
    [BRAPH2.STR ':NNClassifierMLP:' BRAPH2.FAIL_TEST], ...
    'NNClassifierMLP does not construct the layers correctly. The number of the inputs should be the same as the length of dense layers the property.' ...
    )