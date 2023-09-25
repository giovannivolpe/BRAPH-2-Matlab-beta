%% ¡header!
ComparisonGroupBrainPF_NS < ComparisonGroupBrainPF (pf, panel nodal superglobal group comparison on brain surface figure) is the base element to plot a nodal superglobal group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_NS manages the basic functionalities to plot of a nodal superglobal group comparison on brain surface figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.NODE
%%%% ¡title!
NODE SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NS.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF_NS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NS manages the basic functionalities to plot of a nodal superglobal group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_NS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NS notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_NxPP_Node('EL', pf, 'PROP', ComparisonGroupBrainPF_NS.NODE);

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_NS.PARENT ComparisonGroupBrainPF_NS.H ComparisonGroupBrainPF_NS.ST_POSITION ComparisonGroupBrainPF_NS.ST_AXIS ComparisonGroupBrainPF_NS.ST_AREA ComparisonGroupBrainPF_NS.ST_LINE_DIFF ComparisonGroupBrainPF_NS.ST_LINE_CIL ComparisonGroupBrainPF_NS.ST_LINE_CIU ComparisonGroupBrainPF_NS.ST_TITLE ComparisonGroupBrainPF_NS.ST_XLABEL ComparisonGroupBrainPF_NS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_NS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_NS'])
