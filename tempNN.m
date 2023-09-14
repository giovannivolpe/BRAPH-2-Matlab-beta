close all; delete(findall(0, 'type', 'figure')); clear all

%% pipelines
el_class_list = {'NNDataPoint_CON_CLA'}; % 'NNDataPoint_CON_CLA' 'NNDataPoint_CON_REG' 
for i = 1:1:length(el_class_list)
    el_class = el_class_list{i};
    el_path = '/pipelines/connectivity NN';
    delete([fileparts(which('braph2')) el_path filesep() el_class '.m'])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_test_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    ['test_' el_class]
    eval(['test_' el_class])
end

%% PIPELINE TEST 'pipeline_connectivity_regression'
im = ImporterPipelineBRAPH2(...
    'FILE', [fileparts(which('braph2genesis')) filesep 'pipelines' filesep 'connectivity NN' filesep 'pipeline_classification_cross_validation_connectivity_but_measure.braph2'], ...
    'WAITBAR', true ...
    ); 
pip = im.get('PIP');
gui = GUIElement('PE', pip, 'CLOSEREQ', false);
gui.get('DRAW')
gui.get('SHOW')

%% /neuralnetworks
el_class_list = {'NNClassifierMLP'}; % 'NNDataPoint_Graph_REG' 'NNDataPoint_Measure_REG' 'NNDataPoint_Measure_CLA' 'NNDataPoint_Graph_CLA' 'NNRegressor_CrossValidation' 'NNClassifier_CrossValidation' 'NNClassifierMLP' 'NNRegressor_Evaluator' 'NNRegressorMLP' 'NNRegressorMLP' 'NNEvaluator_REG' 'PanelElement' 'ImporterPipelineBRAPH2' 'ExporterPipelineBRAPH2'
for i = 1:1:length(el_class_list)
    el_class = el_class_list{i};
    el_path = '/neuralnetworks';
    delete([fileparts(which('braph2')) el_path filesep() el_class '.m'])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_layout([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_test_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    ['test_' el_class]
    %eval(['test_' el_class])
end

%% src/gui
el_class_list = {'NNDatasetSplit'}; % 'NNBase'  'NNDataset'  'NNDatasetSplit' 'NNDatasetCombine'  'NNDataSplit' 'PanelElement' 'ImporterPipelineBRAPH2' 'ExporterPipelineBRAPH2'
for i = 1:1:length(el_class_list)
    el_class = el_class_list{i};
    el_path = '/src/nn';
    delete([fileparts(which('braph2')) el_path filesep() el_class '.m'])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_layout([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_test_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    ['test_' el_class]
    %eval(['test_' el_class])
end