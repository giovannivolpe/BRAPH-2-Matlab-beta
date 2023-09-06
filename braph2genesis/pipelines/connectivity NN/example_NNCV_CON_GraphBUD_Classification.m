%% EXAMPLE_NNCV_CON_GRAPHBUD_CLASSIFICATION
% Script example pipeline for NN classification cross-validation with the input of GraphBUD derived from SubjectCON 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
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

im_gr3 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_CLA')) filesep 'Example data NN CLA CON XLS' filesep 'CON_Group_3_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3 = im_gr3.get('GR');

%% Analysis CON WU
densities = 0:25:100;
a_BUD1 = AnalyzeEnsemble_CON_BUD( ...
    'DENSITIES', densities, ...
    'GR', gr1 ...
    );

a_BUD2 = AnalyzeEnsemble_CON_BUD( ...
    'TEMPLATE', a_BUD1, ...
    'GR', gr2 ...
    );

a_BUD3 = AnalyzeEnsemble_CON_BUD( ...
    'TEMPLATE', a_BUD1, ...
    'GR', gr3 ...
    );

a_BUD1.memorize('G_DICT');
a_BUD2.memorize('G_DICT');
a_BUD3.memorize('G_DICT');

%% Create NNData composed of corresponding NNDataPoints
% create item lists of NNDataPoint_Graph_CLA
it_list1 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr1.get('ID')}), ...
    a_BUD1.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list2 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr2.get('ID')}), ...
    a_BUD2.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list3 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr3.get('ID')}), ...
    a_BUD3.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create NNDataPoint_Graph_CLA DICT items
it_class = 'NNDataPoint_Graph_CLA';
dp_list1 = IndexedDictionary(...
        'IT_CLASS', it_class, ...
        'IT_LIST', it_list1 ...
        );

dp_list2 = IndexedDictionary(...
        'IT_CLASS', it_class, ...
        'IT_LIST', it_list2 ...
        );

dp_list3 = IndexedDictionary(...
        'IT_CLASS', it_class, ...
        'IT_LIST', it_list3 ...
        );

% create a NNDataset containing the NNDataPoint_CON_CLA DICT
d1 = NNDataset( ...
    'DP_CLASS', it_class, ...
    'DP_DICT', dp_list1 ...
    );

d2 = NNDataset( ...
    'DP_CLASS', it_class, ...
    'DP_DICT', dp_list2 ...
    );

d3 = NNDataset( ...
    'DP_CLASS', it_class, ...
    'DP_DICT', dp_list3 ...
    );

d = NNDatasetCombine('D_LIST', {d1, d2, d3}).get('D');

%% Create a classifier cross-validation
nncv = NNClassifier_CrossValidation('D', d, 'KFOLD', 5);
nncv.get('TRAIN');

%% Evaluate the performance
confusion_matrix = nncv.get('C_MATRIX');
avg_auc = nncv.get('AVG_AUC');
avg_macro_auc = nncv.get('AVG_MACRO_AUC');