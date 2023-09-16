%% ¡header!
AnalyzeEnsemble < ConcreteElement (a, ensemble-based graph analysis) is a ensemble-based graph analysis.

%%% ¡description!
AnalyzeEnsemble provides the methods necessary for all ensemble-based analysis subclasses.
Instances of this class should not be created. Use one of its subclasses instead.

%%% ¡seealso!
CompareEnsemble

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the ensemble-based graph analysis.
%%%% ¡default!
'AnalyzeEnsemble'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the ensemble-based graph analysis.
%%%% ¡default!
'AnalyzeEnsemble provides the methods necessary for all ensemble-based analysis subclasses. Instances of this class should not be created. Use one of its subclasses instead.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the ensemble-based graph analysis.
%%%% ¡settings!
'AnalyzeEnsemble'
%%%% ¡postset!
a.get('TEMPLATE').memorize('GRAPH_TEMPLATE')

%%% ¡prop!
ID (data, string) is a few-letter code for the ensemble-based graph analysis.
%%%% ¡default!
'AnalyzeEnsemble ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the ensemble-based graph analysis.
%%%% ¡default!
'AnalyzeEnsemble label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the ensemble-based graph analysis.
%%%% ¡default!
'AnalyzeEnsemble notes'

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
GRAPH_TEMPLATE (parameter, item) is the graph template to set all graph and measure parameters.
%%%% ¡settings!
'Graph'

%%% ¡prop!
G_DICT (result, idict) is the graph ensemble obtained from this analysis.
%%%% ¡settings!
'Graph'
%%%% ¡calculate!
value = IndexedDictionary('IT_CLASS', 'Graph');

%%% ¡prop!
ME_DICT (result, idict) contains the calculated measures of the graph ensemble.
%%%% ¡settings!
'MeasureEnsemble'
%%%% ¡calculate!
value = IndexedDictionary('IT_CLASS', 'MeasureEnsemble', 'IT_KEY', MeasureEnsemble.MEASURE);
%%%% ¡_gui!
% % % pr = PPAnalyzeEnsemble_MeDict('EL', a, 'PROP', AnalyzeEnsemble.ME_DICT, 'WAITBAR', Callback('EL', a, 'TAG', 'WAITBAR'), varargin{:});

%%% ¡prop!
MEASUREENSEMBLE (query, item) returns an ensemble-based measure.
%%%% ¡settings!
'MeasureEnsemble'
%%%% ¡calculate!
% ME = a.get('MEASUREENSEMBLE', MEASURE_CLASS) checks whether the 
%  measure ensemble exists in the property ME_DICT. If not it creates a new
%  measure M of class MEASURE_CLASS with properties defined by the graph
%  settings. The user must call getValue() for the new measure M to
%  retrieve the value of measure ensemble ME.
if isempty(varargin)
    value = MeasureEnsemble();
    
    % % Warning commented because it most likely will lead to an error anyways
    % warning( ...
    %     [BRAPH2.STR ':' class(a)], ...
    %     [BRAPH2.STR ':' class(a) '\\n' ...
    %     'Missing argument MEASURE_CLASS when using Analysis.get(''MEASUREENSEMBLE'', MEASURE_CLASS).'] ...
    %     )
    
    return
end
measure_class = varargin{1};

m_list = a.memorize('GRAPH_TEMPLATE').get('COMPATIBLE_MEASURES');
if ~contains(measure_class, m_list)
    error(...
        [BRAPH2.STR ':Analysis:' BRAPH2.WRONG_INPUT], ...
        [BRAPH2.STR ':Analysis:' BRAPH2.WRONG_INPUT ' \\n' ...
        a.getClass() ' utilizes graphs of type ' a.memorize('GRAPH_TEMPLATE').getClass() '. \\n' ...
        measure_class ' is not a compatible Measure with ' a.memorize('GRAPH_TEMPLATE').getClass() '. \\n' ...
        'Use ' a.memorize('GRAPH_TEMPLATE').getClass() '().get(''COMPATIBLE_MEASURES'') for a list of compatible measures.'])
end

g_dict = a.memorize('G_DICT');
for i = 1:1:g_dict.get('LENGTH')
    g_dict.get('IT', i).memorize('A');
end

me_dict = a.memorize('ME_DICT');
if me_dict.get('CONTAINS_KEY', measure_class)
    me = me_dict.get('IT', measure_class);
else
    me = MeasureEnsemble( ...
        'ID', measure_class, ...
        'A', a, ...
        'MEASURE', measure_class ... % % % 'MEASURE_TEMPLATE', a.memorize('GRAPH_TEMPLATE').get('MEASURE', measure_class) ...
        );
    
    me_dict.get('ADD', me);
end

value = me;

%%% ¡_prop! % % %TBE???
% % % PFGD (gui, item) contains the panel figure of the graph dictionary.
%%%% ¡_settings!
% % % 'PFAnalysisEnsemble'
%%%% ¡_postprocessing!
% % % if ~braph2_testing % to avoid problems with isqual when the element is recursive
% % %     if isa(a.getr('PFGD'), 'NoValue')
% % %         tmp_g = a.get('graph_template');
% % %         
% % %         if ~isempty(tmp_g) && Graph.is_graph(tmp_g) && ~Graph.is_multigraph(tmp_g)
% % %             a.set('PFGD', PFAnalysisEnsemble('A', a))
% % %         elseif ~isempty(tmp_g) && Graph.is_multigraph(tmp_g)
% % %             a.set('PFGD', PFMultiAnalysisEnsemble('A', a))
% % %         elseif ~isempty(tmp_g) && (Graph.is_multiplex(tmp_g) || Graph.is_ordered_multiplex(tmp_g)) && Graph.is_weighted(tmp_g)
% % %             a.set('PFGD', PFMultiplexAnalysisEnsemble('A', a))
% % %         elseif ~isempty(tmp_g) && (Graph.is_multiplex(tmp_g) || Graph.is_ordered_multiplex(tmp_g)) && Graph.is_binary(tmp_g)
% % %             a.set('PFGD', PFMultiplexBinaryAnalysisEnsemble('A', a))
% % %         else
% % %             a.memorize('PFGD').set('A', a)
% % %         end        
% % %     end
% % % end
%%%% ¡_gui!
% % % pr = PanelPropItem('EL', a, 'PROP', AnalyzeEnsemble.PFGD, ...
% % %     'GUICLASS', 'GUIFig', ...
% % %     varargin{:});

%% ¡tests!

%%% ¡excluded_props!
[AnalyzeEnsemble.TEMPLATE AnalyzeEnsemble.GRAPH_TEMPLATE]