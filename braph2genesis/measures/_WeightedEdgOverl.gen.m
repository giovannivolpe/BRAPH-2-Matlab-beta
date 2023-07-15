%% ¡header!
WeightedEdgOvrl < Measure (m, weighted edge overlap) is the graph weighted edge overlap.

%%% ¡description!
The weighted edge overlap of a graph is the average weight of an edge 
across all layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.M
%%%% ¡title!
WeightedEdgOvrl

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
WeightedEdgOvrl.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the weighted edge overlap.
%%%% ¡default!
'WeightedEdgOvrl'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the weighted edge overlap.
%%%% ¡default!
'The weighted edge overlap of a graph is the average weight of an edge across all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the weighted edge overlap.
%%%% ¡settings!
'WeightedEdgOvrl'

%%% ¡prop!
ID (data, string) is a few-letter code of the weighted edge overlap.
%%%% ¡default!
'WeightedEdgOvrl ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the weighted edge overlap.
%%%% ¡default!
'WeightedEdgOvrl label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the weighted edge overlap.
%%%% ¡default!
'WeightedEdgOvrl notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.BINODAL

%%% ¡prop!
SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.
%%%% ¡default!
Measure.SUPERGLOBAL

%%% ¡prop!
PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.
%%%% ¡default!
Measure.NONPARAMETRIC

%%% ¡prop!
COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
%%%% ¡default!
{'MultiplexWU' 'MultiplexWD' 'OrdMxWU'};

%%% ¡prop!
M (result, cell) is the weighted edge overlap.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = g.get('PARTITIONS');

if l == 0
    value = {};
else
    N = g.get('NODENUMBER');
   weighted_edge_overlap = zeros(N(1));

    for li = 1:l
        Aii = A{li, li};
        weighted_edge_overlap = weighted_edge_overlap + Aii;
    end
    value = {weighted_edge_overlap / l};
end

%% ¡tests!

%%% ¡excluded_props!
[WeightedEdgOvrl.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  1
    .2  0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   .4
    0   .4  0
    ];
B = {B11 B22};

known_weighted_edge_overlap = {[
    0   .6  0.5
    .6   0  .2
    .5  .2  0
    ]};

g = MultiplexWU('B', B);
m_outside_g = WeightedEdgOvrl('G', g);
assert(isequal(m_outside_g.get('M'), known_weighted_edge_overlapoverlap), ...
    [BRAPH2.STR ':WeightedEdgOvrl:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'WeightedEdgOvrl');
assert(isequal(m_inside_g.get('M'), known_weighted_edge_overlapoverlap), ...
    [BRAPH2.STR ':WeightedEdgOvrl:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  0
    .2  0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   .4
    0   .4  0
    ];
B = {B11 B22};

known_weighted_edge_overlap = {[
    0   .6  0
    .6  0   .2
    .5  .2  0
    ]};

g = MultiplexWD('B', B);
m_outside_g = WeightedEdgOvrl('G', g);
assert(isequal(m_outside_g.get('M'), known_weighted_edge_overlapoverlap), ...
    [BRAPH2.STR ':WeightedEdgOvrl:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'WeightedEdgOvrl');
assert(isequal(m_inside_g.get('M'), known_weighted_edge_overlapoverlap), ...
    [BRAPH2.STR ':WeightedEdgOvrl:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])