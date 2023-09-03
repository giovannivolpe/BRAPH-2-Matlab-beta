%% ¡header!
NNDataPoint_Graph_CLA < NNDataPoint (dp, connectivity classification data point) is a data point for classification with connectivity data.

%%% ¡description!
A data point for classification with connectivity data (NNDataPoint_CON_CLA) 
contains the input and target for neural network analysis with a subject with connectivity data (SubjectCON).
The input is the connectivity data of the subject.
The target is obtained from the variables of interest of the subject.

%%% ¡seealso!
SubjectCON

%% ¡props_update!
%%% ¡prop!
NAME (constant, string) is the name of a data point for classification with connectivity data.
%%%% ¡default!
'NNDataPoint_GRAPH_CLA'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of a data point for classification with connectivity data.
%%%% ¡default!
'A data point for classification with connectivity data (NNDataPoint_CON_CLA) contains the input and target for neural network analysis with a subject with connectivity data (SubjectCON). The input is the connectivity data of the subject. The target is obtained from the variables of interest of the subject.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of a data point for classification with connectivity data.
%%%% ¡settings!
'NNDataPoint_GRAPH_CLA'

%%% ¡prop!
ID (data, string) is a few-letter code for a data point for classification with connectivity data.
%%%% ¡default!
'NNDataPoint_GRAPH_CLA ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of a data point for classification with connectivity data.
%%%% ¡default!
'NNDataPoint_GRAPH_CLA label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about a data point for classification with connectivity data.
%%%% ¡default!
'NNDataPoint_GRAPH_CLA notes'

%%% ¡prop!
INPUT (result, cell) is the input value for this data point.
%%%% ¡calculate!
value = {dp.get('SUB').get('CON')};
    
%%% ¡prop!
TARGET (result, stringlist) is the target values for this data point.
%%%% ¡calculate!
value = dp.get('TARGET_IDS');

%% ¡props!

%%% ¡prop!
G (data, item) is a subject with connectivity data.
%%%% ¡settings!
'Graph'
					
%% ¡tests!

%%% ¡excluded_props!
[NNDataPoint_CON_CLA.SUB]

%%% ¡test!
%%%% ¡name!
Weighted directed graph 
%%%% ¡code!

%%% ¡test!
%%%% ¡name!
Binary undirected multigraph at fixed densities
%%%% ¡code!

%%% ¡test!
%%%% ¡name!
Weighted undirected multiplex graph
%%%% ¡code!

%%% ¡test!
%%%% ¡name!
Binary directed multilayer graph
%%%% ¡code!
