%% ¡header!
OrdMlBU < Graph (g, ordinal multilayer binary undirected graph) is an ordinal multilayer binary undirected graph.

%%% ¡description!
In an ordinal multilayer binary undirected (BU) graph, layers could have different number 
 of nodes with within-layer undirected edges either 0 (absence of connection) 
 or 1 (existence of connection).
The connectivity matrices are symmetric (within layer).
All node connections are allowed between layers.
The layers are connected in an ordinal fashion, i.e., only consecutive layers are connected.
On the diagonal of the supra adjacency matrix, matrices are symmetrized, dediagonalized, semipositivized, and binarized.
On the off-diagonal of the supra adjacency matrix, matrices are semipositivized and binarized.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OrdMlBU.ID
%%%% ¡title!
Graph ID

%%% ¡prop!
%%%% ¡id!
OrdMlBU.LABEL
%%%% ¡title!
Graph NAME

%%% ¡prop!
%%%% ¡id!
OrdMlBU.LAYERTICKS
%%%% ¡title!
LAYERS ticks

%%% ¡prop!
%%%% ¡id!
OrdMlBU.LAYERLABELS
%%%% ¡title!
LAYERS labels

%%% ¡prop!
%%%% ¡id!
OrdMlBU.NODELABELS
%%%% ¡title!
NODES labels

%%% ¡prop!
%%%% ¡id!
OrdMlBU.B
%%%% ¡title!
Input ADJACENCY MATRIX

%%% ¡prop!
%%%% ¡id!
OrdMlBU.RANDOMIZE
%%%% ¡title!
RANDOMIZATION ON/OFF

%%% ¡prop!
%%%% ¡id!
OrdMlBU.RANDOM_SEED
%%%% ¡title!
RANDOMIZATION SEED

%%% ¡prop!
%%%% ¡id!
OrdMlBU.ATTEMPTSPEREDGE
%%%% ¡title!
RANDOMIZATION ATTEMPTS PER EDGE


%%% ¡prop!
%%%% ¡id!
OrdMlBU.SYMMETRIZE_RULE
%%%% ¡title!
SYMMETRIZATION RULE

%%% ¡prop!
%%%% ¡id!
OrdMlBU.SEMIPOSITIVIZE_RULE
%%%% ¡title!
NEGATIVE EDGE RULE

%%% ¡prop!
%%%% ¡id!
OrdMlBU.A
%%%% ¡title!
Binary Undirected ADJACENCY MATRICES

%%% ¡prop!
%%%% ¡id!
OrdMlBU.PFGA
%%%% ¡title!
Adjacency Matrix Plot

%%% ¡prop!
%%%% ¡id!
OrdMlBU.PFGH
%%%% ¡title!
Graph Histogram

%%% ¡prop!
%%%% ¡id!
OrdMlBU.M_DICT
%%%% ¡title!
Graph MEASURES

%%% ¡prop!
%%%% ¡id!
OrdMlBU.NOTES
%%%% ¡title!
Graph NOTES

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'OrdMlBU'

%%% ¡prop!
NAME (constant, string) is the name of the ordinal multilayer binary undirected graph.
%%%% ¡default!
'OrdMlBU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the ordinal multilayer binary undirected graph.
%%%% ¡default!
'In an ordinal multilayer binary undirected (BU) graph, layers could have different number of nodes with within-layer undirected edges either 0 (absence of connection) or 1 (existence of connection). The connectivity matrices are symmetric (within layer). All node connections are allowed between layers. The layers are connected in an ordinal fashion, i.e., only consecutive layers are connected. On the diagonal of the supra adjacency matrix, matrices are symmetrized, dediagonalized, semipositivized, and binarized. On the off-diagonal of the supra adjacency matrix, matrices are semipositivized and binarized.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the ordinal multilayer binary undirected graph.
%%%% ¡settings!
'OrdMlBU'

%%% ¡prop!
ID (data, string) is a few-letter code for the ordinal multilayer binary undirected graph.
%%%% ¡default!
'OrdMlBU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the ordinal multilayer binary undirected graph.
%%%% ¡default!
'OrdMlBU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the ordinal multilayer binary undirected graph.
%%%% ¡default!
'OrdMlBU notes'

%%% ¡prop!
GRAPH_TYPE (constant, scalar) returns the graph type __Graph.ORDERED_MULTILAYER__.
%%%% ¡default!
Graph.ORDERED_MULTILAYER

%%% ¡prop!
CONNECTIVITY_TYPE (query, smatrix) returns the connectivity type __Graph.BINARY__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.BINARY * ones(layernumber);

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
A (result, cell) is the cell containing the within-layer binary adjacency matrices of the multilayer binary undirected graph and the ordinal connections between layers.
%%%% ¡calculate!
B = g.get('B'); %#ok<PROPLC>
L = length(B); %#ok<PROPLC> % number of layers
A = cell(L, L);
for i = 1:1:L
    M = symmetrize(B{i, i}, 'SymmetrizeRule', g.get('SYMMETRIZE_RULE')); %#ok<PROPLC> % enforces symmetry of adjacency matrix
    M = dediagonalize(M); % removes self-connections by removing diagonal from adjacency matrix, equivalent to dediagonalize(M, 'DediagonalizeRule', 0)
    M = semipositivize(M, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
    M = binarize(M); % enforces binary adjacency matrix, equivalent to binarize(M, 'threshold', 0, 'bins', [-1:.001:1])
    A(i, i) = {M};
    if ~isempty(A{i, i})
        for j = i+1:1:L
            if j == i + 1
                M = semipositivize(B{i, j}, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
                M = binarize(M, varargin{:}, 'diagonal', 'include'); % enforces binary adjacency matrix, equivalent to binarize(M, 'threshold', 0, 'bins', [-1:.001:1])
                A(i, j) = {M};
                M = semipositivize(B{j, i}, 'SemipositivizeRule', g.get('SEMIPOSITIVIZE_RULE')); % removes negative weights
                M = binarize(M, varargin{:}, 'diagonal', 'include'); % enforces binary adjacency matrix, equivalent to binarize(M, 'threshold', 0, 'bins', [-1:.001:1])
                A(j, i) = {M};
            else
                A(i, j) = {zeros(size(B{i, j}))};
                A(j, i) = {zeros(size(B{j, i}))};
            end
        end
    end
end

if g.get('RANDOMIZE')
    A = g.get('RANDOMIZATION', A);
end
value = A;
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMlBU.A, ...
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
ALAYERLABELS (query, stringlist) returns the layer labels to be used by the slider.
%%%% ¡calculate!
alayerlabels = g.get('LAYERLABELS');
if isempty(alayerlabels) && ~isa(g.getr('A'), 'NoValue') % ensures that it's not unecessarily calculated
    alayerlabels = cellfun(@num2str, num2cell([1:1:g.get('LAYERNUMBER')]), 'uniformoutput', false);
end
value = alayerlabels;

%%% ¡prop!
COMPATIBLE_MEASURES (constant, classlist) is the list of compatible measures.
%%%% ¡default!
getCompatibleMeasures('OrdMlBU')

%% ¡props!

%%% ¡prop!
B (data, cell) is the input cell containing the multilayer adjacency matrices on the diagonal.
%%%% ¡default!
{[] []; [] []}
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', OrdMlBU.B, ...
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
ATTEMPTSPEREDGE (parameter, scalar) is the attempts to rewire each edge.
%%%% ¡default!
5

%%% ¡prop!
RANDOMIZATION (query, cell) is the attempts to rewire each edge.
%%%% ¡calculate!
rng(g.get('RANDOM_SEED'), 'twister')

if isempty(varargin)
    value = {};
    return
end

A = varargin{1};
attempts_per_edge = g.get('ATTEMPTSPEREDGE');

for i = 1:length(A)
    tmp_a = A{i,i};

    random_g = GraphBU();
    random_g.set('ATTEMPTSPEREDGE', g.get('ATTEMPTSPEREDGE'));
    random_A = random_g.get('RANDOMIZATION', {tmp_a});
    A{i, i} = random_A;
end
value = A;

%% ¡tests!

%%% ¡excluded_props!
[OrdMlBU.PFGA OrdMlBU.PFGH]

%%% ¡test!
%%%% ¡name!
Constructor - Full
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
g = OrdMlBU('B', B);
g.get('A_CHECK')
A1 = symmetrize(binarize(semipositivize(dediagonalize(B1))));
A2 = symmetrize(binarize(semipositivize(dediagonalize(B2))));
A3 = symmetrize(binarize(semipositivize(dediagonalize(B3))));
A12 =  binarize(semipositivize(B12), 'diagonal', 'include');
A13 =  zeros(size(B13));
A23 =  binarize(semipositivize(B23), 'diagonal', 'include');
B{1, 1} = A1;
B{2, 2} = A2;
B{3, 3} = A3;
B{1, 2} = A12;
B{1, 3} = A13;
B{2, 3} = A23;
B{2, 1} = A12';
B{3, 1} = A13';
B{3, 2} = A23';
A = B;
assert(isequal(g.get('A'), A), ...
    [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
    'OrdMlBU is not constructing well.')

%%% ¡test!
%%%% ¡name!
Randomize Rules
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
g = OrdMlBU('B', B);
g.set('RANDOMIZE', true);
g.set('ATTEMPTSPEREDGE', 4);
g.get('A_CHECK')
A = g.get('A');

assert(isequal(size(A{1}), size(B{1})), ...
    [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
    'OrdMlBU Randomize is not functioning well.')

g2 = OrdMlBU('B', B);
g2.set('RANDOMIZE', false);
g2.set('ATTEMPTSPEREDGE', 4);
g2.get('A_CHECK')
A2 = g.get('A');
random_A = g2.get('RANDOMIZATION', A2);

for i = 1:length(A2)
    if all(A2{i, i}==0, "all") %if all nodes are zero, the random matrix is also all zeros
        assert(isequal(A2{i, i}, random_A{i, i}), ...
            [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
            'OrdMlBU Randomize is not functioning well.')
    elseif isequal((length(A2{i, i}).^2)- length(A2{i, i}), sum(A2{i, i}==1, "all")) %if all nodes (except diagonal) are one, the random matrix is the same as original
        assert(isequal(A2{i, i}, random_A{i, i}), ...
            [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
            'OrdMlBU Randomize is not functioning well.')
    else
%         assert(~isequal(A2{i, i}, random_A{i, i}), ...
%             [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
%             'OrdMlBU Randomize is not functioning well.')
    end

    assert(isequal(numel(find(A2{i, i})), numel(find(random_A{i, i}))), ... % check same number of nodes
        [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
        'OrdMlBU Randomize is not functioning well.')

    assert(issymmetric(random_A{i, i}), ... % check symmetry 
    [BRAPH2.STR ':OrdMlBU:' BRAPH2.FAIL_TEST], ...
    'OrdMlBU Randomize is not functioning well.')
end