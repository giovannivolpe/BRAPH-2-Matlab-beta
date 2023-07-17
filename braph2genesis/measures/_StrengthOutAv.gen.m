%% ¡header!
StrengthOutAv < StrengthOut (m, average out-strength) is the graph average out-strength.

%%% ¡description!
The average out-strength of a graph is the mean of the sum of all weights of the outward edges 
connected to a node within a layer, i.e., it is the sum of the rows of 
the adjacency matrix. 

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the out-strength.
%%%% ¡default!
'StrengthOutAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the out-strength.
%%%% ¡default!
'The average out-strength of a graph is the mean of the sum of all weights of the outward edges connected to a node within a layer, i.e., it is the sum of the rows of the adjacency matrix.'
%%% ¡prop!
TEMPLATE (parameter, item) is the template of the out-strength.

%%% ¡prop!
ID (data, string) is a few-letter code of the out-strength.
%%%% ¡default!
'StrengthOutAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the out-strength.
%%%% ¡default!
'StrengthOutAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the out-strength.
%%%% ¡default!
'StrengthOutAv notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.GLOBAL__.
%%%% ¡default!
Measure.GLOBAL

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
M (result, cell) is the out-strength.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
out_strength = calculateValue@StrengthOut(m, prop);
L = g.get('LAYERNUMBER');

out_strength_av = cell(L, 1);

parfor li = 1:1:L
    out_strength_av(li) = {mean(out_strength{li})};
end

value = out_strength_av;

%% ¡tests!

%%% ¡excluded_props!
[StrengthOutAv.PFM]

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
known_strength = {mean([1.2 0.2 1])};
g = GraphWD('B', B);
m_outside_g = StrengthOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthOutAv');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthOutAv:' BRAPH2.FAIL_TEST], ...
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
                 mean([1.2 .2  1])
                 mean([1   1.4 .4])
                 };
                                
g = MultiplexWD('B', B);
m_outside_g = StrengthOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthOutAv');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
