%% ¡header!
AnalyzeGroup_ST_BUT < AnalyzeGroup (a, graph analysis with structural data at fixed threshold) is a graph analysis using structural data at fixed threshold.

%%% ¡description!
AnalyzeGroup_ST_BUT uses structural data at fixed threshold and analyzes them using binary undirected graphs.

%%% ¡seealso!
SubjectST, MultigraphBUT

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.ID
%%%% ¡title!
Analysis ID

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.LABEL
%%%% ¡title!
Analysis NAME

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.GR
%%%% ¡title!
SUBJECT GROUP

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.CORRELATION_RULE
%%%% ¡title!
CORRELATION RULE

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.NEGATIVE_WEIGHT_RULE
%%%% ¡title!
NEGATIVE WEIGHTS RULE

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.THRESHOLDS
%%%% ¡title!
THRESHOLDS [-1 ... 1]

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.G
%%%% ¡title!
GRAPH & MEASURES

%%% ¡prop!
%%%% ¡id!
AnalyzeGroup_ST_BUT.NOTES
%%%% ¡title!
Analysis NOTES

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the group-based graph analysis with structural data at fixed threshold.
%%%% ¡default!
'AnalyzeGroup_ST_BUT'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the group-based graph analysis with structural data at fixed threshold.
%%%% ¡default!
'AnalyzeGroup_ST_BUT uses structural data at fixed threshold and analyzes them using binary undirected graphs.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the group-based graph analysis with structural data at fixed threshold.

%%% ¡prop!
ID (data, string) is a few-letter code for the group-based graph analysis with structural data at fixed threshold.
%%%% ¡default!
'AnalyzeGroup_ST_BUT ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the group-based graph analysis with structural data at fixed threshold.
%%%% ¡default!
'AnalyzeGroup_ST_BUT label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the group-based graph analysis with structural data at fixed threshold.
%%%% ¡default!
'AnalyzeGroup_ST_BUT notes'

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class SubjectST.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectST')

%%% ¡prop!
G (result, item) is the graph obtained from this analysis.
%%%% ¡settings!
'MultigraphBUT'
%%%% ¡calculate!
gr = a.get('GR');
% % % node_labels = '';
data_list = cellfun(@(x) x.get('ST'), gr.get('SUB_DICT').get('IT_LIST'), 'UniformOutput', false);
data = cat(2, data_list{:})'; % correlation is a column based operation

% % % atlas = BrainAtlas();
% % % if ~isempty(gr) && ~isa(gr, 'NoValue') && gr.get('SUB_DICT').length > 0
% % %     atlas = gr.get('SUB_DICT').getItem(1).get('BA');
% % % end

% % % if any(strcmp(a.get('CORRELATION_RULE'), {Correlation.PEARSON_CV, Correlation.SPEARMAN_CV}))
% % %     age_list = cellfun(@(x) x.get('age'), gr.get('SUB_DICT').getItems, 'UniformOutput', false);
% % %     age = cat(2, age_list{:})';
% % %     sex_list = cellfun(@(x) x.get('sex'), gr.get('SUB_DICT').getItems, 'UniformOutput', false);
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
% % %     A = Correlation.getAdjacencyMatrix(data, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'), [age, sex]);
% % % else
    A = Correlation.getAdjacencyMatrix(data, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'));
% % % end

thresholds = a.get('THRESHOLDS'); 
            
g = MultigraphBUT( ...
    'ID', ['Graph ' gr.get('ID')], ...
    'B', A, ...
	'THRESHOLDS', thresholds ... % % %     'LAYERTICKS', thresholds, ... % % %     'LAYERLABELS', cell2str(cellfun(@(x) num2str(x), num2cell(thresholds), 'UniformOutput', false)), ... % % %     'BAS', atlas ...
    );

% % % if ~isa(a.getr('TEMPLATE'), 'NoValue')
% % %     g.set('TEMPLATE', a.get('TEMPLATE').memorize('G'))
% % % end

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

%%% ¡prop!
THRESHOLDS (parameter, rvector) is the vector of thresholds.
%%%% ¡default!
[-1:.5:1]
%%%% ¡gui!
pr = PanelPropRVectorSmart('EL', a, 'PROP', AnalyzeGroup_ST_BUT.THRESHOLDS, ...
    'MIN', -1, 'MAX', 1, ...
    'DEFAULT', AnalyzeGroup_ST_BUT.getPropDefault('THRESHOLDS'), ...
    varargin{:});

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡probability!
.01
%%%% ¡code!
if ~isfile([fileparts(which('example_ST_WU')) filesep 'Example data ST XLS' filesep 'atlas.xlsx'])
    test_ImporterGroupSubjectST_XLS % create example files
end

example_ST_BUT

%%% ¡test!
%%%% ¡name!
GUI - Analysis
%%%% ¡probability!
.01
%%%% ¡parallel!
false
%%%% ¡code!
im_ba = ImporterBrainAtlasXLS('FILE', 'destrieux_atlas.xlsx');
ba = im_ba.get('BA');

gr = Group('SUB_CLASS', 'SubjectST', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectST'));
for i = 1:1:50
    sub = SubjectST( ...
        'ID', ['SUB ST ' int2str(i)], ...
        'LABEL', ['Subejct ST ' int2str(i)], ...
        'NOTES', ['Notes on subject ST ' int2str(i)], ...
        'BA', ba, ...
        'ST', rand(ba.get('BR_DICT').get('LENGTH'), 1) ...
        );
    sub.memorize('VOI_DICT').get('ADD', VOINumeric('ID', 'Age', 'V', 100 * rand()))
    sub.memorize('VOI_DICT').get('ADD', VOICategoric('ID', 'Sex', 'CATEGORIES', {'Female', 'Male'}, 'V', randi(2, 1)))
    gr.get('SUB_DICT').get('ADD', sub)
end

a = AnalyzeGroup_ST_BUT('GR', gr, 'THRESHOLDS', .4:.2:1);

gui = GUIElement('PE', a, 'CLOSEREQ', false);
gui.get('DRAW')
gui.get('SHOW')

gui.get('CLOSE')

%%% ¡test!
%%%% ¡name!
GUI - Comparison
%%%% ¡probability!
.01
%%%% ¡parallel!
false
%%%% ¡code!
im_ba = ImporterBrainAtlasXLS('FILE', 'destrieux_atlas.xlsx');
ba = im_ba.get('BA');

gr1 = Group('SUB_CLASS', 'SubjectST', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectST'));
for i = 1:1:50
    sub = SubjectST( ...
        'ID', ['SUB ST ' int2str(i)], ...
        'LABEL', ['Subejct ST ' int2str(i)], ...
        'NOTES', ['Notes on subject ST ' int2str(i)], ...
        'BA', ba, ...
        'ST', rand(ba.get('BR_DICT').get('LENGTH'), 1) ...
        );
    sub.memorize('VOI_DICT').get('ADD', VOINumeric('ID', 'Age', 'V', 100 * rand()))
    sub.memorize('VOI_DICT').get('ADD', VOICategoric('ID', 'Sex', 'CATEGORIES', {'Female', 'Male'}, 'V', randi(2, 1)))
    gr1.get('SUB_DICT').get('ADD', sub)
end

gr2 = Group('SUB_CLASS', 'SubjectST', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectST'));
for i = 1:1:50
    sub = SubjectST( ...
        'ID', ['SUB ST ' int2str(i)], ...
        'LABEL', ['Subejct ST ' int2str(i)], ...
        'NOTES', ['Notes on subject ST ' int2str(i)], ...
        'BA', ba, ...
        'ST', rand(ba.get('BR_DICT').get('LENGTH'), 1) ...
        );
    sub.memorize('VOI_DICT').get('ADD', VOINumeric('ID', 'Age', 'V', 100 * rand()))
    sub.memorize('VOI_DICT').get('ADD', VOICategoric('ID', 'Sex', 'CATEGORIES', {'Female', 'Male'}, 'V', randi(2, 1)))
    gr2.get('SUB_DICT').get('ADD', sub)
end

a1 = AnalyzeGroup_ST_BUT('GR', gr1, 'THRESHOLDS', .4:.2:1);
a2 = AnalyzeGroup_ST_BUT('GR', gr2, 'THRESHOLDS', a1.getCallback('THRESHOLDS'));

c = CompareGroup( ...
    'P', 10, ...
    'A1', a1, ...
    'A2', a2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

gui = GUIElement('PE', c, 'CLOSEREQ', false);
gui.get('DRAW')
gui.get('SHOW')

gui.get('CLOSE')