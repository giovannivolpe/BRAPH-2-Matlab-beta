%EXAMPLE_CON_OMP_WU
% Script example pipeline CON OMP WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectCON_MP')) filesep 'Example data CON_MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON_MP
im_gr1 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_MP')) filesep 'Example data CON_MP XLS' filesep 'CON_MP_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_MP')) filesep 'Example data CON_MP XLS' filesep 'CON_MP_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis CON_OMP WU
a_WU1 = AnalyzeEnsemble_CON_OMP_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_CON_OMP_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr2 ...
    );

% measure calculation
overlappingstrength_WU1 = a_WU1.get('MEASUREENSEMBLE', 'OverlappingS').get('M');
overlappingstrength_av_WU1 = a_WU1.get('MEASUREENSEMBLE', 'OverlappingSAv').get('M');
wedgeoverlap_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedEdgeOvlp').get('M');

overlappingstrength_WU2 = a_WU2.get('MEASUREENSEMBLE', 'OverlappingS').get('M');
overlappingstrength_av_WU2 = a_WU2.get('MEASUREENSEMBLE', 'OverlappingSAv').get('M');
wedgeoverlap_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedEdgeOvlp').get('M');

% comparison
c_WU = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

overlappingstrength_WU_diff = c_WU.get('COMPARISON', 'OverlappingS').get('DIFF');
overlappingstrength_WU_p1 = c_WU.get('COMPARISON', 'OverlappingS').get('P1');
overlappingstrength_WU_p2 = c_WU.get('COMPARISON', 'OverlappingS').get('P2');
overlappingstrength_WU_cil = c_WU.get('COMPARISON', 'OverlappingS').get('CIL');
overlappingstrength_WU_ciu = c_WU.get('COMPARISON', 'OverlappingS').get('CIU');

overlappingstrength_av_WU_diff = c_WU.get('COMPARISON', 'OverlappingSAv').get('DIFF');
overlappingstrength_av_WU_p1 = c_WU.get('COMPARISON', 'OverlappingSAv').get('P1');
overlappingstrength_av_WU_p2 = c_WU.get('COMPARISON', 'OverlappingSAv').get('P2');
overlappingstrength_av_WU_cil = c_WU.get('COMPARISON', 'OverlappingSAv').get('CIL');
overlappingstrength_av_WU_ciu = c_WU.get('COMPARISON', 'OverlappingSAv').get('CIU');

wedgeoverlap_WU_diff = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('DIFF');
wedgeoverlap_WU_p1 = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('P1');
wedgeoverlap_WU_p2 = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('P2');
wedgeoverlap_WU_cil = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('CIL');
wedgeoverlap_WU_ciu = c_WU.get('COMPARISON', 'WeightedEdgeOvlp').get('CIU');