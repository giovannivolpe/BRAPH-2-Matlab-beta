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

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure binodal unilayer group comparison on brain surface figure .
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
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@ComparisonGroupBrainPF(pf, ComparisonGroupBrainPF.DRAW, varargin{:}); % also warning
if value
    % reset the ambient lighting
    pf.get('ST_AMBIENT').get('SETUP')

    % call setup
    pf.get('SETUP');
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡calculate!
value = calculateValue@ComparisonGroupBrainPF(pf, ComparisonGroupBrainPF.DELETE, varargin{:}); % also warning
if value

end

%%% ¡prop!
SHOWMEASURE (figure, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡default!
false
%%%% ¡postset!
m = pf.get('CP');
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
        m_val = cell2mat(m.get('CP'));
        sphs = pf.get('SPH_DICT').get('IT_LIST');
        for i = 1:1:length(sphs)
            set(sphs{i}, 'SPHERESIZE', m_val(i)*0.1);
        end
    end
    % triggers the update of SPH_DICT
    pf.set('SPH_DICT', pf.get('SPH_DICT'))

    % symbols
    if pf.get('SYMS') % spheres
        m_val = cell2mat(m.get('CP'));
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
%%%__WARN_TBI__
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
[ComparisonGroupBrainPF_BU.PARENT ComparisonGroupBrainPF_BU.H ComparisonGroupBrainPF_BU.ST_POSITION ComparisonGroupBrainPF_BU.ST_AXIS ComparisonGroupBrainPF_BU.CP] 

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
