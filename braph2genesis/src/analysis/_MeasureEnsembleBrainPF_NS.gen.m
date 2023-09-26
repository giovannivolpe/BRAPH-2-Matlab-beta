%% ¡header!
MeasureEnsembleBrainPF_NS  < MeasureEnsembleBrainPF (pf, brain panel group comparison on brain surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
MeasureEnsembleBrainPF_NS manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.NODE
%%%% ¡title!
NODE SELECTION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_NS.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'MeasureEnsembleBrainPF_NS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_NS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_NS manages the basic functionalities to plot of a nodal superglobal group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡settings!
'MeasureEnsembleBrainPF_NS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_NS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_NS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_NS notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_NxPP_Node('EL', pf, 'PROP', MeasureEnsembleBrainPF_NS.NODE);

%% ¡tests!

%%% ¡excluded_props!
[MeasureEnsembleBrainPF_NS.PARENT MeasureEnsembleBrainPF_NS.H MeasureEnsembleBrainPF_NS.ST_POSITION MeasureEnsembleBrainPF_NS.ST_AXIS MeasureEnsembleBrainPF_NS.ST_AREA MeasureEnsembleBrainPF_NS.ST_LINE_DIFF MeasureEnsembleBrainPF_NS.ST_LINE_CIL MeasureEnsembleBrainPF_NS.ST_LINE_CIU MeasureEnsembleBrainPF_NS.ST_TITLE MeasureEnsembleBrainPF_NS.ST_XLABEL MeasureEnsembleBrainPF_NS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureEnsembleBrainPF_NS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureEnsembleBrainPF_NS'])