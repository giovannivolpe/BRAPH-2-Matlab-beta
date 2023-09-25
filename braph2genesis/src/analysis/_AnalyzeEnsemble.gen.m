%% ¡header!
AnalyzeEnsemble < ConcreteElement (a, ensemble-based graph analysis) is a ensemble-based graph analysis.

%%% ¡description!
AnalyzeEnsemble provides the methods necessary for all ensemble-based analysis subclasses.
Instances of this class should not be created. Use one of its subclasses instead.

%%% ¡seealso!
CompareEnsemble

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'AnalyzeEnsemble'

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
a.postset@ConcreteElement(AnalyzeEnsemble.TEMPLATE)

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
%%%% ¡gui!
pr = PanelPropItem('EL', a, 'PROP', AnalyzeEnsemble.GR, ...
    'BUTTON_TEXT', a.get('GR').get('ID'), ...
    varargin{:});

%%% ¡prop!
GRAPH_TEMPLATE (parameter, item) is the graph template to set all graph and measure parameters.
%%%% ¡settings!
'Graph'
%%%% ¡gui!
pr = PanelPropItem('EL', a, 'PROP', AnalyzeEnsemble.GRAPH_TEMPLATE, ...
    'BUTTON_TEXT', ['GRAPH TEMPLATE (' a.get('GRAPH_TEMPLATE').getClass() ')'], ...
    varargin{:});

%%% ¡prop!
G_DICT (result, idict) is the graph ensemble obtained from this analysis.
%%%% ¡settings!
'Graph'
%%%% ¡calculate!
value = IndexedDictionary('IT_CLASS', 'Graph');
%%%% ¡gui!
pr = AnalyzeEnsemblePP_GDict('EL', a, 'PROP', AnalyzeEnsemble.G_DICT, ...
    'WAITBAR', a.getCallback('WAITBAR'), ...
    varargin{:});

%%% ¡prop!
ME_DICT (result, idict) contains the calculated measures of the graph ensemble.
%%%% ¡settings!
'MeasureEnsemble'
%%%% ¡calculate!
value = IndexedDictionary('IT_CLASS', 'MeasureEnsemble', 'IT_KEY', MeasureEnsemble.MEASURE);
%%%% ¡gui!
pr = AnalyzeEnsemblePP_MeDict('EL', a, 'PROP', AnalyzeEnsemble.ME_DICT, ...
    'WAITBAR', a.getCallback('WAITBAR'), ...
    varargin{:});
for hang, add on AnalyzeEnsemble:

%%% ¡prop!
PFB (gui, item) contains the panel figure of the comparison.
%%%% ¡settings!
'MeasureEnsembleBrainPF'
%%%% ¡postprocessing!
if isa(cp.getr('PFB'), 'NoValue')

    measure = cp.get('MEASURE');

    switch Element.getPropDefault(measure, 'SHAPE')
        case Measure.GLOBAL % _Measure.GLOBAL_
            switch Element.getPropDefault(measure, 'SCOPE')
                case Measure.SUPERGLOBAL % _Measure.SUPERGLOBAL_
                    cp.set('PFB', MeasureEnsembleBrainPF_GS('AnalyzeEnsemble', a))
                case Measure.UNILAYER % _Measure.UNILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_GU('AnalyzeEnsemble', a))
                case Measure.BILAYER % _Measure.BILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_GB('AnalyzeEnsemble', a))
            end
        case Measure.NODAL % _Measure.NODAL_
            switch Element.getPropDefault(measure, 'SCOPE')
                case Measure.SUPERGLOBAL % _Measure.SUPERGLOBAL_
                    cp.set('PFB', MeasureEnsembleBrainPF_NS('AnalyzeEnsemble', a))
                case Measure.UNILAYER % _Measure.UNILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_NU('AnalyzeEnsemble', a))
                case Measure.BILAYER % _Measure.BILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_NB('AnalyzeEnsemble', a))
            end
        case Measure.BINODAL % _Measure.BINODAL_
            switch Element.getPropDefault(measure, 'SCOPE')
                case Measure.SUPERGLOBAL % _Measure.SUPERGLOBAL_
                    cp.set('PFB', MeasureEnsembleBrainPF_BS('AnalyzeEnsemble', a))
                case Measure.UNILAYER % _Measure.UNILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_BU('AnalyzeEnsemble', a))
                case Measure.BILAYER % _Measure.BILAYER_
                    cp.set('PFB', MeasureEnsembleBrainPF_BB('AnalyzeEnsemble', a))
            end
    end
end
%%%% ¡gui!
pr = PanelPropItem('EL', cp, 'PROP', MeasureEnsembleBrainPF.PFB, ...
    'GUICLASS', 'GUIFig', ...
	'BUTTON_TEXT', ['Plot ' cp.get('MEASURE') ' Comparison'], ...
    varargin{:});

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
        'MEASURE', measure_class, ...
        'MEASURE_TEMPLATE', a.memorize('GRAPH_TEMPLATE').get('MEASURE', measure_class) ...
        );
    
    me_dict.get('ADD', me);
end

value = me;

%% ¡tests!

%%% ¡excluded_props!
[AnalyzeEnsemble.TEMPLATE AnalyzeEnsemble.GRAPH_TEMPLATE]
