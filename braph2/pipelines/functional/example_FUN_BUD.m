%EXAMPLE_FUN_BUD
% Script example pipeline FUN BUD

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

%% Analysis FUN BUD
densities = 5:5:20;

a_BUD1 = AnalyzeEnsemble_FUN_BUD( ...
    'GR', gr1, ...
    'DENSITIES', densities ...
    );

a_BUD2 = AnalyzeEnsemble_FUN_BUD( ...
    'TEMPLATE', a_BUD1, ...
    'GR', gr2, ...
    'DENSITIES', densities ...
    );

% measure calculation
degree_BUD1 = a_BUD1.get('MEASUREENSEMBLE', 'Degree').get('M');
degree_av_BUD1 = a_BUD1.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
distance_BUD1 = a_BUD1.get('MEASUREENSEMBLE', 'Distance').get('M');

degree_BUD2 = a_BUD2.get('MEASUREENSEMBLE', 'Degree').get('M');
degree_av_BUD2 = a_BUD2.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
distance_BUD2 = a_BUD2.get('MEASUREENSEMBLE', 'Distance').get('M');

% comparison
c_BUD = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_BUD1, ...
    'A2', a_BUD2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

degree_BUD_diff = c_BUD.get('COMPARISON', 'Degree').get('DIFF');
degree_BUD_p1 = c_BUD.get('COMPARISON', 'Degree').get('P1');
degree_BUD_p2 = c_BUD.get('COMPARISON', 'Degree').get('P2');
degree_BUD_cil = c_BUD.get('COMPARISON', 'Degree').get('CIL');
degree_BUD_ciu = c_BUD.get('COMPARISON', 'Degree').get('CIU');

degreeav_BUD_diff = c_BUD.get('COMPARISON', 'DegreeAv').get('DIFF');
degreeav_BUD_p1 = c_BUD.get('COMPARISON', 'DegreeAv').get('P1');
degreeav_BUD_p2 = c_BUD.get('COMPARISON', 'DegreeAv').get('P2');
degreeav_BUD_cil = c_BUD.get('COMPARISON', 'DegreeAv').get('CIL');
degreeav_BUD_ciu = c_BUD.get('COMPARISON', 'DegreeAv').get('CIU');

distance_BUD_diff = c_BUD.get('COMPARISON', 'Distance').get('DIFF');
distance_BUD_p1 = c_BUD.get('COMPARISON', 'Distance').get('P1');
distance_BUD_p2 = c_BUD.get('COMPARISON', 'Distance').get('P2');
distance_BUD_cil = c_BUD.get('COMPARISON', 'Distance').get('CIL');
distance_BUD_ciu = c_BUD.get('COMPARISON', 'Distance').get('CIU');

% % % modularity_BUD_diff = c_BUD.get('COMPARISON', 'Modularity').get('DIFF');
% % % modularity_av_BUD_p1 = c_BUD.get('COMPARISON', 'Modularity').get('P1');
% % % modularity_av_BUD_p2 = c_BUD.get('COMPARISON', 'Modularity').get('P2');
% % % modularity_av_BUD_cil = c_BUD.get('COMPARISON', 'Modularity').get('CIL');
% % % modularity_av_BUD_ciu = c_BUD.get('COMPARISON', 'Modularity').get('CIU');
