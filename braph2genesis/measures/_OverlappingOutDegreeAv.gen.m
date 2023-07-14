%% ¡header!
OverlappingOutDegreeAv < OverlappingOutDegree (m, average overlapping out-degree) is the graph average overlapping out-degree.

%%% ¡description!
The average overlapping out-degree of a graph is the average of the sum of the 
out-degrees of a node in all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.M
%%%% ¡title!
OverlappingOutDegreeAv

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingOutDegreeAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping in-degree.
%%%% ¡default!
'OverlappingOutDegreeAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping in-degree.
%%%% ¡default!
'The average overlapping out-degree of a graph is the average of the sum of the out-degrees of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping in-degree.
%%%% ¡settings!
'OverlappingOutDegreeAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping in-degree.
%%%% ¡default!
'OverlappingOutDegreeAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping in-degree.
%%%% ¡default!
'OverlappingOutDegreeAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping in-degree.
%%%% ¡default!
'OverlappingOutDegreeAv notes'

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
{'MultiplexWD' 'MultiplexBD'};

%%% ¡prop!
M (result, cell) is the overlapping in-degree.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
overlapping_in_degree_av = calculateValue@OverlappingOutDegree(m, prop);

value = {mean(cell2mat(overlapping_in_degree_av))};

%% ¡tests!

%%% ¡excluded_props!
[OverlappingOutDegreeAv.PFM]

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

known_overlapping_out_degree_av = {mean([2, 3, 1])};

g = MultiplexBD('B', B);
m_outside_g = OverlappingOutDegreeAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_degree_av), ...
    [BRAPH2.STR ':OverlappingOutDegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingOutDegreeAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_degree_av), ...
    [BRAPH2.STR ':OverlappingOutDegreeAv:' BRAPH2.FAIL_TEST], ...
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

known_overlapping_out_degree_av = {mean([3, 1, 2])};

g = MultiplexWD('B', B);
m_outside_g = OverlappingOutDegreeAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_degree_av), ...
    [BRAPH2.STR ':OverlappingOutDegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingOutDegreeAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_degree_av), ...
    [BRAPH2.STR ':OverlappingOutDegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])