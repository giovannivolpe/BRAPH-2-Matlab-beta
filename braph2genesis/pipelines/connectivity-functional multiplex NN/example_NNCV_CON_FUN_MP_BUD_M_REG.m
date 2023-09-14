%% EXAMPLE_NNCV_CON_FUN_MP_BUD_ME_REG
% Script example pipeline for NN regression cross-validation with input of MultiplexBUD measures derived from SubjectCON_FUN_MP 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON_FUN_MP XLS' filesep 'Connectivity' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr_CON = im_gr.get('GR');

%% Load Groups of SubjectFUN
im_gr = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON_FUN_MP XLS' filesep 'Functional' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr_FUN = im_gr.get('GR');

%% Combine Groups of SubjectCON with Groups of SubjectFUN
co_gr = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr_CON, ...
    'GR_FUN', gr_FUN, ...
    'WAITBAR', true ...
    );

gr = co_gr.get('GR_CON_FUN_MP');

%% Analysis CON FUN MP BUD
thresholds = .7:.1:.9;
a_BUD = AnalyzeEnsemble_CON_FUN_MP_BUD( ...
    'GR', gr, ...
    'DENSITIES', densities ...
    );

a_BUD.get('MEASUREENSEMBLE', 'Degree').get('M');
a_BUD.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
a_BUD.get('MEASUREENSEMBLE', 'Distance').get('M');

%% Create NNData composed of corresponding NNDataPoints
% create a item list of NNDataPoint_CON_FUN_MP_REG
it_list = cellfun(@(g, sub) NNDataPoint_Measure_REG( ...
    'ID', sub.get('ID'), ...
    'G', g, ...
    'M_LIST', {'Degree' 'DegreeAv' 'Distance'}, ...
    'SUB', sub, ...
    'TARGET_IDS', sub.get('VOI_DICT').get('KEYS')), ...
    a_WU.get('G_DICT').get('IT_LIST'), gr.get('SUB_DICT').get('IT_LIST'),...
    'UniformOutput', false);

% create a NNDataPoint_CON_FUN_MP_REG DICT
dp_dict = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_FUN_MP_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNData containing the NNDataPoint_CON_FUN_MP_REG DICT
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_FUN_MP_REG', ...
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