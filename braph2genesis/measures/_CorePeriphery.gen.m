%% ¡header!
CorePeriphery < Richness (m, core-periphery) is the graph core-periphery.

%%% ¡description!
The core-periphery of a node is the value of the rank corresponding 
to the maximum richness nodes. It returns 1 for a node belonging to the 
core and zero otherwise. 

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the core-periphery.
%%%% ¡default!
'CorePeriphery'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the core-periphery.
%%%% ¡default!
'The core-periphery of a node is the value of the rank corresponding to the maximum richness nodes. It returns 1 for a node belonging to the core and zero otherwise.'
%%% ¡prop!
TEMPLATE (parameter, item) is the template of the core-periphery.

%%% ¡prop!
ID (data, string) is a few-letter code of the core-periphery.
%%%% ¡default!
'CorePeriphery ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the core-periphery.
%%%% ¡default!
'CorePeriphery label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the core-periphery.
%%%% ¡default!
'CorePeriphery notes'

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
{'GraphWU' 'GraphWD' 'GraphBU' 'GraphBD' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT'} ;

%%% ¡prop!
M (result, cell) is the core-periphery.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
richness = calculateValue@Richness(m, prop);
L = g.get('LAYERNUMBER');
N = g.get('NODENUMBER');

if L == 0
    value = {};
else
    directionality_layer =  g.get('DIRECTIONALITY_TYPE', L);
    connectivity_layer =  g.get('CONNECTIVITY_TYPE', L);
    core_periphery = cell(L, 1);
    
    for li = 1:1:L
        core_periphery_partition = zeros(N(1), 1);
        
        if connectivity_layer == Graph.WEIGHTED  % weighted graphs
            if directionality_layer == Graph.UNDIRECTED  % undirected graphs
                
                strength = Strength('G', g).get('M');
                deg = strength{li};
                
            else  % directed graphs
                
                in_strength = StrengthIn('G', g).get('M');
                out_strength = StrengthOut('G', g).get('M');
                deg = (in_strength{li} + out_strength{li})/2;
            end
            
        else  % binary graphs
            if directionality_layer == Graph.UNDIRECTED  % undirected graphs
                
                degree = Degree('G', g).get('M');
                deg = degree{li};
                
            else  % directed graphs
                
                in_degree = DegreeIn('G', g).get('M');
                out_degree = DegreeOut('G', g).get('M');
                deg = (in_degree{li} + out_degree{li})/2;
            end
        end
        
        [~, rankingInd] = sort(deg, 'descend');
        richness_partition = richness{li};
        [~, rankOfMaxRichness] = max(richness_partition(rankingInd));  
        core_periphery_partition(rankingInd(1:rankOfMaxRichness)) = 1;
        core_periphery(li) = {core_periphery_partition};
    end
    value = core_periphery;
end

%% ¡tests!

%%% ¡excluded_props!
[CorePeriphery.PFM]

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡code!
B = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

known_core_periphery = {[1 1 0 0]'};

g = GraphBU('B', B);

core_periphery = CorePeriphery('G', g).get('M');

assert(isequal(core_periphery, known_core_periphery), ...
    [BRAPH2.STR ':CorePeriphery:' BRAPH2.BUG_ERR], ...
    'CorePeriphery is not being calculated correctly for GraphBU.')

%%% ¡test!
%%%% ¡name!
MultigraphBUT
%%%% ¡code!
B = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

known_core_periphery = {
                 [1 1 0 0]'
                 [1 0 0 0]'};

g = MultigraphBUT('B', B, 'THRESHOLDS', [0 1]);
core_periphery = CorePeriphery('G', g).get('M');

assert(isequal(core_periphery, known_core_periphery), ...
    [BRAPH2.STR ':CorePeriphery:' BRAPH2.BUG_ERR], ...
    'CorePeriphery is not being calculated correctly for MultigraphBUT.')

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡code!
B11 = [
    0  1  1  0; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

B22 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    1  1  0  0
    ];
B = {B11 B22};

known_core_periphery = {
                     [1 1 0 0]'
                     [1 1 1 0]'};     

g = MultiplexBU('B', B);
core_periphery = CorePeriphery('G', g).get('M');

assert(isequal(core_periphery, known_core_periphery), ...
    [BRAPH2.STR ':CorePeriphery:' BRAPH2.BUG_ERR], ...
    'CorePeriphery is not being calculated correctly for MultiplexBU.')