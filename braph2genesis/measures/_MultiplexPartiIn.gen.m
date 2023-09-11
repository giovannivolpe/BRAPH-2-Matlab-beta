%% ¡header!
MultiplexPartiIn < Measure (m, multiplex in-participation) is the graph multiplex in-participation.

%%% ¡description!
The multiplex in-participation is the homogeneity of the number of inward 
neighbours of a node across the layers.
 
%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.M
%%%% ¡title!
MultiplexPartiIn

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
MultiplexPartiIn.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the multiplex in-participation.
%%%% ¡default!
'MultiplexPartiIn'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the multiplex in-participation.
%%%% ¡default!
'The multiplex in-participation is the homogeneity of the number of inward neighbours of a node across the layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the multiplex in-participation.
%%%% ¡settings!
'MultiplexPartiIn'

%%% ¡prop!
ID (data, string) is a few-letter code of the multiplex in-participation.
%%%% ¡default!
'MultiplexPartiIn ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the multiplex in-participation.
%%%% ¡default!
'MultiplexPartiIn label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the multiplex in-participation.
%%%% ¡default!
'MultiplexPartiIn notes'

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
{'MultiplexBD' 'MultiplexWD'} ;%TBE % % % add any missing tests

%%% ¡prop!
M (result, cell) is the multiplex in-participation.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
L = g.get('LAYERNUMBER');
if L == 0
    value = {};
else
    N = g.get('NODENUMBER');
    in_degree = DegreeIn('G', g).get('M');
    overlapping_in_degree = OverlappingDgrIn('G', g).get('M');  
    multiplex_in_participation =  zeros(N(1), 1);
    for li = 1:1:L
        multiplex_in_participation = multiplex_in_participation + (in_degree{li}./overlapping_in_degree{1}).^2;
    end
    multiplex_in_participation = L / (L - 1) * (1 - multiplex_in_participation);
    multiplex_in_participation(isnan(multiplex_in_participation)) = 0;  % Should return zeros, since NaN happens when strength = 0 and overlapping strength = 0 for all regions
    value = {multiplex_in_participation};
end

%% ¡tests!

%%% ¡excluded_props!
[MultiplexPartiIn.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   0
    0   0   1
    0   1   0
    ];
B22 = [
    0   0   1
    0   0   0
    1   0   0
    ];
B33 = [
    0   1   0
    1   0   0
    0   1   0
    ];
B = {B11 B22 B33};

known_multiplex_in_participation = {[3/4 3/4 3/4]'};

g = MultiplexBD('B', B);

m_outside_g = MultiplexPartiIn('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_in_participation), ...
    [BRAPH2.STR ':MultiplexPartiIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartiIn');
assert(isequal(m_inside_g.get('M'), known_multiplex_in_participation), ...
    [BRAPH2.STR ':MultiplexPartiIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

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

known_multiplex_in_participation = {[8/9 8/9 1]'};

g = MultiplexWD('B', B);

m_outside_g = MultiplexPartiIn('G', g);
assert(isequal(m_outside_g.get('M'), known_multiplex_in_participation), ...
    [BRAPH2.STR ':MultiplexPartiIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexPartiIn');
assert(isequal(m_inside_g.get('M'), known_multiplex_in_participation), ...
    [BRAPH2.STR ':MultiplexPartiIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])