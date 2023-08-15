%% ¡header!
NNClassifier_CrossValidation < NNCrossValidation (nncv, neural network) comprises a neural network model with a dataset.

%%% ¡description!
A neural network base (NNBase) comprises a neural network model with a specific dataset.
 Instances of this class should not be created. Use one of its subclasses instead.

Its subclasses need to implement the props MODEL, INPUTS and TARGETS.
 Each subclass is typically optimized to work with the subclasses of NNDataPoint in the prop DP_CLASSES.

To train a neural network nn use: nn.get('TRAIN')
To obtain the prediction on a dataset D use: predictions = nn.get('PREDICT', D)

%%% ¡seealso!
NNDataPoint, NNDataset, NNEvaluator

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the nerual network base.
%%%% ¡default!
'NNClassifier_CrossValidation'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the nerual network base.
%%%% ¡default!
'A neural network base (NNBase) comprises a neural network model with a specific dataset. Instances of this class should not be created. Use one of its subclasses instead. Its subclasses need to implement the props MODEL, INPUTS and TARGETS.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the nerual network base.
%%%% ¡settings!
'NNClassifier_CrossValidation'

%%% ¡prop!
ID (data, string) is a few-letter code for the nerual network base.
%%%% ¡default!
'NNClassifier_CrossValidation ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the nerual network base.
%%%% ¡default!
'NNClassifier_CrossValidation label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the nerual network base.
%%%% ¡default!
'NNClassifier_CrossValidation notes'
    
%%% ¡prop!
D (data, item) is the dataset to train the neural network model.
%%%% ¡settings!
'NNDataset'

%%% ¡prop!
NN_LIST (data, itemlist) is the neural network list.
%%%% ¡settings!
'NNBase'

%%% ¡prop!
NNEvaluator_LIST (data, itemlist) is the neural network evaluator list.
%%%% ¡settings!
'NNEvaluator'