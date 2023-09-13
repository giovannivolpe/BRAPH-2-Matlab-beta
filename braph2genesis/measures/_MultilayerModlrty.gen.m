%% ¡header!
MultilayerModlrty < MultilayerCommunity  (m, multilayer modularity) is the graph multilayer modularity.

%%% ¡description!
The multilayer modularity of a multilayer graph is the multilayer 
quality function Q of the resulting partition of the multilayer network.  

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.M
%%%% ¡title!
MultilayerModlrty

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
MultilayerModlrty.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the multilayer modularity.
%%%% ¡default!
'MultilayerModlrty'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the multilayer modularity.
%%%% ¡default!
'The multilayer modularity is the homogeneity of the number of inward neighbours of a node across the layers.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the multilayer modularity.
%%%% ¡settings!
'MultilayerModlrty'

%%% ¡prop!
ID (data, string) is a few-letter code of the multilayer modularity.
%%%% ¡default!
'MultilayerModlrty ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the multilayer modularity.
%%%% ¡default!
'MultilayerModlrty label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the multilayer modularity.
%%%% ¡default!
'MultilayerModlrty notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.GLOBAL

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
{'MultiplexBU' 'MultilayerBU'} ;%TBE % % % add any missing tests

%%% ¡prop!
M (result, cell) is the multilayer modularity.
%%%% ¡calculate!
multilayer_community_structure = calculateValue@MultilayerCommunity(m, prop);
Q = 0;
if ~isempty(cell2mat(multilayer_community_structure))
    Q = m.get('QUALITY_FUNCTION');
end
multilayer_modularity = {Q};  % assign normalized quality function
value = multilayer_modularity;

%% ¡tests!

%%% ¡excluded_props!
[MultilayerModlrty.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
%%%% ¡code!
A = rand(5, 5);
B = {A A};
g = MultiplexBU('B', B);

m_outside_g = MultilayerModlrty('G', g);
assert(~isempty(m_outside_g.get('M')), ...
    [BRAPH2.STR ':MultilayerModlrty:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultilayerModlrty');
assert(~isempty(m_inside_g.get('M')), ...
    [BRAPH2.STR ':MultilayerModlrty:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultilayerBU
%%%% ¡probability!
.01
%%%% ¡code!
A11 = rand(5, 5);
A22 = rand(5, 5);
A12 = rand(size(A11, 1),size(A22, 2));
A21 = A12';
A = {A11 A12;
    A21 A22};
g = MultilayerBU('B', A);

m_outside_g = MultilayerModlrty('G', g);
assert(~isempty(m_outside_g.get('M')), ...
    [BRAPH2.STR ':MultilayerModlrty:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultilayerModlrty');
assert(~isempty(m_inside_g.get('M')), ...
    [BRAPH2.STR ':MultilayerModlrty:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])