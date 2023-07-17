%% ¡header!
MultiplexPartOut < Measure (m, multiplex out-participation) is the graph multiplex out-participation.

%%% ¡description!
The multiplex out-participation is the homogeneity of the number of outward 
 neighbours of a node across the layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.M
%%%% ¡title!
MultiplexPartOut

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
MultiplexPartOut.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the multiplex out-participation.
%%%% ¡default!
'MultiplexPartOut'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the multiplex out-participation.
%%%% ¡default!
'The multiplex out-participation is the homogeneity of the number of outward neighbours of a node across the layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the multiplex out-participation.
%%%% ¡settings!
'MultiplexPartOut'

%%% ¡prop!
ID (data, string) is a few-letter code of the multiplex out-participation.
%%%% ¡default!
'MultiplexPartOut ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the multiplex out-participation.
%%%% ¡default!
'MultiplexPartOut label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the multiplex out-participation.
%%%% ¡default!
'MultiplexPartOut notes'

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
M (result, cell) is the multiplex out-participation.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = g.get('PARTITIONS');

if l == 0
    value = {};
else
    N = g.get('NODENUMBER');
    out_degree = DegreeOut('G', g).get('M');
    overlapping_out_degree = OverlappingDegOut('G', g).get('M');
    multiplex_out_participation =  zeros(N(1), 1);

    for li = 1:1:L
        multiplex_out_participation = multiplex_out_participation + (out_degree{li}./overlapping_out_degree{1}).^2;
    end
    multiplex_out_participation = L / (L - 1) * (1 - multiplex_out_participation);
    multiplex_out_participation(isnan(multiplex_out_participation)) = 0;  % Should return zeros, since NaN happens when strength = 0 and overlapping strength = 0 for all regions
    value = {multiplex_out_participation};
end

%% ¡tests!

%%% ¡excluded_props!
[MultiplexPartOut.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWD
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
B = {B11  B22};

known_multiplex_out_participation = {[8/9 8/9 1]'};

g = MultiplexWD('B', B);
m_outside_g = MultiplexPartOut('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_out_participation), ...
    [BRAPH2.STR ':MultiplexPartOut:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartOut');
assert(isequal(m_inside_g.get('M'), known_multiplex_out_participation), ...
    [BRAPH2.STR ':MultiplexPartOut:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

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
    0   1   0
    ];
B33 = [
    0   1   0
    1   0   0
    0   1   0
    ];
B = {B11 B22 B33};

known_multiplex_out_participation = {[1 15/16 1]'};

g = MultiplexBD('B', B);
m_outside_g = MultiplexPartOut('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_out_participation), ...
    [BRAPH2.STR ':MultiplexPartOut:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartOut');
assert(isequal(m_inside_g.get('M'), known_multiplex_out_participation), ...
    [BRAPH2.STR ':MultiplexPartOut:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])