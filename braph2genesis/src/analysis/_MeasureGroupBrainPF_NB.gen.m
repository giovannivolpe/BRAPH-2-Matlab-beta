%% ¡header!
MeasureGroupBrainPF_NB  < MeasureGroupBrainPF (pf, panel figure for nodal bilayer measure group brain) is a plot of a nodal bilayer measure group brain.

%%% ¡description!
A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_NB ) manages the plot of the nodal bilayer measure
 ploted over the brain.  
MeasureGroupBrainPF_NB  utilizes the surface created from BrainAtlasPF to integrate 
 the nodal bilayer meaure into the brain regions.

%%% ¡seealso!
BrainAtlas, BrainSurface, BrainAtlasPF

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NB .ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NB .LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NB .WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureGroupBrainPF_NB .NOTES
%%%% ¡title!
Brain Atlas NOTES

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure for measure group brain.
'MeasureGroupBrainPF_NB '

%%% ¡prop!
NAME (constant, string) is the name of the panel figure for measure group brain.
%%%% ¡default!
'Panel Figure for Measure Group Brain'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure for measure group brain.
%%%% ¡default!
'A Panel Figure for a Brain Measure of Analyze Group (MeasureGroupBrainPF_NB ) manages the plot of the nodal bilayer measure ploted over the brain. MeasureGroupBrainPF_NB  utilizes the surface created from BrainAtlasPF to integrate the nodal bilayer meaure into the brain regions.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure for measure group brain.
%%%% ¡settings!
'MeasureGroupBrainPF_NB '

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NB  ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NB  label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure for measure group brain.
%%%% ¡default!
'MeasureGroupBrainPF_NB  notes'

%%% ¡prop!
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@MeasureGroupBrainPF(pf, MeasureGroupBrainPF.DRAW, varargin{:}); % also warning
if value
    % reset the ambient lighting
    pf.get('ST_AMBIENT').get('SETUP')
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡calculate!
value = calculateValue@MeasureGroupBrainPF(pf, MeasureGroupBrainPF.DELETE, varargin{:}); % also warning
if value

end

%%% ¡prop!
SHOWMEASURE (figure, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡default!
false
%%%% ¡postset!
m = pf.get('M');
% update spheres
if ~pf.get('SHOWMEASURE')  % false
    if pf.get('SPHS') % spheres
        h_sphs = pf.get('H_SPHS');
        for i = 1:1:length(h_sphs)
            set(h_sphs{i}, 'SPHERESIZE', SettingsSphere.getPropDefault(SettingsSphere.SPHERESIZE))
        end     
    end
else % true
    % spheres
    if pf.get('SPHS') % spheres
        m_val = m.get('M');
        h_sphs = pf.get('H_SPHS');
        for i = 1:1:length(h_sphs)
            set(h_sphs{i}, 'SPHERESIZE', m_val{i});
        end     
    end
    % triggers the update of SPH_DICT
    pf.set('SPH_DICT', pf.get('SPH_DICT'))
end

% update state of toggle tool
toolbar = pf.get('H_TOOLBAR');
if check_graphics(toolbar, 'uitoolbar')
    set(findobj(toolbar, 'Tag', 'TOOL.SHOWMEASURE'), 'State', pf.get('SHOWMEASURE'))
end