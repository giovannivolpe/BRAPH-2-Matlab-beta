%% ¡header!
ComparisonEnsembleBrainPF < BrainAtlasPF (pf, panel ensemble-based comparison figure on brain surface figure) is the base element to plot an ensemble-based comparison on brain surface figure.

%%% ¡description!
ComparisonEnsembleBrainPF manages the basic functionalities to plot of an ensemble-based comparison on brain surface figure.

%%% ¡seealso!
ComparisonEnsemble

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF'

%%% ¡prop!
NAME (constant, string) is the name of the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF manages the basic functionalities to plot of an ensemble-based comparison on brain surface.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel ensemble-based comparison figure on brain surface.
%%%% ¡settings!
'ComparisonEnsembleBrainPF'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF notes'

%%% ¡prop!
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.DRAW, varargin{:}); % also warning
if value
    pf.get('SETUP')
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡calculate!
value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.DELETE, varargin{:}); % also warning
if value
    % do nothing
end

%% ¡props!

%%% ¡prop!
CP (metadata, item) is the measure.
%%%% ¡settings!
'ComparisonEnsemble'

%%% ¡prop!
SETUP (query, empty) calculates the diff value and stores it to be implemented in the subelements.
%%%% ¡calculate!
value = [];

%% ¡tests!

%%% ¡excluded_props!
[ComparisonEnsembleBrainPF.PARENT ComparisonEnsembleBrainPF.H ComparisonEnsembleBrainPF.ST_POSITION ComparisonEnsembleBrainPF.ST_AXIS ComparisonEnsembleBrainPF.ST_SURFACE ComparisonEnsembleBrainPF.ST_AMBIENT]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonEnsembleBrainPF'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonEnsembleBrainPF'])