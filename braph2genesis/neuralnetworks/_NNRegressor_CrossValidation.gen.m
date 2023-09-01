%% ¡header!
NNRegressor_CrossValidation < NNCrossValidation (nncv, neural network cross-validation) is a process for evaluating neural network regressors using cross-validation.

%%% ¡description!
NNCrossValidation is a process that facilitates the evaluation of neural network regressors using cross-validation. 
 It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. 
 This helps in assessing the generalization performance of the model and detecting overfitting.

To train all the neural networks for all folds, use: nncv.get('TRAIN')

%%% ¡seealso!
NNDataPoint, NNDataset, NNEvaluator

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the cross-validation.
%%%% ¡default!
'NNRegressor_CrossValidation'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the cross-validation.
%%%% ¡default!
'NNCrossValidation is a process that facilitates the evaluation of neural network regressors using cross-validation. It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. This helps in assessing the generalization performance of the model and detecting overfitting.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the nerual cross-validation.
%%%% ¡settings!
'NNRegressor_CrossValidation'

%%% ¡prop!
ID (data, string) is a few-letter code for the cross-validation.
%%%% ¡default!
'NNRegressor_CrossValidation ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the cross-validation.
%%%% ¡default!
'NNRegressor_CrossValidation label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the cross-validation.
%%%% ¡default!
'NNRegressor_CrossValidation notes'

%%% ¡prop!
NN_LIST (result, itemlist) contains the neural network models corresponding to k folds.
%%%% ¡settings!
'NNRegressorMLP'
%%%% ¡calculate!
d_list = nncv.get('D_LIST');

if isempty(d_list)
    value = {};
else
    for i = 1:length(d_list)
        d_training_set{i} = d_list;
        d_training_set{i}(i) = [];  % Exclude the i-th element
        d_training_set{i} = NNDatasetCombine('D_LIST', d_training_set{i}).get('D');
    end

    d_training_set = d_training_set';

    nn_template = NNRegressorMLP( ...
        'EPOCHS', nncv.get('EPOCHS'), ...
        'BATCH', nncv.get('BATCH'), ...
        'SHUFFLE', nncv.get('SHUFFLE'), ...
        'SOLVER', nncv.get('SOLVER'), ...
        'VERBOSE', nncv.get('VERBOSE'), ...
        'PLOT_TRAINING', nncv.get('PLOT_TRAINING'));

    value = cellfun(@(d) NNRegressorMLP( ...
        'TEMPLATE', nn_template, 'D', d), ...
        d_training_set, 'UniformOutput', false);
end

%%% ¡prop!
EVALUATOR_LIST (result, itemlist) contains the evaluators corresponding to k folds.
%%%% ¡settings!
'NNRegressor_Evaluator'
%%%% ¡calculate!
d_list = nncv.get('D_LIST');
nn_list = nncv.get('NN_LIST');
value = cellfun(@(d, nn) NNRegressor_Evaluator('D', d, 'NN', nn), ...
    d_list, nn_list, 'UniformOutput', false);

%% ¡props!

%%% ¡prop!
CORRELATION_COEFF (result, rvector) provides the metric of the correlation of coefficients.
%%%% ¡calculate!
value = [];

%%% ¡prop!
COEFF_OF_DETERMINATION (result, rvector) provides a measure of how well the predictions are replicated by the model.
%%%% ¡calculate!
value = [];

%% ¡tests!

%%% ¡test!
%%%% ¡name!
evaluate a regressor cross-validation with the example data
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

kfold = 3;
nncv = NNRegressor_CrossValidation('KFOLD', kfold, 'D', d);

nn_list = nncv.get('NN_LIST');
assert(length(nn_list) == kfold, ...
    [BRAPH2.STR ':NNRegressor_CrossValidation:' BRAPH2.FAIL_TEST], ...
    'NNRegressor_CrossValidation does not calculate the neural network list correctly.' ...
    )
e_list = nncv.get('EVALUATOR_LIST');
assert(length(e_list) == kfold, ...
    [BRAPH2.STR ':NNRegressor_CrossValidation:' BRAPH2.FAIL_TEST], ...
    'NNRegressor_CrossValidation does not calculate the evaluator list correctly.' ...
    )