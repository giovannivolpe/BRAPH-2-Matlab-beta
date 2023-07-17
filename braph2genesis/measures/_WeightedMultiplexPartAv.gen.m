%% ¡header!
WeightedMultiplexPartAv < WeightedMultiplexPart (m, average weighted mxpart) is the graph average weighted multiplex participation.

%%% ¡description!
The average weighted multiplex participation of a graph is the average homogeneity 
of its number of neighbours across the layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.M
%%%% ¡title!
WeightedMultiplexPartAv

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
WeightedMultiplexPartAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMultiplexPartAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.
%%%% ¡default!
'The weighted multiplex participation of a graph is the nodal homogeneity of its number of inward neighbours across the layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.
%%%% ¡settings!
'WeightedMultiplexPartAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMultiplexPartAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMultiplexPartAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.
%%%% ¡default!
'WeightedMultiplexPartAv notes'

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
{'MultiplexWU' 'OrdMXWU'};

%%% ¡prop!
M (result, cell) is the weighted multiplex particiption.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class

weighted_multiplex_participation = calculateValue@WeightedMultiplexParticipation(m, prop);	
value = {mean(cell2mat(weighted_multiplex_participation))};

%% ¡tests!

%%% ¡excluded_props!
[WeightedMultiplexPartAv.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .5  1
    .5  0   0
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   0
    0   .5  0
    ];
B = {B11  B22};

known_weighted_multiplex_participation = {mean([24/25 3/4 8/9])};

g = MultiplexWD('B', B);
m_outside_g = WeightedMultiplexPartAv('G', g);

assert(isequal(m_outside_g.get('M'), known_weighted_multiplex_participation), ...
    [BRAPH2.STR ':WeightedMultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'WeightedMultiplexPartAv');
assert(isequal(m_inside_g.get('M'), known_weighted_multiplex_participation), ...
    [BRAPH2.STR ':WeightedMultiplexPartAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
