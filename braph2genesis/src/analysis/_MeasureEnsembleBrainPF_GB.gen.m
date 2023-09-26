%% ¡header!
MeasureEnsembleBrainPF_GB  < MeasureEnsembleBrainPF (pf, brain panel group comparison on brainMeasureEnsembleBrainPF_GB surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
MeasureEnsembleBrainPF_GB manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GB.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'MeasureEnsembleBrainPF_GB'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GB'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GB manages the basic functionalities to plot of a global bilayer group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡settings!
'MeasureEnsembleBrainPF_GB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure global bilayer group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GB notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡tests!

%%% ¡excluded_props!
[MeasureEnsembleBrainPF_GB.PARENT MeasureEnsembleBrainPF_GB.H MeasureEnsembleBrainPF_GB.ST_POSITION MeasureEnsembleBrainPF_GB.ST_AXIS MeasureEnsembleBrainPF_GB.ST_AREA MeasureEnsembleBrainPF_GB.ST_LINE_DIFF MeasureEnsembleBrainPF_GB.ST_LINE_CIL MeasureEnsembleBrainPF_GB.ST_LINE_CIU MeasureEnsembleBrainPF_GB.ST_TITLE MeasureEnsembleBrainPF_GB.ST_XLABEL MeasureEnsembleBrainPF_GB.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureEnsembleBrainPF_GB'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureEnsembleBrainPF_GB'])