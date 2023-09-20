el_class_list = {'StrengthOut'}; % 'NNRegressor_CrossValidation' 'NNClassifier_CrossValidation' 'NNClassifierMLP' 'NNRegressor_Evaluator' 'NNRegressorMLP' 'NNRegressorMLP' 'NNEvaluator_REG' 'PanelElement' 'ImporterPipelineBRAPH2' 'ExporterPipelineBRAPH2'
for i = 1:1:length(el_class_list)
    el_class = el_class_list{i};
    el_path = '/measures';
    delete([fileparts(which('braph2')) el_path filesep() el_class '.m'])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    create_test_Element([fileparts(which('braph2genesis')) el_path filesep() '_' el_class '.gen.m'], [fileparts(which('braph2')) el_path])
    ['test_' el_class]
    eval(['test_' el_class])
end