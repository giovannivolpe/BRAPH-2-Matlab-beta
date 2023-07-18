%% ¡header!
NNData < ConcreteElement (nnd, data for neural network analysis) produces a dataset to train or test a neural network model.

%% ¡description!
NNData generates a group of NN subjects, each of which contains the 
input as structural, adjacency matrices, or graph measures from all of the 
modalities. The generated NN group can be used to train or test neural 
network models.
Instances of this class should not be created. Use one of its subclasses instead.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the data for neural network analysis.
%%%% ¡default!
'NNData'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the data for neural network analysis.
%%%% ¡default!
'NNSubject contains the required information for a neural network analysis.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the data for neural network analysis.
%%%% ¡settings!
'NNData'

%%% ¡prop!
ID (data, string) is a few-letter code for the data for neural network analysis.
%%%% ¡default!
'NNData ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the data for neural network analysis.
%%%% ¡default!
'NNData label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the subject for neural network analysis.
%%%% ¡default!
'NNData notes'

%% ¡props!
%%% ¡prop!
WAITBAR (gui, logical) detemines whether to show the waitbar.
%%%% ¡default!
true

%%% ¡prop!
INPUT_TYPE (parameter, option) is the input type for training or testing the NN.
%%%% ¡_gui!
% % % pr = PPNNDataInputType('EL', nnd, 'PROP', NNData.INPUT_TYPE, 'WAITBAR', Callback('EL', nnd, 'TAG', 'WAITBAR'), varargin{:});

%%% ¡prop!
G (parameter, item) is the graph for calculating the graph measures.
%%%% ¡settings!
'Graph'

%%% ¡prop!
GRAPH_TEMPLATE (parameter, item) is the graph template to set all graph and measure parameters.
%%%% ¡settings!
'Graph'

%%% ¡prop!
MEASURES (parameter, idict) is the graph measures as input to NN.
%%%% ¡settings!
'MeasureEnsemble'
%%%% ¡default!
IndexedDictionary('IT_CLASS', 'MeasureEnsemble', 'IT_KEY', MeasureEnsemble.MEASURE);
% % % % %%%% ¡_postprocessing!
% % % % if ~strcmp(nnd.get('INPUT_TYPE'), 'structural_data')
% % % %     value = nnd.get('MEASUREENSEMBLE','Degree');
% % % % end
%%%% ¡_gui!
% % % pr = PPNNDataMeasures('EL', nnd, 'PROP', NNData.G, 'WAITBAR', Callback('EL', nnd, 'TAG', 'WAITBAR'), varargin{:});

%%% ¡_prop!
ANALYZE_ENSEMBLE (data, item) contains the graphs of the group.
%%%% ¡settings!
'AnalyzeEnsemble'

%%% ¡prop!
TARGET_NAME (data, string) is the name of the traget.
%%%% ¡default!
'Target'

%%% ¡prop!
GR (data, item) is a group of subjects defined as subject class.
%%%% ¡settings!
'Group'

%%% ¡prop!
GR_NN (result, item) is a group of NN subjects.
%%%% ¡settings!
'NNGroup'

%%% ¡_prop!
% % % TEMPLATE (parameter, item) is the analysis template to set the parameters.
% % % %%%% ¡settings!
% % % 'NNData'
% % % %%%% ¡postprocessing!
% % % if nnd.prop_set(NNData.TEMPLATE, varargin{:})
% % %     varargin = {};
% % %     
% % %     parameters = nnd.getProps(Category.PARAMETER);
% % %     for i = 1:1:length(parameters)
% % %         parameter = parameters(i);
% % %         
% % %         if parameter ~= NNData.TEMPLATE
% % %             varargin{length(varargin) + 1} = parameter;
% % %             varargin{length(varargin) + 1} = Callback('EL', nnd.get('TEMPLATE'), 'PROP', parameter);
% % %         end
% % %     end
% % %     
% % %     nnd.set(varargin{:});
% % % end

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

measure_class = varargin{1};
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
m_list = nnd.memorize('GRAPH_TEMPLATE').get('COMPATIBLE_MEASURES');
a = nnd.getPropDefault('ANALYZE_ENSEMBLE');
a.set('GR', nnd.get('GR'));
if isempty(a.get('G_DICT').get('IT'))
    a.memorize('G_DICT').add(g);
end
     
if ~contains(measure_class, m_list)
    error(...
        [BRAPH2.STR ':Analysis:' BRAPH2.WRONG_INPUT], ...
        [BRAPH2.STR ':Analysis:' BRAPH2.WRONG_INPUT ' \\n' ...
        a.getClass() ' utilizes graphs of type ' a.memorize('GRAPH_TEMPLATE').getClass() '. \\n' ...
        measure_class ' is not a compatible Measure with ' a.memorize('GRAPH_TEMPLATE').getClass() '. \\n' ...
        'Use ' a.memorize('GRAPH_TEMPLATE').getClass() '().get(''COMPATIBLE_MEASURES'') for a list of compatible measures.'])
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

%% ¡_methods!
% % % function m_value = getCalculatedMeasure(nnd, g, measure_class)
% % %     me_dict = nnd.get('MEASURES');
% % %     if me_dict.containsKey(measure_class)
% % %         me = me_dict.getItem(measure_class);
% % %     else
% % %         me = MeasureEnsemble( ...
% % %             'ID', measure_class, ...
% % %             'A', nnd.get('ANALYZE_ENSEMBLE'), ...
% % %             'MEASURE', measure_class, ...
% % %             'MEASURE_TEMPLATE', eval([measure_class '(varargin{:})']) ...
% % %             );
% % %         me_dict.add(me);
% % %     end
% % %     core_measure = me.get('MEASURE_TEMPLATE');
% % %     % get parameters from core measure
% % %     j = 1;
% % %     varargin = {};
% % %     if Measure.getPropNumber() ~= core_measure.getPropNumber()
% % %         for i = Measure.getPropNumber() + 1:core_measure.getPropNumber()
% % %             if ~isa(core_measure.getr(i), 'NoValue')
% % %                 varargin{j} = core_measure.getPropTag(i);
% % %                 varargin{j + 1} = core_measure.getr(i);
% % %             end
% % %             j = j + 2;
% % %         end
% % %         varargin = varargin(~cellfun('isempty', varargin));
% % %     end
% % %     
% % %     m_value = g.getMeasure(me.get('MEASURE'), varargin{:}).get('M');
% % % end
