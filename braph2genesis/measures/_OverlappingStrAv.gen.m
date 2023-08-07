%% ¡header!
OverlappingStrAv < OverlappingStr (m, averge overlapping strength) is the graph averge overlapping degree.

%%% ¡description!
The average overlapping strength of a graph is the average of the sum of the 
strengths of a node in all layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.M
%%%% ¡title!
OverlappingStrAv

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingStrAv.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the averge overlapping degree.
%%%% ¡default!
'OverlappingStrAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the averge overlapping degree.
%%%% ¡default!
'The average overlapping strength of a graph is the average of the sum of the strengths of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the averge overlapping degree.
%%%% ¡settings!
'OverlappingStrAv'

%%% ¡prop!
ID (data, string) is a few-letter code of the averge overlapping degree.
%%%% ¡default!
'OverlappingStrAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the averge overlapping degree.
%%%% ¡default!
'OverlappingStrAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the averge overlapping degree.
%%%% ¡default!
'OverlappingStrAv notes'

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
M (result, cell) is the averge overlapping degree.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
overlapping_strength = calculateValue@OverlappingStr(m, prop);
ls = g.get('PARTITIONS');

if l == 0
    value = {};
else

    value = {mean(cell2mat(overlapping_strength))};
end


%% ¡tests!

%%% ¡excluded_props!
[OverlappingStrAv.PFM]

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

known_overlapping_str = {mean([2.2 1.5 1.3])};

g = MultiplexWU('B', B);
m_outside_g = OverlappingStrAv('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_str), ...
    [BRAPH2.STR ':OverlappingStrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrAv');
assert(isequal(m_inside_g.get('M'), known_overlapping_str), ...
    [BRAPH2.STR ':OverlappingStrAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])