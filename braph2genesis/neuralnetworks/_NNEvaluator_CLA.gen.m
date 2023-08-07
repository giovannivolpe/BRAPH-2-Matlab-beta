%% ¡header!
NNEvaluator_CLA < NNEvaluator (nne, neural network evaluator for classification) evaluates the performance of a neural network classifier with a given dataset.

%%% ¡description!
A neural network evaluator for regression (NNEvaluator_CLA) evaluates the performance of a neural network regressor with a given dataset.
NNEvaluator_CLA evaluates the performance of the trained regressor with a given dataset in terms of various regression metrics (e.g., coefficient of determination, mean squared error).

%%% ¡seealso!
NNDataPoint_CON_REG, NNRegressorMLP

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the neural network evaluator for the regression task.
%%%% ¡default!
'NNEvaluator_CLA'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the neural network evaluator for the regression task.
%%%% ¡default!
'A neural network evaluator for regression (NNEvaluator_CLA) evaluates the performance of a neural network regressor with a given dataset. NNEvaluator_CLA evaluates the performance of the trained regressor with a given dataset in terms of various regression metrics (e.g., coefficient of determination, mean squared error).'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the neural network evaluator for the regression task.
%%%% ¡settings!
'NNEvaluator_CLA'

%%% ¡prop!
ID (data, string) is a few-letter code for the neural network evaluator for the regression task.
%%%% ¡default!
'NNEvaluator_CLA ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the neural network evaluator for the regression task.
%%%% ¡default!
'NNEvaluator_CLA label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the neural network evaluator for the regression task.
%%%% ¡default!
'NNEvaluator_CLA notes'
    
%%% ¡prop!
NN (data, item) contains a trained neural network regressor.
%%%% ¡settings!
'NNClassifierMLP'

%%% ¡prop!
PREDICTIONS (result, cell) are the predictions of the trained neural network model from the given dataset.
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
GROUND_TRUTH (query, stringlist) returns the matrix of ground truth derived from the targets.
%%%% ¡calculate!
targets = nne.get('D').get('TARGETS');
if isempty(targets)
    value = [];
else
    for i = 1:length(targets)
        value(i, :) = targets{i};
    end
end

%%% ¡prop!
AUC (result, scalar) provides the metric of the AUC value.
%%%% ¡calculate!
value = 0;

%%% ¡prop!
C_MATRIX (result, matrix) provides the metric of the confusion matrix.
%%%% ¡calculate!
predictions = nne.get('PREDICTIONS');
predictions = cell2mat(predictions);
predictions = bsxfun(@eq, predictions, max(predictions, [], 2));
classNames = nne.get('NN').get('MODEL').Layers(end).Classes;
for i = 1:length(predictions)
    classified(i) = classNames(predictions(i, :));
end
ground_truth = categorical(nne.get('GROUND_TRUTH'));
value = confusionmat(classified,ground_truth);

%%% ¡prop!
PERMUTATION_FEATURE_IMPORTANCE (result, cell) assess the significance of each feature by randomly shuffling its values and measuring how much the performance of the model decreases.
%%%% ¡calculate!
value = {};

%% ¡tests!

%%% ¡test!
%%%% ¡name!
evaluate a classifier with the example data
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
nn.get('MODEL_TRAIN');

nne = NNEvaluator_CLA('NN', nn, 'D', d);

predictions = cell2mat(nne.get('PREDICTIONS'));
% % % 
% % % % Check whether the ground truth are derived as expected
% % % ground_truth = nne.get('GROUND_TRUTH');
% % % targets = d.get('TARGETS');
% % % 
% % % for i = 1:size(ground_truth, 1)
% % %     check(i) = isequal(cell2mat(targets{i}), ground_truth(i, :));
% % % end
% % % assert(all(check), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the ground truth correctly.' ...
% % %     )
% % % 
% % % % Check whether the correlation coefficients are calculated as expected
% % % calculated_value = nne.get('CORRELATION_COEFF');
% % % for i = 1:size(ground_truth, 2)
% % %     corr_matrix = corrcoef(predictions(:, i), ground_truth(:, i));
% % %     known_value(i) = corr_matrix(1, 2);
% % % end
% % % assert(isequal(calculated_value, known_value), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the correlation coefficients correctly.' ...
% % %     )
% % % 
% % % % Check whether the correlation coefficients are calculated as expected
% % % calculated_value = nne.get('COEFF_OF_DETERMINATION');
% % % for i = 1:size(ground_truth, 2)
% % %     corr_matrix = corrcoef(predictions(:, i), ground_truth(:, i));
% % %     known_value(i) = corr_matrix(1, 2)^2;
% % % end
% % % assert(isequal(calculated_value, known_value), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the coefficient of determination correctly.' ...
% % %     )
% % % 
% % % % Check whether the mean absolute errors are calculated as expected
% % % calculated_value = nne.get('MEAN_ABSOLUTE_ERROR');
% % % for i = 1:size(ground_truth, 2)
% % %     known_value(i) = mean(abs(predictions(:, i) - ground_truth(:, i)));
% % % end
% % % assert(isequal(calculated_value, known_value), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the mean absolute errors correctly.' ...
% % %     )
% % % 
% % % % Check whether the mean squared errors are calculated as expected
% % % calculated_value = nne.get('MEAN_SQUARED_ERROR');
% % % for i = 1:size(ground_truth, 2)
% % %     known_value(i) = mean((predictions(:, i) - ground_truth(:, i)).^2);
% % % end
% % % assert(isequal(calculated_value, known_value), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the mean squared errors correctly.' ...
% % %     )
% % % 
% % % % Check whether the mean squared errors are calculated as expected
% % % calculated_value = nne.get('ROOT_MEAN_SQUARED_ERROR');
% % % for i = 1:size(ground_truth, 2)
% % %     known_value(i) = sqrt(mean((predictions(:, i) - ground_truth(:, i)).^2));
% % % end
% % % assert(isequal(calculated_value, known_value), ...
% % %     [BRAPH2.STR ':NNEvaluator_CLA:' BRAPH2.FAIL_TEST], ...
% % %     'NNEvaluator_CLA does not calculate the root mean squared errors correctly.' ...
% % %     )