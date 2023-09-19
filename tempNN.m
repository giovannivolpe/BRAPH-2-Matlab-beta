close all; delete(findall(0, 'type', 'figure')); clear all


% %% /neuralnetworks
% el_class_list = {'NNRegressorMLO'};
% for i = 1:1:length(el_class_list)
%     el_class_list = {'NNDataPoint_Graph_CLA' 'NNDataPoint_Measure_REG' 'NNDataPoint_Measure_CLA'}; % 'NNDataPoint_Graph_REG' 'NNDataPoint_Measure_REG' 'NNDataPoint_Measure_CLA' 'NNDataPoint_Graph_CLA' 'NNRegressor_CrossValidation' 'NNClassifier_CrossValidation' 'NNClassifierMLP' 'NNRegressor_Evaluator' 'NNRegressorMLP' 'NNRegressorMLP' 'NNEvaluator_REG' 'PanelElement' 'ImporterPipelineBRAPH2' 'ExporterPipelineBRAPH2'
%     el_class = el_class_list{i};
%     el_path = '/neuralnetworks';
%     delete([fileparts(which('braph2')) el_path filesep() el_class '.m'])
%     create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
%     create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
%     create_layout([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
%     create_test_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
%     ['test_' el_class]
%     eval(['test_' el_class])
% end

braph2_dr = 'E:\Working\braph\BRAPH-2-Matlab-beta\braph2';
braph2genesis_dr = 'E:\Working\braph\BRAPH-2-Matlab-beta\braph2genesis';
disp('test:');
el_class_list = {['pipelines\structural NN' filesep '_NNDataPoint_ST_CLA.gen.m'];
    };
for i = 1:1:length(el_class_list)
    el_class = el_class_list{i};
    [file_dr, file_nam] = fileparts(el_class);
    delete([braph2_dr filesep file_dr filesep file_nam(2:end-4) '.m'])
    create_Element([braph2genesis_dr filesep el_class], [braph2_dr filesep file_dr]);
    create_Element([braph2genesis_dr filesep el_class], [braph2_dr filesep file_dr]);
    create_test_Element([braph2genesis_dr filesep el_class], [braph2_dr filesep file_dr]);
end

% %% PIPELINE TEST 'pipeline_connectivity_regression'
% im = ImporterPipelineBRAPH2(...
%     'FILE', [fileparts(which('braph2genesis')) filesep 'pipelines' filesep 'connectivity NN' filesep 'pipeline_connectivity_bud_classification_cross_validation.braph2'], ...
%     'WAITBAR', true ...
%     ); 
% pip = im.get('PIP');
% gui = GUIElement('PE', pip, 'CLOSEREQ', false);
% gui.get('DRAW')
% gui.get('SHOW')