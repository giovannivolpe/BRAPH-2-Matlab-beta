%% ¡header!
PanelPropNet < PanelProp (pr, panel property net) plots the panel of a property neural network.

%%% ¡description!
PanelPropNet plots the panel for a NET property with a button.
 It works for all categories. 

%%% ¡seealso!
uibutton, GUI, PanelElement, PanelProp

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the neural network property panel.
%%%% ¡default!
'PanelPropNet'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the neural network property panel.
%%%% ¡default!
'PanelPropNet plots the panel for a NET property with a button. It works for all categories. '

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the neural network property panel.
%%%% ¡settings!
'PanelPropNet'

%%% ¡prop!
ID (data, string) is a few-letter code for the neural network property panel.
%%%% ¡default!
'PanelPropNet ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the neural network property panel.
%%%% ¡default!
'PanelPropNet label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the neural network property panel.
%%%% ¡default!
'PanelPropNet notes'

%%% ¡prop!
EL (data, item) is the element.
%%%% ¡default!
PanelProp()

%%% ¡prop!
PROP (data, scalar) is the property number.
%%%% ¡default!
PanelProp.EL

%%% ¡prop!
HEIGHT (gui, size) is the pixel height of the property panel.
%%%% ¡default!
s(4)

%%% ¡prop!
X_DRAW (query, logical) draws the property panel.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.X_DRAW, varargin{:}); % also warning
if value
    pr.memorize('BUTTON')
end

%%% ¡prop!
UPDATE (query, logical) updates the content and permissions of the button.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.UPDATE, varargin{:}); % also warning
if value
    el = pr.get('EL');
    prop = pr.get('PROP');
    
    if ~isa(pr.getr('BUTTON_TEXT'), 'NoValue')
        button_text = pr.get('BUTTON_TEXT');
    else % isa(pr.getr('BUTTON_TEXT'), 'NoValue')
        if isa(el.getr(prop), 'NoValue')
            button_text = el.getPropDefault(prop).Name;
        else
            button_text = 'Trained neural network';;
        end
    end
    
    switch el.getPropCategory(prop)
        case {Category.CONSTANT, Category.METADATA, Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
            set(pr.get('BUTTON'), ...
                'Text', button_text ...
                )
        
        case {Category.RESULT Category.QUERY Category.EVANESCENT}
            if isa(el.getr(prop), 'NoValue')
                set(pr.get('BUTTON'), ...
                    'Text', button_text, ...
                    'Enable', 'off' ...
                    )
            else
                set(pr.get('BUTTON'), ...
                    'Text', button_text, ...
                    'Enable', 'on' ...
                    )
            end
    end
end

%%% ¡prop!
REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.REDRAW, varargin{:}); % also warning
if value
    w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
    
    set(pr.get('BUTTON'), 'Position', [s(.3) s(.3) .70*w_p s(1.75)])
end

%%% ¡prop!
DELETE (query, logical) resets the handles and closes the dependent figures when the panel is deleted.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.DELETE, varargin{:}); % also warning
if value
    pr.set('BUTTON', Element.getNoValue())
end

%% ¡props!

%%% ¡prop!
BUTTON_TEXT (gui, string) is the button text.

%%% ¡prop!
BUTTON (evanescent, handle) is the logical value dropdown.
%%%% ¡calculate!
el = pr.get('EL');
prop = pr.get('PROP');

button = uibutton( ...
    'Parent', pr.memorize('H'), ... % H = p for Panel
    'Tag', 'BUTTON', ...
    'Text', '', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
    'ButtonPushedFcn', {@cb_button}, ...
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    );

value = button;
%%%% ¡calculate_callbacks!
function cb_button(~, ~)
    el = pr.get('EL');
    prop = pr.get('PROP');
    net = el.memorize(prop);
    
    warningDlg =  warndlg({
        [BRAPH2.STR ':' pr.get('NAME')], ...
        [BRAPH2.STR ':' class(el) newline ...
        'Please be aware that the network visualization window will open upon clicking the button. Note that this window cannot be closed automatically and requires manual closure by the user. It is your responsibility to close the window, as our software does not have control over closing it.']
        }, ...
        'Network Visualization Warning', 'modal');
    uiwait(warningDlg);
    
    analyzeNetwork(net);
end

%% ¡tests!

%%% ¡excluded_props!
[PanelPropNet.PARENT PanelPropNet.H PanelPropNet.LISTENER_CB PanelPropNet.EL PanelPropNet.BUTTON_TEXT PanelPropNet.BUTTON]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':PanelPropNet'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':PanelPropNet'])
