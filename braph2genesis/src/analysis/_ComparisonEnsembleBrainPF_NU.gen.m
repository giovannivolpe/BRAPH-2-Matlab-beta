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
ELCLASS (constant, string) is the class of the % % % .
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
SHOWMEASURE (figure, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡default!
false
%%%% ¡postset!
cp = pf.get('CP');
diff = cp.get('DIFF');
% update spheres
if ~pf.get('SHOWMEASURE')  % false
    if pf.get('SPHS') % spheres
        sphs = pf.get('SPH_DICT').get('IT_LIST');
        for i = 1:1:length(sphs)
            set(sphs{i}, 'SPHERESIZE', SettingsSphere.getPropDefault(23))
            set(sphs{i}, 'FACECOLOR', BRAPH2.COL);
        end
    end
    if pf.get('SYMS') % spheres
        syms = pf.get('SYM_DICT').get('IT_LIST');
        for i = 1:1:length(syms)
            set(syms{i}, 'SYMBOLSIZE', SettingsSymbol.getPropDefault(20))
            set(syms{i}, 'FACECOLOR', BRAPH2.COL);
        end
    end
else % true
    % size
    g = cp.get('C').get('A1').get('GRAPH_TEMPLATE');
    dt_ticks = g.get('LAYERLABELS');
    if isempty(dt_ticks)
        DT_total = 1;
    else
        DT_total = length(dt_ticks);
    end
    M_total = length(diff);
    L_total = M_total/DT_total;

    selected_layer1 = str2num(pf.get('SELECTEDLAYER'));
    selected_layer2 = str2num(pf.get('SELECTEDDT'));
    g = m.get('G');
    temp_val = diff;
    final_selection = (selected_layer2*L_total) - (L_total-selected_layer1);
    m_val = temp_val{final_selection};

    % colors
    % Make colorbar
    lim_min = min(m_val);  % minimum of measure result
    lim_max = max(m_val);  % maximum of measure result
    if lim_min == lim_max
        caxis auto
        cmap_temp = colormap(jet);
        rgb_meas = zeros(size(cmap_temp));
        meas_val = m_val./m_val;
        meas_val(isnan(meas_val)) = 0.1;
    else
        caxis([lim_min lim_max]);
        cmap_temp = colormap(jet);
        rgb_meas = interp1(linspace(lim_min, lim_max, size(cmap_temp, 1)), ...
            cmap_temp, m_val); % colorbar from minimum to maximum value of the measure result
        meas_val = (m_val - lim_min)./(lim_max - lim_min) + 1;  % size normalized by minimum and maximum value of the measure result
        meas_val(isnan(meas_val)) = 0.1;
        meas_val(meas_val <= 0) = 0.1;
    end

    % spheres
    if pf.get('SPHS') % spheres        
        sphs = pf.get('SPH_DICT').get('IT_LIST');
        for i = 1:1:length(sphs)
            set(sphs{i}, 'SPHERESIZE', meas_val(i)*0.1);
            set(sphs{i}, 'FACECOLOR', rgb_meas(i, :));
        end
    end
    % triggers the update of SPH_DICT
    pf.set('SPH_DICT', pf.get('SPH_DICT'))

    % symbols
    if pf.get('SYMS') % spheres
        syms = pf.get('SYM_DICT').get('IT_LIST');
        for i = 1:1:length(syms)
            set(syms{i}, 'SYMBOLSIZE', m_val(i)*0.2)
            set(syms{i}, 'FACECOLOR', rgb_meas(i, :));
        end
    end
    % triggers the update of SYM_DICT
    pf.set('SYM_DICT', pf.get('SYM_DICT'))
end
% update state of toggle tool
toolbar = pf.get('H_TOOLBAR');
if check_graphics(toolbar, 'uitoolbar')
    set(findobj(toolbar, 'Tag', 'TOOL.SHOWMEASURE'), 'State', pf.get('SHOWMEASURE'))
end

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
