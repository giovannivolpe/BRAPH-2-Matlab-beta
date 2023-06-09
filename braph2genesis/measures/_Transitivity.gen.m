%% ¡header!
Transitivity < Measure (m, transitivity) is the graph transitivity.

%%% ¡description!
The transitivity of a graph is the fraction of triangles to the number 
of (unordered) triplets within a layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the transitivity.
%%%% ¡default!
'Transitivity'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the transitivity.
%%%% ¡default!
'The transitivity of a graph is the fraction of triangles to the number of (unordered) triplets within a layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the transitivity.

%%% ¡prop!
ID (data, string) is a few-letter code of the transitivity.
%%%% ¡default!
'Transitivity ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the transitivity.
%%%% ¡default!
'Transitivity label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the transitivity.
%%%% ¡default!
'Transitivity notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
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
%%%% ¡default!
{'GraphWU' 'GraphWD' 'GraphBU' 'GraphBD' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT'}

%%% ¡prop!
M (result, cell) is the transitivity.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');

transitivity = cell(L, 1);
triangles = calculateValue@Triangles(m, prop);

directionality_type =  g.get('DIRECTIONALITY_TYPE', g.get('LAYERNUMBER'));
parfor li = 1:1:L      
    Aii = A{li, li};
    if directionality_type == Graph.UNDIRECTED  % undirected graphs
        
        degree = Degree('G', g).get('M');
        
        transitivity_layer = 2 * sum(triangles{li}) ./ sum((degree{li} .* (degree{li} - 1)));
        
    else  % directed graphs
        
        in_degree = InDegree('G', g).get('M');
        
        out_degree = OutDegree('G', g).get('M');
        
        transitivity_layer = sum(triangles{li}) ./ sum(((out_degree{li} + in_degree{li}) .* (out_degree{li} + in_degree{li} - 1) - 2 * diag(Aii^2)));
    end
    transitivity_layer(isnan(transitivity_layer)) = 0;  % Should return zeros, not NaN
    transitivity(li) = {transitivity_layer};
end
value = transitivity;

%% ¡tests!

%%% ¡excluded_props!
[Transitivity.PFM]

%%% ¡test!
%%%% ¡name!
GraphWU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {3/4};

g = GraphWU('B', B);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {3/4};

g = GraphWD('B', B);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {3/4};

g = GraphBU('B', B);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {3/4};

g = GraphBD('B', B);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUD
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {[0 3/4]};
densities = [33 99];

g = MultigraphBUD('B', B, 'DENSITIES', densities);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUT
%%%% ¡probability!
.01
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

known_transitivity = {[0 3/4]};
thresholds = [0 1];

g = MultigraphBUT('B', B, 'THRESHOLDS', thresholds);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWU
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

known_transitivity = {
                 3/4
                 3/4
                 };      

g = MultiplexWU('B', A);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

known_transitivity = {
                 3/4
                 3/4
                 };      

g = MultiplexWD('B', A);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

known_transitivity = {
                 3/4
                 3/4
                 };      

g = MultiplexBU('B', A);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

known_transitivity = {
                 3/4
                 3/4
                 };      

g = MultiplexBD('B', A);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUD
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

densities = [33 99];

known_transitivity = {
    0
    0
    3/4
    3/4
    };

g = MultiplexBUD('B', A, 'DENSITIES', densities);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUT
%%%% ¡probability!
.01
%%%% ¡code!
A11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
A = {A11 A22};

thresholds = [33 99];

known_transitivity = {
    0
    0
    3/4
    3/4
    };

g = MultiplexBUT('B', A, 'THRESHOLDS', densities);
m_outside_g = Transitivity('G', g);

assert(isequal(m_outside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Transitivity');
assert(isequal(m_inside_g.get('M'), known_transitivity), ...
    [BRAPH2.STR ':Transitivity:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
