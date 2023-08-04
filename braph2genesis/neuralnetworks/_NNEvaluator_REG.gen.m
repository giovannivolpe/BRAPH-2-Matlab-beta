%% ¡header!
NNEvaluator_REG < NNEvaluator (nn, neural network trainor) evaluates a neural network model with a dataset.

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
value = {};

%% ¡props!
%%% ¡prop!
CORRELATION_COEFF (result, cell) is an option for data shuffling.

%%% ¡prop!
COEFF_OF_DETERMINATION (result, cell) is an option for data shuffling.

%%% ¡prop!
mean_absolute_error (result, cell) is an option for data shuffling.

%%% ¡prop!
mean_squared_error (result, cell) is an option for data shuffling.

%%% ¡prop!
root_mean_squared_error (result, cell) is an option for data shuffling.

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

nne = NNEvaluator_REG('NN', nn, 'D', d)

% % % Check whether the number of fully-connected layer matches (excluding fc_output layer)
% % assert(length(nn.get('DENSE_LAYERS')) == sum(contains({trained_model.Layers.Name}, 'fc')) - 1, ...
% %     [BRAPH2.STR ':NNRegressorMLP:' BRAPH2.FAIL_TEST], ...
% %     'NNRegressorMLP does not construct the layers correctly. The number of the inputs should be the same as the length of dense layers the property.' ...
% %     )
