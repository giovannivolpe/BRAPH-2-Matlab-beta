%% EXAMPLE_NNCV_CON_FUN_MP_WU_CLA
% Script example pipeline for NN classification cross-validation with the input of adjacency marix from MultiplexWU with SubjectCON_FUN_MP 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'CON_FUN_MP_Group1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_CON = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'CON_FUN_MP_Group2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_CON = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Connectivity' filesep 'CON_FUN_MP_Group3_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3_CON = im_gr3.get('GR');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'CON_FUN_MP_Group1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_FUN = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'CON_FUN_MP_Group2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_FUN = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_CLA')) filesep 'Example data NN CLA CON_FUN_MP XLS' filesep 'Functional' filesep 'CON_FUN_MP_Group3_XLS'], ...
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

%% Analysis CON FUN MP WU
a_WU1 = AnalyzeEnsemble_CON_FUN_MP_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_CON_FUN_MP_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr2 ...
    );

a_WU3 = AnalyzeEnsemble_CON_FUN_MP_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr3 ...
    );

a_WU1.memorize('G_DICT');
a_WU2.memorize('G_DICT');
a_WU3.memorize('G_DICT');

%% Create NNData composed of corresponding NNDataPoints
% create item lists of NNDataPoint_Graph_CLA
it_list1 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr1.get('ID')}), ...
    a_WU1.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list2 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr2.get('ID')}), ...
    a_WU2.get('G_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list3 = cellfun(@(x) NNDataPoint_Graph_CLA( ...
    'ID', x.get('ID'), ...
    'G', x, ...
    'TARGET_IDS', {gr3.get('ID')}), ...
    a_WU3.get('G_DICT').get('IT_LIST'), ...
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

% create a NNDataset containing the NNDataPoint_Graph_CLA DICT
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

%% Create a classifier cross-validation
nne_template = NNClassifierMLP_Evaluator('P', 2);
nncv = NNClassifierMLP_CrossValidation('D', {d1, d2, d3}, 'KFOLDS', 5, 'NNEVALUATOR_TEMPLATE', nne_template);
nncv.get('TRAIN');

%% Evaluate the performance
confusion_matrix = nncv.get('C_MATRIX');
av_auc = nncv.get('AV_AUC');
av_macro_auc = nncv.get('AV_MACRO_AUC');
av_fi = nncv.get('AV_FEATURE_IMPORTANCE');