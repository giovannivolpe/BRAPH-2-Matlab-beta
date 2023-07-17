%% EXAMPLE_NNCV_ST_MM_CLASSIFICATION
% Script example pipeline for NN cross-validation for classification with
% the input of ROI values from multimodality data

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_ST_MP_WU')) filesep 'example data ST_MP' filesep 'desikan_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectST
im_gr1 = ImporterGroupSubjectST_MP_XLS( ...
    'DIRECTORY', [fileparts(which('example_ST_MP_WU')) filesep 'example data ST_MP' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectST_MP_XLS( ...
    'DIRECTORY', [fileparts(which('example_ST_MP_WU')) filesep 'example data ST_MP' filesep 'xls' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Construct the dataset
nnd1 = NNData_ST_MM( ...
    'GR', gr1, ...
    'INPUT_TYPE', 'structural_data', ...
    'TARGET_NAME', gr1.get('ID') ...
    );

gr1_nn = nnd1.get('GR_NN');

nnd2 = NNData_ST_MM( ...
    'GR', gr2, ...
    'INPUT_TYPE', 'structural_data', ...
    'TARGET_NAME', gr2.get('ID') ...
    );

gr2_nn = nnd2.get('GR_NN');

%% Initiate the cross validation analysis
nncv = NNClassifierCrossValidation( ...
    'GR1', gr1_nn, ...
    'GR2', gr2_nn, ...
    'EPOCHS', 200, ...
    'LAYERS', [100 100], ...
    'KFOLD', 5 ...
    );

%% Evaluate the Performance
gr_cv = nncv.get('GR_PREDICTION');
auc_cv = nncv.get('AUC');
cm_cv = nncv.get('CONFUSION_MATRIX');

close all