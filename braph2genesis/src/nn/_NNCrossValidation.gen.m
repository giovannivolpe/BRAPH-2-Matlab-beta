%% ¡header!
NNCrossValidation < ConcreteElement (nncv, neural network)  is a process for evaluating neural network models using cross-validation.

%%% ¡description!
NNCrossValidation is a process that facilitates the evaluation of neural network models using cross-validation. 
 It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. 
 This helps in assessing the generalization performance of the model and detecting overfitting.

%%% ¡seealso!
NNDataset, NNEvaluator, NNBase

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the cross-valdition.
%%%% ¡default!
'NNCrossValidation'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the cross-valdition.
%%%% ¡default!
'NNCrossValidation is a process that facilitates the evaluation of neural network models using cross-validation. It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. This helps in assessing the generalization performance of the model and detecting overfitting.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the cross-valdition.
%%%% ¡settings!
'NNCrossValidation'

%%% ¡prop!
ID (data, string) is a few-letter code for the cross-valdition.
%%%% ¡default!
'NNCrossValidation ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the nerual network base.
%%%% ¡default!
'NNCrossValidation label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the cross-validation.
%%%% ¡default!
'NNCrossValidation notes'
    
%% ¡props!

%%% ¡prop!
KFOLD (data, scalar) is the number of folds.
%%%% ¡default!
5

%%% ¡prop!
D (data, item) is the dataset to train the neural network model.
%%%% ¡settings!
'NNDataset'

%%% ¡prop!
D_LIST (result, itemlist) is the dataset to train the neural network model.
%%%% ¡settings!
'NNDataset'
%%%% ¡calculate!
d = nncv.get('D');
d_list = 


%%% ¡prop!
NN_LIST (result, itemlist) is the neural network list.
%%%% ¡settings!
'NNBase'
%%%% ¡calculate!

%%% ¡prop!
NNEvaluator_LIST (result, itemlist) is the neural network evaluator list.
%%%% ¡settings!
'NNEvaluator'
%%%% ¡calculate!