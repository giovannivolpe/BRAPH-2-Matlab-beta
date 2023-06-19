%% ¡header!
AnalyzeEnsemble_CON_FUN_MP_WU < AnalyzeEnsemble (a, graph analysis with connectivity and functional multiplex data) is a graph analysis using connectivity and functional multiplex data.

%%% ¡description!
This graph analysis uses connectivity and functional multiplex data and analyzes 
them using weighted undirected graphs,
binary undirected multigraphs with fixed thresholds,
or binary undirected multigraphs with fixed densities.

%%% ¡seealso!
SubjectCON_FUN_MP, MultiplexWU







%% ¡props_update!

%%% ¡prop!
TEMPLATE (parameter, item) is the analysis template to set the parameters.
%%%% ¡settings!
'AnalyzeEnsemble_CON_FUN_MP_WU'

%%% ¡prop!
GRAPH_TEMPLATE (parameter, item) is the graph template to set all graph and measure parameters.
%%%% ¡settings!
'MultiplexWU'
%%%% ¡postprocessing!
if ~braph2_testing
    if isa(a.getr('GRAPH_TEMPLATE'), 'NoValue')

        if a.get('GR').get('SUB_DICT').length() > 0
            a.set('GRAPH_TEMPLATE', MultiplexWU('BAS', a.get('GR').get('SUB_DICT').getItem(1).get('BA')));
        else
             a.set('GRAPH_TEMPLATE', MultiplexWU());
        end
    end
    if a.get('GR').get('SUB_DICT').length() > 0
        layerlabels = cell2str({'CON', 'FUN'});
        
        a.get('GRAPH_TEMPLATE').set('LAYERLABELS', layerlabels)
    end
end

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class SubjectCON_FUN_MP.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectCON_FUN_MP')

%%% ¡prop!
ME_DICT (result, idict) contains the calculated measures of the graph ensemble.
%%%% ¡gui_!
% % % pr = PPAnalyzeEnsembleMP_ME_DICT('EL', a, 'PROP', AnalyzeEnsemble_CON_FUN_MP_WU.ME_DICT, 'WAITBAR', true, varargin{:});

%%% ¡prop!
G_DICT (result, idict) is the multiplex (MultiplexWU) ensemble obtained from this analysis.
%%%% ¡settings!
'MultiplexWU'
%%%% ¡default!
IndexedDictionary('IT_CLASS', 'MultiplexWU')
%%%% ¡calculate!
g_dict = IndexedDictionary('IT_CLASS', 'MultiplexWU');
gr = a.get('GR');

ba = BrainAtlas();
if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').length > 0
    ba = gr.get('SUB_DICT').getItem(1).get('BA');
end

T = a.get('REPETITION');
fmin = a.get('FREQUENCYRULEMIN');
fmax = a.get('FREQUENCYRULEMAX');
for i = 1:1:gr.get('SUB_DICT').length()
    A = cell(1, 2);
	sub = gr.get('SUB_DICT').getItem(i);
    CON_FUN_MP = sub.getr('CON_FUN_MP');
    
    % CON data
    A(1) = CON_FUN_MP(1);
    
    % FUN data
    data = CON_FUN_MP{2};
    fs = 1 / T;
    
    if fmax > fmin && T > 0
        NFFT = 2 * ceil(size(data, 1) / 2);
        ft = fft(data, NFFT);  % Fourier transform
        f = fftshift(fs * abs(-NFFT / 2:NFFT / 2 - 1) / NFFT);  % absolute frequency
        ft(f < fmin | f > fmax, :) = 0;
        data = ifft(ft, NFFT);
    end
    
    A(2) = {Correlation.getAdjacencyMatrix(data, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'))};
    
    g = MultiplexWU( ...
        'ID', ['g ' sub.get('ID')], ...
        'B', A, ...
        'BAS', ba ...
        );
    g_dict.add(g)
end

value = g_dict;

%% ¡props!
%%% ¡prop!
REPETITION(parameter, scalar) is the number of repetitions for functional data
%%%% ¡default!
1
%%% ¡prop!
FREQUENCYRULEMIN(parameter, scalar)is the minimum frequency value for functional data
%%%% ¡default!
0
%%% ¡prop!
FREQUENCYRULEMAX(parameter, scalar)is the maximum frequency value for functional data
%%%% ¡default!
Inf

%%% ¡prop!
CORRELATION_RULE (parameter, option) is the correlation type for functional data.
%%%% ¡settings!
Correlation.CORRELATION_RULE_LIST(1:3)
%%%% ¡default!
Correlation.CORRELATION_RULE_LIST{1}

%%% ¡prop!
NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights of functional data.
%%%% ¡settings!
Correlation.NEGATIVE_WEIGHT_RULE_LIST
%%%% ¡default!
Correlation.NEGATIVE_WEIGHT_RULE_LIST{1}

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡probability!
.01
%%%% ¡code!
if ~isfile([fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'atlas.xlsx'])
    test_ImporterGroupSubjectCON_FUN_MP_XLS % create example files
end

example_CON_FUN_MP_WU