%% ¡header!
LocalEfficiencyAv < LocalEfficiency (m,average local efficiency) is the graphaverage local efficiency.

%%% ¡description!
The average local efficiency is the average of all the local efficiencies 
  within each layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of theaverage local efficiency.
%%%% ¡default!
'LocalEfficiencyAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of theaverage local efficiency.
%%%% ¡default!
'The average local efficiency is the average of all the local efficiencies within each layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of theaverage local efficiency.
%%%% ¡settings!
'LocalEfficiencyAv'

%%% ¡prop!
ID (data, string) is a few-letter code of theaverage local efficiency.
%%%% ¡default!
'LocalEfficiencyAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of theaverage local efficiency.
%%%% ¡default!
'LocalEfficiencyAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about theaverage local efficiency.
%%%% ¡default!
'LocalEfficiencyAv notes'

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
%%% ¡default!
{'GraphWU' 'GraphBU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT'};

%%% ¡prop!
M (result, cell) is theaverage local efficiency.
%%%% ¡calculate!
local_efficiency = calculateValue@LocalEfficiency(m, prop);

g = m.get('G');  % graph from measure class

local_efficiency_av = cell(g.get('LAYERNUMBER'), 1);ls = g.get('PARTITIONS');
L = g.get('LAYERNUMBER');

if L == 0
    value = {};
    return;
end

parfor li = 1:g.get('LAYERNUMBER')
    local_efficiency_av(li) ={mean(local_efficiency{li})};
end

value = local_efficiency_av;

%% ¡tests!

%%% ¡excluded_props!
[LocalEfficiencyAv.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0   .2  .2  .1
    .2  0   .3  0
    .2  .3  0   .3
    .1  0   .3  0
    ];

known_local_efficiency = {mean([1/4 1/5 .1222 1/5]')};

g = GraphWU('B', B);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];

known_local_efficiency = {mean([5/6 1 5/6 1]')};

g = GraphBU('B', B);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];

known_local_efficiency = {...
    mean([0   0 0   0]')
    mean([5/6 1 5/6 1]')
    };

densities = [10 90];
g = MultigraphBUD('B', B, 'DENSITIES', densities);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUT
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];

known_local_efficiency = {...
    mean([0   0 0   0]')
    mean([5/6 1 5/6 1]')
    };

thresholds = [0 1];
g = MultigraphBUT('B', B, 'THRESHOLDS', thresholds);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .2  .2  .1
    .2  0   .3  0
    .2  .3  0   .3
    .1  0   .3  0
    ];
B22 = [
    0   .2  .2  .1
    .2  0   .3  0
    .2  .3  0   .3
    .1  0   .3  0
    ];
B = {B11 B22};

known_local_efficiency = {
    mean([1/4 1/5 .1222 1/5]')
    mean([1/4 1/5 .1222 1/5]')
    };

g = MultiplexWU('B', B);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];

B22 = [
    0  1  1  1
    1  0  1  0
    1  1  0  1
    1  0  1  0
    ];
B = {B11 B22};

known_local_efficiency = {
    mean([5/6 1 5/6 1]')
    mean([5/6 1 5/6 1]')
    };

g = MultiplexBU('B', B);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];

B22 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];
B = {B11 B22};

known_local_efficiency = {                         
                         mean([0   0 0   0]')
                         mean([0   0 0   0]')
                         mean([5/6 1 5/6 1]')
                         mean([5/6 1 5/6 1]')
                         };

g = MultiplexBUD('B', B, 'DENSITIES', [10 90]);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUT
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];

B22 = [
       0  1  1  1
       1  0  1  0
       1  1  0  1
       1  0  1  0
      ];
B = {B11 B22};

known_local_efficiency = {
    mean([5/6 1 5/6 1]')
    mean([5/6 1 5/6 1]')
    mean([0   0 0   0]')
    mean([0   0 0   0]')
    };
thresholds = [0 1];
g = MultiplexBUT('B', B, 'THRESHOLDS', thresholds);

m_outside_g = LocalEfficiency('G', g);
assert(isequal(m_outside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
assert(isequal(m_inside_g.get('M'), known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])