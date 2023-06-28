%% ¡header!
KCore < Measure (m, kcore) is the kcore.

%%% ¡description!
The k-core of a graph is the largest subnetwork comprising nodes of degree k or higher. 
  k is set by the user; the default value is equal to 1.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the kcore.
%%%% ¡default!
'KCore'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the kcore.
%%%% ¡default!
'The kcore of a graph is the shortest path between all pairs of nodes within a layer of the graph. For weighted graphs, the kcore is calculated with the Dijkstra algorithm using the inverse weight as the kcore associated to the edge.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the kcore.

%%% ¡prop!
ID (data, string) is a few-letter code of the kcore.
%%%% ¡default!
'KCore ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the kcore.
%%%% ¡default!
'KCore label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the kcore.
%%%% ¡default!
'KCore notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.BINODAL__.
%%%% ¡default!
Measure.BINODAL

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
{'GraphBD' 'GraphBU' 'GraphWD' 'GraphWU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexBD' 'MultiplexBU' 'MultiplexWD' 'MultiplexWU' 'MultiplexBUD' 'MultiplexBUT'} ;%TBE % % % add tests for 'MultilayerWD' 'MultilayerBD'

%%% ¡prop!
M (result, cell) is the kcore.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');

kcore_threshold = m.get('KCoreThreshold');

k_core = cell(L, 1);
directionality_type =  g.get('DIRECTIONALITY_TYPE', L);
parfor li = 1:1:L    
    Aii = A{li, li};
    directionality_layer = directionality_type(li, li);   
    
    iter = 0;
    subAii = binarize(Aii);
    while 1
        % get degrees of matrix
        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
            deg = sum(subAii, 1)';  % degree undirected graphs
        else
            deg = (sum(subAii, 1)' + sum(subAii, 2));  % degree directed
        end
        
        % find nodes with degree < k
        low_k_nodes = find((deg < kcore_threshold) & (deg > 0));
        
        % if none found -> stop
        if (isempty(low_k_nodes)) break; end; %#ok<SEPEX>
        
        % peel away found nodes
        iter = iter + 1;
        subAii(low_k_nodes, :) = 0;
        subAii(:, low_k_nodes) = 0;
    end
    k_core(li) = {subAii};  % add k-core of layer li
end

value = k_core;

%% ¡props!
%%% ¡prop! 
KCORETHRESHOLD (parameter, SCALAR) is the k-core threshold
%%%% ¡default!
1

%% ¡tests!

%%% ¡excluded_props!
[KCore.PFM]

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

known_kcore = {[
                0  1  1  0;
                1  0  1  0;
                1  1  0  0;
                0  0  0  0
                ]};

g = GraphBU('B', B);

m_outside_g = KCore('G', g, 'KCORETHRESHOLD', 2);
assert(isequal(m_outside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'KCore');
m_inside_g.set('KCORETHRESHOLD', 2);
assert(isequal(m_inside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

known_kcore = {[
                0  1  1  0;
                1  0  1  0;
                1  1  0  0;
                0  0  0  0
                ]};

g = GraphBD('B', B);

m_outside_g = KCore('G', g, 'KCORETHRESHOLD', 4);
assert(isequal(m_outside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'KCore');
m_inside_g.set('KCORETHRESHOLD', 4);
assert(isequal(m_inside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
    0   .1  1  0; 
    .1  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];

A22 = [
    0   .1  1  1; 
    .1  0   1  .8; 
    1   1   0  0;
    1   .8  0  0
    ];
A = {A11 A22};
             
known_kcore(1) = {[
                0  1  1  0;
                1  0  1  0;
                1  1  0  0;
                0  0  0  0
                ]};
known_kcore(2, 1) = {[
                0  1  1  1;
                1  0  1  1;
                1  1  0  0;
                1  1  0  0
                ]};   

g = MultiplexWU('B', A);

m_outside_g = KCore('G', g, 'KCORETHRESHOLD', 2);
assert(isequal(m_outside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'KCore');
m_inside_g.set('KCORETHRESHOLD', 2);
assert(isequal(m_inside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
    0   1   1  .1; 
    .2  0   1  1; 
    1   1   0  0;
    0   .3  0  0
    ];

A22 = [
    0   1   1   .1; 
    .2  0   1   1; 
    1   1   0   0;
    0   .3  .7  0
    ];
A = {A11 A22};
             

known_kcore(1) = {[
                0  1  1  0;
                1  0  1  0;
                1  1  0  0;
                0  0  0  0
                ]};
known_kcore(2, 1) = {[
                0  1  1  1;
                1  0  1  1;
                1  1  0  0;
                0  1  1  0
                ]};   

g = MultiplexWD('B', A);

m_outside_g = KCore('G', g, 'KCORETHRESHOLD', 4);
assert(isequal(m_outside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'KCore');
m_inside_g.set('KCORETHRESHOLD', 4);
assert(isequal(m_inside_g.get('M'), known_kcore), ...
    [BRAPH2.STR ':KCore:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])



