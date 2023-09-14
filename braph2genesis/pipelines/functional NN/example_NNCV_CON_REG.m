%% EXAMPLE_NNCV_FUN_REG
% Script example pipeline for NN regression cross-validation with the input of SubjectFUN 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_FUN_REG')) filesep 'Example data NN REG FUN XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN
im_gr = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_REG')) filesep 'Example data NN REG FUN XLS' filesep 'FUN_Group_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

%% Create NNData composed of corresponding NNDataPoints
% create a item list of NNDataPoint_FUN_REG
it_list = cellfun(@(x) NNDataPoint_FUN_REG( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
    gr.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create a NNDataPoint_FUN_REG DICT
dp_dict = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_FUN_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNData containing the NNDataPoint_FUN_REG DICT
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_FUN_REG', ...
    'DP_DICT', dp_dict ...
    );

%% Create a regressor cross-validation
nn_template = NNRegressorMLP('P', 5);
nncv = NNRegressor_CrossValidation('D', d, 'KFOLDS', 5, 'NN_TEMPLATE', nn_template);
nncv.get('TRAIN');

%% Evaluate the performance
av_corr_coeff = nncv.get('AV_CORR');
av_coeff_determination = nncv.get('AV_DET');
av_mae = nncv.get('AV_MAE');
av_mse = nncv.get('AV_MSE');
av_rmse = nncv.get('AV_RMSE');
av_fi = nncv.get('AV_FEATURE_IMPORTANCE');