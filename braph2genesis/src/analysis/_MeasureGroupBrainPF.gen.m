%% ¡header!
MeasureGroupBrainPF < BrainAtlasPF (pf, panel figure for measure group brain) is a plot of a measure group brain.

%%% ¡description!
A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF) manages the plot of the measure
 ploted over the brain.  
MeasureGroupBrainPF utilizes the surface created from BrainAtlasPF to integrate 
 the meaure into the brain regions.

%%% ¡seealso!
BrainAtlas, BrainSurface, BrainAtlasPF

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.ID
%%%% ¡title!
Meaure Group Brain FigureID

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.LABEL
%%%% ¡title!
Meaure Group Brain FigureNAME

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.NOTES
%%%% ¡title!
Meaure Group Brain NOTES

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.COLORLIST
%%%% ¡title!
Meaure Group Brain COLORLIST

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.SELECTEDLAYER
%%%% ¡title!
Meaure Group Brain SELECTEDLAYER

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF.SELECTEDDT
%%%% ¡title!
Meaure Group Brain SELECTEDDT

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure for measure group brain.
'MeasureGroupBrainPF'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure for measure group brain.
%%%% ¡default!
'Panel Figure for Measure Group Brain'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure for measure group brain.
%%%% ¡default!
'A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF) manages the plot of the measure ploted over the brain. MeasureGroupBrainPF utilizes the surface created from BrainAtlasPF to integrate the meaure into the brain regions.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure for measure group brain.
%%%% ¡settings!
'MeasureGroupBrainPF'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF notes'

%%% ¡prop!
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.DRAW, varargin{:}); % also warning
if value
    % reset the ambient lighting
    pf.get('ST_AMBIENT').get('SETUP');

    % trigger setup
    pf.get('SETUP');
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
COLORLIST (figure, option) is the color list value.
%%%% ¡settings!
{'on' 'off' 'enable'}
%%%% ¡default!
'on'

%%% ¡prop!
M (metadata, item) is the measure.
%%%% ¡settings!
'Measure'

%%% ¡prop!
SELECTEDLAYER (figure, string) is an the choosen selected layer.
%%%% ¡default!
'1'

%%% ¡prop!
SELECTEDDT (figure, string) is an the choosen selected layer.
%%%% ¡default!
'1'

%%% ¡prop!
SETUP (query, empty) calculates the measure value and stores it to be implemented in the subelements.
%%%% ¡calculate!
value = [];

%% ¡tests!

%%% ¡excluded_props!
[MeasureGroupBrainPF.PARENT MeasureGroupBrainPF.H MeasureGroupBrainPF.ST_POSITION MeasureGroupBrainPF.ST_AXIS MeasureGroupBrainPF.ST_SURFACE MeasureGroupBrainPF.ST_AMBIENT]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureGroupBrainPF'])
assert(length(findall(0, 'type', 'figure')) == 5)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureGroupBrainPF'])

%%% ¡test!
%%%% ¡name!
Basics 1
%%%% ¡probability!
.01
%%%% ¡code!
br1 = BrainRegion('ID', 'id1', 'LABEL', 'label1', 'NOTES', 'notes1', 'X', 1, 'Y', 1, 'Z', 1);
br2 = BrainRegion('ID', 'id2', 'LABEL', 'label2', 'NOTES', 'notes2', 'X', 2, 'Y', 2, 'Z', 2);
br3 = BrainRegion('ID', 'id3', 'LABEL', 'label3', 'NOTES', 'notes3', 'X', 3, 'Y', 3, 'Z', 3);
br4 = BrainRegion('ID', 'id4', 'LABEL', 'label4', 'NOTES', 'notes4', 'X', 4, 'Y', 4, 'Z', 4);
br5 = BrainRegion('ID', 'id5', 'LABEL', 'label5', 'NOTES', 'notes5', 'X', 5, 'Y', 5, 'Z', 5);
br6 = BrainRegion('ID', 'id6', 'LABEL', 'label6', 'NOTES', 'notes6', 'X', 6, 'Y', 6, 'Z', 6);
items = {br1, br2, br3, br4, br5, br6};
idict = IndexedDictionary( ...
    'ID', 'idict', ...
    'IT_CLASS', 'BrainRegion', ...
    'IT_KEY', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'IT_LIST', items ...
    );
ba0 = BrainAtlas('ID', 'BA1', 'LABEL', 'brain atlas', 'NOTES', 'Notes on brain atlas.', 'BR_DICT', idict);
pf0 = MeasureGroupBrainPF(...
    'SURF', ImporterBrainSurfaceNV('FILE', 'human_ICBM152.nv').get('SURF'), ...
    'BA', ba0 ...
    );
gui0 = GUIFig('PF', pf0, 'FILE', 'xxx sss', 'POSITION', [.1 .1 .4 .8], 'WAITBAR', true, 'CLOSEREQ', false);
gui0.get('DRAW')
gui0.get('SHOW')

gui0_settings = gui0.memorize('GUI_SETTINGS');
gui0_settings.set('POSITION', [0 0 .3 .5])
gui0_settings.get('DRAW')
gui0_settings.get('SHOW')

gui0.get('CLOSE')

