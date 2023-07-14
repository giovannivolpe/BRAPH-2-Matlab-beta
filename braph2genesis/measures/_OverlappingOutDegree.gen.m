%% ¡header!
OverlappingOutDegree < DegreeOut (m, overlapping out-degree) is the graph overlapping out-degree.

%%% ¡description!
The overlapping out-degree of a graph is the sum of the out-degrees of a node 
in all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.M
%%%% ¡title!
OverlappingOutDegree

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegree.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping out-degree.
%%%% ¡default!
'OverlappingOutDegree'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping out-degree.
%%%% ¡default!
'The overlapping out-degree of a graph is the sum of the out-degrees of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping out-degree.
%%%% ¡settings!
'OverlappingOutDegree'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping out-degree.
%%%% ¡default!
'OverlappingOutDegree ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping out-degree.
%%%% ¡default!
'OverlappingOutDegree label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping out-degree.
%%%% ¡default!
'OverlappingOutDegree notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.NODAL

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
{'MultiplexWD' 'MultiplexBD'};

%%% ¡prop!
M (result, cell) is the overlapping out-degree.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = l;
if l == 0
    value = {};
else
    N = g.get('NODENUMBER');
    out_degree = calculateValue@DegreeOut(m, prop);
    overlapping_out_degree = zeros(N(1), 1);

    for li = 1:l 
        overlapping_out_degree = overlapping_out_degree + out_degree{li};
    end
    value = {overlapping_out_degree};
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingOutDegree.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   0
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   0   0
    ];
B = {B11 B22};

known_overlapping_out_degree = {[2, 3, 1]'};

g = MultiplexBD('B', B);
m_outside_g = OverlappingOutDegree('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_degree), ...
    [BRAPH2.STR ':OverlappingOutDegree:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingOutDegree');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_degree), ...
    [BRAPH2.STR ':OverlappingOutDegree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .4  1
    0   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   0
    0   .3  0
    ];
B = {B11 B22};

known_overlapping_out_degree = {[3, 1, 2]'};

g = MultiplexWD('B', B);
m_outside_g = OverlappingOutDegree('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_degree), ...
    [BRAPH2.STR ':OverlappingOutDegree:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingOutDegree');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_degree), ...
    [BRAPH2.STR ':OverlappingOutDegree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])