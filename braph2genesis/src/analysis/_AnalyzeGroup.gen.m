%% ¡header!
AnalyzeGroup < ConcreteElement (a, group-based graph analysis) is a group-based graph analysis.

%%% ¡description!
AnalyzeGroup provides the methods necessary for all group-based analysis subclasses.
Instances of this class should not be created; Use one of its subclasses instead.

%%% ¡seealso!
CompareGroup

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the group-based graph analysis.
%%%% ¡default!
'AnalyzeGroup'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the group-based graph analysis.
%%%% ¡default!
'AnalyzeGroup provides the methods necessary for all group-based analysis subclasses. Instances of this class should not be created; Use one of its subclasses instead.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the group-based graph analysis.

%%% ¡prop!
ID (data, string) is a few-letter code for the group-based graph analysis.
%%%% ¡default!
'AnalyzeGroup ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the group-based graph analysis.
%%%% ¡default!
'AnalyzeGroup label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the group-based graph analysis.
%%%% ¡default!
'AnalyzeGroup notes'

%% ¡props!

%%% ¡prop!
WAITBAR (gui, logical) detemines whether to show the waitbar.
%%%% ¡default!
true

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class.
%%%% ¡settings!
'Group'

%%% ¡prop!
G (result, item) is the graph obtained from this analysis.
%%%% ¡settings!
'Graph'
%%%% ¡calculate!
value = Graph();
%%%% ¡gui!
pr = PanelPropItem('EL', a, 'PROP', AnalyzeGroup.G, ...
    'GUICLASS', 'GUIElement', ...
    'BUTTON_TEXT', 'Graph & Measures', ...
    varargin{:});
% % % pr = PPAnalyzeGroup_G('EL', a, 'PROP', AnalyzeGroup.G, 'WAITBAR', Callback('EL', a, 'TAG', 'WAITBAR'), varargin{:});