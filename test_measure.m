%% degree %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% OrdMlBUT %%%%%%%%%%%%%%%%%%%%%%
B11 = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

B22 = [    
    0   .2   .7 .5
    .2   0   .1 .5
    .7  .1   0  .5
    .5  .5  .5  0
    ];
B33 = [    
    0   .2   .9 .5
    .2   0   .1 .5
    .9  .1   0  .2
    .5  .5  .2  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B13 = rand(size(B11,1),size(B33,2));
B23 = rand(size(B22,1),size(B33,2));
B21 = B12';
B31 = B13';
B32 = B23';
B= {B11 B12 B13;
    B21 B22 B23;
    B31 B32 B33};

thresholds = [0 .5 1];

g = OrdMlBUT('B', B, 'THRESHOLDS', thresholds);
m_inside_g = g.get('MEASURE', 'Degree');
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MultilayerBUD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear
B11 = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

B22 = [    
    0   .2   .7 .5
    .2   0   .1 .5
    .7  .1   0  .5
    .5  .5  .5  0
    ];
B33 = [    
    0   .2   .9 .5
    .2   0   .1 .5
    .9  .1   0  .2
    .5  .5  .2  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B13 = rand(size(B11,1),size(B33,2));
B23 = rand(size(B22,1),size(B33,2));
B21 = B12';
B31 = B13';
B32 = B23';
B= {B11 B12 B13;
    B21 B22 B23;
    B31 B32 B33};

densities = [0 33 67 100];

g = MultilayerBUD('B', B, 'DENSITIES', densities);
m_inside_g = g.get('MEASURE', 'Degree');
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OrdMlWU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B11 = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

B22 = [    
    0   .2   .7 .5
    .2   0   .1 .5
    .7  .1   0  .5
    .5  .5  .5  0
    ];
B33 = [    
    0   .2   .9 .5
    .2   0   .1 .5
    .9  .1   0  .2
    .5  .5  .2  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B13 = rand(size(B11,1),size(B33,2));
B23 = rand(size(B22,1),size(B33,2));
B21 = B12';
B31 = B13';
B32 = B23';
B= {B11 B12 B13;
    B21 B22 B23;
    B31 B32 B33};

g = OrdMlWU('B', B);
m_inside_g = g.get('MEASURE', 'Degree');
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OrdMxBUT %%%%%%%%%%%%%%%%%%%%%%%%%%

B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];

thresholds = [0 .5 1];
g = OrdMxBUT('B', {B B B}, 'THRESHOLDS', thresholds);
m_inside_g = g.get('MEASURE', 'Degree');
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%% OrdMxWU
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];

g = OrdMxWU('B', {B B B});
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end
m_inside_g = g.get('MEASURE', 'Degree');
		assert(isequal(m_inside_g.get('M'), known_degree), ...
		    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
		    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%% GraphWU
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];
g = GraphWU('B', B);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {degrees_und(Aii)'};
end
m_inside_g = g.get('MEASURE', 'Degree');
		assert(isequal(m_inside_g.get('M'), known_degree), ...
		    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
		    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%% Degree Av
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% graph WU
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];
g = GraphWU('B', B);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end

m_inside_g = g.get('MEASURE', 'DegreeAv');
		assert(isequal(m_inside_g.get('M'), known_degree), ...
		    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
		    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%% OrdMxWU
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];

g = OrdMxWU('B', {B B B});
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end
M = m_inside_g.get('M');
m_inside_g = g.get('MEASURE', 'DegreeAv');
		assert(isequal(M, known_degree), ...
		    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
		    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%% OrdMxBUT
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];

thresholds = [0 .5 1];
g = OrdMxBUT('B', {B B B}, 'THRESHOLDS', thresholds);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end
M = m_inside_g.get('M');
m_inside_g = g.get('MEASURE', 'DegreeAv');
		assert(isequal(M, known_degree), ...
		    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
		    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%%  MultiplexBUD
   B = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

densities = [0 33 67 100];

g = MultiplexBUD('B', {B B B}, 'DENSITIES', densities);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end
m_inside_g = g.get('MEASURE', 'DegreeAv');
M = m_inside_g.get('M');
assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':DegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%% MultiplexBUT
B = [
    0   .2   .7
    .2   0   0
    .7   0   0
    ];

thresholds = [0 .5 1];
g = MultiplexBUT('B', {B B B}, 'THRESHOLDS', thresholds);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end
m_inside_g = g.get('MEASURE', 'DegreeAv');
M = m_inside_g.get('M');

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':DegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%% OrdMlBUT
B11 = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

B22 = [    
    0   .2   .7 .5
    .2   0   .1 .5
    .7  .1   0  .5
    .5  .5  .5  0
    ];
B33 = [    
    0   .2   .9 .5
    .2   0   .1 .5
    .9  .1   0  .2
    .5  .5  .2  0
    ];
B12 = rand(size(B11,1),size(B22,2));
B13 = rand(size(B11,1),size(B33,2));
B23 = rand(size(B22,1),size(B33,2));
B21 = B12';
B31 = B13';
B32 = B23';
B= {B11 B12 B13;
    B21 B22 B23;
    B31 B32 B33};

thresholds = [0 .5 1];

g = OrdMlBUT('B', B, 'THRESHOLDS', thresholds);
m_inside_g = g.get('MEASURE', 'DegreeAv');
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);
parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end

assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':Degree:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%% OrdMxBUD
   B = [
    0   .2   .7
    .2   0   .1
    .7  .1   0
    ];

densities = [0 33 67 100];

g = OrdMxBUD('B', {B B B}, 'DENSITIES', densities);
BUT_graph = g.get('A');
known_degree = cell(length(BUT_graph),1);

parfor li = 1:1:length(BUT_graph)
    Aii = BUT_graph{li, li};
    known_degree(li) = {mean(degrees_und(Aii))'};
end


m_inside_g = g.get('MEASURE', 'DegreeAv');
assert(isequal(m_inside_g.get('M'), known_degree), ...
    [BRAPH2.STR ':DegreeAv:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])
%% 

