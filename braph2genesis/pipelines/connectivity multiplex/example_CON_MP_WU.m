%EXAMPLE_CON_MP_WU
% Script example pipeline CON MP WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_CON_MP_WU')) filesep 'example data CON_MP' filesep 'aal90_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON_MP
im_gr1 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('example_CON_MP_WU')) filesep 'example data CON_MP' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('example_CON_MP_WU')) filesep 'example data CON_MP' filesep 'xls' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis CON_MP WU
a_WU1 = AnalyzeEnsemble_CON_MP_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_CON_MP_WU( ...
    'GR', gr2 ...
    );

% measure calculation
overlappingdegree_WU1 = a_WU1.getMeasureEnsemble('OverlappingDegree').get('M');
overlappingdegree_av_WU1 = a_WU1.getMeasureEnsemble('OverlappingDegreeAv').get('M');
edgeoverlap_WU1 = a_WU1.getMeasureEnsemble('EdgeOverlap').get('M');

overlappingdegree_WU2 = a_WU2.getMeasureEnsemble('OverlappingDegree').get('M');
overlappingdegree_av_WU2 = a_WU2.getMeasureEnsemble('OverlappingDegreeAv').get('M');
edgeoverlap_WU2 = a_WU2.getMeasureEnsemble('EdgeOverlap').get('M');

% comparison
c_WU = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

overlappingdegree_WU_diff = c_WU.getComparison('OverlappingDegree').get('DIFF');
overlappingdegree_WU_p1 = c_WU.getComparison('OverlappingDegree').get('P1');
overlappingdegree_WU_p2 = c_WU.getComparison('OverlappingDegree').get('P2');
overlappingdegree_WU_cil = c_WU.getComparison('OverlappingDegree').get('CIL');
overlappingdegree_WU_ciu = c_WU.getComparison('OverlappingDegree').get('CIU');

overlappingdegree_av_WU_diff = c_WU.getComparison('OverlappingDegreeAv').get('DIFF');
overlappingdegree_av_WU_p1 = c_WU.getComparison('OverlappingDegreeAv').get('P1');
overlappingdegree_av_WU_p2 = c_WU.getComparison('OverlappingDegreeAv').get('P2');
overlappingdegree_av_WU_cil = c_WU.getComparison('OverlappingDegreeAv').get('CIL');
overlappingdegree_av_WU_ciu = c_WU.getComparison('OverlappingDegreeAv').get('CIU');

edgeoverlap_WU_diff = c_WU.getComparison('EdgeOverlap').get('DIFF');
edgeoverlap_WU_p1 = c_WU.getComparison('EdgeOverlap').get('P1');
edgeoverlap_WU_p2 = c_WU.getComparison('EdgeOverlap').get('P2');
edgeoverlap_WU_cil = c_WU.getComparison('EdgeOverlap').get('CIL');
edgeoverlap_WU_ciu = c_WU.getComparison('EdgeOverlap').get('CIU');