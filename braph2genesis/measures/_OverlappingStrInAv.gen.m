%% ¡header!
OverlappingStrInAv < OverlappingStrIn (m, average ovrlapstrin) is the graph average overlapping strength.

%%% ¡description!
The average overlapping in-strength of a graph is the average of the sum of the 
in-strengths of a node in all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.M
%%%% ¡title!
OverlappingStrInAv

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingStrInAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping strength.
%%%% ¡default!
'OverlappingStrInAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping strength.
%%%% ¡default!
'The average overlapping in-strength of a graph is the average of the sum of the in-strengths of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping strength.
%%%% ¡settings!
'OverlappingStrInAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping strength.
%%%% ¡default!
'OverlappingStrInAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping strength.
%%%% ¡default!
'OverlappingStrInAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping strength.
%%%% ¡default!
'OverlappingStrInAv notes'

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
{'MultiplexWD'};

%%% ¡prop!
M (result, cell) is the overlapping strength.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
overlapping_in_strength = calculateValue@OverlappingStrIn(m, prop);
l = g.get('LAYERNUMBER');

if l == 0
    value = {};
else
    value = {mean(cell2mat(overlapping_in_strength))};
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingStrInAv.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  1
    .3  0   .1
    1   0   0
    ];
B22 = [
    0   1   .4
    1   0   0
    .7  .3  0
    ];
B = {B11 B22};

known_overlapping_in_strength = {mean([3 1.5 1.5])};

g = MultiplexWD('B', B);
m_outside_g = OverlappingStrInAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrInAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])