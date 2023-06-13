%EXAMPLE_FUN_WU_GROUP
% Script example pipeline FUN GA WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'FUN_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'FUN_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis FUN WU GROUP
a_WU1 = AnalyzeGroup_FUN_GA_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeGroup_FUN_GA_WU( ...
    'GR', gr2 ...
    );

% measure calculation
g_WU1 = a_WU1.get('G');
degree_WU1 = g_WU1.get('MEASURE', 'Degree').get('M');
% % % strength_WU1 = g_WU1.get('MEASURE', 'Strength').get('M');
% % % modularity_WU1 = g_WU1.get('MEASURE', 'Modularity').get('M');

g_WU2 = a_WU2.get('G');
degree_WU2 = g_WU2.get('MEASURE', 'Degree').get('M');
% % % strength_WU2 = g_WU2.get('MEASURE', 'Strength').get('M');
% % % modularity_WU2 = g_WU2.get('MEASURE', 'Modularity').get('M');

% comparison
c_WU = CompareGroup( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

degree_WU_diff = c_WU.get('COMPARISON', 'Degree').get('DIFF');
degree_WU_p1 = c_WU.get('COMPARISON', 'Degree').get('P1');
degree_WU_p2 = c_WU.get('COMPARISON', 'Degree').get('P2');
degree_WU_cil = c_WU.get('COMPARISON', 'Degree').get('CIL');
degree_WU_ciu = c_WU.get('COMPARISON', 'Degree').get('CIU');

% % % strength_WU_diff = c_WU.get('COMPARISON', 'Strength').get('DIFF');
% % % strength_WU_p1 = c_WU.get('COMPARISON', 'Strength').get('P1');
% % % strength_WU_p2 = c_WU.get('COMPARISON', 'Strength').get('P2');
% % % strength_WU_cil = c_WU.get('COMPARISON', 'Strength').get('CIL');
% % % strength_WU_ciu = c_WU.get('COMPARISON', 'Strength').get('CIU');

% % % modularity_WU_diff = c_WU.get('COMPARISON', 'Modularity').get('DIFF');
% % % modularity_WU_p1 = c_WU.get('COMPARISON', 'Modularity').get('P1');
% % % modularity_WU_p2 = c_WU.get('COMPARISON', 'Modularity').get('P2');
% % % modularity_WU_ciu = c_WU.get('COMPARISON', 'Modularity').get('CIU');