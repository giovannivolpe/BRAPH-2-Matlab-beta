%% ¡header!
OverlappingDgrAv < OverlappingDgr (m, averge overlapping-degree) is the graph averge overlapping degree.

%%% ¡description!
The average overlapping degree of a graph is the average of the sum of the 
degrees of a node in all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.M
%%%% ¡title!
OverlappingDgrAv

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingDgrAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the averge overlapping degree.
%%%% ¡default!
'OverlappingDgrAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the averge overlapping degree.
%%%% ¡default!
'The averge overlapping degree of a graph is the sum of the degrees of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the averge overlapping degree.
%%%% ¡settings!
'OverlappingDgrAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the averge overlapping degree.
%%%% ¡default!
'OverlappingDgrAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the averge overlapping degree.
%%%% ¡default!
'OverlappingDgrAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the averge overlapping degree.
%%%% ¡default!
'OverlappingDgrAv notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.GLOBAL

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
{'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU' 'MaltilayerWU' 'OrdMlWU'};

%%% ¡prop!
M (result, cell) is the averge overlapping degree.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = g.get('PARTITIONS');

if l == 0
    value = {};
else
    overlapping_degree = calculateValue@OverlappingDgr(m, prop);
    overlapping_degree_av = cell(length(l), 1);

    for i=1:length(l)
        overlapping_degree_av(i) = {mean(overlapping_degree{i})};
    end
    value = overlapping_degree_av;
    if contains(class(g),'Multilayer') | contains(class(g),'OrdMl')
     value = {mean([sum(cell2mat(overlapping_degree'),2)])}
    end 
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingDgrAv.PFM]

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
    1   0   .3
    0   .3  0
    ];
B = {B11 B22};

known_overlapping_degree = {mean([3, 3, 2]')};

g = MultiplexWU('B', B);
m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   1
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   1   0
    ];
B = {B11 B22};

known_overlapping_degree = {mean([3, 3, 2]')};

g = MultiplexBU('B', B);
m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUT
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   1
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   1   0
    ];
B = {B11 B22};

known_overlapping_degree = { ...
    mean([3, 3, 2]')
    mean([0, 0, 0]')
    };

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);

m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   1
    1   0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   1
    0   1   0
    ];
B = {B11 B22};

known_overlapping_degree = { ...
    mean([0, 0, 0]')
    mean([4, 4, 4]')
    };

g = MultiplexBUD('B', B, 'DENSITIES', [0 100]);

m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
OrdMxWU
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
    1   0   .3
    0   .3  0
    ];
B = {B11 B22};

known_overlapping_degree = {mean([3, 3, 2]')};

g = OrdMxWU('B', B);
m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultilayerWU
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
    1   0   .3
    0   .3  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B21 = B12';
B = {B11 B12;
     B21 B22};

known_overlapping_degree = {mean([3, 3, 2]')};
g = MultilayerWU('B', B);
m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
OrdMlWU
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
    1   0   .3
    0   .3  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B21 = B12';
B = {B11 B12;
     B21 B22};

known_overlapping_degree = {mean([3, 3, 2]')};
g = OrdMlWU('B', B);
m_outside_g = OverlappingDgrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingDgrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_degree), ...
    [BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])