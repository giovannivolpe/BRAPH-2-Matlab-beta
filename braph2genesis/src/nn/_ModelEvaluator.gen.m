%% ¡header!
ModelEvaluator < Element (me, model evaluator of a neural network model) evaluates the performance of a neural network model with a specific dataset.

%% ¡description!
This model evaluator evaluates the performance of a neural network model.
Instances of this class should not be created. 
Use one of its subclasses instead.

%% ¡props!
%%% ¡prop!
DATASET_PROCESSOR (data, item) is a dataset processor contains the dataset and the neural network model.
%%%% ¡settings!
'DatasetProcessor'

%%% ¡prop!
TRAINED_MODEL (data, item) is a trained neural network model.
%%%% ¡settings!
'BaseNN'
