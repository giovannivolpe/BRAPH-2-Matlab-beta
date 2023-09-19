%% ¡header!
LocalEfficiency < Measure (m, local efficiency) is the graph local efficiency.

%%% ¡description!
The local efficiency is the average inverse shortest path length with 
  local nodes within each layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the local efficiency.
%%%% ¡default!
'LocalEfficiency'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the local efficiency.
%%%% ¡default!
'The local efficiency is the average inverse shortest path length with local nodes within each layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the local efficiency.
%%%% ¡settings!
'LocalEfficiency'

%%% ¡prop!
ID (data, string) is a few-letter code of the local efficiency.
%%%% ¡default!
'LocalEfficiency ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the local efficiency.
%%%% ¡default!
'LocalEfficiency label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the local efficiency.
%%%% ¡default!
'LocalEfficiency notes'

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
{'GraphWU' 'GraphBU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT'};

%%% ¡prop!
M (result, cell) is the local efficiency.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');
local_efficiency = cell(L, 1);
N = g.get('NODENUMBER');

parfor li = 1:L
    Aii = A{li, li};    
    local_efficiency_layer = zeros(N(li), 1);
    for i = 1:1:N(li)
        nodes = find(Aii(i, :)  | Aii(:, i).');  % neighbours of u
        if numel(nodes) > 1
            sub_graph = g.get('SUBGRAPH', nodes);
            global_efficiency = GlobalEfficiency('G', sub_graph).get('M');
            local_efficiency_layer(i) = mean(global_efficiency{li});
        end
    end
    local_efficiency(li) = {local_efficiency_layer};
end

value = local_efficiency;

%% ¡tests!

%%% ¡excluded_props!
[LocalEfficiency.PFM]

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

known_local_efficiency = {round([1/4 1/5 .1222 1/5]', 3)};

g = GraphWU('B', B);

m_outside_g = LocalEfficiency('G', g);
tmp_val = m_outside_g.get('M');
assert(isequal(round(tmp_val{1}, 3), known_local_efficiency{1}), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
tmp_val = m_inside_g.get('M');
assert(isequal(round(tmp_val{1}, 3), known_local_efficiency{1}), ...
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

known_local_efficiency = {[5/6 1 5/6 1]'};

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
    [0   0 0   0]'
    [5/6 1 5/6 1]'
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
        [5/6 1 5/6 1]'
	    [0   0 0   0]'	    
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
    round([1/4 1/5 .1222 1/5]', 3)
    round([1/4 1/5 .1222 1/5]', 3)
    };

g = MultiplexWU('B', B);

m_outside_g = LocalEfficiency('G', g);
tmp_val = m_outside_g.get('M');
tmp_val = cellfun(@(x) round(x, 3), tmp_val, 'UniformOutput', false);
assert(isequal(tmp_val, known_local_efficiency), ...
    [BRAPH2.STR ':LocalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'LocalEfficiency');
tmp_val = m_inside_g.get('M');
tmp_val = cellfun(@(x) round(x, 3), tmp_val, 'UniformOutput', false);
assert(isequal(tmp_val, known_local_efficiency), ...
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
    [5/6 1 5/6 1]'
    [5/6 1 5/6 1]'
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
                         [0   0 0   0]'
                         [0   0 0   0]' 
                         [5/6 1 5/6 1]'
                         [5/6 1 5/6 1]'
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
                         [5/6 1 5/6 1]'
                         [5/6 1 5/6 1]'
                         [0   0 0   0]'
                         [0   0 0   0]'                         
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
