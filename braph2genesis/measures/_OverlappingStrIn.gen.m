%% ¡header!
OverlappingStrIn < StrengthIn (m, ovrlapstrin) is the graph overlapping strength.

%%% ¡description!
The overlapping in-strength of a graph is the sum of the in-strengths of a 
node in all layers.

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.M
%%%% ¡title!
OverlappingStrIn

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
OverlappingStrIn.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the overlapping strength.
%%%% ¡default!
'OverlappingStrIn'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the overlapping strength.
%%%% ¡default!
'The overlapping in-strength of a graph is the sum of the in-strengths of a node in all layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the overlapping strength.
%%%% ¡settings!
'OverlappingStrIn'

%%% ¡prop!
ID (data, string) is a few-letter code of the overlapping strength.
%%%% ¡default!
'OverlappingStrIn ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the overlapping strength.
%%%% ¡default!
'OverlappingStrIn label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the overlapping strength.
%%%% ¡default!
'OverlappingStrIn notes'

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
{'MultiplexWD'};

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
    strength = calculateValue@StrengthIn(m, prop);	
    overlapping_strength = zeros(N(1), 1);
    for li = 1:l  
        overlapping_strength = overlapping_strength + strength{li}';
    end
    value = {overlapping_strength};
end

%% ¡tests!

%%% ¡excluded_props!
[OverlappingStrIn.PFM]

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

known_overlapping_in_strength = {[3 1.5 1.5]'};

g = MultiplexWD('B', B);
m_outside_g = OverlappingStrIn('G', g);
assert(isequal(m_outside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'OverlappingStrIn');
assert(isequal(m_inside_g.get('M'), known_overlapping_in_strength), ...
    [BRAPH2.STR ':OverlappingStrIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])