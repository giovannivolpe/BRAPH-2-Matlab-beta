%% ¡header!
NNEvaluator < ConcreteElement (nne, neural network evaluator) evaluates the performance of a neural network model with a given dataset.

%%% ¡description!
A neural network evaluator (NNEvaluator) evaluates the performance of a neural network model with a given dataset.
Instances of this class should not be created. Use one of its subclasses instead.
Its subclasses shall be specifically designed to cater to different evaluation cases such as a classification task, a regression task, or a data generation task.


%%% ¡seealso!
NNDataPoint, NNData, NNBase

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the evaluator for the neural network analysis.
%%%% ¡default!
'NNEvaluator'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the evaluator for the neural network analysis.
%%%% ¡default!
'A neural network evaluator (NNEvaluator) evaluates the performance of a neural network model with a given dataset. Instances of this class should not be created. Use one of its subclasses instead. Its subclasses shall be specifically designed to cater to different evaluation cases such as a classification task, a regression task, or a data generation task.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the evaluator for the neural network analysis.
%%%% ¡settings!
'NNEvaluator'

%%% ¡prop!
ID (data, string) is a few-letter code for the evaluator for the neural network analysis.
%%%% ¡default!
'NNEvaluator ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the evaluator for the neural network analysis.
%%%% ¡default!
'NNEvaluator label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the evaluator for the neural network analysis.
%%%% ¡default!
'NNEvaluator notes'
    
%% ¡props!

%%% ¡prop!
D (data, item) is the given dataset to evaluate the neural network model.
%%%% ¡settings!
'NNDataset'

%%% ¡prop!
NN (data, item) contains a trained neural network model.
%%%% ¡settings!
'NNBase'

%%% ¡prop!
PREDICTIONS (result, cell) are the predictions of the trained neural network model from the given dataset.
