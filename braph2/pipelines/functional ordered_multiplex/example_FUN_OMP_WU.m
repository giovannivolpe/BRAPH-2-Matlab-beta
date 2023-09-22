%EXAMPLE_FUN_OMP_WU
% Script example pipeline FUN OMP WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectFUN_MP')) filesep 'Example data FUN_MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN_MP
im_gr1 = ImporterGroupSubjectFUN_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN_MP')) filesep 'Example data FUN_MP XLS' filesep 'FUN_MP_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN_MP')) filesep 'Example data FUN_MP XLS' filesep 'FUN_MP_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis FUN_OMP WU
a_WU1 = AnalyzeEnsemble_FUN_OMP_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_FUN_OMP_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr2 ...
    );

% measure calculation
wmpc_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedMxP').get('M');
wmpc_av_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedMxPAv').get('M');
weo_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedEdgeOvlp').get('M');

wmpc_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedMxP').get('M');
wmpc_av_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedMxPAv').get('M');
weo_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedEdgeOvlp').get('M');

% comparison
c_WU = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

wmpc_WU_diff = c_WU.get('COMPARISON', 'WeightedMxP').get('DIFF');
wmpc_WU_p1 = c_WU.get('COMPARISON', 'WeightedMxP').get('P1');
wmpc_WU_p2 = c_WU.get('COMPARISON', 'WeightedMxP').get('P2');
wmpc_WU_cil = c_WU.get('COMPARISON', 'WeightedMxP').get('CIL');
wmpc_WU_ciu = c_WU.get('COMPARISON', 'WeightedMxP').get('CIU');

wmpc_av_WU_diff = c_WU.get('COMPARISON', 'WeightedMxPAv').get('DIFF');
wmpc_av_WU_p1 = c_WU.get('COMPARISON', 'WeightedMxPAv').get('P1');
wmpc_av_WU_p2 = c_WU.get('COMPARISON', 'WeightedMxPAv').get('P2');
wmpc_av_WU_cil = c_WU.get('COMPARISON', 'WeightedMxPAv').get('CIL');
wmpc_av_WU_ciu = c_WU.get('COMPARISON', 'WeightedMxPAv').get('CIU');

weo_WU_diff = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('DIFF');
weo_WU_p1 = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('P1');
weo_WU_p2 = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('P2');
weo_WU_cil = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('CIL');
weo_WU_ciu = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('CIU');