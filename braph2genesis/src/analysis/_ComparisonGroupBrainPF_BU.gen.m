%% ¡header!
ComparisonGroupBrainPF_BU < ComparisonGroupBrainPF (pf, panel binodal unilayer group comparison on brain surface figure) is the base element to plot a binodal unilayer group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_BU manages the basic functionalities to plot of a binodal unilayer group comparison on brain surface figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_BU.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF_BU'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BU manages the basic functionalities to plot of a binodal unilayer group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_BU'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure binodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_BU notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
cp = pf.get('CP');
g = cp.get('C').get('A1').get('G');

x = g.get('ALAYERTICKS');

nodes = pf.get('NODES');
diff = cellfun(@(x) x(nodes(1), nodes(2)), cp.get('DIFF'))';
cil = cellfun(@(x) x(nodes(1), nodes(2)), cp.get('CIL'))';
ciu = cellfun(@(x) x(nodes(1), nodes(2)), cp.get('CIU'))';

pf.memorize('ST_LINE_DIFF').set('X', x, 'Y', diff)
pf.memorize('ST_LINE_CIL').set('X', x, 'Y', cil)
pf.memorize('ST_LINE_CIU').set('X', x, 'Y', ciu)

if ~isempty(cil) && ~isempty(ciu)
    if isempty(x) 
        pf.memorize('ST_AREA').set('X', [1:1:length(diff) length(diff):-1:1], 'Y', [cil ciu(end:-1:1)])
    else
        pf.memorize('ST_AREA').set('X', [x x(end:-1:1)], 'Y', [cil ciu(end:-1:1)])
    end
end

xlim = pf.get('H_AXES').get('XLim');
ylim = pf.get('H_AXES').get('YLim');
anodelabels = g.get('ANODELABELS');
if isequal(anodelabels, {'numbered'})
    title = [cp.get('LABEL') ' ' int2str(nodes(1)) ' ' int2str(nodes(2))];
else
    title = [cp.get('LABEL') ' ' anodelabels{nodes(1)} ' ' anodelabels{nodes(2)}];
end
pf.get('ST_TITLE').set( ...
    'TXT', title, ...
    'X', .5 * (xlim(2) + xlim(1)), ...
    'Y', ylim(2) + .07 * (ylim(2) - ylim(1)), ...
    'Z', 0 ...
    )
pf.get('ST_XLABEL').set( ...
    'TXT', 'Layer', ...
    'X', .5 * (xlim(2) + xlim(1)), ...
    'Y', ylim(1) - .07 * (ylim(2) - ylim(1)), ...
    'Z', 0 ...
    )
pf.get('ST_YLABEL').set( ...
	'TXT', 'Measure Value', ...
    'X', xlim(1) - .14 * (xlim(2) - xlim(1)), ...
    'Y', .5 * (ylim(2) + ylim(1)), ...
    'Z', 0 ...
    )

value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the binodal group comparison on brain surface figure.
%%%% ¡default!
[1 1]
%%%% ¡postset!
pf.get('SETUP')
%%%% ¡gui!
pr = ComparisonGroupPF_BxPP_Node('EL', pf, 'PROP', ComparisonGroupBrainPF_BU.NODES);

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_BU.PARENT ComparisonGroupBrainPF_BU.H ComparisonGroupBrainPF_BU.ST_POSITION ComparisonGroupBrainPF_BU.ST_AXIS ComparisonGroupBrainPF_BU.CP ComparisonGroupBrainPF_BU.ST_AREA ComparisonGroupBrainPF_BU.ST_LINE_DIFF ComparisonGroupBrainPF_BU.ST_LINE_CIL ComparisonGroupBrainPF_BU.ST_LINE_CIU ComparisonGroupBrainPF_BU.ST_TITLE ComparisonGroupBrainPF_BU.ST_XLABEL ComparisonGroupBrainPF_BU.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_BU'])
assert(length(findall(0, 'type', 'figure')) == 5)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_BU'])
