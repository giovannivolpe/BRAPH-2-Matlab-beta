%% ¡header!
OverlappingStrOutAv < OverlappingStrOut (m, average ovrlapstrout) is the graph average overlapping strength.

%%% ¡description!
The average overlapping out-strength of a graph is the average of the sum of the out-strengths of a 
node in all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.M
%%%% ¡title!
OverlappingStrOutAv

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingStrOutAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping strength.
%%%% ¡default!
'OverlappingStrOutAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping strength.
%%%% ¡default!
'The average overlapping out-strength of a graph is the average of the sum of the out-strengths of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping strength.
%%%% ¡settings!
'OverlappingStrOutAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping strength.
%%%% ¡default!
'OverlappingStrOutAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping strength.
%%%% ¡default!
'OverlappingStrOutAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping strength.
%%%% ¡default!
'OverlappingStrOutAv notes'

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
{'MultiplexWD' 'MultilayerWD' 'OrdMlWD'};

%%% ¡prop!
M (result, cell) is the overlapping strength.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
overlapping_out_strength = calculateValue@OverlappingStrOut(m, prop);
l = g.get('LAYERNUMBER');

if l == 0
    value = {};
else
    value = {mean(cell2mat(overlapping_out_strength))};
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingStrOutAv.PFM]

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
    0   1   0
    1   0   0
    .7  .3  0
    ];
B = {B11 B22};

known_overlapping_in_strength = {mean([2.2 1.4 2])};

g = MultiplexWD('B', B);
m_outside_g = OverlappingStrOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrOutAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultilayerWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  1
    .3  0   .1
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   0
    .7  .3  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B21 = B12';
B = {B11 B12;
     B21 B22};

known_overlapping_out_strength_av = {mean([2.2 1.4 2]')};

g = MultilayerWD('B', B);
m_outside_g = OverlappingStrOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_strength_av), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrOutAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_strength_av), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
OrdMlWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  1
    .3  0   .1
    1   0   0
    ];
B22 = [
    0   1   0
    1   0   0
    .7  .3  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B21 = B12';
B = {B11 B12;
     B21 B22};

known_overlapping_out_strength_av = {mean([2.2 1.4 2]')};

g = OrdMlWD('B', B);
m_outside_g = OverlappingStrOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_out_strength_av), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrOutAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_out_strength_av), ...
    [BRAPH2.STR ':OverlappingStrOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])