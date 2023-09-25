%% ¡header!
ComparisonGroupBrainPF < BrainAtlasPF (bapf, brain group comparison on brain surface figure) is the base element to plot a group comparison on brain surface.

%%% ¡description!
ComparisonGroupBrainPF manages the basic functionalities to plot of a group comparison on brain surface.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonGroupBrainPF'

%%% ¡prop!
NAME (constant, string) is the name of the panel group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF manages the basic functionalities to plot of a group comparison on brain surface.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF notes'

%%% ¡prop!
DRAW (query, logical) draws the figure comparison figure.
%%%% ¡calculate!
value = calculateValue@PanelFig(bapf, BrainAtlasPF.DRAW, varargin{:}); % also warning
if value
    bapf.memorize('H_AXES')
    
    bapf.memorize('ST_AXIS').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_AXES).get('SETUP')
    bapf.memorize('LISTENER_ST_AXIS');
    
    bapf.memorize('H_AREA')
    bapf.memorize('ST_AREA').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_AREA).get('SETUP')
    bapf.memorize('LISTENER_ST_AREA');

    bapf.memorize('H_LINE_DIFF')
    bapf.memorize('ST_LINE_DIFF').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_LINE_DIFF).get('SETUP')
	bapf.memorize('LISTENER_ST_LINE_DIFF');
    
    bapf.memorize('H_LINE_CIL')
    bapf.memorize('ST_LINE_CIL').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_LINE_CIL).get('SETUP')
	bapf.memorize('LISTENER_ST_LINE_CIL');

    bapf.memorize('H_LINE_CIU')
    bapf.memorize('ST_LINE_CIU').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_LINE_CIU).get('SETUP')
	bapf.memorize('LISTENER_ST_LINE_CIU');

    bapf.memorize('H_TITLE')
    bapf.memorize('ST_TITLE').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_TITLE).get('SETUP')

    bapf.memorize('H_XLABEL')
    bapf.memorize('ST_XLABEL').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_XLABEL).get('SETUP')
    
    bapf.memorize('H_YLABEL')
    bapf.memorize('ST_YLABEL').set('PANEL', bapf, 'PROP', ComparisonGroupBrainPF.H_YLABEL).get('SETUP')

    bapf.get('SETUP')
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel figure graph is deleted.
%%%% ¡calculate!
value = calculateValue@PanelFig(bapf, PanelFig.DELETE, varargin{:}); % also warning
if value
    bapf.set('H_AXES', Element.getNoValue())

    bapf.set('LISTENER_ST_AXIS', Element.getNoValue())
    
    bapf.set('H_AREA', Element.getNoValue())
    bapf.set('LISTENER_ST_AREA', Element.getNoValue())
 
    bapf.set('H_LINE_DIFF', Element.getNoValue())
    bapf.set('LISTENER_ST_LINE_DIFF', Element.getNoValue())

    bapf.set('H_LINE_CIL', Element.getNoValue())
    bapf.set('LISTENER_ST_LINE_CIL', Element.getNoValue())

    bapf.set('H_LINE_CIU', Element.getNoValue())
    bapf.set('LISTENER_ST_LINE_CIU', Element.getNoValue())

    bapf.set('H_TITLE', Element.getNoValue())

    bapf.set('H_XLABEL', Element.getNoValue())
    
    bapf.set('H_YLABEL', Element.getNoValue())
end

%%% ¡prop!
H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
%%%% ¡calculate!
toolbar = bapf.memorize('H_TOOLBAR');
if check_graphics(toolbar, 'uitoolbar')
    value = calculateValue@BrainAtlasPF(bapf, BrainAtlasPF.H_TOOLS);
    
    tool_separator_1 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');

    % Axis
    tool_axis = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Axis', ...
        'Separator', 'on', ...
        'State', bapf.get('ST_AXIS').get('AXIS'), ...
        'Tooltip', 'Show axis', ...
        'CData', imread('icon_axis.png'), ...
        'OnCallback', {@cb_axis, true}, ...
        'OffCallback', {@cb_axis, false});

    % Grid
    tool_grid = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Grid', ...
        'State', bapf.get('ST_AXIS').get('GRID'), ...
        'Tooltip', 'Show grid', ...
        'CData', imread('icon_grid.png'), ...
        'OnCallback', {@cb_grid, true}, ...
        'OffCallback', {@cb_grid, false});

    tool_separator_2 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');
    
    % Difference Line
    tool_line_diff = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Line_Diff', ...
        'State', bapf.get('ST_LINE_DIFF').get('VISIBLE'), ...
        'Tooltip', 'Show difference line', ...
        'CData', imresize(imread('icon_line.png'), [24 24]), ... % % % make icon 16x16
        'OnCallback', {@cb_line_diff, true}, ...
        'OffCallback', {@cb_line_diff, false});

    % Difference Line
    tool_line_ci = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Line_CI', ...
        'State', bapf.get('ST_LINE_DIFF').get('VISIBLE'), ...
        'Tooltip', 'Show confidence lines (95%)', ...
        'CData', imresize(imread('icon_line.png'), [24 24]), ... % % % imread('icon_lines_two.png'), ...
        'OnCallback', {@cb_line_ci, true}, ...
        'OffCallback', {@cb_line_ci, false});
    
    % Confidence Area
    tool_area = uitoggletool(toolbar, ...
        'Tag', 'TOOL.Area', ...
        'State', bapf.get('ST_AREA').get('VISIBLE'), ...
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
    bapf.get('ST_AXIS').set('AXIS', axis);
    
    % triggers the update of ST_AXIS
    bapf.set('ST_AXIS', bapf.get('ST_AXIS'))
end
function cb_grid(~, ~, grid) % (src, event)
    bapf.get('ST_AXIS').set('GRID', grid);

    % triggers the update of ST_AXIS
    bapf.set('ST_AXIS', bapf.get('ST_AXIS'))
end
function cb_line_diff(~, ~, visible) % (src, event)
	bapf.get('ST_LINE_DIFF').set('VISIBLE', visible)

    % triggers the update of ST_LINE_DIFF
    bapf.set('ST_LINE_DIFF', bapf.get('ST_LINE_DIFF'))
end
function cb_line_ci(~, ~, visible) % (src, event)
	bapf.get('ST_LINE_CIL').set('VISIBLE', visible)
	bapf.get('ST_LINE_CIU').set('VISIBLE', visible)

    % triggers the update of ST_LINE_CIL and ST_LINE_CIU
    bapf.set('ST_LINE_CIL', bapf.get('ST_LINE_CIL'))
    bapf.set('ST_LINE_CIU', bapf.get('ST_LINE_CIU'))
end
function cb_area(~, ~, visible) % (src, event)
    bapf.get('ST_AREA').set('VISIBLE', visible)

    % triggers the update of ST_AREA
    bapf.set('ST_AREA', bapf.get('ST_AREA'))
end

%% ¡props!

%%% ¡prop!
H_AXES (evanescent, handle) is the handle for the axes.
%%%% ¡calculate!
h_axes = uiaxes( ...
    'Parent', bapf.memorize('H'), ...
    'Tag', 'H_AXES', ...
    'Units', 'normalized', ...
    'OuterPosition', [.2 .2 .6 .6] ... % % % %TODO transform this into a prop?
    );
h_axes.Toolbar.Visible = 'off';
h_axes.Interactions = [];
box(h_axes, 'on')
hold(h_axes, 'on')
value = h_axes;

%%% ¡prop!
ST_AXIS (figure, item) determines the axis settings.
%%%% ¡settings!
'SettingsAxis'
%%%% ¡default!
SettingsAxis('AXIS', true, 'GRID', false, 'EQUAL', false)
%%%% ¡postset!
if bapf.get('DRAWN')
    toolbar = bapf.get('H_TOOLBAR');
    if check_graphics(toolbar, 'uitoolbar')
        set(findobj(toolbar, 'Tag', 'TOOL.Grid'), 'State', bapf.get('ST_AXIS').get('GRID'))
        set(findobj(toolbar, 'Tag', 'TOOL.Axis'), 'State', bapf.get('ST_AXIS').get('AXIS'))
    end
end
%%%% ¡gui!
pr = SettingsAxisPP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_AXIS, varargin{:});

%%% ¡prop!
LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
%%%% ¡calculate!
value = listener(bapf.get('ST_AXIS'), 'PropSet', @cb_listener_st_axis); 
%%%% ¡calculate_callbacks!
function cb_listener_st_axis(~, ~)
    if bapf.get('DRAWN')
        toolbar = bapf.get('H_TOOLBAR');
        if check_graphics(toolbar, 'uitoolbar')
            set(findobj(toolbar, 'Tag', 'TOOL.Grid'), 'State', bapf.get('ST_AXIS').get('GRID'))
            set(findobj(toolbar, 'Tag', 'TOOL.Axis'), 'State', bapf.get('ST_AXIS').get('AXIS'))
        end
    end
end

%%% ¡prop!
CP (metadata, item) is the group comparison on brain surface.
%%%% ¡settings!
'ComparisonGroup'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface value and stores it to be implemented in the subelements.
%%%% ¡calculate!
value = [];

%%% ¡prop!
H_AREA (evanescent, handle) is the handle for the group comparison on brain surface confidence area.
%%%% ¡calculate!
value = fill(bapf.get('H_AXES'), [0], [0], 'k');

%%% ¡prop!
ST_AREA (figure, item) determines the area settings.
%%%% ¡settings!
'SettingsArea'
%%%% ¡gui!
pr = SettingsAreaPP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_AREA, varargin{:});

%%% ¡prop!
LISTENER_ST_AREA (evanescent, handle) contains the listener to the measure area settings to update the pushbutton.
%%%% ¡calculate!
value = listener(bapf.get('ST_AREA'), 'PropSet', @cb_listener_st_area); 
%%%% ¡calculate_callbacks!
function cb_listener_st_area(~, ~)
    if bapf.get('DRAWN')
        toolbar = bapf.get('H_TOOLBAR');
        if check_graphics(toolbar, 'uitoolbar')
            set(findobj(toolbar, 'Tag', 'TOOL.Area'), 'State', bapf.get('ST_AREA').get('VISIBLE'))
        end
    end
end

%%% ¡prop!
H_LINE_DIFF (evanescent, handle) is the handle for the group comparison on brain surface line.
%%%% ¡calculate!
value = plot(bapf.get('H_AXES'), [0], [0], 'b', 'LineWidth', 2);

%%% ¡prop!
ST_LINE_DIFF (figure, item) determines the line settings.
%%%% ¡settings!
'SettingsLine'
%%%% ¡gui!
pr = SettingsLinePP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_LINE_DIFF, varargin{:});

%%% ¡prop!
LISTENER_ST_LINE_DIFF (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
%%%% ¡calculate!
value = listener(bapf.get('ST_LINE_DIFF'), 'PropSet', @cb_listener_st_line_diff); 
%%%% ¡calculate_callbacks!
function cb_listener_st_line_diff(~, ~)
    if bapf.get('DRAWN')
        toolbar = bapf.get('H_TOOLBAR');
        if check_graphics(toolbar, 'uitoolbar')
            set(findobj(toolbar, 'Tag', 'TOOL.Line_DIff'), 'State', bapf.get('ST_LINE_DIFF').get('VISIBLE'))
        end
    end
end

%%% ¡prop!
H_LINE_CIL (evanescent, handle) is the handle for the lower confidence interval of the group comparison on brain surface line.
%%%% ¡calculate!
value = plot(bapf.get('H_AXES'), [0], [0], 'b', 'LineWidth', 2);

%%% ¡prop!
ST_LINE_CIL (figure, item) determines the line settings.
%%%% ¡settings!
'SettingsLine'
%%%% ¡default!
SettingsLine('SYMBOLSIZE', 6, 'FACECOLOR', [.5 .5 .5])
%%%% ¡gui!
pr = SettingsLinePP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_LINE_CIL, varargin{:});

%%% ¡prop!
LISTENER_ST_LINE_CIL (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
%%%% ¡calculate!
value = listener(bapf.get('ST_LINE_DIFF'), 'PropSet', @cb_listener_st_line_cil); 
%%%% ¡calculate_callbacks!
function cb_listener_st_line_cil(~, ~)
    if bapf.get('DRAWN')
        toolbar = bapf.get('H_TOOLBAR');
        if check_graphics(toolbar, 'uitoolbar')
            set(findobj(toolbar, 'Tag', 'TOOL.Line_CI'), 'State', bapf.get('ST_LINE_CIL').get('VISIBLE'))
        end
    end
end

%%% ¡prop!
H_LINE_CIU (evanescent, handle) is the handle for the upper confidence interval of the group comparison on brain surface line.
%%%% ¡calculate!
value = plot(bapf.get('H_AXES'), [0], [0], 'b', 'LineWidth', 2);

%%% ¡prop!
ST_LINE_CIU (figure, item) determines the line settings.
%%%% ¡settings!
'SettingsLine'
%%%% ¡default!
SettingsLine('SYMBOLSIZE', 6, 'FACECOLOR', [.5 .5 .5])
%%%% ¡gui!
pr = SettingsLinePP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_LINE_CIU, varargin{:});

%%% ¡prop!
LISTENER_ST_LINE_CIU (evanescent, handle) contains the listener to the measure line settings to update the pushbutton.
%%%% ¡calculate!
value = listener(bapf.get('ST_LINE_CIU'), 'PropSet', @cb_listener_st_line_ciu); 
%%%% ¡calculate_callbacks!
function cb_listener_st_line_ciu(~, ~)
    if bapf.get('DRAWN')
        toolbar = bapf.get('H_TOOLBAR');
        if check_graphics(toolbar, 'uitoolbar')
            set(findobj(toolbar, 'Tag', 'TOOL.Line_CI'), 'State', bapf.get('ST_LINE_CIU').get('VISIBLE'))
        end
    end
end

%%% ¡prop!
H_TITLE (evanescent, handle) is the axis title.
%%%% ¡calculate!
value = title(bapf.get('H_AXES'), '');

if isa(bapf.getr('ST_TITLE'), 'NoValue')
    st = bapf.memorize('ST_TITLE');
    
    position = get(value, 'Position');
    st.set( ...
        'TXT', bapf.get('CP').get('LABEL'), ...
        'X', position(1), ...
        'Y', position(2), ...
        'Z', position(3) ...
        )
end

%%% ¡prop!
ST_TITLE (figure, item) determines the title settings.
%%%% ¡settings!
'SettingsText'
%%%% ¡default!
SettingsText('VISIBLE', true, 'FONTSIZE', s(2), 'HALIGN', 'center', 'VALIGN', 'middle')
%%%% ¡gui!
pr = SettingsTextPP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_TITLE, varargin{:});

%%% ¡prop!
H_XLABEL (evanescent, handle) is the axis x-label.
%%%% ¡calculate!
value = xlabel(bapf.get('H_AXES'), '');

if isa(bapf.getr('ST_XLABEL'), 'NoValue')
    st = bapf.memorize('ST_XLABEL');
    
    position = get(value, 'Position');
    st.set( ...
        'TXT', 'Layer', ...
        'X', position(1), ...
        'Y', position(2), ...
        'Z', position(3) ...
        )
end

%%% ¡prop!
ST_XLABEL (figure, item) determines the x-label settings.
%%%% ¡settings!
'SettingsText'
%%%% ¡default!
SettingsText('VISIBLE', true, 'FONTSIZE', s(2), 'HALIGN', 'center', 'VALIGN', 'middle')
%%%% ¡gui!
pr = SettingsTextPP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_XLABEL, varargin{:});

%%% ¡prop!
H_YLABEL (evanescent, handle) is the axis y-label.
%%%% ¡calculate!
value = ylabel(bapf.get('H_AXES'), '');

if isa(bapf.getr('ST_YLABEL'), 'NoValue')
    st = bapf.memorize('ST_YLABEL');
    
    position = get(value, 'Position');
    st.set( ...
        'TXT', 'Difference', ...
        'X', position(1), ...
        'Y', position(2), ...
        'Z', position(3) ...
        )
end

%%% ¡prop!
ST_YLABEL (figure, item) determines the y-label settings.
%%%% ¡settings!
'SettingsText'
%%%% ¡default!
SettingsText('VISIBLE', true, 'FONTSIZE', s(2), 'HALIGN', 'center', 'VALIGN', 'middle', 'ROTATION', 90)
%%%% ¡gui!
pr = SettingsTextPP('EL', bapf, 'PROP', ComparisonGroupBrainPF.ST_YLABEL, varargin{:});

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF.PARENT ComparisonGroupBrainPF.H ComparisonGroupBrainPF.ST_POSITION ComparisonGroupBrainPF.ST_AXIS ComparisonGroupBrainPF.ST_AREA ComparisonGroupBrainPF.ST_LINE_DIFF ComparisonGroupBrainPF.ST_LINE_CIL ComparisonGroupBrainPF.ST_LINE_CIU ComparisonGroupBrainPF.ST_TITLE ComparisonGroupBrainPF.ST_XLABEL ComparisonGroupBrainPF.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF'])