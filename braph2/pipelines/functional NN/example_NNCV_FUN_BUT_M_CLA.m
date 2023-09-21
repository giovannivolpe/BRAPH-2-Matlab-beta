%% EXAMPLE_NNCV_FUN_BUT_M_CLA
% Script example pipeline for NN regression cross-validation with input of GraphBUT measures derived from SubjectFUN 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_3_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3 = im_gr3.get('GR');

%% Analysis FUN BUT
thresholds = 0.1:.1:.2;
graph_temp = MultigraphBUT('THRESHOLDS', thresholds);
a_BUT1 = AnalyzeEnsemble_FUN_BUT( ...
    'GRAPH_TEMPLATE', graph_temp, ...
    'GR', gr1 ...
    );

a_BUT2 = AnalyzeEnsemble_FUN_BUT( ...
    'TEMPLATE', a_BUT1, ...
    'GR', gr2 ...
    );

a_BUT3 = AnalyzeEnsemble_FUN_BUT( ...
    'TEMPLATE', a_BUT1, ...
    'GR', gr3 ...
    );

a_BUT1.get('MEASUREENSEMBLE', 'OverlappingDeg').get('M');
a_BUT1.get('MEASUREENSEMBLE', 'OverlappingDegAv').get('M');
a_BUT1.get('MEASUREENSEMBLE', 'Distance').get('M');

a_BUT2.get('MEASUREENSEMBLE', 'OverlappingDeg').get('M');
a_BUT2.get('MEASUREENSEMBLE', 'OverlappingDegAv').get('M');
a_BUT2.get('MEASUREENSEMBLE', 'Distance').get('M');

a_BUT3.get('MEASUREENSEMBLE', 'OverlappingDeg').get('M');
a_BUT3.get('MEASUREENSEMBLE', 'OverlappingDegAv').get('M');
a_BUT3.get('MEASUREENSEMBLE', 'Distance').get('M');

%% Create NNData composed of corresponding NNDataPoints
[~, group_folder_name] = fileparts(im_gr1.get('DIRECTORY'));
it_list1 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUT1.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUT1.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

[~, group_folder_name] = fileparts(im_gr2.get('DIRECTORY'));
it_list2 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUT2.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUT2.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

[~, group_folder_name] = fileparts(im_gr3.get('DIRECTORY'));
it_list3 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUT3.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUT3.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create NNDataPoint_Graph_CLA DICT items
dp_list1 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_Measure_CLA', ...
        'IT_LIST', it_list1 ...
        );

dp_list2 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_Measure_CLA', ...
        'IT_LIST', it_list2 ...
        );

dp_list3 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_Measure_CLA', ...
        'IT_LIST', it_list3 ...
        );

% create a NNDataset containing the NNDataPoint_Measure_CLA DICT
d1 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_Measure_CLA', ...
    'DP_DICT', dp_list1 ...
    );

d2 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_Measure_CLA', ...
    'DP_DICT', dp_list2 ...
    );

d3 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_Measure_CLA', ...
    'DP_DICT', dp_list3 ...
    );

%% Create a classifier cross-validation
nne_template = NNClassifierMLP_Evaluator('P', 2);
nncv = NNClassifierMLP_CrossValidation('D', {d1, d2, d3}, 'KFOLDS', 5, 'NNEVALUATOR_TEMPLATE', nne_template);
nncv.get('TRAIN');

%% Evaluate the performance
confusion_matrix = nncv.get('C_MATRIX');
av_auc = nncv.get('AV_AUC');
av_macro_auc = nncv.get('AV_MACRO_AUC');