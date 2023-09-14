%% ¡header!
NNDataPoint_CON_FUN_MP_REG < NNDataPoint (dp, connectivity-functipnal multiplex regression data point) is a data point for regression with connectivity-functional multiplex data.

%%% ¡description!
A data point for regression with connectivity-functional multiplex data (NNDataPoint_CON_FUN_MP_REG) 
contains the input and target for neural network analysis with a subject 
with connectivity-functional multiplex data (SubjectCON_FUN_MP).
The input is the connectivity-functional multiplex data of the subject.
The target is obtained from the variables of interest of the subject.

%%% ¡seealso!
SubjectCON_FUN_MP

%% ¡props_update!
%%% ¡prop!
NAME (constant, string) is the name of a data point for regression with connectivity-functional multiplex data.
%%%% ¡default!
'NNDataPoint_CON_FUN_MP_REG'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of a data point for regression with connectivity-functional multiplex data.
%%%% ¡default!
'A data point for regression with connectivity data (NNDataPoint_CON_REG) contains the input and target for neural network analysis with a subject with connectivity data (SubjectCON). The input is the connectivity data of the subject. The target is obtained from the variables of interest of the subject.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of a data point for regression with connectivity-functional multiplex data.
%%%% ¡settings!
'NNDataPoint_CON_FUN_MP_REG'

%%% ¡prop!
ID (data, string) is a few-letter code for a data point for regression with connectivity-functional multiplex data.
%%%% ¡default!
'NNDataPoint_CON_FUN_MP_REG ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of a data point for regression with connectivity-functional multiplex data.
%%%% ¡default!
'NNDataPoint_CON_FUN_MP_REG label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about a data point for regression with connectivity-functional multiplex data.
%%%% ¡default!
'NNDataPoint_CON_FUN_MP_REG notes'

%%% ¡prop!
INPUT (result, cell) is the input value for this data point.
%%%% ¡calculate!
value = {dp.get('SUB').get('CON_FUN_MP')};
    
%%% ¡prop!
TARGET (result, cell) is the target value for this data point.
%%%% ¡calculate!
value = cellfun(@(x) dp.get('SUB').get('VOI_DICT').get('IT', x).get('V'), dp.get('TARGET_IDS'), 'UniformOutput', false);

%% ¡props!

%%% ¡prop!
SUB (data, item) is a subject with connectivity-functional multiplex data.
%%%% ¡settings!
'SubjectCON_FUN_MP'

%%% ¡prop!
TARGET_IDS (parameter, stringlist) is a list of variable-of-interest IDs to be used as regression targets.
					
%% ¡tests!

%%% ¡excluded_props!
[NNDataPoint_CON_FUN_MP_REG.SUB]

%%% ¡test!
%%%% ¡name!
Create example files for regression
%%%% ¡code!
data_dir = [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON-FUN MP XLS'];
if ~isdir(data_dir)
    mkdir(data_dir);

    % Brain Atlas
    im_ba = ImporterBrainAtlasXLS('FILE', 'aal90_atlas.xlsx');
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
    N_subjects = 10;
    K = [3 4 5 6 7]; % degree
    beta = [0.02 0.1 0.3 0.5 0.8]; % Rewiring probability
    gr1_ts1 = cell(1, N_subjects); % layer 1
    gr1_ts2 = cell(1, N_subjects); % layer 2
    gr_name = 'CON_FUN_MP_Group_XLS';
%     gr_dir = [data_dir filesep() gr_name];
%     mkdir(gr_dir);
    vois = [
        {{'Subject ID'} {'Age'} {'Sex'}}
        {{} {} cell2str(sex_options)}
        ];
    for i = 1:1:N_subjects % subject number
        sub_id = ['SubjectCON_FUN_MP' num2str(i)];
        
        sub = SubjectCON_FUN_MP( ...
            'ID', ['SUB CON_FUN_MP ' int2str(i)], ...
            'LABEL', ['Subejct CON_FUN_MP ' int2str(i)], ...
            'NOTES', ['Notes on subject CON_FUN_MP ' int2str(i)], ...
            'BA', ba, ...
            'CON', rand(ba.get('BR_DICT').get('LENGTH')), ...
            'FUN', rand(10, ba.get('BR_DICT').get('LENGTH')) ...
            );
        
        
        % randomize the parameters
        K_temp = K(randperm(length(K)));
        beta_temp = beta(randperm(length(beta)));
        % initialize matrix for the subject
        A_full1 = zeros(N);
        % loop over each module
        for i_mod = 1:1:5
            A_full1(indices{i_mod},indices{i_mod}) = full(adjacency(WattsStrogatz(18, K_temp(i_mod), beta_temp(i_mod))));
        end
        A_full1(1:length(A_full1)+1:numel(A_full1)) = 1;

        % this is needed to make the matrices positive definite
        A_full1 = A_full1*transpose(A_full1);
        % 10% of connections kept
        density = 10;
        A_full2 = A_full1;
        sorted_vector = sort(A_full2(:));
        index = round(length(sorted_vector) * (100 - density) / 100);
        if index == 0
            threshold = sorted_vector(1) - eps;
        elseif index >= length(sorted_vector)
            threshold = sorted_vector(end) + eps;
        else
            threshold = sorted_vector(index);
        end
        % Calculates thresholded graph
        A_full2(A_full2 < threshold) = 0;
        
        % make the adjacency matrix weighted
        r = 0 + (0.5 - 0)*rand(size(A_full2));
        diffA = A_full2 - r;
        A_full2(A_full2 ~= 0) = diffA(A_full2 ~= 0);
        
        % make the adjacency matrix symmetric
        A_full2 = max(A_full2, transpose(A_full2));
        % This matrix will be covariance matrices for the two groups
        % Specify the mean
        mu_gr11 = ones(1, length(A_full1));
        
        % calculate time series
        R11 = mvnrnd(mu_gr11, A_full1, N_tslength);
        
        % Normalize the time series
        mean_R11 = mean(R11);
        std_R11 = std(R11);
        R11 = (R11 - mean_R11) ./ std_R11;
        
        % place in the array
        gr1_ts1{1, i_gr1} = R11;
        gr1_ts2{1, i_gr1} = A_full2;
        
        %writetable(array2table(A), [gr_dir filesep() sub_id '.xlsx'], 'WriteVariableNames', false)

        % variables of interest
        age_upperBound = 80;
        age_lowerBound = 50;
        age = age_lowerBound + beta(i)*(age_upperBound - age_lowerBound);
        vois = [vois; {sub_id, age, sex_options(randi(2))}];   
    end
    % Create the tables - functional layer
    tables_gr11 = cell(size(gr1_ts1));
    mkdir([data_dir filesep() 'Functional/GroupName1']);
    for i_tab = 1:1:N_subjects
        T_gr11 = array2table(gr1_ts1{i_tab});
        tables_gr11{i_tab} = T_gr11;
        file_name = strcat("Functional/GroupName1/", sub_Tags(i_tab), ".xlsx");
        writetable(T_gr11, file_name, 'WriteRowNames', false, 'WriteVariableNames', false)
    end
    
    % Create the tables - connectivity layer
    tables_gr12 = cell(size(gr1_ts2));
    mkdir([data_dir filesep() 'Connectivity/GroupName1']);
    for i_tab = 1:1:N_subjects
        T_gr12 = array2table(gr1_ts2{i_tab});
        tables_gr12{i_tab} = T_gr12;
        file_name = strcat("Connectivity/GroupName1/", sub_Tags(i_tab), ".xlsx");
        writetable(T_gr12, file_name, 'WriteRowNames', false, 'WriteVariableNames', false)
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

%%% ¡test! 
%%%% ¡name!
Create a NNDataset containg NNDataPoint_CON_FUN_MP_REG with simulated data
%%%% ¡code!
% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON-FUN MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

% Load Group of SubjectCON_FUN_MP
im_gr = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON-FUN MP XLS' filesep 'CON_FUN_MP_Group_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

% create a item list of NNDataPoint_CON_FUN_MP_REG
it_list = cellfun(@(x) NNDataPoint_CON_FUN_MP_REG( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
    gr.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create a NNDataPoint_CON_FUN_MP_REG DICT
dp_list = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_CON_FUN_MP_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNDataset containing the NNDataPoint_CON_FUN_MP_REG DICT
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_CON_FUN_MP_REG', ...
    'DP_DICT', dp_list ...
    );

% Check whether the number of inputs matches
assert(length(d.get('INPUTS')) == gr.get('SUB_DICT').get('LENGTH'), ...
		[BRAPH2.STR ':NNDataPoint_CON_FUN_MP_FUN_MPREG:' BRAPH2.FAIL_TEST], ...
		'NNDataPoint_CON_FUN_MP_REG does not construct the dataset correctly. The number of the inputs should be the same as the number of imported subjects.' ...
		)

% Check whether the number of targets matches
assert(length(d.get('TARGETS')) == gr.get('SUB_DICT').get('LENGTH'), ...
		[BRAPH2.STR ':NNDataPoint_CON_FUN_MP_REG:' BRAPH2.FAIL_TEST], ...
		'NNDataPoint_CON_FUN_MP_REG does not construct the dataset correctly. The number of the targets should be the same as the number of imported subjects.' ...
		)

% Check whether the content of input for a single datapoint matches
for index = 1:1:gr.get('SUB_DICT').get('LENGTH')
    individual_input = d.get('DP_DICT').get('IT', index).get('INPUT');
    known_input = {gr.get('SUB_DICT').get('IT', index).get('CON_FUN_MP')};

    assert(isequal(individual_input, known_input), ...
        [BRAPH2.STR ':NNDataPoint_CON_FUN_MP_REG:' BRAPH2.FAIL_TEST], ...
        'NNDataPoint_CON_FUN_MP_REG does not construct the dataset correctly. The input value is not derived correctly.' ...
        )
end

%%% ¡test! 
%%%% ¡name!
Example training-test regression
%%%% ¡code!
% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON-FUN MP XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_CON_FUN_MP_REG % create example files
end

example_NN_CON_FUN_MP_REG

%%% ¡test! 
%%%% ¡name!
Example cross-validation regression
%%%% ¡code!
% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_CON_FUN_MP_REG')) filesep 'Example data NN REG CON-FUN MP XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_CON_FUN_MP_REG % create example files
end

example_NNCV_CON_FUN_MP_REG