%% EXAMPLE_NNCV_CON_FUN_MP_BUD_M_CLA
% Script example pipeline for NN regression cross-validation with input of MultiplexBUD measures derived from SubjectCON_FUN_MP 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_CON = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_CON = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'GroupName3'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3_CON = im_gr3.get('GR');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_FUN = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_FUN = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'GroupName3'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3_FUN = im_gr3.get('GR');

%% Combine Groups of SubjectCON with Groups of SubjectFUN
co_gr1 = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr1_CON, ...
    'GR_FUN', gr1_FUN, ...
    'WAITBAR', true ...
    );
gr1 = co_gr1.get('GR_CON_FUN_MP');

co_gr2 = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr2_CON, ...
    'GR_FUN', gr2_FUN, ...
    'WAITBAR', true ...
    );
gr2 = co_gr2.get('GR_CON_FUN_MP');

co_gr3 = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr3_CON, ...
    'GR_FUN', gr3_FUN, ...
    'WAITBAR', true ...
    );
gr3 = co_gr3.get('GR_CON_FUN_MP');

%% Analysis CON BUD
densities = 5:5:15;

a_BUD1 = AnalyzeEnsemble_CON_BUD( ...
    'GR', gr1, ...
    'DENSITIES', densities ...
    );

a_BUD2 = AnalyzeEnsemble_CON_FUN_MP_BUD( ...
    'TEMPLATE', a_BUD1, ...
    'GR', gr2, ...
    'DENSITIES', densities ...
    );

a_BUD3 = AnalyzeEnsemble_CON_FUN_MP_BUD( ...
    'TEMPLATE', a_BUD1, ...
    'GR', gr3, ...
    'DENSITIES', densities ...
    );

a_BUD1.get('MEASUREENSEMBLE', 'Degree').get('M');
a_BUD1.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
a_BUD1.get('MEASUREENSEMBLE', 'Distance').get('M');

a_BUD2.get('MEASUREENSEMBLE', 'Degree').get('M');
a_BUD2.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
a_BUD2.get('MEASUREENSEMBLE', 'Distance').get('M');

a_BUD3.get('MEASUREENSEMBLE', 'Degree').get('M');
a_BUD3.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
a_BUD3.get('MEASUREENSEMBLE', 'Distance').get('M');

%% Create NNData composed of corresponding NNDataPoints
[~, group_folder_name] = fileparts(im_gr1.get('DIRECTORY'));
it_list1 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUD1.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUD1.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

[~, group_folder_name] = fileparts(im_gr2.get('DIRECTORY'));
it_list2 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUD2.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUD2.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

[~, group_folder_name] = fileparts(im_gr3.get('DIRECTORY'));
it_list3 = cellfun(@(x) NNDataPoint_Measure_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'M_LIST', a_BUD3.get('ME_DICT').get('KEYS'), ...
    'TARGET_IDS', {group_folder_name}), ...
    a_BUD3.get('G_DICT').get('IT_LIST'), ...
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

d = NNDatasetCombine('D_LIST', {d1, d2, d3}).get('D');

%% Create a classifier cross-validation
nne_template = NNClassifierMLP_Evaluator('P', 2);
nncv = NNClassifierMLP_CrossValidation('D', d, 'KFOLDS', 5, 'NNEVALUATOR_TEMPLATE', nne_template);
nncv.get('TRAIN');

%% Evaluate the performance
confusion_matrix = nncv.get('C_MATRIX');
av_auc = nncv.get('AV_AUC');
av_macro_auc = nncv.get('AV_MACRO_AUC');
av_fi = nncv.get('AV_FEATURE_IMPORTANCE');