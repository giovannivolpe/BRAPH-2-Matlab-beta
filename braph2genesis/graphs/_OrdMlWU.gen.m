%% ¡header!
OrdMlWU < Graph (g, ordinal multilayer weighted undirected graph) is an ordinal multilayer weighted undirected graph.

%%% ¡description!
In an ordinal multilayer weighted undirected (WU) graph, layers could have different number 
 of nodes with within-layer weighted undirected edges, associated with a real 
 number between 0 and 1 and indicating the strength of the connection.
The connectivity matrices are symmetric (within layer).
All node connections are allowed between layers.
The layers are connected in an ordinal fashion, i.e., only consecutive layers are connected.
Matrices on the diagonal line are symmetrized, dediagonalized, semipositivized, standardized
Matrices on the non-diagonal line are semipositivized, standardized
%% ¡props_update!

%%% ¡prop!

NAME (constant, string) is the name of the ordinal multilayer weighted undirected graph.
%%%% ¡default!
'OrdMlWU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the ordinal multilayer weighted undirected graph.
%%%% ¡default!
'In an ordinal multilayer weighted undirected (WU) graph, layers could have different number of nodes with within-layer weighted undirected edges, associated with a real number between 0 and 1 and indicating the strength of the connection. The connectivity matrices are symmetric (within layer). All node connections are allowed between layers. The layers are connected in an ordinal fashion, i.e., only consecutive layers are connected.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the ordinal multilayer weighted undirected graph.
%%% ¡_prop!
% % % TEMPLATE (parameter, item) is the graph template to set the graph and measure parameters.
% % % %%%% ¡_settings!
% % % 'OrdMlWU'

%%% ¡prop!
ID (data, string) is a few-letter code for the ordinal multilayer weighted undirected graph.
%%%% ¡default!
'OrdMlWU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the ordinal multilayer weighted undirected graph.
%%%% ¡default!
'OrdMlWU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the ordinal multilayer weighted undirected graph.
%%%% ¡default!
'OrdMlWU notes'

%%% ¡prop!
GRAPH_TYPE (constant, scalar) returns the graph type __Graph.ORDERED_MULTILAYER__.
%%%% ¡default!
Graph.ORDERED_MULTILAYER

%%% ¡prop!
CONNECTIVITY_TYPE (query, smatrix) returns the connectivity type __Graph.WEIGHTED__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.WEIGHTED * ones(layernumber);

%%% ¡prop!
DIRECTIONALITY_TYPE (query, smatrix) returns the directionality type __Graph.UNDIRECTED__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.UNDIRECTED * ones(layernumber);

%%% ¡prop!
SELFCONNECTIVITY_TYPE (query, smatrix) returns the self-connectivity type __Graph.NONSELFCONNECTED__ on the diagonal and __Graph.SELFCONNECTED__ off diagonal.
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.SELFCONNECTED * ones(layernumber);
value(1:layernumber+1:end) = Graph.NONSELFCONNECTED;                

%%% ¡prop!
NEGATIVITY_TYPE (query, smatrix) returns the negativity type __Graph.NONNEGATIVE__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.NONNEGATIVE * ones(layernumber);

%%% ¡prop!
A (result, cell) is the cell containing the within-layer weighted adjacency matrices of the multilayer weighted undirected graph and the ordinal connections between layers.
%%%% ¡calculate!
B = g.get('B'); %#ok<PROPLC>
L = length(B); %#ok<PROPLC> % number of layers
for i = 1:1:L
    M = symmetrize(B{i,i}, 'SymmetrizeRule', g.get('SYMMETRIZE_RULE')); %#ok<PROPLC> % enforces symmetry of adjacency matrix
    M = dediagonalize(M); % removes self-connections by removing diagonal from adjacency matrix, equivalent to dediagonalize(M, 'DediagonalizeRule', 0)
    M = semipositivize(M, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
    M = standardize(M, 'StandardizeRule', g.get('STANDARDIZE_RULE')); % rescales adjacency matrix
    B(i, i) = {M};
    if ~isempty(A{i, i})
        for j = i+1:1:L
            M = semipositivize(B{i,j}, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
            M = standardize(M, 'StandardizeRule', g.get('STANDARDIZE_RULE'));  % rescales adjacency matrix
            B(i, j) = {M};
            M = semipositivize(B{j,i}, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
            M = standardize(M, 'StandardizeRule', g.get('STANDARDIZE_RULE'));  % rescales adjacency matrix
            B(j, i) = {M};
        end
    end
end
A = B;
value = A;

%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMlWU.A, ...
    'TABLE_HEIGHT', s(40), ...
    'XYSLIDERLOCK', true, ... 
    'XSLIDERSHOW', false, ...
    'YSLIDERSHOW', true, ...
    'YSLIDERLABELS', g.getCallback('ALAYERLABELS'), ...
    'YSLIDERWIDTH', s(5), ...
    'ROWNAME', g.getCallback('ANODELABELS'), ...
    'COLUMNNAME', g.getCallback('ANODELABELS'), ...
    varargin{:});

%%% ¡prop!
PARTITIONS (result, rvector) returns the number of layers in the partitions of the graph.
%%%% ¡calculate!
value = ones(1, g.get('LAYERNUMBER'));

%%% ¡prop!
ALAYERLABELS (query, stringlist) returns the layer labels to be used by the slider.
%%%% ¡calculate!
alayerlabels = g.get('LAYERLABELS');
if isempty(alayerlabels) && ~isa(g.getr('A'), 'NoValue') % ensures that it's not unecessarily calculated
    alayerlabels = cellfun(@num2str, num2cell([1:1:g.get('LAYERNUMBER')]), 'uniformoutput', false);
end
value = alayerlabels;

%%% ¡prop!
COMPATIBLE_MEASURES (constant, stringlist) is the list of compatible measures.
%%%% ¡default!
getCompatibleMeasures('OrdMlWU')

%% ¡props!

%%% ¡prop!
B (data, cell) is the input cell containing the multilayer adjacency matrices on the diagonal.
%%%% ¡default!
{[] []; [] []}
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMlWU.B, ...
    'TABLE_HEIGHT', s(40), ...
    'XSLIDERSHOW', true, ...
    'XSLIDERLABELS', g.get('LAYERLABELS'), ...
    'XSLIDERHEIGHT', s(3.5), ...
    'YSLIDERSHOW', false, ...
    'ROWNAME', g.getCallback('ANODELABELS'), ...
    'COLUMNNAME', g.getCallback('ANODELABELS'), ...
    varargin{:});

%%% ¡prop!
SYMMETRIZE_RULE (parameter, option) determines how to symmetrize the matrix.
%%%% ¡settings!
{'max', 'sum', 'average', 'min'}

%%% ¡prop!
SEMIPOSITIVIZE_RULE (parameter, option) determines how to remove the negative edges.
%%%% ¡settings!
{'zero', 'absolute'}

%%% ¡prop!
STANDARDIZE_RULE (parameter, option) determines how to normalize the weights between 0 and 1.
%%%% ¡settings!
{'threshold' 'range'}

%% ¡tests!

%%% ¡excluded_props!
[OrdMlWU.PFGA OrdMlWU.PFGH]

%%% ¡test!
%%%% ¡name!
Constructor - Full
%%%% ¡probability!
.01
%%%% ¡code!
B1 = rand(randi(10));
B2 = rand(randi(10));
B3 = rand(randi(10));
B12 = rand(size(B1,1),size(B2,2));
B13 = rand(size(B1,1),size(B3,2));
B23 = rand(size(B2,1),size(B3,2));
B = {
    B1                           B12                            B13
    B12'                         B2                             B23
    B13'                         B23'                           B3
    };
g = OrdMlWU('B', B);
g.get('A_CHECK')
A1 = symmetrize(standardize(semipositivize(dediagonalize(B1))));
A2 = symmetrize(standardize(semipositivize(dediagonalize(B2))));
A3 = symmetrize(standardize(semipositivize(dediagonalize(B3))));
B12 = standardize(semipositivize(B12));
B13 = standardize(semipositivize(B13));
B23 = standardize(semipositivize(B23));
B{1,1} = A1;
B{2,2} = A2;
B{3,3} = A3;
B{1,2} = B12;
B{2,1} = B12';
B{1,3} = B13;
B{3,1} = B13';
B{2,3} = B23;
B{3,2} = B23';
A = B;
assert(isequal(g.get('A'), A), ...
    [BRAPH2.STR ':OrdMlWU:' BRAPH2.FAIL_TEST], ...
    'OrdMlWU is not constructing well.')

%% ¡_props!

%%% ¡_prop!
ATTEMPTSPEREDGE (parameter, scalar) is the attempts to rewire each edge.
%%%% ¡_default!
5

%%% ¡_prop!
NUMBEROFWEIGHTS (parameter, scalar) specifies the number of weights sorted at the same time.
%%%% ¡_default!
10

%% ¡_methods!
function random_g = randomize(g)
    % RANDOMIZE returns a randomized graph
    %
    % RANDOMIZED_G = RANDOMIZE(G) returns the randomized
    % graph RANDOM_G obtained with a randomized correlation
    % matrix via the static function randomize_A while preserving
    % degree distributions. The randomization it is done layer by
    % layer and then integrated in the 2-D supra-adjacency matrix
    % cell array.
    %
    % RANDOMIZED_G = RANDOMIZE(G, 'AttemptsPerEdge', VALUE)
    % returns the randomized graph RANDOM_G obtained with a
    % randomized correlation matrix via the static function
    % randomize_A while preserving  degree distributions.
    % The multilayer is randomized layer by layer where randomized
    % adjacency matrix of each layer are then integrated in the
    % 2-D supra-adjacency matrix cell array.
    %
    % See also GraphBD

    % get rules
    number_of_weights = g.get('NUMBEROFWEIGHTS');
    attempts_per_edge = g.get('ATTEMPTSPEREDGE');

    if nargin<2
        attempts_per_edge = 5;
    end

    % get A
    A = g.get('A');
    [l, ls] = g.layernumber();

    random_multi_A = cell(l, l);
    for li = 1:1:l
        Aii = A{li, li};
        random_A = GraphWU.randomize_A(Aii, attempts_per_edge, number_of_weights);
        random_multi_A(li,li) = {random_A};
    end
    random_g = OrdMlWU('B', random_multi_A);

end
