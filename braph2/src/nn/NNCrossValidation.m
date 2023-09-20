classdef NNCrossValidation < ConcreteElement
	%NNCrossValidation is a process for evaluating neural network models using cross-validation.
	% It is a subclass of <a href="matlab:help ConcreteElement">ConcreteElement</a>.
	%
	% A cross validation (NNCrossValidation) is a process that facilitates the evaluation of neural network models using cross-validation. 
	%  It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. 
	%  This helps in assessing the generalization performance of the model and detecting overfitting.
	% 
	% To train all the neural networks for all folds, use: nncv.get('TRAIN')
	%
	% The list of NNCrossValidation properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the cross-validation.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the cross-validation.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the cross-validation.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the cross-validation.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the cross-validation.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the cross-validation.
	%  <strong>7</strong> <strong>KFOLDS</strong> 	KFOLDS (data, scalar) is the number of folds.
	%  <strong>8</strong> <strong>SPLIT</strong> 	SPLIT (data, cell) is a cell containing the ratio numbers or the vectors stating which datapoints belong to the splitted neural network datasets.
	%  <strong>9</strong> <strong>D</strong> 	D (data, item) is the dataset to be cross-validated.
	%  <strong>10</strong> <strong>NN_TEMPLATE</strong> 	NN_TEMPLATE (parameter, item) is the neural network template to set all neural network parameters.
	%  <strong>11</strong> <strong>NNEVALUATOR_TEMPLATE</strong> 	NNEVALUATOR_TEMPLATE (parameter, item) is the neural network evaluator template to set all evalutor parameters.
	%  <strong>12</strong> <strong>DSP</strong> 	DSP (result, item) is a dataset splitter.
	%  <strong>13</strong> <strong>D_LIST</strong> 	D_LIST (result, itemlist) contains the split datasets corresponding to the k folds.
	%  <strong>14</strong> <strong>NN_LIST</strong> 	NN_LIST (result, itemlist) contains the neural network models corresponding to the k folds.
	%  <strong>15</strong> <strong>EVALUATOR_LIST</strong> 	EVALUATOR_LIST (result, itemlist) contains the evaluators corresponding to the k folds.
	%  <strong>16</strong> <strong>EPOCHS</strong> 	EPOCHS (parameter, scalar) is the maximum number of epochs.
	%  <strong>17</strong> <strong>BATCH</strong> 	BATCH (parameter, scalar) is the size of the mini-batch used for each training iteration.
	%  <strong>18</strong> <strong>SHUFFLE</strong> 	SHUFFLE (parameter, option) is an option for data shuffling.
	%  <strong>19</strong> <strong>SOLVER</strong> 	SOLVER (parameter, option) is an option for the solver.
	%  <strong>20</strong> <strong>VERBOSE</strong> 	VERBOSE (metadata, logical) is an indicator to display training progress information.
	%  <strong>21</strong> <strong>PLOT_TRAINING</strong> 	PLOT_TRAINING (metadata, option) determines whether to plot the training progress.
	%  <strong>22</strong> <strong>TRAIN</strong> 	TRAIN (query, empty) trains all neural network models for all folds.
	%
	% NNCrossValidation methods (constructor):
	%  NNCrossValidation - constructor
	%
	% NNCrossValidation methods:
	%  set - sets values of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns the value of a property and memorizes it
	%             (for RESULT, QUERY, and EVANESCENT properties)
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% NNCrossValidation methods (display):
	%  tostring - string with information about the neural network cross-validation
	%  disp - displays information about the neural network cross-validation
	%  tree - displays the tree of the neural network cross-validation
	%
	% NNCrossValidation methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two neural network cross-validation are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the neural network cross-validation
	%
	% NNCrossValidation methods (save/load, Static):
	%  save - saves BRAPH2 neural network cross-validation as b2 file
	%  load - loads a BRAPH2 neural network cross-validation from a b2 file
	%
	% NNCrossValidation method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the neural network cross-validation
	%
	% NNCrossValidation method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the neural network cross-validation
	%
	% NNCrossValidation methods (inspection, Static):
	%  getClass - returns the class of the neural network cross-validation
	%  getSubclasses - returns all subclasses of NNCrossValidation
	%  getProps - returns the property list of the neural network cross-validation
	%  getPropNumber - returns the property number of the neural network cross-validation
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditioned default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% NNCrossValidation methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% NNCrossValidation methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% NNCrossValidation methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% NNCrossValidation methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatTag - returns the tag of a format
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% To print full list of constants, click here <a href="matlab:metaclass = ?NNCrossValidation; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">NNCrossValidation constants</a>.
	%
	%
	% See also NNDataset, NNEvaluator, NNBase.
	
	properties (Constant) % properties
		KFOLDS = 7; %CET: Computational Efficiency Trick
		KFOLDS_TAG = 'KFOLDS';
		KFOLDS_CATEGORY = 4;
		KFOLDS_FORMAT = 11;
		
		SPLIT = 8; %CET: Computational Efficiency Trick
		SPLIT_TAG = 'SPLIT';
		SPLIT_CATEGORY = 4;
		SPLIT_FORMAT = 16;
		
		D = 9; %CET: Computational Efficiency Trick
		D_TAG = 'D';
		D_CATEGORY = 4;
		D_FORMAT = 8;
		
		NN_TEMPLATE = 10; %CET: Computational Efficiency Trick
		NN_TEMPLATE_TAG = 'NN_TEMPLATE';
		NN_TEMPLATE_CATEGORY = 3;
		NN_TEMPLATE_FORMAT = 8;
		
		NNEVALUATOR_TEMPLATE = 11; %CET: Computational Efficiency Trick
		NNEVALUATOR_TEMPLATE_TAG = 'NNEVALUATOR_TEMPLATE';
		NNEVALUATOR_TEMPLATE_CATEGORY = 3;
		NNEVALUATOR_TEMPLATE_FORMAT = 8;
		
		DSP = 12; %CET: Computational Efficiency Trick
		DSP_TAG = 'DSP';
		DSP_CATEGORY = 5;
		DSP_FORMAT = 8;
		
		D_LIST = 13; %CET: Computational Efficiency Trick
		D_LIST_TAG = 'D_LIST';
		D_LIST_CATEGORY = 5;
		D_LIST_FORMAT = 9;
		
		NN_LIST = 14; %CET: Computational Efficiency Trick
		NN_LIST_TAG = 'NN_LIST';
		NN_LIST_CATEGORY = 5;
		NN_LIST_FORMAT = 9;
		
		EVALUATOR_LIST = 15; %CET: Computational Efficiency Trick
		EVALUATOR_LIST_TAG = 'EVALUATOR_LIST';
		EVALUATOR_LIST_CATEGORY = 5;
		EVALUATOR_LIST_FORMAT = 9;
		
		EPOCHS = 16; %CET: Computational Efficiency Trick
		EPOCHS_TAG = 'EPOCHS';
		EPOCHS_CATEGORY = 3;
		EPOCHS_FORMAT = 11;
		
		BATCH = 17; %CET: Computational Efficiency Trick
		BATCH_TAG = 'BATCH';
		BATCH_CATEGORY = 3;
		BATCH_FORMAT = 11;
		
		SHUFFLE = 18; %CET: Computational Efficiency Trick
		SHUFFLE_TAG = 'SHUFFLE';
		SHUFFLE_CATEGORY = 3;
		SHUFFLE_FORMAT = 5;
		
		SOLVER = 19; %CET: Computational Efficiency Trick
		SOLVER_TAG = 'SOLVER';
		SOLVER_CATEGORY = 3;
		SOLVER_FORMAT = 5;
		
		VERBOSE = 20; %CET: Computational Efficiency Trick
		VERBOSE_TAG = 'VERBOSE';
		VERBOSE_CATEGORY = 2;
		VERBOSE_FORMAT = 4;
		
		PLOT_TRAINING = 21; %CET: Computational Efficiency Trick
		PLOT_TRAINING_TAG = 'PLOT_TRAINING';
		PLOT_TRAINING_CATEGORY = 2;
		PLOT_TRAINING_FORMAT = 5;
		
		TRAIN = 22; %CET: Computational Efficiency Trick
		TRAIN_TAG = 'TRAIN';
		TRAIN_CATEGORY = 6;
		TRAIN_FORMAT = 1;
	end
	methods % constructor
		function nncv = NNCrossValidation(varargin)
			%NNCrossValidation() creates a neural network cross-validation.
			%
			% NNCrossValidation(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% NNCrossValidation(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of NNCrossValidation properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the cross-validation.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the cross-validation.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the cross-validation.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the cross-validation.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the cross-validation.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the cross-validation.
			%  <strong>7</strong> <strong>KFOLDS</strong> 	KFOLDS (data, scalar) is the number of folds.
			%  <strong>8</strong> <strong>SPLIT</strong> 	SPLIT (data, cell) is a cell containing the ratio numbers or the vectors stating which datapoints belong to the splitted neural network datasets.
			%  <strong>9</strong> <strong>D</strong> 	D (data, item) is the dataset to be cross-validated.
			%  <strong>10</strong> <strong>NN_TEMPLATE</strong> 	NN_TEMPLATE (parameter, item) is the neural network template to set all neural network parameters.
			%  <strong>11</strong> <strong>NNEVALUATOR_TEMPLATE</strong> 	NNEVALUATOR_TEMPLATE (parameter, item) is the neural network evaluator template to set all evalutor parameters.
			%  <strong>12</strong> <strong>DSP</strong> 	DSP (result, item) is a dataset splitter.
			%  <strong>13</strong> <strong>D_LIST</strong> 	D_LIST (result, itemlist) contains the split datasets corresponding to the k folds.
			%  <strong>14</strong> <strong>NN_LIST</strong> 	NN_LIST (result, itemlist) contains the neural network models corresponding to the k folds.
			%  <strong>15</strong> <strong>EVALUATOR_LIST</strong> 	EVALUATOR_LIST (result, itemlist) contains the evaluators corresponding to the k folds.
			%  <strong>16</strong> <strong>EPOCHS</strong> 	EPOCHS (parameter, scalar) is the maximum number of epochs.
			%  <strong>17</strong> <strong>BATCH</strong> 	BATCH (parameter, scalar) is the size of the mini-batch used for each training iteration.
			%  <strong>18</strong> <strong>SHUFFLE</strong> 	SHUFFLE (parameter, option) is an option for data shuffling.
			%  <strong>19</strong> <strong>SOLVER</strong> 	SOLVER (parameter, option) is an option for the solver.
			%  <strong>20</strong> <strong>VERBOSE</strong> 	VERBOSE (metadata, logical) is an indicator to display training progress information.
			%  <strong>21</strong> <strong>PLOT_TRAINING</strong> 	PLOT_TRAINING (metadata, option) determines whether to plot the training progress.
			%  <strong>22</strong> <strong>TRAIN</strong> 	TRAIN (query, empty) trains all neural network models for all folds.
			%
			% See also Category, Format.
			
			nncv = nncv@ConcreteElement(varargin{:});
		end
	end
	methods (Static) % inspection
		function nncv_class = getClass()
			%GETCLASS returns the class of the neural network cross-validation.
			%
			% CLASS = NNCrossValidation.GETCLASS() returns the class 'NNCrossValidation'.
			%
			% Alternative forms to call this method are:
			%  CLASS = NNCV.GETCLASS() returns the class of the neural network cross-validation NNCV.
			%  CLASS = Element.GETCLASS(NNCV) returns the class of 'NNCV'.
			%  CLASS = Element.GETCLASS('NNCrossValidation') returns 'NNCrossValidation'.
			%
			% Note that the Element.GETCLASS(NNCV) and Element.GETCLASS('NNCrossValidation')
			%  are less computationally efficient.
			
			nncv_class = 'NNCrossValidation';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the neural network cross-validation.
			%
			% LIST = NNCrossValidation.GETSUBCLASSES() returns all subclasses of 'NNCrossValidation'.
			%
			% Alternative forms to call this method are:
			%  LIST = NNCV.GETSUBCLASSES() returns all subclasses of the neural network cross-validation NNCV.
			%  LIST = Element.GETSUBCLASSES(NNCV) returns all subclasses of 'NNCV'.
			%  LIST = Element.GETSUBCLASSES('NNCrossValidation') returns all subclasses of 'NNCrossValidation'.
			%
			% Note that the Element.GETSUBCLASSES(NNCV) and Element.GETSUBCLASSES('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'NNCrossValidation'  'NNClassifierMLP_CrossValidation'  'NNRegressorMLP_CrossValidation' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of neural network cross-validation.
			%
			% PROPS = NNCrossValidation.GETPROPS() returns the property list of neural network cross-validation
			%  as a row vector.
			%
			% PROPS = NNCrossValidation.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = NNCV.GETPROPS([CATEGORY]) returns the property list of the neural network cross-validation NNCV.
			%  PROPS = Element.GETPROPS(NNCV[, CATEGORY]) returns the property list of 'NNCV'.
			%  PROPS = Element.GETPROPS('NNCrossValidation'[, CATEGORY]) returns the property list of 'NNCrossValidation'.
			%
			% Note that the Element.GETPROPS(NNCV) and Element.GETPROPS('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2];
				case 2 % Category.METADATA
					prop_list = [5 6 20 21];
				case 3 % Category.PARAMETER
					prop_list = [3 10 11 16 17 18 19];
				case 4 % Category.DATA
					prop_list = [4 7 8 9];
				case 5 % Category.RESULT
					prop_list = [12 13 14 15];
				case 6 % Category.QUERY
					prop_list = 22;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of neural network cross-validation.
			%
			% N = NNCrossValidation.GETPROPNUMBER() returns the property number of neural network cross-validation.
			%
			% N = NNCrossValidation.GETPROPNUMBER(CATEGORY) returns the property number of neural network cross-validation
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = NNCV.GETPROPNUMBER([CATEGORY]) returns the property number of the neural network cross-validation NNCV.
			%  N = Element.GETPROPNUMBER(NNCV) returns the property number of 'NNCV'.
			%  N = Element.GETPROPNUMBER('NNCrossValidation') returns the property number of 'NNCrossValidation'.
			%
			% Note that the Element.GETPROPNUMBER(NNCV) and Element.GETPROPNUMBER('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 22;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 2;
				case 2 % Category.METADATA
					prop_number = 4;
				case 3 % Category.PARAMETER
					prop_number = 7;
				case 4 % Category.DATA
					prop_number = 4;
				case 5 % Category.RESULT
					prop_number = 4;
				case 6 % Category.QUERY
					prop_number = 1;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in neural network cross-validation/error.
			%
			% CHECK = NNCrossValidation.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = NNCV.EXISTSPROP(PROP) checks whether PROP exists for NNCV.
			%  CHECK = Element.EXISTSPROP(NNCV, PROP) checks whether PROP exists for NNCV.
			%  CHECK = Element.EXISTSPROP(NNCrossValidation, PROP) checks whether PROP exists for NNCrossValidation.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%
			% Alternative forms to call this method are:
			%  NNCV.EXISTSPROP(PROP) throws error if PROP does NOT exist for NNCV.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%  Element.EXISTSPROP(NNCV, PROP) throws error if PROP does NOT exist for NNCV.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%  Element.EXISTSPROP(NNCrossValidation, PROP) throws error if PROP does NOT exist for NNCrossValidation.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%
			% Note that the Element.EXISTSPROP(NNCV) and Element.EXISTSPROP('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 22 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput'], ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for NNCrossValidation.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in neural network cross-validation/error.
			%
			% CHECK = NNCrossValidation.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = NNCV.EXISTSTAG(TAG) checks whether TAG exists for NNCV.
			%  CHECK = Element.EXISTSTAG(NNCV, TAG) checks whether TAG exists for NNCV.
			%  CHECK = Element.EXISTSTAG(NNCrossValidation, TAG) checks whether TAG exists for NNCrossValidation.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%
			% Alternative forms to call this method are:
			%  NNCV.EXISTSTAG(TAG) throws error if TAG does NOT exist for NNCV.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%  Element.EXISTSTAG(NNCV, TAG) throws error if TAG does NOT exist for NNCV.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%  Element.EXISTSTAG(NNCrossValidation, TAG) throws error if TAG does NOT exist for NNCrossValidation.
			%   Error id: [BRAPH2:NNCrossValidation:WrongInput]
			%
			% Note that the Element.EXISTSTAG(NNCV) and Element.EXISTSTAG('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'KFOLDS'  'SPLIT'  'D'  'NN_TEMPLATE'  'NNEVALUATOR_TEMPLATE'  'DSP'  'D_LIST'  'NN_LIST'  'EVALUATOR_LIST'  'EPOCHS'  'BATCH'  'SHUFFLE'  'SOLVER'  'VERBOSE'  'PLOT_TRAINING'  'TRAIN' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput'], ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for NNCrossValidation.'] ...
					)
			end
		end
		function prop = getPropProp(pointer)
			%GETPROPPROP returns the property number of a property.
			%
			% PROP = Element.GETPROPPROP(PROP) returns PROP, i.e., the 
			%  property number of the property PROP.
			%
			% PROP = Element.GETPROPPROP(TAG) returns the property number 
			%  of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PROPERTY = NNCV.GETPROPPROP(POINTER) returns property number of POINTER of NNCV.
			%  PROPERTY = Element.GETPROPPROP(NNCrossValidation, POINTER) returns property number of POINTER of NNCrossValidation.
			%  PROPERTY = NNCV.GETPROPPROP(NNCrossValidation, POINTER) returns property number of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPPROP(NNCV) and Element.GETPROPPROP('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'KFOLDS'  'SPLIT'  'D'  'NN_TEMPLATE'  'NNEVALUATOR_TEMPLATE'  'DSP'  'D_LIST'  'NN_LIST'  'EVALUATOR_LIST'  'EPOCHS'  'BATCH'  'SHUFFLE'  'SOLVER'  'VERBOSE'  'PLOT_TRAINING'  'TRAIN' })); % tag = pointer %CET: Computational Efficiency Trick
			else % numeric
				prop = pointer;
			end
		end
		function tag = getPropTag(pointer)
			%GETPROPTAG returns the tag of a property.
			%
			% TAG = Element.GETPROPTAG(PROP) returns the tag TAG of the 
			%  property PROP.
			%
			% TAG = Element.GETPROPTAG(TAG) returns TAG, i.e. the tag of 
			%  the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  TAG = NNCV.GETPROPTAG(POINTER) returns tag of POINTER of NNCV.
			%  TAG = Element.GETPROPTAG(NNCrossValidation, POINTER) returns tag of POINTER of NNCrossValidation.
			%  TAG = NNCV.GETPROPTAG(NNCrossValidation, POINTER) returns tag of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPTAG(NNCV) and Element.GETPROPTAG('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				nncrossvalidation_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'KFOLDS'  'SPLIT'  'D'  'NN_TEMPLATE'  'NNEVALUATOR_TEMPLATE'  'DSP'  'D_LIST'  'NN_LIST'  'EVALUATOR_LIST'  'EPOCHS'  'BATCH'  'SHUFFLE'  'SOLVER'  'VERBOSE'  'PLOT_TRAINING'  'TRAIN' };
				tag = nncrossvalidation_tag_list{pointer}; % prop = pointer
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the category of the
			%  property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the category of the
			%  property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = NNCV.GETPROPCATEGORY(POINTER) returns category of POINTER of NNCV.
			%  CATEGORY = Element.GETPROPCATEGORY(NNCrossValidation, POINTER) returns category of POINTER of NNCrossValidation.
			%  CATEGORY = NNCV.GETPROPCATEGORY(NNCrossValidation, POINTER) returns category of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPCATEGORY(NNCV) and Element.GETPROPCATEGORY('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nncrossvalidation_category_list = { 1  1  3  4  2  2  4  4  4  3  3  5  5  5  5  3  3  3  3  2  2  6 };
			prop_category = nncrossvalidation_category_list{prop};
		end
		function prop_format = getPropFormat(pointer)
			%GETPROPFORMAT returns the format of a property.
			%
			% FORMAT = Element.GETPROPFORMAT(PROP) returns the
			%  format of the property PROP.
			%
			% FORMAT = Element.GETPROPFORMAT(TAG) returns the
			%  format of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  FORMAT = NNCV.GETPROPFORMAT(POINTER) returns format of POINTER of NNCV.
			%  FORMAT = Element.GETPROPFORMAT(NNCrossValidation, POINTER) returns format of POINTER of NNCrossValidation.
			%  FORMAT = NNCV.GETPROPFORMAT(NNCrossValidation, POINTER) returns format of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPFORMAT(NNCV) and Element.GETPROPFORMAT('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nncrossvalidation_format_list = { 2  2  8  2  2  2  11  16  8  8  8  8  9  9  9  11  11  5  5  4  5  1 };
			prop_format = nncrossvalidation_format_list{prop};
		end
		function prop_description = getPropDescription(pointer)
			%GETPROPDESCRIPTION returns the description of a property.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(PROP) returns the
			%  description of the property PROP.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(TAG) returns the
			%  description of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DESCRIPTION = NNCV.GETPROPDESCRIPTION(POINTER) returns description of POINTER of NNCV.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(NNCrossValidation, POINTER) returns description of POINTER of NNCrossValidation.
			%  DESCRIPTION = NNCV.GETPROPDESCRIPTION(NNCrossValidation, POINTER) returns description of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPDESCRIPTION(NNCV) and Element.GETPROPDESCRIPTION('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nncrossvalidation_description_list = { 'NAME (constant, string) is the name of the cross-validation.'  'DESCRIPTION (constant, string) is the description of the cross-validation.'  'TEMPLATE (parameter, item) is the template of the cross-validation.'  'ID (data, string) is a few-letter code for the cross-validation.'  'LABEL (metadata, string) is an extended label of the cross-validation.'  'NOTES (metadata, string) are some specific notes about the cross-validation.'  'KFOLDS (data, scalar) is the number of folds.'  'SPLIT (data, cell) is a cell containing the ratio numbers or the vectors stating which datapoints belong to the splitted neural network datasets.'  'D (data, item) is the dataset to be cross-validated.'  'NN_TEMPLATE (parameter, item) is the neural network template to set all neural network parameters.'  'NNEVALUATOR_TEMPLATE (parameter, item) is the neural network evaluator template to set all evalutor parameters.'  'DSP (result, item) is a dataset splitter.'  'D_LIST (result, itemlist) contains the split datasets corresponding to the k folds.'  'NN_LIST (result, itemlist) contains the neural network models corresponding to the k folds.'  'EVALUATOR_LIST (result, itemlist) contains the evaluators corresponding to the k folds.'  'EPOCHS (parameter, scalar) is the maximum number of epochs.'  'BATCH (parameter, scalar) is the size of the mini-batch used for each training iteration.'  'SHUFFLE (parameter, option) is an option for data shuffling.'  'SOLVER (parameter, option) is an option for the solver.'  'VERBOSE (metadata, logical) is an indicator to display training progress information.'  'PLOT_TRAINING (metadata, option) determines whether to plot the training progress.'  'TRAIN (query, empty) trains all neural network models for all folds.' };
			prop_description = nncrossvalidation_description_list{prop};
		end
		function prop_settings = getPropSettings(pointer)
			%GETPROPSETTINGS returns the settings of a property.
			%
			% SETTINGS = Element.GETPROPSETTINGS(PROP) returns the
			%  settings of the property PROP.
			%
			% SETTINGS = Element.GETPROPSETTINGS(TAG) returns the
			%  settings of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SETTINGS = NNCV.GETPROPSETTINGS(POINTER) returns settings of POINTER of NNCV.
			%  SETTINGS = Element.GETPROPSETTINGS(NNCrossValidation, POINTER) returns settings of POINTER of NNCrossValidation.
			%  SETTINGS = NNCV.GETPROPSETTINGS(NNCrossValidation, POINTER) returns settings of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPSETTINGS(NNCV) and Element.GETPROPSETTINGS('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 7 % NNCrossValidation.KFOLDS
					prop_settings = Format.getFormatSettings(11);
				case 8 % NNCrossValidation.SPLIT
					prop_settings = Format.getFormatSettings(16);
				case 9 % NNCrossValidation.D
					prop_settings = 'NNDataset';
				case 10 % NNCrossValidation.NN_TEMPLATE
					prop_settings = 'NNBase';
				case 11 % NNCrossValidation.NNEVALUATOR_TEMPLATE
					prop_settings = 'NNEvaluator';
				case 12 % NNCrossValidation.DSP
					prop_settings = 'NNDatasetSplit';
				case 13 % NNCrossValidation.D_LIST
					prop_settings = Format.getFormatSettings(9);
				case 14 % NNCrossValidation.NN_LIST
					prop_settings = Format.getFormatSettings(9);
				case 15 % NNCrossValidation.EVALUATOR_LIST
					prop_settings = Format.getFormatSettings(9);
				case 16 % NNCrossValidation.EPOCHS
					prop_settings = Format.getFormatSettings(11);
				case 17 % NNCrossValidation.BATCH
					prop_settings = Format.getFormatSettings(11);
				case 18 % NNCrossValidation.SHUFFLE
					prop_settings = {'once' 'never' 'every-epoch'};
				case 19 % NNCrossValidation.SOLVER
					prop_settings = {'adam' 'sgdm' 'rmsprop'};
				case 20 % NNCrossValidation.VERBOSE
					prop_settings = Format.getFormatSettings(4);
				case 21 % NNCrossValidation.PLOT_TRAINING
					prop_settings = {'none' 'training-progress'};
				case 22 % NNCrossValidation.TRAIN
					prop_settings = Format.getFormatSettings(1);
				case 3 % NNCrossValidation.TEMPLATE
					prop_settings = 'NNCrossValidation';
				otherwise
					prop_settings = getPropSettings@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = NNCrossValidation.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = NNCrossValidation.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = NNCV.GETPROPDEFAULT(POINTER) returns the default value of POINTER of NNCV.
			%  DEFAULT = Element.GETPROPDEFAULT(NNCrossValidation, POINTER) returns the default value of POINTER of NNCrossValidation.
			%  DEFAULT = NNCV.GETPROPDEFAULT(NNCrossValidation, POINTER) returns the default value of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPDEFAULT(NNCV) and Element.GETPROPDEFAULT('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 7 % NNCrossValidation.KFOLDS
					prop_default = 5;
				case 8 % NNCrossValidation.SPLIT
					prop_default = Format.getFormatDefault(16, NNCrossValidation.getPropSettings(prop));
				case 9 % NNCrossValidation.D
					prop_default = Format.getFormatDefault(8, NNCrossValidation.getPropSettings(prop));
				case 10 % NNCrossValidation.NN_TEMPLATE
					prop_default = Format.getFormatDefault(8, NNCrossValidation.getPropSettings(prop));
				case 11 % NNCrossValidation.NNEVALUATOR_TEMPLATE
					prop_default = Format.getFormatDefault(8, NNCrossValidation.getPropSettings(prop));
				case 12 % NNCrossValidation.DSP
					prop_default = Format.getFormatDefault(8, NNCrossValidation.getPropSettings(prop));
				case 13 % NNCrossValidation.D_LIST
					prop_default = Format.getFormatDefault(9, NNCrossValidation.getPropSettings(prop));
				case 14 % NNCrossValidation.NN_LIST
					prop_default = Format.getFormatDefault(9, NNCrossValidation.getPropSettings(prop));
				case 15 % NNCrossValidation.EVALUATOR_LIST
					prop_default = Format.getFormatDefault(9, NNCrossValidation.getPropSettings(prop));
				case 16 % NNCrossValidation.EPOCHS
					prop_default = 20;
				case 17 % NNCrossValidation.BATCH
					prop_default = 8;
				case 18 % NNCrossValidation.SHUFFLE
					prop_default = Format.getFormatDefault(5, NNCrossValidation.getPropSettings(prop));
				case 19 % NNCrossValidation.SOLVER
					prop_default = Format.getFormatDefault(5, NNCrossValidation.getPropSettings(prop));
				case 20 % NNCrossValidation.VERBOSE
					prop_default = false;
				case 21 % NNCrossValidation.PLOT_TRAINING
					prop_default = Format.getFormatDefault(5, NNCrossValidation.getPropSettings(prop));
				case 22 % NNCrossValidation.TRAIN
					prop_default = Format.getFormatDefault(1, NNCrossValidation.getPropSettings(prop));
				case 1 % NNCrossValidation.NAME
					prop_default = 'NNCrossValidation';
				case 2 % NNCrossValidation.DESCRIPTION
					prop_default = 'A cross validation (NNCrossValidation) is a process that facilitates the evaluation of neural network models using cross-validation. It involves splitting a dataset into multiple subsets (folds), training the model on some folds while validating on others, and then repeating the process for all combinations of folds. This helps in assessing the generalization performance of the model and detecting overfitting.';
				case 3 % NNCrossValidation.TEMPLATE
					prop_default = Format.getFormatDefault(8, NNCrossValidation.getPropSettings(prop));
				case 4 % NNCrossValidation.ID
					prop_default = 'NNCrossValidation ID';
				case 5 % NNCrossValidation.LABEL
					prop_default = 'NNCrossValidation label';
				case 6 % NNCrossValidation.NOTES
					prop_default = 'NNCrossValidation notes';
				otherwise
					prop_default = getPropDefault@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = NNCrossValidation.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = NNCrossValidation.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = NNCV.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of NNCV.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(NNCrossValidation, POINTER) returns the conditioned default value of POINTER of NNCrossValidation.
			%  DEFAULT = NNCV.GETPROPDEFAULTCONDITIONED(NNCrossValidation, POINTER) returns the conditioned default value of POINTER of NNCrossValidation.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(NNCV) and Element.GETPROPDEFAULTCONDITIONED('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			prop_default = NNCrossValidation.conditioning(prop, NNCrossValidation.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = NNCV.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = NNCV.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of NNCV.
			%  CHECK = Element.CHECKPROP(NNCrossValidation, PROP, VALUE) checks VALUE format for PROP of NNCrossValidation.
			%  CHECK = NNCV.CHECKPROP(NNCrossValidation, PROP, VALUE) checks VALUE format for PROP of NNCrossValidation.
			% 
			% NNCV.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:NNCrossValidation:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  NNCV.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of NNCV.
			%   Error id: BRAPH2:NNCrossValidation:WrongInput
			%  Element.CHECKPROP(NNCrossValidation, PROP, VALUE) throws error if VALUE has not a valid format for PROP of NNCrossValidation.
			%   Error id: BRAPH2:NNCrossValidation:WrongInput
			%  NNCV.CHECKPROP(NNCrossValidation, PROP, VALUE) throws error if VALUE has not a valid format for PROP of NNCrossValidation.
			%   Error id: BRAPH2:NNCrossValidation:WrongInput]
			% 
			% Note that the Element.CHECKPROP(NNCV) and Element.CHECKPROP('NNCrossValidation')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = NNCrossValidation.getPropProp(pointer);
			
			switch prop
				case 7 % NNCrossValidation.KFOLDS
					check = Format.checkFormat(11, value, NNCrossValidation.getPropSettings(prop));
				case 8 % NNCrossValidation.SPLIT
					check = Format.checkFormat(16, value, NNCrossValidation.getPropSettings(prop));
				case 9 % NNCrossValidation.D
					check = Format.checkFormat(8, value, NNCrossValidation.getPropSettings(prop));
				case 10 % NNCrossValidation.NN_TEMPLATE
					check = Format.checkFormat(8, value, NNCrossValidation.getPropSettings(prop));
				case 11 % NNCrossValidation.NNEVALUATOR_TEMPLATE
					check = Format.checkFormat(8, value, NNCrossValidation.getPropSettings(prop));
				case 12 % NNCrossValidation.DSP
					check = Format.checkFormat(8, value, NNCrossValidation.getPropSettings(prop));
				case 13 % NNCrossValidation.D_LIST
					check = Format.checkFormat(9, value, NNCrossValidation.getPropSettings(prop));
				case 14 % NNCrossValidation.NN_LIST
					check = Format.checkFormat(9, value, NNCrossValidation.getPropSettings(prop));
				case 15 % NNCrossValidation.EVALUATOR_LIST
					check = Format.checkFormat(9, value, NNCrossValidation.getPropSettings(prop));
				case 16 % NNCrossValidation.EPOCHS
					check = Format.checkFormat(11, value, NNCrossValidation.getPropSettings(prop));
				case 17 % NNCrossValidation.BATCH
					check = Format.checkFormat(11, value, NNCrossValidation.getPropSettings(prop));
				case 18 % NNCrossValidation.SHUFFLE
					check = Format.checkFormat(5, value, NNCrossValidation.getPropSettings(prop));
				case 19 % NNCrossValidation.SOLVER
					check = Format.checkFormat(5, value, NNCrossValidation.getPropSettings(prop));
				case 20 % NNCrossValidation.VERBOSE
					check = Format.checkFormat(4, value, NNCrossValidation.getPropSettings(prop));
				case 21 % NNCrossValidation.PLOT_TRAINING
					check = Format.checkFormat(5, value, NNCrossValidation.getPropSettings(prop));
				case 22 % NNCrossValidation.TRAIN
					check = Format.checkFormat(1, value, NNCrossValidation.getPropSettings(prop));
				case 3 % NNCrossValidation.TEMPLATE
					check = Format.checkFormat(8, value, NNCrossValidation.getPropSettings(prop));
				otherwise
					if prop <= 6
						check = checkProp@ConcreteElement(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput'], ...
					['BRAPH2' ':NNCrossValidation:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' NNCrossValidation.getPropTag(prop) ' (' NNCrossValidation.getFormatTag(NNCrossValidation.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % postprocessing
		function postprocessing(nncv, prop)
			%POSTPROCESSING postprocessesing after setting.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing of PROP after setting. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% The postprocessing of all properties occurs each time set is called.
			%
			% See also conditioning, preset, checkProp, postset, calculateValue,
			%  checkValue.
			
			switch prop
				case 8 % NNCrossValidation.SPLIT
					split = nncv.get('SPLIT');
					kfolds = nncv.get('KFOLDS');
					d = nncv.get('D');
					if isempty(split) && d.get('DP_DICT').get('LENGTH') > kfolds
					    nncv.set('SPLIT', repmat({1 / kfolds}, 1, kfolds));
					end
					
				otherwise
					if prop <= 6
						postprocessing@ConcreteElement(nncv, prop);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(nncv, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case 12 % NNCrossValidation.DSP
					rng_settings_ = rng(); rng(nncv.getPropSeed(12), 'twister')
					
					d = nncv.get('D');
					value = NNDatasetSplit('D', d, 'SPLIT', nncv.get('SPLIT'));
					
					rng(rng_settings_)
					
				case 13 % NNCrossValidation.D_LIST
					rng_settings_ = rng(); rng(nncv.getPropSeed(13), 'twister')
					
					d = nncv.get('D');
					if d.get('DP_DICT').get('LENGTH') == 0
					    value = {};
					else
					    value = nncv.get('DSP').get('D_LIST');
					end
					
					rng(rng_settings_)
					
				case 22 % NNCrossValidation.TRAIN
					nn_list = nncv.memorize('NN_LIST');
					for i = 1:1:length(nn_list)
					    nn_list{i}.memorize('MODEL');
					end
					value = [];
					
				otherwise
					if prop <= 6
						value = calculateValue@ConcreteElement(nncv, prop, varargin{:});
					else
						value = calculateValue@Element(nncv, prop, varargin{:});
					end
			end
			
		end
	end
end
