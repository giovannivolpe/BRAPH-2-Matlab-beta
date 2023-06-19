%% ¡header!
StrengthIn < Measure (m, in-strength) is the graph in-strength.

%%% ¡description!
The in-strength of a graph is the sum of all weights of the inward edges 
connected to a node within a layer, i.e., it is the sum of the columns of 
the adjacency matrix. 

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the in-strength.
%%%% ¡default!
'StrengthIn'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the in-strength.
%%%% ¡default!
'The in-strength of a graph is the sum of all weights of the inward edges connected to a node within a layer, i.e., it is the sum of the columns of the adjacency matrix.'
%%% ¡prop!
TEMPLATE (parameter, item) is the template of the in-strength.

%%% ¡prop!
ID (data, string) is a few-letter code of the in-strength.
%%%% ¡default!
'StrengthIn ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the in-strength.
%%%% ¡default!
'StrengthIn label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the in-strength.
%%%% ¡default!
'StrengthIn notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.NODAL

%%% ¡prop!
SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.
%%%% ¡default!
Measure.UNILAYER

%%% ¡prop!
PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.
%%%% ¡default!
Measure.NONPARAMETRIC

%%% ¡prop!
COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
%%%% ¡default!
{'GraphWD' 'MultiplexWD'}

%%% ¡prop!
M (result, cell) is the in-strength.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)

L = g.get('LAYERNUMBER');
in_strength = cell(L, 1);

parfor li = 1:1:L
    Aii = A{li, li};
    in_strength(li) = {sum(Aii, 1)};  % calculates the in-strength of a node for layer li
end
value = in_strength;

%% ¡tests!

%%% ¡excluded_props!
[StrengthIn.PFM]

%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  .2 1
    .2 0  0
    1  0  0
    ];
known_strength = {[1.2 0.2 1]};
g = GraphWD('B', B);
m_outside_g = StrengthIn('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthIn');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0  .2 1
    .2 0  0
    1  0  0
    ];
B22 = [
    0 1  0
    1 0  .4
    0 .4 0
    ];
B = {B11 B22};

known_strength = {
                 [1.2 .2  1]
                 [1   1.4 .4]
                 };
                                
g = MultiplexWD('B', B);
m_outside_g = StrengthIn('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthIn');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])