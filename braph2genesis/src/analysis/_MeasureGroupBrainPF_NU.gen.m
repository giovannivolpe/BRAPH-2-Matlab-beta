%% ¡header!
MeasureGroupBrainPF_NU  < MeasureGroupBrainPF (pf, panel figure for nodal unilayer measure group brain) is a plot of a nodal unilayer measure group brain.

%%% ¡description!
A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_NU ) manages the plot of the nodal unilayer measure
 ploted over the brain.  
MeasureGroupBrainPF_NU  utilizes the surface created from BrainAtlasPF to integrate 
 the nodal unilayer meaure into the brain regions.

%%% ¡seealso!
BrainAtlas, BrainSurface, BrainAtlasPF

%% ¡layout!
%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU.SELECTEDLAYER
%%%% ¡title!
Meaure Group Brain SELECTEDLAYER

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU.SELECTEDDT
%%%% ¡title!
Meaure Group Brain SELECTEDDT

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU.COLORLIST
%%%% ¡title!
Meaure Group Brain COLORLIST

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU.SIZELIST
%%%% ¡title!
Meaure Group Brain SIZELIST

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU .ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU .LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU .WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NU .NOTES
%%%% ¡title!
Brain Atlas NOTES

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure for measure group brain.
'MeasureGroupBrainPF_NU '

%%% ¡prop!
NAME (constant, string) is the name of the panel figure for measure group brain.
%%%% ¡default!
'Panel Figure for Measure Group Brain'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure for measure group brain.
%%%% ¡default!
'A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_NU ) manages the plot of the nodal unilayer measure ploted over the brain. MeasureGroupBrainPF_NU  utilizes the surface created from BrainAtlasPF to integrate the nodal unilayer meaure into the brain regions.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure for measure group brain.
%%%% ¡settings!
'MeasureGroupBrainPF_NU '

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NU  ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NU  label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NU  notes'

%%% ¡prop!
SETUP (query, empty) calculates the measure value and stores it to be implemented in the subelements.
%%%% ¡calculate!
m = pf.get('M');
% update spheres
% size
ax_ = pf.get('H_AXES');
g = m.get('G');
dt_ticks = g.get('LAYERLABELS');
if isempty(dt_ticks)
    DT_total = 1;
else
    DT_total = length(dt_ticks);
end
M_total = length(m.get('M'));
L_total = M_total/DT_total;

selected_layer1 = str2double(pf.get('SELECTEDLAYER'));
selected_layer2 = str2double(pf.get('SELECTEDDT'));
g = m.get('G');
temp_val = m.get('M');
final_selection = (selected_layer2*L_total) - (L_total-selected_layer1);
m_val = temp_val{final_selection};
color_selection = pf.get('COLORLIST');

% colors
% Make colorbar
if strcmp(color_selection, 'on')
    lim_min = min(m_val);  % minimum of measure result
    lim_max = max(m_val);  % maximum of measure result
    if lim_min == lim_max
        clim(ax_, 'auto')
        cmap_temp = colormap(ax_, jet);
        rgb_meas = zeros(size(cmap_temp));
    else
        clim(ax_, [lim_min lim_max]);
        cmap_temp = colormap(ax_, jet);
        rgb_meas = interp1(linspace(lim_min, lim_max, size(cmap_temp, 1)), ...
            cmap_temp, m_val); % colorbar from minimum to maximum value of the measure result
        meas_val = (m_val - lim_min)./(lim_max - lim_min) + 1;  % size normalized by minimum and maximum value of the measure result
    end
else
    for i = 1:length(m_val{1})
        rgb_meas(i, :) = BRAPH2.COL;
    end
end

% spheres
if pf.get('SPHS') % spheres
    sphs = pf.get('SPH_DICT').get('IT_LIST');
    for i = 1:1:length(sphs)
        set(sphs{i}, 'SPHERESIZE', m_val(i)*0.2);
        % control disable
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

value = {};
