%% Pipeline Connectivity Regression 

% This is the pipeline script to compare two groups of subjects using connectivity data and weighted undirected graphs.
% 1. It loads a brain atlas from an XLS file (e.g., desikan_atlas.xlsx).
% 2. It loads the data of two groups of subjects from two directories (e.g., GroupName1 and GroupName2) containing XLS files of each subject.
% 3. It analyzes the first group using connectivity analyses (CON) based on weighted undirected graphs (WU).
% 4. It analyzes the second group using the same parameters selected for the first group.
% 5. It compares the results of the two analyses.

%% Brain Atlas
ba = ImporterBrainAtlasXLS('WAITBAR', true).get('GET_FILE').get('BA'); % Load a Brain Atlas XLS % Brain Atlas

%% Groups
gr1 = ImporterGroupSubjectCON_XLS('BA', ba, 'WAITBAR', true).get('GET_DIR').get('GR'); % Load Group CON 1 from XLS % Group CON 1
gr2 = ImporterGroupSubjectCON_XLS('BA', ba, 'WAITBAR', true).get('GET_DIR').get('GR'); % Load Group CON 2 from XLS % Group CON 2

%% Dataset
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_REG', ...
    'DP_DICT', IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_REG', ...
        'IT_LIST', cellfun(@(x) NNDataPoint_CON_REG( ...
            'ID', x.get('ID'), ...
            'SUB', x, ...
            'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
            gr.get('SUB_DICT').get('IT_LIST'), ...
            'UniformOutput', false) ...
    ) ...
); % Construct NN Dataset % NN Dataset

%% Training/test split
d_split = NNDatasetSplit('D', d, 'SPLIT', {0.3, 0.7}); % Split NN Dataset % NN Dataset Splitter
d_list = d_split.get('D_LIST'); % Splitted NN Datasets % Splitted NN Datasets
d_training = d_split{1}; % Show NN Training Dataset % NN Training Dataset
d_test = d_split{2}; % Show NN Test Dataset % NN Test Dataset

%% NN MODEL
nn = NNRegressorMLP('D', d_training, 'DENSE_LAYERS', [20 20]); % Train NN Model % NN Model

%% NN Evaluator
nne_training = NNEvaluator_REG('D', d_training, 'NN', nn); % Evaluate NN with Training Dataset % Training Dataset Evaluation
nne_test = NNEvaluator_REG('D', d_test, 'NN', nn); % Evaluate NN with Test Dataset % Test Dataset Evaluation