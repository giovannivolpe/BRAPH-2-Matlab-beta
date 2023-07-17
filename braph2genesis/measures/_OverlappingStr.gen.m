%% ¡header!
OverlappingStr < Strength (m, ovrlapstr) is the graph overlapping strength.

%%% ¡description!
The overlapping strength of a graph is the sum of the strengths of a node in 
all layers. 

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingStr.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingStr.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingStr.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingStr.M
%%%% ¡title!
OverlappingStr

%%% ¡prop!
%%%% ¡id!
OverlappingStr.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingStr.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingStr.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping strength.
%%%% ¡default!
'OverlappingStr'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping strength.
%%%% ¡default!
'The overlapping strength of a graph is the sum of the strengths of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping strength.
%%%% ¡settings!
'OverlappingStr'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping strength.
%%%% ¡default!
'OverlappingStr ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping strength.
%%%% ¡default!
'OverlappingStr label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping strength.
%%%% ¡default!
'OverlappingStr notes'

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
{'MultiplexWU' 'OrdMxWU'};

%%% ¡prop!
M (result, cell) is the overlapping strength.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');

if l == 0
    value = {};
else
    N = g.get('NODENUMBER');
    strength = calculateValue@Strength(m, prop);	
    overlapping_strength = zeros(N(1), 1);
    for li = 1:l 
        overlapping_strength = overlapping_strength + strength{li};
    end
    value = {overlapping_strength};
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingStr.PFM]

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

known_overlapping_strength = {[2.2 1.5 1.3]'};

g = MultiplexWU('B', B);
m_outside_g = OverlappingStr('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_strength), ...
    [BRAPH2.STR ':OverlappingStr:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStr');
assert(isequal(m_inside_g.get('M'), known_overlapping_strength), ...
    [BRAPH2.STR ':OverlappingStr:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])