%% ¡header!
WeightedMxPartiAv < WeightedMxParti (m, average weighted mxpart) is the graph average weighted multiplex participation.

%%% ¡description!
The average weighted multiplex participation of a graph is the average homogeneity 
of its number of neighbours across the layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.M
%%%% ¡title!
WeightedMxPartiAv

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
WeightedMxPartiAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMxPartiAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.
%%%% ¡default!
'The weighted multiplex participation of a graph is the nodal homogeneity of its number of inward neighbours across the layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.
%%%% ¡settings!
'WeightedMxPartiAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMxPartiAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the weighted multiplex particiption.
%%%% ¡default!
'WeightedMxPartiAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.
%%%% ¡default!
'WeightedMxPartiAv notes'

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
{'MultiplexWU' 'OrdMxWU'};

%%% ¡prop!
M (result, cell) is the weighted multiplex particiption.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class

weighted_multiplex_participation = calculateValue@WeightedMxParti(m, prop);	
value = {mean(cell2mat(weighted_multiplex_participation))};

%% ¡tests!

%%% ¡excluded_props!
[WeightedMxPartiAv.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWU
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

g = MultiplexWU('B', B);
m_outside_g = WeightedMxPartiAv('G', g);

assert(isequal(m_outside_g.get('M'), known_weighted_multiplex_participation), ...
    [BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'WeightedMxPartiAv');
assert(isequal(m_inside_g.get('M'), known_weighted_multiplex_participation), ...
    [BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
