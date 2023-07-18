%% ¡header!
NNData_CON_WU < NNData (nnd, connectivity data for neural network analysis with graph WU) produces a dataset to train or test a neural netowrk model for connectivity data. 

%% ¡description!
This NN data generates a group of NN subjects, each of which contains the 
input as BUD adjacency matrices or graph measures from connectivity data. 
The generated NN group can be used to train or test a neural network model.

%%% ¡seealso!
NNGroup, NNData, NNSubject

%% ¡constants!
INPUT_TYPES = {
    NNSubject.INPUT_MEASURES
    NNSubject.INPUT_ADJACENCY
    }

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the connectivity data for neural network analysis with graph WU.
%%%% ¡default!
'NNData_CON_WU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the connectivity data for neural network analysis with graph WU.
%%%% ¡default!
'This NN data generates a group of NN subjects, each of which contains the input as BUD adjacency matrices or graph measures from connectivity data. The generated NN group can be used to train or test a neural network model.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the connectivity data for neural network analysis with graph WU.
%%%% ¡settings!
'NNData_CON_WU'

%%% ¡prop!
ID (data, string) is a few-letter code for the connectivity data for neural network analysis with graph WU.
%%%% ¡default!
'NNData_CON_WU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the connectivity data for neural network analysis with graph WU.
%%%% ¡default!
'NNData_CON_WU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the connectivity data for neural network analysis with graph WU.
%%%% ¡default!
'NNData_CON_WU notes'

%%% ¡prop!
ANALYZE_ENSEMBLE (data, item) contains the graphs of the group.
%%%% ¡settings!
'AnalyzeEnsemble_CON_WU'

%%% ¡prop!
GRAPH_TEMPLATE (parameter, item) is the graph template to set all graph and measure parameters.
%%%% ¡settings!
'GraphWU'

%%% ¡prop!
INPUT_TYPE (parameter, option) is the input type for training or testing the NN.
%%%% ¡settings!
INPUT_TYPES

%%% ¡prop!
GR (data, item) is a group of subjects defined as SubjectCON class.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectCON')

%%% ¡prop!
G (parameter, item) is the graph for calculating the graph measures.
%%%% ¡settings!
'GraphWU'

%%% ¡prop!
GR_NN (result, item) is a group of NN subjects.
%%%% ¡settings!
'NNGroup'
%%%% ¡default!
NNGroup('SUB_CLASS', 'NNSubject', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'NNSubject'))
%%%% ¡calculate!
wb = braph2waitbar(nnd.get('WAITBAR'), 0, 'Constructing NN input...');

gr = nnd.get('GR');
nn_gr = NNGroup( ...
    'SUB_CLASS', 'NNSubject', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'NNSubject') ...
    );

nn_gr.lock('SUB_CLASS');

nn_gr.set( ...
    'ID', gr.get('ID'), ...
    'LABEL', gr.get('LABEL'), ...
    'NOTES', gr.get('NOTES') ...
    );

atlas = BrainAtlas();
if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').get('LENGTH') > 0 
    atlas = gr.get('SUB_DICT').get('IT', 1).get('BA');
end

% get analyzeEnsemble

nn_sub_dict = nn_gr.get('SUB_DICT');

for i = 1:1:gr.get('SUB_DICT').get('LENGTH')
    braph2waitbar(wb, .15 + .85 * i / gr.get('SUB_DICT').get('LENGTH'), ['Constructing subject ' num2str(i) ' of ' num2str(gr.get('SUB_DICT').get('LENGTH'))  ' in ' gr.get('ID') ' ...'])

    sub = gr.get('SUB_DICT').get('IT', i);
    g = GraphWU( ...
        'ID', ['g ' sub.get('ID')], ...
        'BAS', atlas, ...
        'B', Callback('EL', sub, 'TAG', 'CON') ...
        );

    if string(nnd.get('INPUT_TYPE')) == "adjacency_matrices"
        input = g.get('A');
        input_label = {'GraphWU'};

    elseif string(nnd.get('INPUT_TYPE')) == "graph_measures"
        input_nodal = [];
        input_binodal = [];
        input_global = [];
        mlist = cellfun(@(x) x.get('ID'), nnd.get('Measures').get('IT_LIST'), 'UniformOutput', false);
        if isempty(mlist)
            nnd.getMeasureEnsemble('Degree');
            mlist = cellfun(@(x) x.get('ID'), nnd.get('Measures').get('IT_LIST'), 'UniformOutput', false);
        end
        input_label = mlist;
        for j = 1:length(mlist)
            m_value = nnd.getCalculatedMeasure(g, mlist{j});
            if Measure.is_nodal(mlist{j})
                input_nodal = [input_nodal cell2mat(m_value)];
            elseif Measure.is_global(mlist{j})
                input_global = [input_global cell2mat(m_value)];
            else
                input_binodal = [input_binodal cell2mat(m_value)];
            end
        end
        input = {input_global input_nodal input_binodal};
    end

    nn_sub = NNSubject( ...
        'ID', [sub.get('ID') ' in ' gr.get('ID')], ...
        'BA', atlas, ...
        'VOI_DICT', sub_CON.get('VOI_DICT'), ...
        'G', g, ...
        'INPUT', input, ...
        'INPUT_TYPE', nnd.get('INPUT_TYPE'), ...
        'INPUT_LABEL', input_label, ...
        'TARGET_NAME', nnd.get('TARGET_NAME') ...
        );

    nn_sub_dict.add(nn_sub);
end

nn_gr.set('sub_dict', nn_sub_dict);

braph2waitbar(wb, 'close')

value = nn_gr;

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Create example files for classification
%%%% ¡code!
data_dir = [fileparts(which('NNData_CON_WU')) filesep 'Example data NN CLASSIFICATION CON XLS'];
if ~isdir(data_dir)
    mkdir(data_dir);

    % Brain Atlas
    im_ba = ImporterBrainAtlasXLS('FILE', 'desikan_atlas.xlsx');
    ba = im_ba.get('BA');
    ex_ba = ExporterBrainAtlasXLS( ...
        'BA', ba, ...
        'FILE', [data_dir filesep() 'atlas.xlsx'] ...
        );
    ex_ba.get('SAVE')
    N = ba.get('BR_DICT').get('LENGTH');

    % saves RNG
    rng_settings_ = rng(); rng('default')

    sex_options = {'Female' 'Male'};

    % Group 1
    K1 = 2; % degree (mean node degree is 2K) - group 1
    beta1 = 0.3; % Rewiring probability - group 1
    gr1_name = 'CON_Group_1_XLS';
    gr1_dir = [data_dir filesep() gr1_name];
    mkdir(gr1_dir);
    vois1 = [
        {{'Subject ID'} {'Age'} {'Sex'}}
        {{} {} cell2str(sex_options)}
        ];
    for i = 1:1:50 % subject number
        sub_id = ['SubjectCON_' num2str(i)];

        h1 = WattsStrogatz(N, K1, beta1); % create two WS graph
        % figure(1) % Plot the two graphs to double-check
        % plot(h1, 'NodeColor',[1 0 0], 'EdgeColor',[0 0 0], 'EdgeAlpha',0.1, 'Layout','circle');
        % title(['Group 1: Graph with $N = $ ' num2str(N_nodes) ...
        %     ' nodes, $K = $ ' num2str(K1) ', and $\beta = $ ' num2str(beta1)], ...
        %     'Interpreter','latex')
        % axis equal

        A1 = full(adjacency(h1)); A1(1:length(A1)+1:numel(A1)) = 0; % extract the adjacency matrix
        r = 0 + (0.5 - 0)*rand(size(A1)); diffA = A1 - r; A1(A1 ~= 0) = diffA(A1 ~= 0); % make the adjacency matrix weighted
        A1 = max(A1, transpose(A1)); % make the adjacency matrix symmetric

        writetable(array2table(A1), [gr1_dir filesep() sub_id '.xlsx'], 'WriteVariableNames', false)

        % variables of interest
        vois1 = [vois1; {sub_id, randi(90), sex_options(randi(2))}];
    end
    writetable(table(vois1), [data_dir filesep() gr1_name '.vois.xlsx'], 'WriteVariableNames', false)

    % Group 2
    K2 = 2; % degree (mean node degree is 2K) - group 2
    beta2 = 0.85; % Rewiring probability - group 2
    gr2_name = 'CON_Group_2_XLS';
    gr2_dir = [data_dir filesep() gr2_name];
    mkdir(gr2_dir);
    vois2 = [
        {{'Subject ID'} {'Age'} {'Sex'}}
        {{} {} cell2str(sex_options)}
        ];
    for i = 51:1:100
        sub_id = ['SubjectCON_' num2str(i)];

        h2 = WattsStrogatz(N, K2, beta2);
        % figure(2)
        % plot(h2, 'NodeColor',[1 0 0], 'EdgeColor',[0 0 0], 'EdgeAlpha',0.1, 'Layout','circle');
        % title(['Group 2: Graph with $N = $ ' num2str(N_nodes) ...
        %     ' nodes, $K = $ ' num2str(K2) ', and $\beta = $ ' num2str(beta2)], ...
        %     'Interpreter','latex')
        % axis equal

        A2 = full(adjacency(h2)); A2(1:length(A2)+1:numel(A2)) = 0;
        r = 0 + (0.5 - 0)*rand(size(A2)); diffA = A2 - r; A2(A2 ~= 0) = diffA(A2 ~= 0);
        A2 = max(A2, transpose(A2));

        writetable(array2table(A2), [gr2_dir filesep() sub_id '.xlsx'], 'WriteVariableNames', false)

        % variables of interest
        vois2 = [vois2; {sub_id, randi(90), sex_options(randi(2))}];
    end
    writetable(table(vois2), [data_dir filesep() gr2_name '.vois.xlsx'], 'WriteVariableNames', false)

    % reset RNG
    rng(rng_settings_)
end

%%% ¡test!
%%%% ¡name!
Create example files for regression
%%%% ¡code!
data_dir = [fileparts(which('NNData_CON_WU')) filesep 'Example data NN REGRESSION CON XLS'];
if ~isdir(data_dir)
    mkdir(data_dir);

    % Brain Atlas
    im_ba = ImporterBrainAtlasXLS('FILE', 'desikan_atlas.xlsx');
    ba = im_ba.get('BA');
    ex_ba = ExporterBrainAtlasXLS( ...
        'BA', ba, ...
        'FILE', [data_dir filesep() 'atlas.xlsx'] ...
        );
    ex_ba.get('SAVE')
    N = ba.get('BR_DICT').get('LENGTH');

    % saves RNG
    rng_settings_ = rng(); rng('default')

    sex_options = {'Female' 'Male'};

    % Group 
    K = 2; % degree (mean node degree is 2K)
    beta = 0.3; % Rewiring probability
    gr_name = 'CON_Group_XLS';
    gr_dir = [data_dir filesep() gr_name];
    mkdir(gr_dir);
    vois = [
        {{'Subject ID'} {'Age'} {'Sex'}}
        {{} {} cell2str(sex_options)}
        ];
    for i = 1:1:100 % subject number
        sub_id = ['SubjectCON_' num2str(i)];
        % create WS graphs with random beta
        beta(i) = rand(1);
        h = WattsStrogatz(N, K, beta(i)); % create WS graph
        % figure(1) % Plot the two graphs to double-check
        % plot(h1, 'NodeColor',[1 0 0], 'EdgeColor',[0 0 0], 'EdgeAlpha',0.1, 'Layout','circle');
        % title(['Group 1: Graph with $N = $ ' num2str(N_nodes) ...
        %     ' nodes, $K = $ ' num2str(K1) ', and $\beta = $ ' num2str(beta1)], ...
        %     'Interpreter','latex')
        % axis equal

        A = full(adjacency(h)); A(1:length(A)+1:numel(A)) = 0; % extract the adjacency matrix
        r = 0 + (0.5 - 0)*rand(size(A)); diffA = A - r; A(A ~= 0) = diffA(A ~= 0); % make the adjacency matrix weighted
        A = max(A, transpose(A)); % make the adjacency matrix symmetric

        writetable(array2table(A), [gr_dir filesep() sub_id '.xlsx'], 'WriteVariableNames', false)

        % variables of interest
        vois = [vois; {sub_id, randi(90), sex_options(randi(2))}];
    end
    writetable(table(vois), [data_dir filesep() gr_name '.vois.xlsx'], 'WriteVariableNames', false)

    % reset RNG
    rng(rng_settings_)
end
%%% ¡test_functions!
function h = WattsStrogatz(N, K, beta)
% H = WattsStrogatz(N,K,beta) returns a Watts-Strogatz model graph with N
% nodes, N*K edges, mean node degree 2*K, and rewiring probability beta.
%
% beta = 0 is a ring lattice, and beta = 1 is a random graph.

% Connect each node to its K next and previous neighbors. This constructs
% indices for a ring lattice.
    s = repelem((1:N)', 1, K);
    t = s + repmat(1:K, N, 1);
    t = mod(t - 1, N) + 1;
    
    % Rewire the target node of each edge with probability beta
    for source = 1:N
        switchEdge = rand(K, 1) < beta;
        
        newTargets = rand(N, 1);
        newTargets(source) = 0;
        newTargets(s(t == source)) = 0;
        newTargets(t(source, ~switchEdge)) = 0;
        
        [~, ind] = sort(newTargets, 'descend');
        t(source, switchEdge) = ind(1:nnz(switchEdge));
    end
    
    h = graph(s,t);
end

% % % %%% ¡test!
% % % %%%% ¡name!
% % % Example 1
% % % %%%% ¡code!
% % % example_NN_CON_WU_Regression_AdjacencyMatrix
% % % 
% % % %%% ¡test!
% % % %%%% ¡name!
% % % Example 2
% % % %%%% ¡code!
% % % example_NN_CON_WU_Classification_AdjacencyMatrix
% % % 
% % % %%% ¡test!
% % % %%%% ¡name!
% % % Example 3
% % % %%%% ¡code!
% % % example_NN_CON_WU_Classification_GraphMeasures
% % % 
% % % %%% ¡test!
% % % %%%% ¡name!
% % % Example 4
% % % %%%% ¡code!
% % % example_NNCV_CON_WU_Classification_AdjacencyMatrix
% % % 
% % % %%% ¡test!
% % % %%%% ¡name!
% % % Example 5
% % % %%%% ¡code!
% % % example_NNCV_CON_WU_Regression_GraphMeasures