%% ¡header!
PathLengthIn < Measure (m, in-path length) is the graph in-path length.

%%% ¡description!
The in-path length is the average shortest in-path length of one node to all other nodes within a layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the PathlengthIn.
%%%% ¡default!
'PathlengthIn'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the PathlengthIn.
%%%% ¡default!
'The PathlengthIn is the average shortest pathlength of one node to all other nodes within a layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the PathlengthIn.

%%% ¡prop!
ID (data, string) is a few-letter code of the PathlengthIn.
%%%% ¡default!
'PathlengthIn ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the PathlengthIn.
%%%% ¡default!
'PathlengthIn label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the PathlengthIn.
%%%% ¡default!
'PathlengthIn notes'

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
{'GraphBD' 'GraphWD' 'MultiplexBD' 'MultiplexWD' 'MultilayerBD' 'OrdMlBD'}

%%% ¡prop!
M (result, cell) is the cell containing the PathlengthIn.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
A = g.get('A');  % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
N = g.get('NODENUMBER');
L = g.get('LAYERNUMBER');

in_path_length = cell(L, 1);                    
path_length_rule = m.get('rule');

distance = Distance('G', g).get('M');

parfor li = 1:1:L
    in_path_length_layer = zeros(N(1), 1);
    distance_layer = distance{li};

    switch lower(path_length_rule)
        case {'subgraphs'}
            for u = 1:1:N
                Du = distance_layer(:, u);
                in_path_length_layer(u) = mean(Du(Du~=Inf & Du~=0));
            end
            in_path_length_layer(isnan(in_path_length_layer)) = 0;  % node Nan corresponds to isolated nodes, pathlength is 0
        case {'harmonic'}
            for u = 1:1:N
                Du = distance_layer(:, u);
                in_path_length_layer(u) = harmmean(Du(Du~=0));
            end
        otherwise  % 'default'
            for u = 1:1:N
                Du = distance_layer(:, u);
                in_path_length_layer(u) = mean(Du(Du~=0));
            end
    end
    in_path_length(li) = {in_path_length_layer};
end
value = in_path_length;

%% ¡props!

%%% ¡prop! 
RULE (parameter, option) is the PathlengthIn algorithm
%%%% ¡settings!
{'subgraphs' 'harmonic' 'mean'}
%%%% ¡default!
'harmonic'

%% ¡tests!

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡code!
A = [
    0  1  1  1  0;
    1  0  0  0  0;
    1  1  0  1  0;
    1  1  0  0  0;
    0  0  0  0  0
    ];

known_in_path_length = {[Inf Inf Inf Inf Inf]'};
g = GraphBD('B', A);

m_outside_g = PathlengthIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthIn');
assert(isequal(m_inside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡code!
A11 = [
      0  1  1  1  0;
      1  0  0  0  0;
      1  1  0  1  0;
      1  1  0  0  0;
      0  0  0  0  0
      ];

A22 = [
      0  1  1  1  0;
      1  0  0  0  0;
      1  1  0  1  0;
      1  1  0  0  0;
      0  0  0  0  0
      ];
A = {A11  A22};

known_in_path_length = {
                    [Inf Inf Inf Inf Inf]'
                    [Inf Inf Inf Inf Inf]'
                    };

g = MultiplexBD('B', A);

m_outside_g = PathlengthIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthIn');
assert(isequal(m_inside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
OrdMlBD
%%%% ¡code!
B11 = [
      0  1  1  1  0;
      1  0  0  0  0;
      1  1  0  1  0;
      1  1  0  0  0;
      0  0  0  0  0
      ];

B22 = [
      0  1  1  1  0;
      1  0  0  0  0;
      1  1  0  1  0;
      1  1  0  0  0;
      0  0  0  0  0
      ];
B12 = rand(size(B11,1),size(B22,2));
B21 = B12';
B = {B11 B12;
     B21 B22};

known_in_path_length = {
                    [Inf Inf Inf Inf Inf]'
                    [Inf Inf Inf Inf Inf]'
                    };

g = OrdMlBD('B', A);

m_outside_g = PathlengthIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthIn');
assert(isequal(m_inside_g.get('M'), known_in_path_length), ...
    [BRAPH2.STR ':PathlengthIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])