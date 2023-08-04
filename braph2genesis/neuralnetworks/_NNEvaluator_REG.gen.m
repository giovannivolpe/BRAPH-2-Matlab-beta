%% ¡header!
NNEvaluator_REG < NNEvaluator (nne, neural network trainor) evaluates a neural network model with a dataset.

%%% ¡description!

%%% ¡seealso!
NNData, NNRegressorMLP

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the trainor for neural network analysis.
%%%% ¡default!
'NNEvaluator_REG'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the trainor for neural network analysis.
%%%% ¡default!
'...'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the trainor for neural network analysis.
%%%% ¡settings!
'NNEvaluator_REG'

%%% ¡prop!
ID (data, string) is a few-letter code for the trainor for neural network analysis.
%%%% ¡default!
'NNEvaluator_REG ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the trainor for neural network analysis.
%%%% ¡default!
'NNEvaluator_REG label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the trainor for neural network analysis.
%%%% ¡default!
'NNEvaluator_REG notes'
    
%%% ¡prop!
NN (data, item) is a trained neural network model.
%%%% ¡settings!
'NNRegressorMLP'

%%% ¡prop!
PREDICTIONS (result, cell) is a trained neural network model.
%%%% ¡calculate!
nn = nne.get('NN');
net = nn.get('MODEL');
inputs = cell2mat(eval([nn.getClass char("('D', nne.get('D')).get('DATA_CONSTRUCT')")]));
if isempty(inputs)
    value = {};
else
    value = {net.predict(inputs)};
end

%% ¡props!
%%% ¡prop!
GROUND_TRUTH (query, matrix) returns the matrix of ground truth from the targets.
%%%% ¡calculate!
targets = nne.get('D').get('TARGETS');
if isempty(targets)
    value = [];
else
    for i = 1:length(targets)
        value(i, :) = cell2mat(targets{i});
    end
end

%%% ¡prop!
CORRELATION_COEFF (result, rvector) is an option for data shuffling.
%%%% ¡calculate!
predictions = cell2mat(nne.get('PREDICTIONS'));
if isempty(predictions)
    value = [];
else
    ground_truth = nne.get('GROUND_TRUTH');
    num_dp = size(ground_truth, 1);
    num_target = size(ground_truth, 2);
    for i = 1:num_target
        corr_matrix = corrcoef(predictions(:, i), ground_truth(:, i));
        value(i) = corr_matrix(1, 2);
    end
end

%%% ¡prop!
COEFF_OF_DETERMINATION (result, rvector) is an option for data shuffling.
%%%% ¡calculate!
predictions = cell2mat(nne.get('PREDICTIONS'));
if isempty(predictions)
    value = [];
else
    ground_truth = nne.get('GROUND_TRUTH');
    num_dp = size(ground_truth, 1);
    num_target = size(ground_truth, 2);
    for i = 1:num_target
        corr_matrix = corrcoef(predictions(:, i), ground_truth(:, i));
        value(i) = corr_matrix(1, 2)^2;
    end
end

%%% ¡prop!
MEAN_ABSOLUTE_ERROR (result, rvector) is an option for data shuffling.
%%%% ¡calculate!
predictions = cell2mat(nne.get('PREDICTIONS'));
if isempty(predictions)
    value = [];
else
    ground_truth = nne.get('GROUND_TRUTH');
    num_dp = size(ground_truth, 1);
    num_target = size(ground_truth, 2);
    for i = 1:num_target
        value(i) = mean(abs(predictions(:, i) - ground_truth(:, i)));
    end
end

%%% ¡prop!
MEAN_SQUARED_ERROR (result, rvector) is an option for data shuffling.
%%%% ¡calculate!
predictions = cell2mat(nne.get('PREDICTIONS'));
if isempty(predictions)
    value = [];
else
    ground_truth = nne.get('GROUND_TRUTH');
    num_dp = size(ground_truth, 1);
    num_target = size(ground_truth, 2);
    for i = 1:num_target
        value(i) = mean((predictions(:, i) - ground_truth(:, i)).^2);
    end
end

%%% ¡prop!
ROOT_MEAN_SQUARED_ERROR (result, rvector) is an option for data shuffling.
%%%% ¡calculate!
predictions = cell2mat(nne.get('PREDICTIONS'));
if isempty(predictions)
    value = [];
else
    ground_truth = nne.get('GROUND_TRUTH');
    num_dp = size(ground_truth, 1);
    num_target = size(ground_truth, 2);
    for i = 1:num_target
        value(i) = sqrt(mean((predictions(:, i) - ground_truth(:, i)).^2));
    end
end

%%% ¡prop!
PERMUTATION_FEATURE_IMPORTANCE (result, cell) assess the significance of each feature by randomly shuffling its values and measuring how much the performance of the model decreases.
%%%% ¡calculate!
value = {};

%% ¡tests!

%%% ¡test!
%%%% ¡name!
evaluate a regressor with example data
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
nn.get('MODEL_TRAIN');

nne = NNEvaluator_REG('NN', nn, 'D', d);

predictions = nne.get('PREDICTIONS');
c = nne.get('CORRELATION_COEFF');
c_of_d = nne.get('COEFF_OF_DETERMINATION');
mae = nne.get('MEAN_ABSOLUTE_ERROR');
mse = nne.get('MEAN_SQUARED_ERROR');
rmse = nne.get('ROOT_MEAN_SQUARED_ERROR');
pfi = nne.get('PERMUTATION_FEATURE_IMPORTANCE');
% % % Check whether the number of fully-connected layer matches (excluding fc_output layer)
% % assert(length(nn.get('DENSE_LAYERS')) == sum(contains({trained_model.Layers.Name}, 'fc')) - 1, ...
% %     [BRAPH2.STR ':NNRegressorMLP:' BRAPH2.FAIL_TEST], ...
% %     'NNRegressorMLP does not construct the layers correctly. The number of the inputs should be the same as the length of dense layers the property.' ...
% %     )
