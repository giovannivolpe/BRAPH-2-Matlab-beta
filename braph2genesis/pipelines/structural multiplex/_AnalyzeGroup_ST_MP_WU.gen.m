%% ¡header!
AnalyzeGroup_ST_MP_WU < AnalyzeGroup (a, graph analysis with structural multiplex data) is a graph analysis using structural multiplex data.

%%% ¡description!
This graph analysis uses structural multiplex data and analyzes them using 
weighted undirected multiplexes, binary undirected multiplexes with fixed thresholds,
or binary undirected multiplexes with fixed densities.

%%% ¡seealso!
SubjectST_MP, MultiplexWU

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.ID
%%%% ¡title!
Analysis ID

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.LABEL
%%%% ¡title!
Analysis NAME

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.GR
%%%% ¡title!
SUBJECT GROUP

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
%%%% ¡title!
CORRELATION RULE

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
%%%% ¡title!
NEGATIVE WEIGHTS RULE

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.G
%%%% ¡title!
GRAPH & MEASURES

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_MP_WU.NOTES
%%%% ¡title!
Analysis NOTES

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the graph analysis with structural multiplex data.
%%%% ¡default!
'AnalyzeGroup_ST_MP_WU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the graph analysis with structural multiplex data.
%%%% ¡default!
'This graph analysis uses structural multiplex data and analyzes them using weighted undirected multiplexes, binary undirected multiplexes with fixed thresholds, or binary undirected multiplexes with fixed densities.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the graph analysis with structural multiplex data.

%%% ¡prop!
ID (data, string) is a few-letter code for the graph analysis with structural multiplex data.
%%%% ¡default!
'AnalyzeGroup_ST_MP_WU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the graph analysis with structural multiplex data.
%%%% ¡default!
'AnalyzeGroup_ST_MP_WU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the graph analysis with structural multiplex data.
%%%% ¡default!
'AnalyzeGroup_ST_MP_WU notes'

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class SubjectST_MP.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectST_MP')

%%% ¡prop!
G (result, item) is the graph obtained from this analysis.
%%%% ¡settings!
'MultiplexWU'
%%%% ¡default!
MultiplexWU()
%%%% ¡calculate!
gr = a.get('GR');
data_list = cellfun(@(x) x.get('ST_MP'), gr.get('SUB_DICT').get('IT_LIST'), 'UniformOutput', false);

% % % if any(strcmp(a.get('CORRELATION_RULE'), {Correlation.PEARSON_CV, Correlation.SPEARMAN_CV}))
% % %     age_list = cellfun(@(x) x.get('age'), gr.get('SUB_DICT').get('IT_LIST'), 'UniformOutput', false);
% % %     age = cat(2, age_list{:})';
% % %     sex_list = cellfun(@(x) x.get('sex'), gr.get('SUB_DICT').get('IT_LIST'), 'UniformOutput', false);
% % %     sex = zeros(size(age));
% % %     for i=1:length(sex_list)
% % %         switch lower(sex_list{i})
% % %             case 'female'
% % %                 sex(i) = 1;
% % %             case 'male'
% % %                 sex(i) = -1;
% % %             otherwise
% % %                 sex(i) = 0;
% % %         end
% % %     end
% % %     covariates = [age, sex];
% % % end

if isempty(data_list)
    A ={[], []};
else
    L = gr.get('SUB_DICT').get('IT', 1).get('L');  % number of layers
    br_number = gr.get('SUB_DICT').get('IT', 1).get('BA').get('BR_DICT').get('LENGTH');  % number of regions
    data = cell(L, 1);
    for i = 1:1:L
        data_layer = zeros(length(data_list), br_number);
        for j = 1:1:length(data_list)
            sub_cell = data_list{j};
            data_layer(j, :) = sub_cell{i}';
        end
        data(i) = {data_layer};
    end

    A = cell(1, L);
    for i = 1:1:L
% % %         if any(strcmp(a.get('CORRELATION_RULE'), {Correlation.PEARSON_CV, Correlation.SPEARMAN_CV}))
% % %             A(i) = {Correlation.getAdjacencyMatrix(data{i}, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'), covariates)};
% % %         else
            A(i) = {Correlation.getAdjacencyMatrix(data{i}, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'))};
% % %         end
    end
end

% % % ba = BrainAtlas();
% % % if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').length > 0
% % %     ba = gr.get('SUB_DICT').get('IT', 1).get('BA');
% % % end

L = length(A);
g = MultiplexWU( ...
    'ID', ['Graph ' gr.get('ID')], ...
    'B', A ... % % % 'LAYERTICKS', [1:1:L], ... % % % 'LAYERLABELS', cell2str(cellfun(@(x) ['L' num2str(x)], num2cell([1:1:L]), 'UniformOutput', false)), ... % % % 'BAS', ba ...
    );

value = g;

%% ¡props!

%%% ¡prop!
CORRELATION_RULE (parameter, option) is the correlation type.
%%%% ¡settings!
Correlation.CORRELATION_RULE_LIST
%%%% ¡default!
Correlation.PEARSON

%%% ¡prop!
NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights.
%%%% ¡settings!
Correlation.NEGATIVE_WEIGHT_RULE_LIST
%%%% ¡default!
Correlation.ZERO

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡probability!
.01
%%%% ¡code!
if ~isfile([fileparts(which('example_ST_MP_WU')) filesep 'Example data ST_MP XLS' filesep 'atlas.xlsx'])
    test_ImporterGroupSubjectST_MP_XLS % create example files
end

example_ST_MP_WU