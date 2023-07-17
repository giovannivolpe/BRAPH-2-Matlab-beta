%% ¡header!
MultiplexCorePeriph < Multirich (m, multiplex core-periphery) is the graph multiplex core-periphery.

%%% ¡description!
The multiplex core-periphery of a node is the value of the rank corresponding 
 to the maximum multirichness nodes. It returns 1 for a node belonging to the 
 core and zero otherwise. The relevance of each layer is controlled by the 
 multirichness coefficients that are between 0 and 1, and add up to one; 
 the default coefficients are (1/layernumber).

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.ID
%%%% ¡title!
Measure ID

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.LABEL
%%%% ¡title!
Measure NAME

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.G
%%%% ¡title!
Graph

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.M
%%%% ¡title!
MultiplexCorePeriph

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.PFM
%%%% ¡title!
Measure Plot

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.NOTES
%%%% ¡title!
Measure NOTES

%%% ¡prop!
%%%% ¡id!
MultiplexCorePeriph.COMPATIBLE_GRAPHS
%%%% ¡title!
Compatible Graphs

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the weighted multiplex particiption.
%%%% ¡default!
'MultiplexCorePeriph'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.
%%%% ¡default!
'The multiplex core-periphery of a node is the value of the rank corresponding to the maximum multirichness nodes. It returns 1 for a node belonging to the  core and zero otherwise. The relevance of each layer is controlled by the  multirichness coefficients that are between 0 and 1, and add up to one;  the default coefficients are (1/layernumber).'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.
%%%% ¡settings!
'MultiplexCorePeriph'

%%% ¡prop!
ID (data, string) is a few-letter code of the weighted multiplex particiption.
%%%% ¡default!
'MultiplexCorePeriph ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the weighted multiplex particiption.
%%%% ¡default!
'MultiplexCorePeriph label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.
%%%% ¡default!
'MultiplexCorePeriph notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.NODAL

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
{'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT''OrdMXWU'};

%%% ¡prop!
M (result, cell) is the weighted multiplex particiption.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
l = g.get('LAYERNUMBER');
ls = g.get('PARTITIONS');

multirichness = calculateValue@Multirichness(m, prop);

if l == 0
    value = {};
else
    N = g.get('NODENUMBER');
    multirichness_coefficients = m.get('MULTIRICHNESS_COEFFICIENTS');
    assert(length(multirichness_coefficients) == ls(1) || all(multirichness_coefficients == 0), ...
        [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
        ['Multirichness coefficients must have the same length than the ' ...
        'number of layers (' tostring(ls(1)) ') while its length is ' tostring(length(multirichness_coefficients))])

    if length(multirichness_coefficients) == ls(1)
        assert(all(multirichness_coefficients <= 1) && all(multirichness_coefficients >= 0), ...
            [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
            ['Multirichness coefficients must be between 0 and 1 ' ...
            'while they are ' tostring(multirichness_coefficients)])
        c = multirichness_coefficients;

    else  % same relevance for each layer
        c = ones(1, l)/ls(1);
    end

    directionality_layer =  g.get('DIRECTIONALITY_TYPE', l);
    connectivity_layer =  g.get('CONNECTIVITY_TYPE', l);
    multiplex_core_periphery = cell(length(ls), 1);
    count = 1;
    for i = 1:1:length(ls)
        overlapping_coefficients = zeros(N(1), 1);
        multiplex_core_periphery_partition = zeros(N(1), 1);
        for li = count:1:ls(i) + count - 1
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
            overlapping_coefficients = overlapping_coefficients + c(li)*deg;
        end
        [~, rankingInd] = sort(overlapping_coefficients, 'descend');
        multirichness_partition = multirichness{i};
        [~, rankOfMaxMultirichness] = max(multirichness_partition(rankingInd));  
        multiplex_core_periphery_partition(rankingInd(1:rankOfMaxMultirichness)) = 1;
        count = count + ls(i);
        multiplex_core_periphery(i) = {multiplex_core_periphery_partition};
    end
    value = multiplex_core_periphery;
end

%% ¡tests!

%%% ¡excluded_props!
[MultiplexCorePeriph.PFM]

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   .1  1  0; 
    .1  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];
B22 = [
    0   .1  1  1; 
    .1  0   1  .8; 
    1   1   0  0;
    1   .8  0  0
    ];
B = {B11 B22};

known_multiplex_core_periphery = {[0 0 1 0]'};      

g = MultiplexWU('B', B);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0   1   1  .1; 
    .2  0   1  1; 
    1   1   0  0;
    0   .3  0  0
    ];
B22 = [
    0   1   1   .1; 
    .2  0   1   1; 
    1   1   0   0;
    0   .3  .7  0
    ];
B = {B11 B22};

known_multiplex_core_periphery = {[0 1 1 0]'};      

g = MultiplexWD('B', B);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
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

known_multiplex_core_periphery = {[1 1 1 0]'};      

g = MultiplexBU('B', B);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡probability!
.01
%%%% ¡code!
B11 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    0  1  0  0
    ];

B22 = [
    0  1  1  1; 
    1  0  1  1; 
    1  1  0  0;
    0  1  1  0
    ];
B = {B11 B22};
             
known_multiplex_core_periphery = {[1 1 1 0]'};      

g = MultiplexBU('B', B);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUT
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

known_multiplex_core_periphery = {
    [1 1 1 0]'
    [1 0 0 0]'};

g = MultiplexBUT('B', B, 'THRESHOLDS', [0 1]);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUD
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

known_multiplex_core_periphery = {    
    [1 0 0 0]'
    [1 1 1 0]'};

g = MultiplexBUD('B', B, 'DENSITIES', [10 90]);
m_outside_g = MultiplexCorePeriph('G', g);

assert(isequal(m_outside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'MultiplexCorePeriph');
assert(isequal(m_inside_g.get('M'), known_multiplex_core_periphery), ...
    [BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

