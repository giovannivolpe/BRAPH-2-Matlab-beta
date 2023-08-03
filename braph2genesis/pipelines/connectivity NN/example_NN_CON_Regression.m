%% EXAMPLE_NN_CON_REGRESSION
% Script example pipeline for NN regression with the input of SubjectCON 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_REG')) filesep 'Example data NN REG CON XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_REG')) filesep 'Example data NN REG CON XLS' filesep 'CON_Group_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

%% Create NNData composed of corresponding NNDataPoints
% create a item list of NNDataPoint_CON_REG
it_list = cellfun(@(x) NNDataPoint_CON_REG( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
    gr.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create a NNDataPoint_CON_REG DICT
dp_dict = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNData containing the NNDataPoint_CON_REG DICT
d = NNData( ...
    'DP_CLASS', 'NNDataPoint_CON_REG', ...
    'DP_DICT', dp_dict ...
    );

%% Split the NNData into training set and validation set
d_split = NNDataSplit('D', d, 'SPLIT', {0.3, 0.7}).get('D_SPLIT');
d_training = d_split{1};
d_test = d_split{2};

%% Create a MLP regressor with training set
nn = NNRegressorMLP('D', d_training, 'DENSE_LAYERS', [20 20]);
%% a prop called train query 
%nn.memorize('MODEL');
nn.get('TRAIN');

%% Evaluate the regressor with the test set
% % % nne_test = NNEvaluator_REG('D', d_test, 'NN', nn);
% % % rmse_val = nne_test.get('RMSE');
% % % feature_importance = nne_test.get('FEATURE_PERMUTATION_IMPORTANCE');
