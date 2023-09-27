%% ¡header!
ComparisonEnsembleBrainPF_NU < ComparisonEnsembleBrainPF (pf, panel nodal unilayer ensemble-based comparison figure on brain surface figure) is the base element to plot a nodal unilayer ensemble-based comparison figure on brain surface figure.

%%% ¡description!
ComparisonEnsembleBrainPF_NU manages the basic functionalities to plot of a nodal unilayer ensemble-based comparison figure on brain surface figure.

%%% ¡seealso!
ComparisonEnsemble

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.LAYER
%%%% ¡title!
Graph LAYER

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SIZE_DIFF
%%%% ¡title!
Show Difference with SIZE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SIZE_SCALE
%%%% ¡title!
Size SCALE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.COLOR_DIFF
%%%% ¡title!
Show Difference with COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.FDR
%%%% ¡title!
FDR CORRECTION

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.QVALUE
%%%% ¡title!
QVALUE 

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
ComparisonEnsembleBrainPF_NU.VIEW
%%%% ¡title!
3D VIEW

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.BRAIN
%%%% ¡title!
BRAIN ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SURFFILE
%%%% ¡title!
BRAIN SURFACE

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_SURFACE
%%%% ¡title!
BRAIN COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ST_AMBIENT
%%%% ¡title!
MATERIAL & LIGHTNING

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SPHS
%%%% ¡title!
Brain Region SPHERES ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SPH_DICT
%%%% ¡title!
Brain Region SPHERES PROPERTIES

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SYMS
%%%% ¡title!
Brain Region SYMBOLS ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.SYM_DICT
%%%% ¡title!
Brain Region SYMBOLS PROPERTIES

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.IDS
%%%% ¡title!
Brain Region IDs ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.ID_DICT
%%%% ¡title!
Brain Region IDs PROPERTIES

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.LABS
%%%% ¡title!
Brain Region LABELS ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonEnsembleBrainPF_NU.LAB_DICT
%%%% ¡title!
Brain Region LABELS PROPERTIES

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
sphs_list = pf.get('SPH_DICT').get('IT_LIST');
layer = pf.get('LAYER')
diff = cp.get('DIFF');
p2 = cp.get('P2');
diff = diff{layer};
p2 = p2{layer};

size_diff = pf.get('SIZE_DIFF');
switch size_diff
    case 'on'
        % transfrom diff value to appropriate size
        % value
        diff(isnan(diff)) = 0.1;
        diff(diff == 0) = 0.01;
        size_scale = pf.get('SIZE_SCALE')
        size_value = abs(diff) * size_scale;

        % set size to sphs
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'SPHERESIZE', size_value(i));
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
        % transfrom diff value to appropriate color
        % code
        color_code_list = cell(size(diff));

        for i = 1:numel(color_code_list)
            if diff(i) > 0
                color_code_list{i} = [1 0 0]; % Red
            elseif diff(i) < 0
                color_code_list{i} = [0 0 1]; % Blue
            else
                color_code_list{i} = [0 0 0]; % Black (or any other color for zero)
            end
        end

        % set color to sphs
        cellfun(@(sph, color_code) set(sph, 'FACECOLOR', color_code), sphs_list, color_code_list', 'UniformOutput', false);
    case 'off'
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'FACECOLOR', SettingsSphere.getPropDefault(17));
        end
    case 'disable'
end

fdr_diff = pf.get('FDR');
switch fdr_diff
    case 'on'
        [~, mask] = fdr(p2', pf.get('QVALUE'));
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'VISIBLE', mask(i));
        end
    case 'off'
        for i = 1:1:length(sphs_list)
            set(sphs_list{i}, 'VISIBLE', true);
        end
    case 'disable'
end

value = {};

%% ¡props!

%%% ¡prop!
LAYER (figure, scalar) is the node number of the nodal measure.
%%%% ¡default!
1
%%%% ¡postset!
pf.get('SETUP');

%%% ¡prop!
SIZE_DIFF (figure, option) is the node number of the nodal measure.
%%%% ¡settings!
{'on' 'off' 'disable'}
%%%% ¡default!
'on'
%%%% ¡postset!
pf.get('SETUP');

%%% ¡prop!
SIZE_SCALE (figure, scalar) is the node number of the nodal measure.
%%%% ¡default!
5
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

%%% ¡prop!
QVALUE (figure, scalar) is the node number of the nodal measure.
%%%% ¡default!
0.05
%%%% ¡postprocessing!
if isempty(pf.get('QVALUE'))
    pf.set('QVALUE', pf.get('CP').get('QVALUE'));
end
%%%% ¡postset!
pf.get('CP').set('QVALUE', pf.get('QVALUE'));
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
