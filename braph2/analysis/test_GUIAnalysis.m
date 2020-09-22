% test GUIAnalysis

%% Init ST

analysis_file = [fileparts(which('example_workflow_ST_WU.m')) filesep() 'example data ST (MRI)' filesep() 'analysis_example_ST_BUT.analysis'];
temp = load(analysis_file, '-mat', 'ga', 'BUILD');
ga = temp.ga;

GUIAnalysis(ga)

set(gcf, 'CloseRequestFcn', 'closereq')
close(gcf)

%% Init FNC

analysis_file = [fileparts(which('example_workflow_FNC_WU.m')) filesep() 'example data FNC (fMRI)' filesep() 'analysis_example_FNC_BUT.analysis'];
temp = load(analysis_file, '-mat', 'ga', 'BUILD');
ga = temp.ga;

GUIAnalysis(ga)

set(gcf, 'CloseRequestFcn', 'closereq')
close(gcf)

%% INIT CON

analysis_file = [fileparts(which('example_workflow_CON_WU.m')) filesep() 'example data CON (DTI)' filesep() 'analysis_example_CON_BUT.analysis'];
temp = load(analysis_file, '-mat', 'ga', 'BUILD');
ga = temp.ga;

GUIAnalysis(ga)

set(gcf, 'CloseRequestFcn', 'closereq')
close(gcf)
