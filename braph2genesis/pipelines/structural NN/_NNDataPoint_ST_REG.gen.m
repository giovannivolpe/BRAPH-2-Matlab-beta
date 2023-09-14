%% ¡header!
NNDataPoint_ST_REG < NNDataPoint (dp, structural regression data point) is a data point for regression with structural data.

%%% ¡description!
A data point for regression with structural data (NNDataPoint_ST_REG) 
contains the input and target for neural network analysis with a subject with structural data (SubjectST).
The input is the structural data of the subject.
The target is obtained from the variables of interest of the subject.

%%% ¡seealso!
SubjectST

%% ¡props_update!
%%% ¡prop!
NAME (constant, string) is the name of a data point for regression with structural data.
%%%% ¡default!
'NNDataPoint_ST_REG'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of a data point for regression with structural data.
%%%% ¡default!
'A data point for regression with structural data (NNDataPoint_ST_REG) contains the input and target for neural network analysis with a subject with structural data (SubjectST). The input is the structural data of the subject. The target is obtained from the variables of interest of the subject.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of a data point for regression with structural data.
%%%% ¡settings!
'NNDataPoint_ST_REG'

%%% ¡prop!
ID (data, string) is a few-letter code for a data point for regression with structural data.
%%%% ¡default!
'NNDataPoint_ST_REG ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of a data point for regression with structural data.
%%%% ¡default!
'NNDataPoint_ST_REG label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about a data point for regression with structural data.
%%%% ¡default!
'NNDataPoint_ST_REG notes'

%%% ¡prop!
INPUT (result, cell) is the input value for this data point.
%%%% ¡calculate!
value = {dp.get('SUB').get('ST')};
    
%%% ¡prop!
TARGET (result, cell) is the target value for this data point.
%%%% ¡calculate!
value = cellfun(@(x) dp.get('SUB').get('VOI_DICT').get('IT', x).get('V'), dp.get('TARGET_IDS'), 'UniformOutput', false);

%% ¡props!

%%% ¡prop!
SUB (data, item) is a subject with structural data.
%%%% ¡settings!
'SubjectST'

%%% ¡prop!
TARGET_IDS (parameter, stringlist) is a list of variable-of-interest IDs to be used as regression targets.
					
%% ¡tests!

%%% ¡excluded_props!
[NNDataPoint_ST_REG.SUB]

%%% ¡test!
%%%% ¡name!
Create example files for regression
%%%% ¡code!
data_dir = [fileparts(which('NNDataPoint_ST_REG')) filesep 'Example data NN REG ST XLS'];
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
    gr_name = 'ST_Group_XLS';
    gr_dir = [data_dir filesep() gr_name];
    mkdir(gr_dir);
    vois = [
        {{'Subject ID'} {'Age'} {'Sex'}}
        {{} {} cell2str(sex_options)}
        ];
    for i = 1:1:100 % subject number
        sub_id = ['SubjectST_' num2str(i)];
        mean_all(i) = 30 + (10 - 1)*rand(1);
        %R(i, :) = deviation.*randn(N_nodes, 1) + mean_all(i);
        R_ind = randn(N_nodes, 1) + mean_all(i);
        R_ind(R_ind < 0) = 0;
        mean_all(i) = mean(R_ind, 'all');
        A(i, :) = R_ind;
        writetable(array2table(A), [gr_dir filesep() sub_id '.xlsx'], 'WriteVariableNames', false)

        % variables of interest
        age_upperBound = 80;
        age_lowerBound = 50;
        age = age_lowerBound + beta(i)*(age_upperBound - age_lowerBound);
        vois = [vois; {sub_id, age, sex_options(randi(2))}];
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
Create a NNDataset containg NNDataPoint_ST_REG with simulated data
%%%% ¡code!
% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_ST_REG')) filesep 'Example data NN REG ST XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

% Load Group of SubjectST
im_gr = ImporterGroupSubjectST_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_ST_REG')) filesep 'Example data NN REG ST XLS' filesep 'ST_Group_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr = im_gr.get('GR');

% create a item list of NNDataPoint_ST_REG
it_list = cellfun(@(x) NNDataPoint_ST_REG( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_IDS', x.get('VOI_DICT').get('KEYS')), ...
    gr.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create a NNDataPoint_ST_REG DICT
dp_list = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_ST_REG', ...
        'IT_LIST', it_list ...
        );

% create a NNDataset containing the NNDataPoint_ST_REG DICT
d = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_ST_REG', ...
    'DP_DICT', dp_list ...
    );

% Check whether the number of inputs matches
assert(length(d.get('INPUTS')) == gr.get('SUB_DICT').get('LENGTH'), ...
		[BRAPH2.STR ':NNDataPoint_ST_REG:' BRAPH2.FAIL_TEST], ...
		'NNDataPoint_ST_REG does not construct the dataset correctly. The number of the inputs should be the same as the number of imported subjects.' ...
		)

% Check whether the number of targets matches
assert(length(d.get('TARGETS')) == gr.get('SUB_DICT').get('LENGTH'), ...
		[BRAPH2.STR ':NNDataPoint_ST_REG:' BRAPH2.FAIL_TEST], ...
		'NNDataPoint_ST_REG does not construct the dataset correctly. The number of the targets should be the same as the number of imported subjects.' ...
		)

% Check whether the content of input for a single datapoint matches
for index = 1:1:gr.get('SUB_DICT').get('LENGTH')
    individual_input = d.get('DP_DICT').get('IT', index).get('INPUT');
    known_input = {gr.get('SUB_DICT').get('IT', index).get('ST')};

    assert(isequal(individual_input, known_input), ...
        [BRAPH2.STR ':NNDataPoint_ST_REG:' BRAPH2.FAIL_TEST], ...
        'NNDataPoint_ST_REG does not construct the dataset correctly. The input value is not derived correctly.' ...
        )
end

%%% ¡test! 
%%%% ¡name!
Example training-test regression
%%%% ¡code!
% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_ST_REG')) filesep 'Example data NN REG ST XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_ST_REG % create example files
end

example_NN_ST_REG

%%% ¡test! 
%%%% ¡name!
Example cross-validation regression
%%%% ¡code!
% ensure the example data is generated
if ~isfile([fileparts(which('NNDataPoint_ST_REG')) filesep 'Example data NN REG ST XLS' filesep 'atlas.xlsx'])
    test_NNDataPoint_ST_REG % create example files
end

example_NNCV_ST_REG