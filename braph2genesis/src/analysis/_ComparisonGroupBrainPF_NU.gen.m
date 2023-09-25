%% ¡header!
ComparisonGroupBrainPF_NU < ComparisonGroupPF (pf, panel nodal unilayer group comparison on brain surface figure) is the base element to plot a nodal unilayer group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_NU manages the basic functionalities to plot of a nodal unilayer group comparison on brain surface figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.NODE
%%%% ¡title!
NODE SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_NU.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF_NU'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NU manages the basic functionalities to plot of a nodal unilayer group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_NU'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal unilayer group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_NU notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
cp = pf.get('CP');
g = cp.get('C').get('A1').get('G');

x = g.get('ALAYERTICKS');

node = pf.get('NODE');
diff = cellfun(@(x) x(node), cp.get('DIFF'))';
cil = cellfun(@(x) x(node), cp.get('CIL'))';
ciu = cellfun(@(x) x(node), cp.get('CIU'))';

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
    title = [cp.get('LABEL') ' ' int2str(node)];
else
    title = [cp.get('LABEL') ' ' anodelabels{node}];
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
NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
%%%% ¡default!
1
%%%% ¡postset!
pf.get('SETUP')
%%%% ¡gui!
pr = ComparisonGroupPF_NxPP_Node('EL', pf, 'PROP', ComparisonGroupBrainPF_NU.NODE);

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_NU.PARENT ComparisonGroupBrainPF_NU.H ComparisonGroupBrainPF_NU.ST_POSITION ComparisonGroupBrainPF_NU.ST_AXIS ComparisonGroupBrainPF_NU.CP ComparisonGroupBrainPF_NU.ST_AREA ComparisonGroupBrainPF_NU.ST_LINE_DIFF ComparisonGroupBrainPF_NU.ST_LINE_CIL ComparisonGroupBrainPF_NU.ST_LINE_CIU ComparisonGroupBrainPF_NU.ST_TITLE ComparisonGroupBrainPF_NU.ST_XLABEL ComparisonGroupBrainPF_NU.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_NU'])
assert(length(findall(0, 'type', 'figure')) == 5)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_NU'])
