%EXAMPLE_NN_CON_WU_REGRESSION_ADJACENCYMATRIX
% Script example pipeline for connectivity data with NN using GraphWU for regression.  

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'desikan_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

%% Construct the Dataset
nnd = NNRegressorData_CON_WU( ...
    'GR', gr, ...
    'SPLIT', 0.2, ...
    'TARGET_NAME', 'age', ...
    'FEATURE_MASK', 0.05 ...
    );

train_nn_gr = nnd.get('TRAIN_NN_GR_FS');
val_nn_gr = nnd.get('VAL_NN_GR_FS');

%% Train the neural network regressor with training set
regressor = NNRegressorDNN( ...
    'NN_GR', train_nn_gr, ...
    'VERBOSE', true, ...
    'SHUFFLE', 'every-epoch' ...
    );
regressor.memorize('MODEL');

%% Evaluate the regressor for training set
nne_train = NNRegressorEvaluator( ...
    'NN_GR', train_nn_gr, ...
    'NN', regressor ...
    );

rmse_train = nne_train.get('RMSE');

%% Evaluate the regressor for validation set
nne_val = NNRegressorEvaluator( ...
    'NN_GR', val_nn_gr, ...
    'NN', regressor ...
    );

rmse_val = nne_val.get('RMSE');

%% Load another groups of subjectCON
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_NN_CON_WU_Regression_AdjacencyMatrix')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr_test = im_gr.get('GR');

%% Evaluate the regressor with testing set
nnd_test = NNRegressorData_CON_WU( ...
    'GR', gr_test, ...
    'SPLIT', 1.0, ...
    'TARGET_NAME', 'age', ...
    'FEATURE_MASK', nnd.get('FEATURE_MASK') ...
    );

test_nn_gr = nnd_test.get('VAL_NN_GR_FS');

nne_test = NNRegressorEvaluator( ...
    'NN_GR', test_nn_gr, ...
    'NN', regressor ...
    );

rmse_test = nne_test.get('RMSE');

close all