%% ¡header!
SmallWorldness < PathLengthAv (m, small-worldness) is the graph small-worldness.

%%% ¡description!
The small-worldness coefficient is the fraction of the clustering coefficient 
  and average path length of each layer and the clustering coefficient and 
  average path length of 100 random graphs.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the small-worldness.
%%%% ¡default!
'SmallWorldness'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the small-worldness.
%%%% ¡default!
'The small-worldness coefficient is the fraction of the clustering coefficient and average path length of each layer and the clustering coefficient and average path length of 100 random graphs.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the small-worldness.
%%%% ¡settings!
'SmallWorldness'

%%% ¡prop!
ID (data, string) is a few-letter code of the small-worldness.
%%%% ¡default!
'SmallWorldness ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the small-worldness.
%%%% ¡default!
'SmallWorldness label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the small-worldness.
%%%% ¡default!
'SmallWorldness notes'

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
M (result, cell) is the small-worldness.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
if isempty(g.get('A'))
    value = {};
    return;
end
L = g.get('LAYERNUMBER');
path_length_rule = m.get('RULE');
clustering_av = ClusteringAv('G', g).get('M');
path_length_av = calculateValue@PathLengthAv(m, prop);

M = 100;  % number of random graphs
clustering_av_random = cell(1, M);
path_length_av_random = cell(1, M);
for r = 1:1:M
    g_random = g.randomize();

    clustering_av_random(r) = {ClusteringAv('G', g_random).get('M')};
    path_length_av_random(r) = {PathLengthAv('G', g_random, 'RULE', path_length_rule).get('M')}; 
    
end
path_length_av_random = cellfun(@(x) cell2mat(x), path_length_av_random, 'UniformOutput', false);
clustering_av_random = cellfun(@(x) cell2mat(x), clustering_av_random, 'UniformOutput', false);
path_length_av_random = cell2mat(path_length_av_random);
clustering_av_random = cell2mat(clustering_av_random);
path_length_av_random = mean(path_length_av_random, 2);
clustering_av_random = mean(clustering_av_random, 2);

small_worldness = cell(L, 1);
for li = 1:1:L
    small_worldness_layer = (clustering_av{li}/clustering_av_random(li)) / (path_length_av{li}/ path_length_av_random(li));
    small_worldness_layer(isnan(small_worldness_layer)) = 0;  % node NaN corresponds to 0/0 or Inf/Inf from path length (disconnected nodes)
    small_worldness(li) = {small_worldness_layer};
end

value = small_worldness;

%% ¡tests!

%%% ¡excluded_props!
[SmallWorldness.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
B = rand(20);

known_smallworldness = {1};

g = GraphWU('B', B);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B = rand(20);

known_smallworldness = {1};

g = GraphBU('B', B);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUD
%%%% ¡probability!
.01
%%%% ¡code!
B = rand(20);

known_smallworldness = {0 1};

densities = [1 90];

g = MultigraphBUD('B', B, 'DENSITIES', densities);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUT
%%%% ¡code!
thresholds = [0 1];
B = rand(20);

known_smallworldness = {1 0};

g = MultigraphBUT('B', B, 'THRESHOLDS', thresholds);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = rand(20);
B22 = rand(20);

B = {B11 B22};

known_smallworldness = {1; 1};

g = MultiplexWU('B', B);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = rand(20);
B22 = rand(20);

B = {B11 B22};

known_smallworldness = {1; 1};

g = GraphBU('B', B);

m_outside_g = SmallWorldness('G', g);
assert(isequal(m_outside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'SmallWorldness');
assert(isequal(m_inside_g.get('M'), known_smallworldness), ...
    [BRAPH2.STR ':SmallWorldness:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])