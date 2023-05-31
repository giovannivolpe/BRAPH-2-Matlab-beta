%% ¡header!
Triangles < Measure(m, triangles) is the graph triangles.

%%% ¡description!
The triangles are calculated as the number of neighbors of a node that are 
also neighbors of each other within a layer. In weighted graphs, the triangles are 
calculated as geometric mean of the weights of the edges forming the triangle.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the triangles.
%%%% ¡default!
'Triangles'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the triangles.
%%%% ¡default!
'The triangles are calculated as the number of neighbors of a node that are also neighbors of each other within a layer. In weighted graphs, the triangles are calculated as geometric mean of the weights of the edges forming the triangle.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the triangles.

%%% ¡prop!
ID (data, string) is a few-letter code of the triangles.
%%%% ¡default!
'Triangles ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the triangles.
%%%% ¡default!
'Triangles label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the triangles.
%%%% ¡default!
'Triangles notes'

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
{'GraphWU' 'GraphWD' 'GraphBU' 'MultigraphBUD' 'MultigraphBUT' 'GraphBD' 'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'MultiplexBD'}

%%% ¡prop!
M (result, cell) is the triangles.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
A = g.get('A');  % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.) 
L = g.layernumber();

triangles = cell(g.layernumber(), 1);
            
directionality_type =  g.getDirectionalityType(g.layernumber());
parfor li = 1:1:L        
    Aii = A{li, li};    
    
    if directionality_type == Graph.UNDIRECTED  % undirected graphs
        triangles_layer = diag((Aii.^(1/3))^3) / 2;
        triangles_layer(isnan(triangles_layer)) = 0;  % Should return zeros, not NaN
        triangles(li) = {triangles_layer};
        
    else  % directed graphs
        directed_triangles_rule = m.get('rule');
        switch lower(directed_triangles_rule)
            case 'all'  % all rule
                triangles_layer = diag((Aii.^(1/3) + transpose(Aii).^(1/3))^3) / 2;
            case 'middleman'  % middleman rule
                triangles_layer = diag(Aii.^(1/3) * transpose(Aii).^(1/3) * Aii.^(1/3));
            case 'in'  % in rule
                triangles_layer = diag(transpose(Aii).^(1/3) * (Aii.^(1/3))^2);
            case 'out'  % out rule
                triangles_layer = diag((Aii.^(1/3))^2 * transpose(Aii).^(1/3));
            otherwise  % {'cycle'}  % cycle rule
                triangles_layer = diag((Aii.^(1/3))^3);
        end
        triangles_layer(isnan(triangles_layer)) = 0;  % Should return zeros, not NaN
        triangles(li) = {triangles_layer};
    end
end
value = triangles;

%% ¡props!
%%% ¡prop! 
rule (parameter, OPTION) is the rule to determine what is a triangle in directed networks.
%%%% ¡settings!
{'all' 'middleman' 'in' 'out' 'cycle'}
%%%% ¡default!
'cycle'

%% ¡tests!



