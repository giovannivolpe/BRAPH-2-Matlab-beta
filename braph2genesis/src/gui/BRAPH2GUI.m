function f_out = BRAPH2GUI()
%BRAPH2GUI opens the initial GUI for BRAPH 2. 
% It provides a list of all available pipelines with search functionalities.
%
% BRAPH2GUI() opens the initial GUI for BRAPH 2.
%
% F = BRAPH2GUI(TITLE, MESSAGE) returns a handle to the uifigure.
%
% See also braph2, uifigure.

f = uifigure( ...
    'Tag', 'f', ...
    'Visible', 'off', ...
    'WindowStyle', 'modal', ...
    'Resize', 'off', ...
    'Icon', 'braph2icon_64px.png', ...
    'Name', BRAPH2.NAME, ...
    'Color', BRAPH2.COL_BKG, ...
    'Units', 'pixels', ...
    'Position', [(w(0)-s(72))/2 (h(0)-s(45))/2 s(72) s(45)] ...
    );

icon = rgb2gray(imread('braph2icon.png'));
h_axes = uiaxes( ...
    'Parent', f,  ...
    'Tag', 'h_axes', ...
    'Visible', 'off', ...
    'InnerPosition', [s(1) s(20) s(24) s(24)], ...
    'XLim', [0 size(icon, 1)], ...
    'YLim', [0 size(icon, 2)], ...
    'YDir', 'reverse', ...
    'Colormap', [BRAPH2.COL_BKG; repmat(BRAPH2.COL, 254, 1); 1 1 1] ...
    );
h_image = image( ...
    'Parent', h_axes, ...
    'Tag', 'h_image', ...
    'CData', icon ...
    ); %#ok<NASGU>
h_axes.Toolbar.Visible = 'off';
h_axes.Interactions = [];
            
h_text_braph2 = text( ...
    'Parent', h_axes, ...
    'Tag', 'h_text', ...
    'String', ['{\bf\color{orange}' BRAPH2.NAME '}'], ...
    'FontSize', BRAPH2.FONTSIZE * 2, ...
    'Position', [size(icon, 1)/2 size(icon, 2)+BRAPH2.FONTSIZE*3], ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'middle' ...
    ); %#ok<NASGU>

h_text_credits = text( ...
    'Parent', h_axes, ...
    'Tag', 'h_text', ...
    'String', {
        ['{\color{gray}version ' BRAPH2.VERSION '}']
        ['{\color{gray}build ' int2str(BRAPH2.BUILD) '}']
        ['{\color{gray}' lower(BRAPH2.COPYRIGHT) '}']
        }, ...
    'FontSize', BRAPH2.FONTSIZE * 1.5, ...
    'Position', [size(icon, 1)/2 size(icon, 2)+BRAPH2.FONTSIZE*24], ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'middle' ...
    ); %#ok<NASGU>

% % % h_button = uibutton( ...
% % %     'Parent', f, ...
% % %     'Tag', 'h_button', ...
% % %     'Text', 'OK', ...
% % %     'FontSize', BRAPH2.FONTSIZE, ...
% % %     'Position', [s(5) s(7) s(8), s(1.8)], ...
% % %     'ButtonPushedFcn', {@cb_button}, ...
% % %     'Interruptible', 'off', ...
% % %     'BusyAction', 'cancel' ...
% % %     ); %#ok<NASGU>
% % %     function cb_button(~, ~)
% % %         close(f)
% % %     end

drawnow()
set(f, 'Visible', 'on')

if nargout > 0
    f_out = f;
end

end
