function f_out = BRAPH2GUI()
%BRAPH2GUI opens the initial GUI for BRAPH 2. 
% It provides a list of all available pipelines with search functionalities.
%
% BRAPH2GUI() opens the initial GUI for BRAPH 2.
%
% F = BRAPH2GUI(TITLE, MESSAGE) returns a handle to the uifigure.
%
% See also braph2, uifigure.

%% Initialization
f = uifigure( ...
    'Tag', 'F', ...
    'Visible', 'off', ...
    'WindowStyle', 'modal', ...
    'Resize', 'off', ...
    'Icon', 'braph2icon_64px.png', ...
    'Name', BRAPH2.NAME, ...
    'Color', BRAPH2.COL_BKG, ...
    'Units', 'pixels', ...
    'Position', [(w(0)-s(72))/2 (h(0)-s(45))/2 s(72) s(45)] ...
    );

%% Left Column - Logo& Info
icon = rgb2gray(imread('braph2icon.png'));
h_axes = uiaxes( ...
    'Parent', f,  ...
    'Tag', 'H_AXES', ...
    'Visible', 'off', ...
    'InnerPosition', [s(1) s(20) s(24) s(24)], ...
    'XLim', [0 size(icon, 1)], ...
    'YLim', [0 size(icon, 2)], ...
    'YDir', 'reverse', ...
    'Colormap', [BRAPH2.COL_BKG; repmat(BRAPH2.COL, 254, 1); 1 1 1] ...
    );
h_image = image( ...
    'Parent', h_axes, ...
    'Tag', 'H_IMAGE', ...
    'CData', icon ...
    ); %#ok<NASGU>
h_axes.Toolbar.Visible = 'off';
h_axes.Interactions = [];
            
h_text_braph2 = text( ...
    'Parent', h_axes, ...
    'Tag', 'H_TEXT_BRAPH2', ...
    'String', ['{\bf\color{orange}' BRAPH2.NAME '}'], ...
    'FontSize', BRAPH2.FONTSIZE * 2.5, ...
    'Position', [size(icon, 1)/2 size(icon, 2)], ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'top' ...
    ); %#ok<NASGU>

h_text_credits = text( ...
    'Parent', h_axes, ...
    'Tag', 'H_TEXT_CREDITS', ...
    'String', {
        ['{\color{gray}version ' BRAPH2.VERSION '}']
        ['{\color{gray}build ' int2str(BRAPH2.BUILD) '}']
        ['{\color{gray}released ' BRAPH2.RELEASE '}']
        ['{\color{gray}' lower(BRAPH2.COPYRIGHT) '}']
        }, ...
    'FontSize', BRAPH2.FONTSIZE * 1.5, ...
    'Position', [size(icon, 1)/2 1.2*size(icon, 2)], ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'top' ...
    ); %#ok<NASGU>


%% Bottom Buttons

dw = 1; % horizonthal spacing around buttons
bw =  w(f) / 7 - 2 * dw; % button width

dh = 5; % vertical spacing around buttons
bh = h(f) / 10; % button height

h_button_pip = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_PIP', ...
    'Tooltip', 'Open a Pipeline (*.braph2) ...', ...
    'Text', '', ...
    'Icon', imread('icon_load_pip_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw dh bw bh], ...
    'BackgroundColor', [1 1 1], ...    
    'ButtonPushedFcn', {@cb_button_pip}, ...
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_button_pip(~, ~)
% % %         [file, path, filterindex] = uigetfile(BRAPH2.EXT_PIPELINE, 'Select the file to load a pipeline.'); %#ok<NBRAK,CCAT>
% % %         if filterindex
% % %             set(ui_checkbox_bottom_animation, 'Value', false)
% % %             filename = fullfile(path, file);
% % %             pipe = ImporterPipelineBRAPH2( ...
% % %                 'ID', 'Import BRAPH2 Pipeline', ...
% % %                 'WAITBAR', true, ...
% % %                 'File', filename ...
% % %                 ).get('Pip');
% % %             set(ui_checkbox_bottom_animation, 'Value', false)
% % %             pipeline_guis{end+1} =  GUIElement('PE', pipe, 'FILE', filename).draw();
% % %         end
disp('cb_button_pip')
    end

h_button_el = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_EL', ...
    'Tooltip', 'Load an Element (*.b2) into MatLab workspace ...', ...
    'Text', '', ...
    'Icon', imread('icon_load_el_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+(2*dw+bw) dh bw bh], ...
    'BackgroundColor', [1 1 1], ...    
    'ButtonPushedFcn', {@cb_button_el}, ...
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_button_el(~, ~)
% % %         [file, path, filterindex] = uigetfile(BRAPH2.EXT_ELEMENT, ['Select the .b2 file.']);
% % %         if filterindex
% % %             filename = fullfile(path, file);
% % %             tmp = load(filename, '-mat', 'el');
% % %             set(ui_checkbox_bottom_animation, 'Value', false)
% % %             GUIElement('PE', tmp.el, 'FILE', filename).draw();
% % %         end
disp('cb_button_el')
    end

h_button_web = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_WEB', ...
    'Tooltip', 'Open braph.org ...', ...
    'Text', '', ...
    'Icon', imread('icon_web_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+2*(2*dw+bw) dh bw bh], ...
    'ButtonPushedFcn', {@cb_web}, ...
    'BackgroundColor', [1 1 1], ...    
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_web(~, ~)
        BRAPH2.web()
    end

h_button_forum = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_FORUM', ...
    'Tooltip', 'Open BRAPH2 forum ...', ...
    'Text', '', ...
    'Icon', imread('icon_forum_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+3*(2*dw+bw) dh bw bh], ...
    'ButtonPushedFcn', {@cb_forum}, ...
    'BackgroundColor', [1 1 1], ...    
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_forum(~, ~)
        BRAPH2.forum()
    end

h_button_twitter = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_TWITTER', ...
    'Tooltip', 'Open BRAPH2 twitter ...', ...
    'Text', '', ...
    'Icon', imread('icon_twitter_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+4*(2*dw+bw) dh bw bh], ...
    'ButtonPushedFcn', {@cb_twitter}, ...
    'BackgroundColor', [1 1 1], ...    
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_twitter(~, ~)
        BRAPH2.twitter()
    end

h_button_license = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_LICENSE', ...
    'Tooltip', 'BRAPH2 license ...', ...
    'Text', '', ...
    'Icon', imread('icon_license_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+5*(2*dw+bw) dh bw bh], ...
    'ButtonPushedFcn', {@cb_license}, ...
    'BackgroundColor', [1 1 1], ...    
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_license(~, ~)
        BRAPH2.license()
    end

h_button_about = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON_ABOUT', ...
    'Tooltip', 'About BRAPH2 ...', ...
    'Text', '', ...
    'Icon', imread('icon_about_32px.png'), ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [dw+6*(2*dw+bw) dh bw bh], ...
    'ButtonPushedFcn', {@cb_about}, ...
    'BackgroundColor', [1 1 1], ...    
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_about(~, ~)
        BRAPH2.credits();
    end

%% Right Column - Pipelines

h_editfield = uieditfield( ...
    'Parent', f, ...
    'Tag', 'H_EDITFIELD', ...
    'Tooltip', 'Write the keywords describing the pipeline you are looking for', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [w(h_axes) .9*h(f) .9*w(f)-w(h_axes) 2*BRAPH2.FONTSIZE], ...
    'ValueChangedFcn', {@cb_editfield} ...
    ); %#ok<NASGU>
    function cb_editfield(~, ~)
        % % %
disp('cb_editfield')
    end

h_dropdown = uilistbox( ...
    'Parent', f, ...
    'Tag', 'H_DROPDOWN', ...
    'Tooltip', 'Available pipelines', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [w(h_axes) .4*h(f) .9*w(f)-w(h_axes) .5*h(f)], ...
    'ValueChangedFcn', {@cb_listbox_selected} ... % % % 'DoubleClickedFcn', {@cb_listbox_clicked} ...
    ); %#ok<NASGU>
    function cb_listbox_selected(~, ~)
        % % % 
disp('cb_listbox_selected')
    end
% % %     function cb_listbox_clicked(~, ~)
% % %         % % % 
% % %     end

h_label = uilabel( ...
    'Parent', f, ...
    'Tag', 'H_LABEL', ...
    'Tooltip', 'Selected pipeline info', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [w(h_axes) .2*h(f) .9*w(f)-w(h_axes) .2*h(f)], ...
    'Interpreter', 'html', ...
    'VerticalAlignment', 'top' ...
    ); %#ok<NASGU>

h_button = uibutton( ...
    'Parent', f, ...
    'Tag', 'H_BUTTON', ...
    'Tooltip', 'Open selected pipeline ...', ...
    'Text', 'Open selected pipeline ...', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Position', [w(h_axes) .15*h(f) .9*w(f)-w(h_axes) .05*h(f)], ...
    'ButtonPushedFcn', {@cb_button}, ...
    'Interruptible', 'off', ...
    'BusyAction', 'cancel' ...
    ); %#ok<NASGU>
    function cb_button(~, ~)
        % % %
disp('cb_button')
    end

set(h_label, 'Text', sprintf('%s\n%s','<strong>Line 1</strong>','Line 2','Line 1','Line 2','Line 1','Line 2','Line 1','Line 2'))

%% Finalization
drawnow()
set(f, 'Visible', 'on')

if nargout > 0
    f_out = f;
end

end