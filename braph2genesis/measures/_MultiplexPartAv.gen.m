%% ¡header!
MultiplexPartAv < MultiplexPart (m, average mxpart) is the graph average multiplex participation.

%%% ¡description!
The average multiplex participation of a graph is the average homogeneity 
    of its number of neighbours across the layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.M
%%%% ¡title!
MultiplexPartAv

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
MultiplexPartAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the multiplex participation.
%%%% ¡default!
'MultiplexPartAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the multiplex participation.
%%%% ¡default!
'The average multiplex participation of a graph is the average homogeneity of its number of neighbours across the layers.' 

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the multiplex participation.
%%%% ¡settings!
'MultiplexPartAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the multiplex participation.
%%%% ¡default!
'MultiplexPartAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the multiplex participation.
%%%% ¡default!
'MultiplexPartAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the multiplex participation.
%%%% ¡default!
'MultiplexPartAv notes'

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
{'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};

%%% ¡prop!
M (result, cell) is the multiplex participation.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = g.get('PARTITIONS');

if l == 0
    value = {};
else
    multiplex_participation = calculateValue@MultiplexPart(m, prop);
    multiplex_participation_av = cell(length(ls), 1);

    for i=1:length(ls)
        multiplex_participation_av(i) = {mean(multiplex_participation{i})};
    end
    value = multiplex_participation_av;
end

%% ¡tests!

%%% ¡excluded_props!
[MultiplexPartAv.PFM]

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
B = {B11  B22};
known_multiplex_participation = {mean([8/9 8/9 1]')};

g = MultiplexWU('B', B);
m_outside_g = MultiplexPartAv('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartAv');
assert(isequal(m_inside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
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
B33 = [
    0   1   0
    1   0   0
    0   0   0
    ];
B = {B11 B22 B33};

known_multiplex_participation = {mean([15/16 15/16 3/4]')};

g = MultiplexBU('B', B);
m_outside_g = MultiplexPartAv('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartAv');
assert(isequal(m_inside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
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
B33 = [
    0   1   0
    1   0   0
    0   0   0
    ];
B = {B11 B22 B33};

known_multiplex_participation = {...
    mean([15/16 15/16 3/4]')
    mean([0, 0, 0]')
    };

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);

m_outside_g = MultiplexPartAv('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartAv');
assert(isequal(m_inside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
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
B33 = [
    0   1   0
    1   0   0
    0   0   0
    ];
B = {B11 B22 B33};

known_multiplex_participation = {...    
    mean([0, 0, 0]')
    mean( [15/16 15/16 3/4]')
    };

g = MultiplexBUD('B', B, 'DENSITIES', [0 90]);

m_outside_g = MultiplexPartAv('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartAv');
assert(isequal(m_inside_g.get('M'), known_multiplex_participation), ...
    [BRAPH2.STR ':MultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])