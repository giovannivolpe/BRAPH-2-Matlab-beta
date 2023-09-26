%% ¡header!
MeasureEnsembleBrainPF_GU  < MeasureEnsembleBrainPF (pf, brain panel group comparison on brain surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
MeasureEnsembleBrainPF_GU manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasureEnsembleBrainPF_GU.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'MeasureEnsembleBrainPF_GU'

%%% ¡prop!
NAME (constant, string) is the name of the brain panel group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the brain panel group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GU manages the basic functionalities to plot of a group comparison on brain surface.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the brain panel group comparison on brain surface figure.
%%%% ¡settings!
'MeasureEnsembleBrainPF_GU'

%%% ¡prop!
ID (data, string) is a few-letter code for the brain panel group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the brain panel group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the brain panel group comparison on brain surface figure.
%%%% ¡default!
'MeasureEnsembleBrainPF_GU notes'

%%% ¡prop!
DRAW (query, logical) draws the figure comparison figure.
%%%% ¡calculate!
value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.DRAW, varargin{:}); % also warning
if value
    pf.memorize('H_AXES')

    pf.memorize('ST_AXIS').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_AXES).get('SETUP')
    pf.memorize('LISTENER_ST_AXIS');

    pf.memorize('H_AREA')
    pf.memorize('ST_AREA').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_AREA).get('SETUP')
    pf.memorize('LISTENER_ST_AREA');

    pf.memorize('H_LINE_DIFF')
    pf.memorize('ST_LINE_DIFF').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_LINE_DIFF).get('SETUP')
	pf.memorize('LISTENER_ST_LINE_DIFF');

    pf.memorize('H_LINE_CIL')
    pf.memorize('ST_LINE_CIL').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_LINE_CIL).get('SETUP')
	pf.memorize('LISTENER_ST_LINE_CIL');

    pf.memorize('H_LINE_CIU')
    pf.memorize('ST_LINE_CIU').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_LINE_CIU).get('SETUP')
	pf.memorize('LISTENER_ST_LINE_CIU');

    pf.memorize('H_TITLE')
    pf.memorize('ST_TITLE').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_TITLE).get('SETUP')

    pf.memorize('H_XLABEL')
    pf.memorize('ST_XLABEL').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_XLABEL).get('SETUP')

    pf.memorize('H_YLABEL')
    pf.memorize('ST_YLABEL').set('PANEL', pf, 'PROP', MeasureEnsembleBrainPF_GU.H_YLABEL).get('SETUP')

    pf.get('SETUP')
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the brain panel figure graph is deleted.
%%%% ¡calculate!
value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.DELETE, varargin{:}); % also warning
if value
    pf.set('H_AXES', Element.getNoValue())

    pf.set('LISTENER_ST_AXIS', Element.getNoValue())

    pf.set('H_AREA', Element.getNoValue())
    pf.set('LISTENER_ST_AREA', Element.getNoValue())

    pf.set('H_LINE_DIFF', Element.getNoValue())
    pf.set('LISTENER_ST_LINE_DIFF', Element.getNoValue())

    pf.set('H_LINE_CIL', Element.getNoValue())
    pf.set('LISTENER_ST_LINE_CIL', Element.getNoValue())

    pf.set('H_LINE_CIU', Element.getNoValue())
    pf.set('LISTENER_ST_LINE_CIU', Element.getNoValue())

    pf.set('H_TITLE', Element.getNoValue())

    pf.set('H_XLABEL', Element.getNoValue())

    pf.set('H_YLABEL', Element.getNoValue())
end

%%% ¡prop!
H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
%%%% ¡calculate!
toolbar = pf.memorize('H_TOOLBAR');
if check_graphics(toolbar, 'uitoolbar')
    value = calculateValue@BrainAtlasPF(pf, BrainAtlasPF.H_TOOLS);

    tool_separator_1 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');

    % Axis
    tool_axis = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Axis', ...
        'Separator', 'on', ...
        'State', pf.get('ST_AXIS').get('AXIS'), ...
        'Tooltip', 'Show axis', ...
        'CData', imread('icon_axis.png'), ...
        'OnCallback', {@cb_axis, true}, ...
        'OffCallback', {@cb_axis, false});

    % Grid
    tool_grid = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Grid', ...
        'State', pf.get('ST_AXIS').get('GRID'), ...
        'Tooltip', 'Show grid', ...
        'CData', imread('icon_grid.png'), ...
        'OnCallback', {@cb_grid, true}, ...
        'OffCallback', {@cb_grid, false});

    tool_separator_2 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');

    % Difference Line
    tool_line_diff = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Line_Diff', ...
        'State', pf.get('ST_LINE_DIFF').get('VISIBLE'), ...
        'Tooltip', 'Show difference line', ...
        'CData', imresize(imread('icon_line.png'), [24 24]), ... % % % make icon 16x16
        'OnCallback', {@cb_line_diff, true}, ...
        'OffCallback', {@cb_line_diff, false});

    % Difference Line
    tool_line_ci = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Line_CI', ...
        'State', pf.get('ST_LINE_DIFF').get('VISIBLE'), ...
        'Tooltip', 'Show confidence lines (95%)', ...
        'CData', imresize(imread('icon_line.png'), [24 24]), ... % % % imread('icon_lines_two.png'), ...
        'OnCallback', {@cb_line_ci, true}, ...
        'OffCallback', {@cb_line_ci, false});

    % Confidence Area
    tool_area = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Area', ...
        'State', pf.get('ST_AREA').get('VISIBLE'), ...
        'Tooltip', 'Show confidence area (95%)', ...
        'CData', imresize(imread('icon_area.png'), [24 24]), ... % % % make icon 16x16
        'OnCallback', {@cb_area, true}, ...
        'OffCallback', {@cb_area, false});

    value = {value{:}, ...
        tool_separator_1, ...
        tool_axis, tool_grid, ... 
        tool_separator_2, ... 
        tool_line_diff, tool_line_ci, tool_area ...
        };
else
    value = {};
end
%%%% ¡calculate_callbacks!
function cb_axis(~, ~, axis) % (src, event)
    pf.get('ST_AXIS').set('AXIS', axis);

    % triggers the update of ST_AXIS
    pf.set('ST_AXIS', pf.get('ST_AXIS'))
end
function cb_grid(~, ~, grid) % (src, event)
    pf.get('ST_AXIS').set('GRID', grid);

    % triggers the update of ST_AXIS
    pf.set('ST_AXIS', pf.get('ST_AXIS'))
end
function cb_line_diff(~, ~, visible) % (src, event)
	pf.get('ST_LINE_DIFF').set('VISIBLE', visible)

    % triggers the update of ST_LINE_DIFF
    pf.set('ST_LINE_DIFF', pf.get('ST_LINE_DIFF'))
end
function cb_line_ci(~, ~, visible) % (src, event)
	pf.get('ST_LINE_CIL').set('VISIBLE', visible)
	pf.get('ST_LINE_CIU').set('VISIBLE', visible)

    % triggers the update of ST_LINE_CIL and ST_LINE_CIU
    pf.set('ST_LINE_CIL', pf.get('ST_LINE_CIL'))
    pf.set('ST_LINE_CIU', pf.get('ST_LINE_CIU'))
end
function cb_area(~, ~, visible) % (src, event)
    pf.get('ST_AREA').set('VISIBLE', visible)

    % triggers the update of ST_AREA
    pf.set('ST_AREA', pf.get('ST_AREA'))
end

%% ¡props!

%%%% ¡gui!
pr = SettingsAxisPP('EL', pf, 'PROP', MeasureEnsembleBrainPF_GU.ST_AXIS, varargin{:});

%% ¡tests!

%%% ¡excluded_props!
[MeasureEnsembleBrainPF_GU.PARENT MeasureEnsembleBrainPF_GU.H MeasureEnsembleBrainPF_GU.ST_POSITION MeasureEnsembleBrainPF_GU.ST_AXIS MeasureEnsembleBrainPF_GU.ST_AREA MeasureEnsembleBrainPF_GU.ST_LINE_DIFF MeasureEnsembleBrainPF_GU.ST_LINE_CIL MeasureEnsembleBrainPF_GU.ST_LINE_CIU MeasureEnsembleBrainPF_GU.ST_TITLE MeasureEnsembleBrainPF_GU.ST_XLABEL MeasureEnsembleBrainPF_GU.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasureEnsembleBrainPF_GU'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasureEnsembleBrainPF_GU'])