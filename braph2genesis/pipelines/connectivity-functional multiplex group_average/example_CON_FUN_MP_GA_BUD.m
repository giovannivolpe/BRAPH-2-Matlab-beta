%EXAMPLE_CON_FUN_MP_GA_BUD
% Script example pipeline CON FUN MP GA BUD

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON-FUN_MP' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON-FUN_MP' filesep 'xls' filesep 'connectivity' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_CON = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON-FUN_MP' filesep 'xls' filesep 'connectivity' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_CON = im_gr2.get('GR');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON-FUN_MP' filesep 'xls' filesep 'functional' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_FUN = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON-FUN_MP' filesep 'xls' filesep 'functional' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_FUN = im_gr2.get('GR');

%% Combine Groups of SubjectCON with Groups of SubjectFUN
co_gr1 = CombineGroups_CON_FUN( ...
    'GR1', gr1_CON, ...
    'GR2', gr1_FUN, ...
    'WAITBAR', true ...
    );

gr1 = co_gr1.get('GR');

co_gr2 = CombineGroups_CON_FUN( ...
    'GR1', gr2_CON, ...
    'GR2', gr2_FUN, ...
    'WAITBAR', true ...
    );

gr2 = co_gr2.get('GR');

%% Analysis CON FUN MP GA BUD
densities = 5:5:15;

a_BUD1 = AnalyzeGroup_CON_FUN_MP_GA_BUD( ...
    'GR', gr1, ...
    'DENSITIES', densities ...
    );

a_BUD2 = AnalyzeGroup_CON_FUN_MP_GA_BUD( ...
    'GR', gr2, ...
    'DENSITIES', densities ...
    );

% measure calculation
g_BUD1 = a_BUD1.get('G');
mpc_BUD1 = g_BUD1.get('MEASURE', 'MultiplexParticipation').get('M');
mpc_av_BUD1 = g_BUD1.get('MEASURE', 'MultiplexParticipationAv').get('M');
edgeov_BUD1 = g_BUD1.get('MEASURE', 'EdgeOverlap').get('M');

g_BUD2 = a_BUD2.get('G');
mpc_BUD2 = g_BUD2.get('MEASURE', 'MultiplexParticipation').get('M');
mpc_av_BUD2 = g_BUD2.get('MEASURE', 'MultiplexParticipationAv').get('M');
edgeov_BUD2 = g_BUD2.get('MEASURE', 'EdgeOverlap').get('M');

% comparison
c_BUD = CompareGroup( ...
    'P', 10, ...
    'A1', a_BUD1, ...
    'A2', a_BUD2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

mpc_BUD_diff = c_BUD.get('COMPARISON', 'MultiplexParticipation').get('DIFF');
mpc_BUD_p1 = c_BUD.get('COMPARISON', 'MultiplexParticipation').get('P1');
mpc_BUD_p2 = c_BUD.get('COMPARISON', 'MultiplexParticipation').get('P2');
mpc_BUD_cil = c_BUD.get('COMPARISON', 'MultiplexParticipation').get('CIL');
mpc_BUD_ciu = c_BUD.get('COMPARISON', 'MultiplexParticipation').get('CIU');

mpc_av_BUD_diff = c_BUD.get('COMPARISON', 'MultiplexParticipationAv').get('DIFF');
mpc_av_BUD_p1 = c_BUD.get('COMPARISON', 'MultiplexParticipationAv').get('P1');
mpc_av_BUD_p2 = c_BUD.get('COMPARISON', 'MultiplexParticipationAv').get('P2');
mpc_av_BUD_cil = c_BUD.get('COMPARISON', 'MultiplexParticipationAv').get('CIL');
mpc_av_BUD_ciu = c_BUD.get('COMPARISON', 'MultiplexParticipationAv').get('CIU');