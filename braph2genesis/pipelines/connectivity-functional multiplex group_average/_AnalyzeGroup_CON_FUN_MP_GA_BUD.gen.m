%% ¡header!
AnalyzeGroup_CON_FUN_MP_GA_BUD < AnalyzeGroup (a, graph analysis with connectivity and functional multiplex data of fixed density) is a graph analysis using connectivity and functional multiplex data of fixed density.

%%% ¡description!
This graph analysis uses connectivity and functional multiplex data of 
fixed density and analyzes them using binary undirected graphs.

%%% ¡seealso!
SubjectCON_FUN_MP, MultiplexBUD

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the graph analysis with connectivity and functional multiplex data of fixed density.
%%%% ¡default!
'AnalyzeGroup_CON_FUN_MP_GA_BUD'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the graph analysis with connectivity and functional multiplex data of fixed density.
%%%% ¡default!
'This graph analysis uses connectivity and functional multiplex data of fixed density and analyzes them using binary undirected graphs.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the graph analysis with connectivity and functional multiplex data of fixed density.

%%% ¡prop!
ID (data, string) is a few-letter code for the graph analysis with connectivity and functional multiplex data of fixed density.
%%%% ¡default!
'AnalyzeGroup_CON_FUN_MP_GA_BUD ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the graph analysis with connectivity and functional multiplex data of fixed density.
%%%% ¡default!
'AnalyzeGroup_CON_FUN_MP_GA_BUD label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the graph analysis with connectivity and functional multiplex data of fixed density.
%%%% ¡default!
'AnalyzeGroup_CON_FUN_MP_GA_BUD notes'

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class SubjectCON_FUN_MP.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectCON_FUN_MP')

%%% ¡prop!
G (result, item) is the average multiplex graph obtained from this analysis.
%%%% ¡settings!
'MultiplexBUD'
%%%% ¡default!
MultiplexBUD()
%%%% ¡calculate!
gr = a.get('GR');
T = a.get('REPETITION');
fmin = a.get('F_MIN');
fmax = a.get('F_MAX');
densities = a.get('DENSITIES'); % this is a vector
A = cell(1, 2);
data = cell(1, 2);
layerlabels = {};

for i = 1:1:gr.get('SUB_DICT').get('LENGTH')
    sub = gr.get('SUB_DICT').get('IT', i);
    CON_FUN_MP = sub.getr('CON_FUN_MP');
    
    % FUN data
    data_fun = CON_FUN_MP{2};
    fs = 1 / T;
    
    if fmax > fmin && T > 0
        NFFT = 2 * ceil(size(data_fun, 1) / 2);
        ft = fft(data_fun, NFFT);  % Fourier transform
        f = fftshift(fs * abs(-NFFT / 2:NFFT / 2 - 1) / NFFT);  % absolute frequency
        ft(f < fmin | f > fmax, :) = 0;
        data_fun = ifft(ft, NFFT);
    end
    
    A_fun = Correlation.getAdjacencyMatrix(data_fun, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'));
       
    % CON data
    if i == 1
        data(1) = CON_FUN_MP(1);
        data(2) = {A_fun};
    else
        data(1) = {data{1} + CON_FUN_MP{1}};
        data(2) = {data{2} + A_fun};
    end
    
    for i = 1:length(densities)
        layerlabels = [...
            layerlabels, ['C ' num2str(densities(i)) '%'], ...
            ['F ' num2str(densities(i)) '%']];
    end   
end

A(1) = {data{1} / gr.get('SUB_DICT').get('LENGTH')};
A(2) = {data{2} / gr.get('SUB_DICT').get('LENGTH')};

% % % ba = BrainAtlas();
% % % if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').length > 0
% % %     ba = gr.get('SUB_DICT').getItem(1).get('BA');
% % % end
                    
g = MultiplexBUD( ...
    'ID', ['Graph ' gr.get('ID')], ...
    'B', A, ...
    'DENSITIES', densities ... % % % 'LAYERTICKS', densities, ... % % % 'LAYERLABELS', cell2str(layerlabels), ... % % % 'BAS', ba ...
    );

value = g;

%% ¡props!

%%% ¡prop!
REPETITION (parameter, scalar) is the number of repetitions for functional data
%%%% ¡default!
1

%%% ¡prop!
F_MIN (parameter, scalar)is the minimum frequency value for functional data
%%%% ¡default!
0

%%% ¡prop!
F_MAX (parameter, scalar)is the maximum frequency value for functional data
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

%%% ¡prop!
DENSITIES (parameter, rvector) is the vector of densities.
%%%% ¡default!
[1:1:10]
%%%% ¡gui!
pr = PanelPropRVectorSmart('EL', a, 'PROP', AnalyzeGroup_CON_FUN_MP_GA_BUD.DENSITIES, ...
    'MIN', 0, 'MAX', 100, ...
    'DEFAULT', AnalyzeGroup_CON_FUN_MP_GA_BUD.getPropDefault('DENSITIES'), ...
    varargin{:});

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡probability!
.01
%%%% ¡code!
example_CON_FUN_MP_GA_BUD