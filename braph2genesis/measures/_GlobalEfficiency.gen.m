%% ¡header!
GlobalEfficiency < Distance (m, global efficiency) is the graph global efficiency.

%%% ¡description!
The global efficiency is the average inverse shortest path length within each layer. 
It is inversely related to the characteristic path length.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the global efficiency.
%%%% ¡default!
'GlobalEfficiency'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the global efficiency.
%%%% ¡default!
'The global efficiency is the average inverse shortest path length within each layer. It is inversely related to the characteristic path length.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the global efficiency.

%%% ¡prop!
ID (data, string) is a few-letter code of the degree.
%%%% ¡default!
'GlobalEfficiency ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the global efficiency.
%%%% ¡default!
'GlobalEfficiency label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the global efficiency.
%%%% ¡default!
'GlobalEfficiency notes'

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
{'GraphWU' 'GraphBU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT'}


%%% ¡prop!
M (result, cell) is the global efficiency.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');
N = g.get('NODENUMBER');

distance = calculateValue@Distance(m, prop);

global_efficiency = cell(L, 1);
parfor li = 1:1:L
    inverse_distance = distance{li}.^-1;  % inverse distance
    inverse_distance(1:N(li)+1:end) = 0;
    global_efficiency_layer = (sum(inverse_distance, 2) / (N(li)-1));
    global_efficiency(li) = {global_efficiency_layer};
end
value = global_efficiency;

%% ¡tests!

%%% ¡excluded_props!
[GlobalEfficiency.PFM]

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0   .1  0   0   0
    .2  0   0   0   0
    0   0   0   .2  0
    0   0   .1  0   0
    0   0   0   0   0
    ];

known_global_efficiency = {[1/4 1/4 1/4 1/4 0]'};

g = GraphBU('B', B);
m_global_efficiency = GlobalEfficiency('G', g);

assert(isequal(m_global_efficiency.get('M'), known_global_efficiency), ...
    [BRAPH2.STR ':GlobalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_global_efficiency) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
      0   .1  0   0   0
      .2  0   0   0   0
      0   0   0   .2  0
      0   0   .1  0   0
      0   0   0   0   0
      ];

B22 = [
      0   .1  0   0   0
      .2  0   0   0   0
      0   0   0   .2  0
      0   0   .1  0   0
      0   0   0   0   0
      ];
B33 = [
      0   .1  0   0   0
      .2  0   0   0   0
      0   0   0   .2  0
      0   0   .1  0   0
      0   0   0   0   0
      ];
B = {B11  B22  B33};

known_global_efficiency = {
                        [1/4 1/4 1/4 1/4 0]'
                        [1/4 1/4 1/4 1/4 0]'
                        [1/4 1/4 1/4 1/4 0]'
                        };


g = MultiplexBU('B', B);
m_global_efficiency = GlobalEfficiency('G', g);

assert(isequal(m_global_efficiency.get('M'), known_global_efficiency), ...
    [BRAPH2.STR ':GlobalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(m_global_efficiency) ' is not being calculated correctly for ' class(g) '.'])
