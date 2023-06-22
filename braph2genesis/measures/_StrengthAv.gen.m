%% ¡header!
StrengthAv < Strength (m, average strength) is the graph average strength.

%%% ¡description!
The average strength of a graph is the average of the sum of all weights of 
the edges connected to a node within a layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the average strength.
%%%% ¡default!
'StrengthAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the average strength.
%%%% ¡default!
'The average strength of a graph is the average of the sum of all weights of the edges connected to a node within a layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the average strength.

%%% ¡prop!
ID (data, string) is a few-letter code of the average strength.
%%%% ¡default!
'StrengthAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the average strength.
%%%% ¡default!
'StrengthAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the average strength.
%%%% ¡default!
'StrengthAv notes'

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
{'GraphWU' 'MultiplexWU' 'OrdMxWU'}

%%% ¡prop!
M (result, cell) is the average strength.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
L = g.get('LAYERNUMBER');

strength = calculateValue@Strength(m, prop);

strength_av = cell(L, 1);
parfor li = 1:L
    strength_av(li) = {mean(strength{li})};
end

value = strength_av;

%% ¡tests!

%%% ¡excluded_props!
[StrengthAv.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  .2 1
    .2 0  0
    1  0  0
    ];
known_strength = {mean([1.2 0.2 1]')};
g = GraphWU('B', B);
m_outside_g = StrengthAv('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthAv');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
MultiplexWU
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
                 mean([1.2 .2  1]')
                 mean([1   1.4 .4]')
                 };
                                
g = MultiplexWU('B', B);
m_outside_g = StrengthAv('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthAv');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
OrdMxWU
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
B= {B11 B22};

known_strength = {
    mean([1.2 .2 1]')
    mean([1 1.3 .3]')
    };

g = OrdMxWU('B', B);

m_outside_g = StrengthAv('G', g);
assert(isequal(m_outside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'StrengthAv');
assert(isequal(m_inside_g.get('M'), known_strength), ...
    [BRAPH2.STR ':StrengthAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
