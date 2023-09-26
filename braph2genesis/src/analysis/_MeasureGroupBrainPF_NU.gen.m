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
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@MeasureGroupBrainPF(pf, MeasureGroupBrainPF.DRAW, varargin{:}); % also warning
if value
    % reset the ambient lighting
    pf.get('ST_AMBIENT').get('SETUP')

    % call setup
    pf.get('SETUP');
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
        sphs = pf.get('SPH_DICT').get('IT_LIST');
        for i = 1:1:length(sphs)
            set(sphs{i}, 'SPHERESIZE', SettingsSphere.getPropDefault(23))
        end
    end
    if pf.get('SYMS') % spheres
        syms = pf.get('SYM_DICT').get('IT_LIST');
        for i = 1:1:length(syms)
            set(syms{i}, 'SYMBOLSIZE', SettingsSymbol.getPropDefault(20))
        end
    end
else % true
    % spheres
    if pf.get('SPHS') % spheres
        m_val = cell2mat(m.get('M'));
        sphs = pf.get('SPH_DICT').get('IT_LIST');
        for i = 1:1:length(sphs)
            set(sphs{i}, 'SPHERESIZE', m_val(i)*0.1);
        end
    end
    % triggers the update of SPH_DICT
    pf.set('SPH_DICT', pf.get('SPH_DICT'))

    % symbols
    if pf.get('SYMS') % spheres
        m_val = cell2mat(m.get('M'));
        syms = pf.get('SYM_DICT').get('IT_LIST');
        for i = 1:1:length(syms)
            set(syms{i}, 'SYMBOLSIZE', m_val(i)*0.2)
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

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
value = [];

%% ¡props!
