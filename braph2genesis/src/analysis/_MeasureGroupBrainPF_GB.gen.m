%% ¡header!
MeasureGroupBrainPF_GB < MeasureGroupBrainPF (pf, panel figure for global bilayer measure group brain) is a plot of a global bilayer measure group brain.

%%% ¡description!
A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_GB) manages the plot of the global bilayer measure
 ploted over the brain.  
MeasureGroupBrainPF_GB utilizes the surface created from BrainAtlasPF to integrate 
 the global bilayer meaure into the brain regions.

%%% ¡seealso!
BrainAtlas, BrainSurface, BrainAtlasPF

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % %.
%%%% ¡default!
'MeasureGroupBrainPF_GB'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure for measure group brain.
%%%% ¡default!
'Panel Figure for Measure Group Brain'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure for measure group brain.
%%%% ¡default!
'A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_GB) manages the plot of the global bilayer measure ploted over the brain. MeasureGroupBrainPF_GB  utilizes the surface created from BrainAtlasPF to integrate the global bilayer meaure into the brain regions.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure for measure group brain.
%%%% ¡settings!
'MeasureGroupBrainPF_GB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_GB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_GB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_GB notes'

%%% ¡prop!
SETUP (query, empty) calculates the measure value and stores it to be ploted on a brain surface.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡tests!

%%% ¡excluded_props!
[MeasureGroupBrainPF_GB.PARENT MeasureGroupBrainPF_GB.H MeasureGroupBrainPF_GB.ST_POSITION MeasureGroupBrainPF_GB.ST_AXIS MeasureGroupBrainPF_GB.ST_SURFACE MeasureGroupBrainPF_GB.ST_AMBIENT MeasureGroupBrainPF_GB.M]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureGroupBrainPF_GB'])
assert(length(findall(0, 'type', 'figure')) == 5)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureGroupBrainPF_GB'])