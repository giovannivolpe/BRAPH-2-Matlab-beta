%% ¡header!
PathlengthOutAv < PathLengthOut (m, average out-path length) is the graph average out-path length.

%%% ¡description!
The out-path length is the average shortest out-path lengths of one node to all other nodes without a layer.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the PathlengthOutAv.
%%%% ¡default!
'PathlengthOutAv'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the PathlengthOutAv.
%%%% ¡default!
'The PathlengthOutAv is the average shortest PathlengthOutAv of one node to all other nodes within a layer.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the PathlengthOutAv.

%%% ¡prop!
ID (data, string) is a few-letter code of the PathlengthOutAv.
%%%% ¡default!
'PathlengthOutAv ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the PathlengthOutAv.
%%%% ¡default!
'PathlengthOutAv label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the PathlengthOutAv.
%%%% ¡default!
'PathlengthOutAv notes'

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
M (result, cell) is the cell containing the PathlengthOutAv.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class

out_path_length = calculateValue@PathlengthOutAv(m, prop);
out_path_length_av = cell(g.layernumber(), 1);
parfor li = 1:1:length(out_path_length_av)
    out_path_length_av(li) = {mean(out_path_length{li})};
end
value = out_path_length_av;

%% ¡tests!

%%% ¡excluded_props!
[PathlengthOutAv.PFM]

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡code!
B = [
    0  1  1  1  0;
    1  0  0  0  0;
    1  1  0  1  0;
    1  1  0  0  0;
    0  0  0  0  0
    ];
known_out_path_length_av = {Inf};

g = GraphBD('B', B);

m_outside_g = PathlengthOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthOutAv');
assert(isequal(m_inside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
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
B = {B11 B22};

known_out_path_length_av = {
                    Inf
                    Inf
                    };

g = MultiplexBD('B', B);

m_outside_g = PathlengthOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthOutAv');
assert(isequal(m_inside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
OrdMxBD
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

known_out_path_length_av = {
                    Inf
                    Inf
                    };

g = OrdMxBD('B', A);
m_outside_g = PathlengthOutAv('G', g);
assert(isequal(m_outside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'PathlengthOutAv');
assert(isequal(m_inside_g.get('M'), known_out_path_length_av), ...
    [BRAPH2.STR ':PathlengthOutAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])