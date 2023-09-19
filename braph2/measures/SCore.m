classdef SCore < Measure
	%SCore is the score.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The s-core of a graph is the largest subnetwork comprising nodes of strength 
	%   s or higher. s is set by the user; the default value is equal to 1.
	%
	% SCore methods (constructor):
	%  SCore - constructor
	%
	% SCore methods:
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
	% SCore methods (display):
	%  tostring - string with information about the score
	%  disp - displays information about the score
	%  tree - displays the tree of the score
	%
	% SCore methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two score are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the score
	%
	% SCore methods (save/load, Static):
	%  save - saves BRAPH2 score as b2 file
	%  load - loads a BRAPH2 score from a b2 file
	%
	% SCore method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the score
	%
	% SCore method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the score
	%
	% SCore methods (inspection, Static):
	%  getClass - returns the class of the score
	%  getSubclasses - returns all subclasses of SCore
	%  getProps - returns the property list of the score
	%  getPropNumber - returns the property number of the score
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
	% SCore methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% SCore methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% SCore methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% SCore methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?SCore; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">SCore constants</a>.
	%
	
	properties (Constant) % properties
		SCORETHRESHOLD = Measure.getPropNumber() + 1;
		SCORETHRESHOLD_TAG = 'SCORETHRESHOLD';
		SCORETHRESHOLD_CATEGORY = Category.PARAMETER;
		SCORETHRESHOLD_FORMAT = Format.SCALAR;
	end
	methods % constructor
		function m = SCore(varargin)
			%SCore() creates a score.
			%
			% SCore(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% SCore(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Measure(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the score.
			%
			% CLASS = SCore.GETCLASS() returns the class 'SCore'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the score M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('SCore') returns 'SCore'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('SCore')
			%  are less computationally efficient.
			
			m_class = 'SCore';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the score.
			%
			% LIST = SCore.GETSUBCLASSES() returns all subclasses of 'SCore'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the score M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('SCore') returns all subclasses of 'SCore'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('SCore')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('SCore', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of score.
			%
			% PROPS = SCore.GETPROPS() returns the property list of score
			%  as a row vector.
			%
			% PROPS = SCore.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the score M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('SCore'[, CATEGORY]) returns the property list of 'SCore'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('SCore')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Measure.getProps() ...
						SCore.SCORETHRESHOLD ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Measure.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Measure.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Measure.getProps(Category.PARAMETER) ...
						SCore.SCORETHRESHOLD ...
						];
				case Category.DATA
					prop_list = [ ...
						Measure.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Measure.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Measure.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Measure.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Measure.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Measure.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of score.
			%
			% N = SCore.GETPROPNUMBER() returns the property number of score.
			%
			% N = SCore.GETPROPNUMBER(CATEGORY) returns the property number of score
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the score M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('SCore') returns the property number of 'SCore'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('SCore')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(SCore.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in score/error.
			%
			% CHECK = SCore.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(SCore, PROP) checks whether PROP exists for SCore.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:SCore:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%  Element.EXISTSPROP(SCore, PROP) throws error if PROP does NOT exist for SCore.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('SCore')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == SCore.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for SCore.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in score/error.
			%
			% CHECK = SCore.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(SCore, TAG) checks whether TAG exists for SCore.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:SCore:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%  Element.EXISTSTAG(SCore, TAG) throws error if TAG does NOT exist for SCore.
			%   Error id: [BRAPH2:SCore:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('SCore')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			score_tag_list = cellfun(@(x) SCore.getPropTag(x), num2cell(SCore.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, score_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for SCore.'] ...
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
			%  PROPERTY = M.GETPROPPROP(POINTER) returns property number of POINTER of M.
			%  PROPERTY = Element.GETPROPPROP(SCore, POINTER) returns property number of POINTER of SCore.
			%  PROPERTY = M.GETPROPPROP(SCore, POINTER) returns property number of POINTER of SCore.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('SCore')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				score_tag_list = cellfun(@(x) SCore.getPropTag(x), num2cell(SCore.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, score_tag_list)); % tag = pointer
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
			%  TAG = M.GETPROPTAG(POINTER) returns tag of POINTER of M.
			%  TAG = Element.GETPROPTAG(SCore, POINTER) returns tag of POINTER of SCore.
			%  TAG = M.GETPROPTAG(SCore, POINTER) returns tag of POINTER of SCore.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('SCore')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case SCore.SCORETHRESHOLD
						tag = SCore.SCORETHRESHOLD_TAG;
					otherwise
						tag = getPropTag@Measure(prop);
				end
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
			%  CATEGORY = M.GETPROPCATEGORY(POINTER) returns category of POINTER of M.
			%  CATEGORY = Element.GETPROPCATEGORY(SCore, POINTER) returns category of POINTER of SCore.
			%  CATEGORY = M.GETPROPCATEGORY(SCore, POINTER) returns category of POINTER of SCore.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('SCore')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD
					prop_category = SCore.SCORETHRESHOLD_CATEGORY;
				otherwise
					prop_category = getPropCategory@Measure(prop);
			end
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
			%  FORMAT = M.GETPROPFORMAT(POINTER) returns format of POINTER of M.
			%  FORMAT = Element.GETPROPFORMAT(SCore, POINTER) returns format of POINTER of SCore.
			%  FORMAT = M.GETPROPFORMAT(SCore, POINTER) returns format of POINTER of SCore.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('SCore')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD
					prop_format = SCore.SCORETHRESHOLD_FORMAT;
				otherwise
					prop_format = getPropFormat@Measure(prop);
			end
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
			%  DESCRIPTION = M.GETPROPDESCRIPTION(POINTER) returns description of POINTER of M.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(SCore, POINTER) returns description of POINTER of SCore.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(SCore, POINTER) returns description of POINTER of SCore.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('SCore')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD
					prop_description = 'SCORETHRESHOLD (parameter, scalar) is the strength threshold.';
				case SCore.NAME
					prop_description = 'NAME (constant, string) is the name of the score.';
				case SCore.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the score.';
				case SCore.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the score.';
				case SCore.ID
					prop_description = 'ID (data, string) is a few-letter code of the score.';
				case SCore.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the score.';
				case SCore.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the score.';
				case SCore.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.BINODAL__.';
				case SCore.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case SCore.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case SCore.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case SCore.M
					prop_description = 'M (result, cell) is the score.';
				otherwise
					prop_description = getPropDescription@Measure(prop);
			end
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
			%  SETTINGS = M.GETPROPSETTINGS(POINTER) returns settings of POINTER of M.
			%  SETTINGS = Element.GETPROPSETTINGS(SCore, POINTER) returns settings of POINTER of SCore.
			%  SETTINGS = M.GETPROPSETTINGS(SCore, POINTER) returns settings of POINTER of SCore.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('SCore')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case SCore.TEMPLATE
					prop_settings = 'SCore';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = SCore.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = SCore.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(SCore, POINTER) returns the default value of POINTER of SCore.
			%  DEFAULT = M.GETPROPDEFAULT(SCore, POINTER) returns the default value of POINTER of SCore.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('SCore')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD
					prop_default = 1;
				case SCore.NAME
					prop_default = 'SCore';
				case SCore.DESCRIPTION
					prop_default = 'The s-core of a graph is the largest subnetwork comprising nodes of strength s or higher. s is set by the user; the default value is equal to 1.';
				case SCore.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, SCore.getPropSettings(prop));
				case SCore.ID
					prop_default = 'SCore ID';
				case SCore.LABEL
					prop_default = 'SCore label';
				case SCore.NOTES
					prop_default = 'SCore notes';
				case SCore.SHAPE
					prop_default = Measure.BINODAL;
				case SCore.SCOPE
					prop_default = Measure.UNILAYER;
				case SCore.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case SCore.COMPATIBLE_GRAPHS
					prop_default = {'GraphWD' 'GraphWU' 'MultiplexWD' 'MultiplexWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = SCore.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = SCore.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(SCore, POINTER) returns the conditioned default value of POINTER of SCore.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(SCore, POINTER) returns the conditioned default value of POINTER of SCore.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('SCore')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = SCore.getPropProp(pointer);
			
			prop_default = SCore.conditioning(prop, SCore.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = M.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = M.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of M.
			%  CHECK = Element.CHECKPROP(SCore, PROP, VALUE) checks VALUE format for PROP of SCore.
			%  CHECK = M.CHECKPROP(SCore, PROP, VALUE) checks VALUE format for PROP of SCore.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:SCore:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:SCore:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(SCore, PROP, VALUE) throws error if VALUE has not a valid format for PROP of SCore.
			%   Error id: €BRAPH2.STR€:SCore:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(SCore, PROP, VALUE) throws error if VALUE has not a valid format for PROP of SCore.
			%   Error id: €BRAPH2.STR€:SCore:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('SCore')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = SCore.getPropProp(pointer);
			
			switch prop
				case SCore.SCORETHRESHOLD % __SCore.SCORETHRESHOLD__
					check = Format.checkFormat(Format.SCALAR, value, SCore.getPropSettings(prop));
				case SCore.TEMPLATE % __SCore.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, SCore.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' SCore.getPropTag(prop) ' (' SCore.getFormatTag(SCore.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(m, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with Category.RESULT,
			%  Category.QUERY, and Category.EVANESCENT. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  Category.QUERY.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case SCore.M % __SCore.M__
					rng_settings_ = rng(); rng(m.getPropSeed(SCore.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					
					score_threshold = m.get('SCORETHRESHOLD');
					assert(isnumeric(score_threshold) == 1, ...
					    [BRAPH2.STR ':SCore:' BRAPH2.WRONG_INPUT], ...
					    ['SCore threshold must be a positive number ' ...
					    'while it is ' tostring(score_threshold)])
					
					s_core = cell(L, 1);
					directionality_type = g.get('DIRECTIONALITY_TYPE', L);
					parfor li = 1:1:L    
					    
					    Aii = A{li, li};
					    directionality_layer = directionality_type(li, li);
					
					    iter = 0;
					    subAii = Aii;
					    while 1
					        % get strengths of matrix
					        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					            st = sum(subAii, 1)';  % degree undirected graphs
					        else
					            st = (sum(subAii, 1)' + sum(subAii, 2));  % strength directed
					        end
					        
					        % find nodes with degree < k
					        low_s_nodes = find((st < score_threshold) & (st > 0));
					        
					        % if none found -> stop
					        if (isempty(low_s_nodes)) break; end; %#ok<SEPEX>
					        
					        % peel away found nodes
					        iter = iter + 1;
					        subAii(low_s_nodes, :) = 0;
					        subAii(:, low_s_nodes) = 0;
					    end
					    s_core(li) = {subAii};  % add s-core of layer li
					end
					value = s_core;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Measure.getPropNumber()
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
