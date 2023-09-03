%%% ¡test!
%%%% ¡name!
GraphWD
%%%% ¡code!
B = [
    0   .2  1
    0   0   .8
    1   0   0
    ];

known_in_degree = {[1 1 2]'};

g = GraphWD('B', B);

m_outside_g = DegreeIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_degree), ...
   [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'DegreeIn');
assert(isequal(m_inside_g.get('M'), known_in_degree), ...
    [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡code!
B = [
    0   1   1
    0   0   0
    1   0   0
    ];

known_in_degree = {[1 1 1]'};

g = GraphBD('B', B);

m_outside_g = DegreeIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_degree), ...
   [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'DegreeIn');
assert(isequal(m_inside_g.get('M'), known_in_degree), ...
    [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexWD
%%%% ¡code!
B11 = [
      0   .2  1
      0   0   .8
      1   0   0
      ];
B22 = [
      0  1   .6
      1  0   .4
      0  .4  0
      ];
B = {B11 B22};

known_in_degree = {
                  [1 1 2]'
                  [1 2 2]'
                  };

g = MultiplexWD('B', B);
BUT_graph = g.get('A');
m_outside_g = DegreeIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_degree), ...
   [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'DegreeIn');
assert(isequal(m_inside_g.get('M'), known_in_degree), ...
    [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡code!
B11 = [
      0  1  1
      0  0  0
      1  0  0
      ];
B22 = [
       0  1  0
       1  0  1
       1  1  0
       ];
B = {B11 B22};

known_in_degree = { 
                  [1 1 1]'
                  [2 2 1]'
                  };

g = MultiplexBD('B', B);

m_outside_g = DegreeIn('G', g);
assert(isequal(m_outside_g.get('M'), known_in_degree), ...
   [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'DegreeIn');
assert(isequal(m_inside_g.get('M'), known_in_degree), ...
    [BRAPH2.STR ':DegreeIn:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])