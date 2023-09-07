%% ¡header!
AssortInward < Measure (m, in-in-assortativity) is the graph in-in-assortativity.

%%% ¡description!
The in-in-assortativity coefficient of a graph is the correlation coefficient between 
  the degrees/strengths of all nodes on two opposite ends of an edge within a layer. 
The corresponding coefficient for directed and weighted networks is calculated by 
  using the weighted and directed variants of in-degree/in-strength.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the in-in-assortativity.
%%%% ¡default!
'AssortInward'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the in-in-assortativity.
%%%% ¡default!
'The in-in-assortativity coefficient of a graph is the correlation coefficient between the degrees/strengths of all nodes on two opposite ends of an edge within a layer. The corresponding coefficient for directed and weighted networks is calculated by using the weighted and directed variants of in-degree/in-strength.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the in-in-assortativity.
%%%% ¡settings!
'AssortInward'

%%% ¡prop!
ID (data, string) is a few-letter code of the in-in-assortativity.
%%%% ¡default!
'AssortInward ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the in-in-assortativity.
%%%% ¡default!
'AssortInward label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the in-in-assortativity.
%%%% ¡default!
'AssortInward notes'

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
%%%% ¡default!
{'GraphBD' 'GraphWD' 'MultiplexWD' 'MultiplexBD' 'MultilayerWD' 'OrdMlWD'};

%%% ¡prop!
M (result, cell) is the in-in-assortativity.
%%%% ¡calculate!
g = m.get('G'); % graph from measure class
A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
L = g.get('LAYERNUMBER');
N = g.get('NODENUMBER');
in_in_assortativity = cell(L, 1);
connectivity_types = g.get('CONNECTIVITY_TYPE', L);  
parfor li = 1:L
    Aii = A{li, li};
    connectivity_type = connectivity_types(li, li);
    [i, j] = find(Aii ~= 0);  % nodes [i, j]
    M = length(i);  % Number of edges
    k_i = zeros(M, L);
    k_j = zeros(length(j), L);
    
    if connectivity_type == Graph.WEIGHTED  % weighted graphs
        in_strength = StrengthIn('G', g).get('M');
        d = in_strength{li};
    else  % binary graphs
        in_degree = DegreeIn('G', g).get('M');
        d= in_degree{li};
    end
    
    k_i(:, li) = d(i);  % in-degree/in-strength node i
    k_j(:, li) = d(j);  % in-degree/in-strength node j
    % compute assortativity
    assortativity_layer = (sum(k_i(:, li) .* k_j(:, li)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2)...
        / (sum(0.5 * (k_i(:, li).^2 + k_j(:, li).^2)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2);
    assortativity_layer(isnan(assortativity_layer)) = 0;  % Should return zeros, not NaN
    
    in_in_assortativity(li) = {assortativity_layer};
end

value = in_in_assortativity;

%% ¡tests!

%%% ¡excluded_props!
[AssortInward.PFM]

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡probability!
.01
%%%% ¡code!
A = [
    0  1  0  0  0;
    0  0  1  0  0;
    0  0  0  1  0;
    0  1  0  0  1;
    1  0  0  1  0
    ];

known_in_in_assortativity = {(15/7-(21/14)^2)/(35/14-(21/14)^2)};

g = GraphBD('B', A);
in_in_assortativity = AssortInward('G', g).get('M');

m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡code!
A = [
    0  2  0  0  0;
    0  0  3  0  0;
    0  0  0  1  0;
    0  2  0  0  2;
    1  0  0  2  0
    ];

known_in_in_assortativity = {(15/7-(21/14)^2)/(35/14-(21/14)^2)};

g = GraphWD('B', A);
m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡code!
A11 = [
      0  1  0  0  0;
      0  0  1  0  0;
      0  0  0  1  0;
      0  1  0  0  1;
      1  0  0  1  0
    ];

A22 = [
      0  1  0  0  0;
      0  0  1  0  0;
      0  0  0  1  0;
      0  1  0  0  1;
      1  0  0  1  0
    ];
A = {A11 A22};
             
known_in_in_assortativity = {
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    };    

g = MultiplexBD('B', A);

m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡code!
A11 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A22 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A = {A11 A22};

known_in_in_assortativity = {
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    };   

g = MultiplexWD('B', A);

m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
OrdMlWD
%%%% ¡code!
A11 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A22 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A12 = rand(size(A11,1),size(A22,2));
A21 = A12';


A = {A11 A12;
    A21 A22;};


known_in_in_assortativity = {
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    };   

g = OrdMlWD('B', A);

m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultilayerWD
%%%% ¡code!
A11 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A22 = [
       0  2  0  0  0;
       0  0  3  0  0;
       0  0  0  1  0;
       0  2  0  0  2;
       1  0  0  2  0
    ];
A12 = rand(size(A11,1),size(A22,2));
A21 = A12';
A = {A11 A12;
    A21 A22;};
known_in_in_assortativity = {
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    (15/7-(21/14)^2)/(35/14-(21/14)^2)
                    };   

g = MultilayerWD('B', A);

m_outside_g = AssortInward('G', g);
assert(isequal(m_outside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'AssortInward');
assert(isequal(m_inside_g.get('M'), known_in_in_assortativity), ...
    [BRAPH2.STR ':AssortInward:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])