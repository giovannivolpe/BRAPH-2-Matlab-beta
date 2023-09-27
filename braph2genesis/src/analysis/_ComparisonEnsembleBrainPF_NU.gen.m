%% ¡header!
ComparisonEnsembleBrainPF_NU < ComparisonEnsembleBrainPF (pf, panel nodal unilayer ensemble-based comparison figure on brain surface figure) is the base element to plot a nodal unilayer ensemble-based comparison figure on brain surface figure.

%%% ¡description!
ComparisonEnsembleBrainPF_NU manages the basic functionalities to plot of a nodal unilayer ensemble-based comparison figure on brain surface figure.

%%% ¡seealso!
ComparisonEnsemble

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU manages the basic functionalities to plot of a nodal unilayer ensemble-based comparison figure on brain surface.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡settings!
'ComparisonEnsembleBrainPF_NU'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal unilayer ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_NU notes'

%%% ¡prop!
SETUP (query, empty) calculates the diff value and stores it to be implemented in the subelements.
%%%% ¡calculate!
cp = pf.get('CP');
g = cp.get('C').get('A1').get('GRAPH_TEMPLATE');
diff = cp.get('DIFF');
sphs_list = pf.get('SPH_DICT').get('IT_LIST');
diff = diff{1};

size_diff = pf.get('SIZE_DIFF');
switch size_diff
    case 'on'
        % transfrom diff value
        diff(isnan(diff)) = 0.1;
        diff(diff == 0) = 0.01;
        diff_transformed = abs(diff) * 10;

        % set size to sphs
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'SPHERESIZE', diff_transformed(i));
        end
    case 'off'
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'SPHERESIZE', SettingsSphere.getPropDefault(23));
        end
    case 'disable'
end

color_diff = pf.get('COLOR_DIFF');
switch color_diff
    case 'on'
    case 'off'
    case 'disable'
end

fdr = pf.get('FDR');
switch color_diff
    case 'on'
    case 'off'
    case 'disable'
end

value = {};

%% ¡props!

%%% ¡prop!
SIZE_DIFF (figure, option) is the node number of the nodal measure.
%%%% ¡settings!
{'on' 'off' 'disable'}
%%%% ¡default!
'on'
%%%% ¡postset!
pf.get('SETUP');

%%% ¡prop!
COLOR_DIFF (figure, option) is the node number of the nodal measure.
%%%% ¡settings!
{'on' 'off' 'disable'}
%%%% ¡default!
'on'
%%%% ¡postset!
pf.get('SETUP');

%%% ¡prop!
FDR (figure, option) is the node number of the nodal measure.
%%%% ¡settings!
{'on' 'off' 'disable'}
%%%% ¡default!
'on'
%%%% ¡postset!
pf.get('SETUP');

%%% ¡excluded_props!
[ComparisonEnsembleBrainPF_NU.PARENT ComparisonEnsembleBrainPF_NU.H ComparisonEnsembleBrainPF_NU.ST_POSITION ComparisonEnsembleBrainPF_NU.ST_AXIS ComparisonEnsembleBrainPF_NU.ST_AREA ComparisonEnsembleBrainPF_NU.ST_LINE_DIFF ComparisonEnsembleBrainPF_NU.ST_LINE_CIL ComparisonEnsembleBrainPF_NU.ST_LINE_CIU ComparisonEnsembleBrainPF_NU.ST_TITLE ComparisonEnsembleBrainPF_NU.ST_XLABEL ComparisonEnsembleBrainPF_NU.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonEnsembleBrainPF_NU'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonEnsembleBrainPF_NU'])
