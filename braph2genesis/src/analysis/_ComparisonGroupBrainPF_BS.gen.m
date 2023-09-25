%% ¡header!
ComparisonGroupBrainPF_BS < ComparisonGroupPF (pf, panel binodal superglobal group comparison on brain surface figure) is the base element to plot a binodal superglobal group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_BS manages the basic functionalities to plot of a binodal superglobal group comparison on brain surface figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BS.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF_BS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BS manages the basic functionalities to plot of a binodal superglobal group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_BS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure binodal superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BS notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the binodal group comparison on brain surface figure.
%%%% ¡gui!
pr = ComparisonGroupPF_BxPP_Node('EL', pf, 'PROP', ComparisonGroupBrainPF_BS.NODES);

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_BS.PARENT ComparisonGroupBrainPF_BS.H ComparisonGroupBrainPF_BS.ST_POSITION ComparisonGroupBrainPF_BS.ST_AXIS ComparisonGroupBrainPF_BS.ST_AREA ComparisonGroupBrainPF_BS.ST_LINE_DIFF ComparisonGroupBrainPF_BS.ST_LINE_CIL ComparisonGroupBrainPF_BS.ST_LINE_CIU ComparisonGroupBrainPF_BS.ST_TITLE ComparisonGroupBrainPF_BS.ST_XLABEL ComparisonGroupBrainPF_BS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_BS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_BS'])
