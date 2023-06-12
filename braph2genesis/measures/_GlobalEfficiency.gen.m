%% ¡header!
GlobalEfficiency < Measure (m, globalefficiency) is the graph globalefficiency.

%%% ¡description!
The global efficiency is the average inverse shortest path length within each layer. 
It is inversely related to the characteristic path length.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the globalefficiency.
%%%% ¡default!
'GlobalEfficiency'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the globalefficiency.
%%%% ¡default!
'The global efficiency is the average inverse shortest path length within each layer. It is inversely related to the characteristic path length.'
%%% ¡prop!
TEMPLATE (parameter, item) is the template of the globalefficiency.

%%% ¡prop!
ID (data, string) is a few-letter code of the degree.
%%%% ¡default!
'GlobalEfficiency ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the globalefficiency.
%%%% ¡default!
'GlobalEfficiency label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the globalefficiency.
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

%% ¡props_update!

%%% ¡prop!
M (result, cell) is theglobalefficiency.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
N = g.get('NODENUMBER');

distance = Distance('G', g).get('M');

globalefficiency = cell(g.get('LAYERNUMBER'), 1);
parfor li = 1:1:g.get('LAYERNUMBER')
    inverse_distance = distance{li}.^-1;  % inverse distance
    inverse_distance(1:N(li)+1:end) = 0;
    globalefficiency_layer = (sum(inverse_distance, 2) / (N(li)-1));
    globalefficiency(li) = {globalefficiency_layer};
end
value = globalefficiency;

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

known_globalefficiency = {[1/4 1/4 1/4 1/4 0]'};

g = GraphBU('B', B);
m_globalefficiency = GlobalEfficiency('G', g).get('M');

assert(isequal(m_globalefficiency, known_globalefficiency), ...
    [BRAPH2.STR ':GlobalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(globalefficiency) ' is not being calculated correctly for ' class(g) '.'])

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

known_globalefficiency = {
                        [1/4 1/4 1/4 1/4 0]'
                        [1/4 1/4 1/4 1/4 0]'
                        [1/4 1/4 1/4 1/4 0]'
                        };


g = MultiplexBU('B', B);
m_globalefficiency = GlobalEfficiency('G', g).get('M');

assert(isequal(m_globalefficiency, known_globalefficiency), ...
    [BRAPH2.STR ':GlobalEfficiency:' BRAPH2.FAIL_TEST], ...
    [class(globalefficiency) ' is not being calculated correctly for ' class(g) '.'])
