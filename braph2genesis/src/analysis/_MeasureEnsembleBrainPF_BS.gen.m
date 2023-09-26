%% ¡header!
MeasureEnsembleBrainPF_BS  < MeasureEnsembleBrainPF (pf, brain panel group comparison on brain surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
MeasureEnsembleBrainPF_BS manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_BS.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'MeasureEnsembleBrainPF_BS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BS manages the basic functionalities to plot of a binodal superglobal group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡settings!
'MeasureEnsembleBrainPF_BS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_BS notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the binodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_BxPP_Node('EL', pf, 'PROP', MeasureEnsembleBrainPF_BS.NODES);

%% ¡tests!

%%% ¡excluded_props!
[MeasureEnsembleBrainPF_BS.PARENT MeasureEnsembleBrainPF_BS.H MeasureEnsembleBrainPF_BS.ST_POSITION MeasureEnsembleBrainPF_BS.ST_AXIS MeasureEnsembleBrainPF_BS.ST_AREA MeasureEnsembleBrainPF_BS.ST_LINE_DIFF MeasureEnsembleBrainPF_BS.ST_LINE_CIL MeasureEnsembleBrainPF_BS.ST_LINE_CIU MeasureEnsembleBrainPF_BS.ST_TITLE MeasureEnsembleBrainPF_BS.ST_XLABEL MeasureEnsembleBrainPF_BS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureEnsembleBrainPF_BS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureEnsembleBrainPF_BS'])