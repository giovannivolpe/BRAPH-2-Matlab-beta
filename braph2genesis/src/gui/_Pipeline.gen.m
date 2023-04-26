%% ¡header!
Pipeline < ConcreteElement (pip, analysis pipeline) is an analysis pipeline.

%%% ¡description!
Pipeline is an analysis pipeline.

%%% ¡seealso!
PipelinePP_PSDict, PipelineSection, PipelineCode

%% ¡gui!

%%% ¡menu_import!
uimenu(menu_import, ...
    'Tag', 'MENU.Import.BRAPH2', ...
    'Label', 'Import BRAPH2 ...', ...
    'Callback', {@cb_importer_BRAPH2});
function cb_importer_BRAPH2(~, ~)
    try
        im = ImporterPipelineBRAPH2('ID', 'Import BRAPH2 Pipeline', 'WAITBAR', true).get('GET_FILE');
        pip = pe.get('EL');
        gui = GUIElement('PE', ba);
        gui.get('DRAW')
        gui.get('SHOW')
    catch e
        % % % %TODO implement and use braph2msgbox instead of warndlg
        warndlg(['Please, select a valid input Pipeline in BRAPH2 format. ' newline() ...
            newline() ...
            'Error message:' newline() ...
            newline() ...
            e.message newline()], 'Warning');
    end
end

%%% ¡menu_export!
uimenu(menu_export, ...
    'Tag', 'MENU.Export.BRAPH2', ...
    'Label', 'Export BRAPH2 ...', ...
    'Callback', {@cb_exporter_BRAPH2});
function cb_exporter_BRAPH2(~, ~)
    ex = ExporterPipelineBRAPH2('ID', 'Export BRAPH2 Pipeline', 'PIP', el.copy(), 'WAITBAR', true).get('PUT_FILE');
    if ~strcmp(ex.get('FILE'), ExporterPipelineBRAPH2.getPropDefault('FILE'))
        ex.get('SAVE');
    end
end

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the pipeline.
%%%% ¡default!
'Pipeline'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the pipeline.
%%%% ¡default!
'Pipeline is an analysis pipeline.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the pipeline.

%%% ¡prop!
ID (data, string) is a few-letter code for the pipeline.
%%%% ¡default!
'Pipeline ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the pipeline.
%%%% ¡default!
'Pipeline label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the pipeline.
%%%% ¡default!
'Pipeline notes'
%%%% ¡gui!
pr = PanelPropStringTextArea('EL', pip, 'PROP', Pipeline.NOTES, 'HEIGHT', s(10), varargin{:});

%% ¡props!

%%% ¡prop!
PS_DICT (data, idict) is an indexed dictionary with the code sections.
%%%% ¡settings!
'PipelineSection'
%%%% ¡gui!
pr = PipelinePP_PSDict('EL', pip, 'PROP', Pipeline.PS_DICT, varargin{:});

