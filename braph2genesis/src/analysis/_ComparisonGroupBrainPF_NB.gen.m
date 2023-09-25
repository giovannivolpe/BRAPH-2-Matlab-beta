%% ¡header!
ComparisonGroupBrainPF_NB < ComparisonGroupBrainPF (pf, panel nodal bilayer group comparison on brain surface figure) is the base element to plot a nodal bilayer group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_NB manages the basic functionalities to plot of a nodal bilayer group comparison on brain surface figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.NODE
%%%% ¡title!
NODE SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NB.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF_NB'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NB'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NB manages the basic functionalities to plot of a nodal bilayer group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_NB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal bilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NB notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_NxPP_Node('EL', pf, 'PROP', ComparisonGroupBrainPF_NB.NODE);

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_NB.PARENT ComparisonGroupBrainPF_NB.H ComparisonGroupBrainPF_NB.ST_POSITION ComparisonGroupBrainPF_NB.ST_AXIS ComparisonGroupBrainPF_NB.ST_AREA ComparisonGroupBrainPF_NB.ST_LINE_DIFF ComparisonGroupBrainPF_NB.ST_LINE_CIL ComparisonGroupBrainPF_NB.ST_LINE_CIU ComparisonGroupBrainPF_NB.ST_TITLE ComparisonGroupBrainPF_NB.ST_XLABEL ComparisonGroupBrainPF_NB.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_NB'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_NB'])
