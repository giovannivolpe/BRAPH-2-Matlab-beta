%% ¡header!
MultigraphBUT < GraphWU (g, binary undirected multigraph with fixed thresholds) is a binary undirected multigraph with fixed thresholds.

%%% ¡description!
In a binary undirected multigraph with fixed thresholds, all the layers 
 consist of binary undirected (BU) graphs derived from the same 
 weighted connectivity matrix binarized at different thresholds.
There are no connections between layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.ID
%%%% ¡title!
Graph ID

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.LABEL
%%%% ¡title!
Graph NAME

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.LAYERTICKS
%%%% ¡title!
LAYERS ticks

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.LAYERLABELS
%%%% ¡title!
LAYERS labels

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.NODELABELS
%%%% ¡title!
NODES labels

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.B
%%%% ¡title!
Input ADJACENCY MATRIX

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.SYMMETRIZE_RULE
%%%% ¡title!
SYMMETRIZATION RULE

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.SEMIPOSITIVIZE_RULE
%%%% ¡title!
NEGATIVE EDGE RULE

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.STANDARDIZE_RULE
%%%% ¡title!
NORMALIZATION RULE

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.THRESHOLDS
%%%% ¡title!
THRESHOLDS [-1 ... 1]

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.RANDOMIZE
%%%% ¡title!
RANDOMIZE ON/OFF

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.RANDOM_SEED
%%%% ¡title!
RANDOMIZATION SEED

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.RANDOMIZATION
%%%% ¡title!
RANDOMIZATION VALUE

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.ATTEMPTSPEREDGE
%%%% ¡title!
RANDOMIZATION ATTEMPTS PER EDGE

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.A
%%%% ¡title!
Binary Undirected ADJACENCY MATRICES at fixed Thresholds

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.PFGA
%%%% ¡title!
Adjacency Matrix Plot

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.PFGH
%%%% ¡title!
Graph Histogram

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.M_DICT
%%%% ¡title!
Graph MEASURES

%%% ¡prop!
%%%% ¡id!
MultigraphBUT.NOTES
%%%% ¡title!
Graph NOTES

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the binary undirected multigraph with fixed thresholds.
%%%% ¡default!
'MultigraphBUT'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the binary undirected multigraph with fixed thresholds.
%%%% ¡default!
'In a binary undirected multigraph with fixed thresholds, all the layers consist of binary undirected (BU) graphs derived from the same weighted connectivity matrix binarized at different thresholds. There are no connections between layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the binary undirected multigraph with fixed thresholds.
%%%% ¡settings!
'MultigraphBUT'

%%% ¡prop!
ID (data, string) is a few-letter code for the binary undirected multigraph with fixed thresholds.
%%%% ¡default!
'MultigraphBUT ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the binary undirected multigraph with fixed thresholds.
%%%% ¡default!
'MultigraphBUT label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the binary undirected multigraph with fixed thresholds.
%%%% ¡default!
'MultigraphBUT notes'

%%% ¡prop!
GRAPH_TYPE (constant, scalar) returns the graph type __Graph.MULTIGRAPH__.
%%%% ¡default!
Graph.MULTIGRAPH

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
SELFCONNECTIVITY_TYPE (query, smatrix) returns the self-connectivity type __Graph.NONSELFCONNECTED__ * ones(layernumber).
%%%% ¡calculate!
if isempty(varargin)
    layernumber = 1;
else
    layernumber = varargin{1};
end
value = Graph.NONSELFCONNECTED * ones(layernumber);

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
A (result, cell) is the cell array with the symmetric binary adjacency matrices of the binary undirected multigraph.
%%%% ¡calculate!
A_WU = calculateValue@GraphWU(g, prop);

thresholds = g.get('THRESHOLDS');
A = cell(length(thresholds));

for i = 1:1:length(thresholds)
    threshold = thresholds(i);
    tmp_A = dediagonalize(binarize(cell2mat(A_WU), 'threshold', threshold));

    A{i, i} = tmp_A;
end
if g.get('RANDOMIZE')
    A = g.get('RANDOMIZATION', A);
end
value = A;
%%%% ¡gui!
pr = PanelPropCell('EL', g, 'PROP', MultigraphBUT.A, ...
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
ALAYERLABELS (query, stringlist) returns the layer labels for A.
%%%% ¡calculate!
alayerlabels = g.get('LAYERLABELS');
if isempty(alayerlabels) && ~isa(g.getr('A'), 'NoValue') % ensures that it's not unecessarily calculated
    alayerlabels = cellfun(@num2str, num2cell(g.get('THRESHOLDS')), 'uniformoutput', false);
end
value = alayerlabels;

%%% ¡prop!
COMPATIBLE_MEASURES (constant, classlist) is the list of compatible measures.
%%%% ¡default!
getCompatibleMeasures('MultigraphBUT')

%% ¡props!

%%% ¡prop!
THRESHOLDS (parameter, rvector) is the vector of thresholds.
%%%% ¡gui!
pr = PanelPropRVectorSmart('EL', g, 'PROP', MultigraphBUT.THRESHOLDS, 'MAX', 1, 'MIN', -1, varargin{:});

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

    random_g = GraphWU();
    random_g.set('ATTEMPTSPEREDGE',  g.get('ATTEMPTSPEREDGE');
    random_A{i, i} = random_g.randomize_A(tmp_a);
end

value = random_A;

%% ¡tests!

%%% ¡excluded_props!
[MultigraphBUT.PFGA MultigraphBUT.PFGH]

%%% ¡test!
%%%% ¡name!
Constructor - Empty
%%%% ¡probability!
.01
%%%% ¡code!

% 1
B = [];
g = MultigraphBUT('B', B, 'THRESHOLDS', []);

g.get('A_CHECK')

A = {};
assert(isequal(g.get('A'), A), ...
    [BRAPH2.STR ':MultigraphBUT:' BRAPH2.FAIL_TEST], ...
    'MultigraphBUT is not constructing well.')

% 2
B = [];
g = MultigraphBUT('B', B, 'THRESHOLDS', [0 .1 .2 .3 .4 .5]);

g.get('A_CHECK')

A = g.get('A');
assert(isequal(A{1, 1}, []) && isequal(A{2, 2}, []) && isequal(A{3, 3}, []) && isequal(A{4, 4}, []) && isequal(A{5, 5}, []) && isequal(A{6, 6}, []), ...
    [BRAPH2.STR ':MultigraphBUT:' BRAPH2.FAIL_TEST], ...
    'MultigraphBUT is not constructing well.')

% 3
B = [
    0 .1 .2 .3 .4
    .1 0 .1 .2 .3
    .2 .1 0 .1 .2
    .3 .2 .1 0 .1
    .4 .3 .2 .1 0
    ];
g = MultigraphBUT('B', B, 'THRESHOLDS', []);

g.get('A_CHECK')
A = {};
assert(isequal(g.get('A'), A), ...
    [BRAPH2.STR ':MultigraphBUT:' BRAPH2.FAIL_TEST], ...
    'MultigraphBUT is not constructing well.')

%%% ¡test!
%%%% ¡name!
Constructor - Full
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 .1 .2 .3 .4
    .1 0 .1 .2 .3
    .2 .1 0 .1 .2
    .3 .2 .1 0 .1
    .4 .3 .2 .1 0
    ];
g = MultigraphBUT('B', B, 'THRESHOLDS', [0 .1 .2 .3 .4 .5]);

g.get('A_CHECK')

A = g.get('A');
assert(isequal( ...
    A{1, 1}, ...
    [
    0 1 1 1 1
    1 0 1 1 1
    1 1 0 1 1
    1 1 1 0 1
    1 1 1 1 0
    ]) ...
    && ...
    isequal( ...
    A{2, 2}, ...
    [
    0 0 1 1 1
    0 0 0 1 1
    1 0 0 0 1
    1 1 0 0 0
    1 1 1 0 0
    ]) ...
    && ...
    isequal( ...
    A{3, 3}, ...
    [
    0 0 0 1 1
    0 0 0 0 1
    0 0 0 0 0
    1 0 0 0 0
    1 1 0 0 0
    ]) ...
    && ...
    isequal( ...
    A{4, 4}, ...
    [
    0 0 0 0 1
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    1 0 0 0 0
    ]) ...
    && ...
    isequal( ...
    A{5, 5}, ...
    [
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    ]) ...
    && ...
    isequal( ...
    A{6, 6}, ...
    [
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    0 0 0 0 0
    ]), ...
    [BRAPH2.STR ':MultigraphBUT:' BRAPH2.FAIL_TEST], ...
    'MultigraphBUT is not constructing well.')

%%% ¡test!
%%%% ¡name!
Randomize Rules
%%%% ¡probability!
.01
%%%% ¡code!
B = randn(10);

g = MultigraphBUT('B', B, 'THRESHOLDS', [.5]);
g.set('RANDOMIZE', true);
g.set('ATTEMPTSPEREDGE', 4);

A = g.get('A');

assert(isequal(size(A{1}), size(B)), ...
    [BRAPH2.STR ':GraphBU:' BRAPH2.FAIL_TEST], ...
    'GraphBU Randomize is not functioning well.')

g2 = MultigraphBUT('B', B, 'THRESHOLDS', [.5]);
g2.set('RANDOMIZE', false);
g2.set('ATTEMPTSPEREDGE', 4);
A2 = g2.get('A');
random_A = g2.get('RANDOMIZATION', A2);

assert(~isequal(A2, random_A), ...
    [BRAPH2.STR ':GraphWU:' BRAPH2.FAIL_TEST], ...
    'GraphWU Randomize is not functioning well.')

d1 = g.get('MEASURE', 'Degree');
d2 = g2.get('MEASURE', 'Degree');

assert(isequal(d1.get('M'), d2.get('M')), ...
    [BRAPH2.STR ':GraphWU:' BRAPH2.FAIL_TEST], ...
    'GraphWU Randomize is not functioning well.')
