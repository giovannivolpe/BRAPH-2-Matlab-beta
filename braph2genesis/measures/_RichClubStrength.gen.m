%% ¡header!
RichClubStrength < Strength (m, richclubstrength) is the graph richclubstrength.

%%% ¡description!
The rich-club strength of a node at level s is the sum of the weighted edges 
  that connect nodes of strength s or higher within a layer. 
  s is set by the user and it can be a vector containting all the strength thresholds 
  the default value is equal to 1.
%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the richclubstrength.
%%%% ¡default!
'RichClubStrength'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the richclubstrength.
%%%% ¡default!
'The rich-club strength of a node at level s is the sum of the weighted edges that connect nodes of strength s or higher within a layer. s is set by the user and it can be a vector containting all the strength thresholds the default value is equal to 1.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the richclubstrength.
%%%% ¡settings!
'RichClubStrength'

%%% ¡prop!
ID (data, string) is a few-letter code of the richclubstrength.
%%%% ¡default!
'RichClubStrength ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the richclubstrength.
%%%% ¡default!
'RichClubStrength label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the richclubstrength.
%%%% ¡default!
'RichClubStrength notes'

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
Measure.PARAMETRIC

%%% ¡prop!
COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
%%%% ¡default!
{'GraphWU' 'GraphWD' 'MultiplexWU' 'MultiplexWD'};

%%% ¡prop!
M (result, cell) is the richclubstrength.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');
N = g.get('NODENUMBER');

rich_club_strength = cell(L, 1); 
directionality_type = g.get('DIRECTIONALITY_TYPE', L);
richclub_threshold = m.get('PARAMETRIC_VALUE');
assert(mod(richclub_threshold, 1) == 0, ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.WRONG_INPUT], ...
    ['RichClubStrength threshold must be an integer value ' ...
    'while it is ' tostring(richclub_threshold)])

k_level = abs(richclub_threshold);
for li = 1:1:L
    
    Aii = A{li, li};
    directionality_layer = directionality_type(li, li);

    if directionality_layer == Graph.UNDIRECTED  % undirected graphs
       
        degree = calculateValue@Strength(m, prop); 
        deg = degree{li};

    else  % directed graphs
      
        in_strength = StrengthIn('G', g).get('M');        
        out_strength = StrengthOut('G', g).get('M');       

        deg = (in_strength{li} + out_strength{li})/2;
    end

    richclub_layer = zeros(N(1), 1, k_level);
    for k = 1:1:k_level
        low_rich_nodes = find(deg <= k);  % get lower rich nodes with degree <= k
        Aii = binarize(Aii);  % binarizes the adjacency matrix
        subAii = Aii;  % extract subnetwork of nodes >k by removing nodes <= k of Aii
        subAii(low_rich_nodes, :) = 0;  % remove rows
        subAii(:, low_rich_nodes) = 0;  % remove columns

        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
            richclub_layer(:, :, k) = sum(subAii, 1)';  % degree of high rich nodes
        else
            richclub_layer(:, :, k) = (sum(subAii, 1)' + sum(subAii, 2))/2;  % degree of high rich nodes
        end

    end
    rich_club_strength(li) = {richclub_layer};  % add rich club degree of layer li          
end

value = rich_club_strength;

%% ¡props!
%%% ¡prop! 
PARAMETRIC_VALUE (parameter, SCALAR) 
%%%% ¡default!
1

%% ¡tests!

%%% ¡excluded_props!
[RichClubStrength.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0   .1  1  0; 
    .1  0   1  .8; 
    1   1   0  0;
    0   .8  0  0
    ];


known_rich_club_strength = {[1.1 1.1 2 0]'};

g = GraphWU('B', B);

m_outside_g = RichClubStrength('G', g);
assert(isequal(m_outside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'RichClubStrength');
assert(isequal(m_inside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0   1   1  .1; 
    .2  0   1  1; 
    1   1   0  0;
    0   .3  0  0
    ];

wrich(:, 1, 1) = [1.6 1.6 2 0]';
wrich(:, 1, 2) = [0 0 0 0]';
known_rich_club_strength = {wrich};

g = GraphWD('B', B);

m_outside_g = RichClubStrength('G', g);
assert(isequal(m_outside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'RichClubStrength');
assert(isequal(m_inside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWU
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

w_richness_l1(:, 1, 1) = [1.6 1.6 2 0]';
w_richness_l1(:, 1, 2) = [0 0 0 0]';

w_richness_l2(:, 1, 1) = [1.6 1.6 2 0]';
w_richness_l2(:, 1, 2) = [0 1 1 0]';

known_rich_club_strength = {
    w_richness_l1
    w_richness_l2
    };

g = MultiplexWU('B', A);
m_outside_g = RichClubStrength('G', g, 'PARAMETRIC_VALUE', [1.5, 2]);
assert(isequal(m_outside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'RichClubStrength');
m_inside_g.set('PARAMETRIC_VALUE', [1.5, 2]);
assert(isequal(m_inside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
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

w_richness_l1(:, 1, 1) = [1.6 1.6 2 0]';
w_richness_l1(:, 1, 2) = [0 0 0 0]';

w_richness_l2(:, 1, 1) = [1.6 1.6 2 0]';
w_richness_l2(:, 1, 2) = [0 1 1 0]';

known_rich_club_strength = {
    w_richness_l1
    w_richness_l2
    };

g = MultiplexWD('B', A);
m_outside_g = RichClubStrength('G', g, 'PARAMETRIC_VALUE', [1.5, 2]);
assert(isequal(m_outside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'RichClubStrength');
m_inside_g.set('PARAMETRIC_VALUE', [1.5, 2]);
assert(isequal(m_inside_g.get('M'), known_rich_club_strength), ...
    [BRAPH2.STR ':RichClubStrength:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

