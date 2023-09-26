%% ¡header!
MeasureEnsembleBrainPF_BB  < MeasureEnsembleBrainPF (pf, brain panel group comparison on brain surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
MeasureEnsembleBrainPF_BB manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BB.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'MeasureEnsembleBrainPF_BB'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BB'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BB manages the basic functionalities to plot of a binodal bilayer group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡settings!
'MeasureEnsembleBrainPF_BB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure binodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BB notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the binodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_BxPP_Node('EL', pf, 'PROP', MeasureEnsembleBrainPF_BB.NODES);

%% ¡tests!

%%% ¡excluded_props!
[MeasureEnsembleBrainPF_BB.PARENT MeasureEnsembleBrainPF_BB.H MeasureEnsembleBrainPF_BB.ST_POSITION MeasureEnsembleBrainPF_BB.ST_AXIS MeasureEnsembleBrainPF_BB.ST_AREA MeasureEnsembleBrainPF_BB.ST_LINE_DIFF MeasureEnsembleBrainPF_BB.ST_LINE_CIL MeasureEnsembleBrainPF_BB.ST_LINE_CIU MeasureEnsembleBrainPF_BB.ST_TITLE MeasureEnsembleBrainPF_BB.ST_XLABEL MeasureEnsembleBrainPF_BB.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureEnsembleBrainPF_BB'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureEnsembleBrainPF_BB'])