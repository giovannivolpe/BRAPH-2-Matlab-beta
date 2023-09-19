classdef AnalyzeGroup_ST_MP_WU < AnalyzeGroup
	%AnalyzeGroup_ST_MP_WU is a graph analysis using structural multiplex data.
	% It is a subclass of <a href="matlab:help AnalyzeGroup">AnalyzeGroup</a>.
	%
	% This graph analysis uses structural multiplex data and analyzes them using 
	% weighted undirected multiplexes, binary undirected multiplexes with fixed thresholds,
	% or binary undirected multiplexes with fixed densities.
	%
	% AnalyzeGroup_ST_MP_WU methods (constructor):
	%  AnalyzeGroup_ST_MP_WU - constructor
	%
	% AnalyzeGroup_ST_MP_WU methods:
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
	% AnalyzeGroup_ST_MP_WU methods (display):
	%  tostring - string with information about the graph analysis with structural multiplex data
	%  disp - displays information about the graph analysis with structural multiplex data
	%  tree - displays the tree of the graph analysis with structural multiplex data
	%
	% AnalyzeGroup_ST_MP_WU methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two graph analysis with structural multiplex data are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the graph analysis with structural multiplex data
	%
	% AnalyzeGroup_ST_MP_WU methods (save/load, Static):
	%  save - saves BRAPH2 graph analysis with structural multiplex data as b2 file
	%  load - loads a BRAPH2 graph analysis with structural multiplex data from a b2 file
	%
	% AnalyzeGroup_ST_MP_WU method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the graph analysis with structural multiplex data
	%
	% AnalyzeGroup_ST_MP_WU method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the graph analysis with structural multiplex data
	%
	% AnalyzeGroup_ST_MP_WU methods (inspection, Static):
	%  getClass - returns the class of the graph analysis with structural multiplex data
	%  getSubclasses - returns all subclasses of AnalyzeGroup_ST_MP_WU
	%  getProps - returns the property list of the graph analysis with structural multiplex data
	%  getPropNumber - returns the property number of the graph analysis with structural multiplex data
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
	% AnalyzeGroup_ST_MP_WU methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% AnalyzeGroup_ST_MP_WU methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% AnalyzeGroup_ST_MP_WU methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% AnalyzeGroup_ST_MP_WU methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?AnalyzeGroup_ST_MP_WU; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">AnalyzeGroup_ST_MP_WU constants</a>.
	%
	%
	% See also SubjectST_MP, MultiplexWU.
	
	properties (Constant) % properties
		CORRELATION_RULE = AnalyzeGroup.getPropNumber() + 1;
		CORRELATION_RULE_TAG = 'CORRELATION_RULE';
		CORRELATION_RULE_CATEGORY = Category.PARAMETER;
		CORRELATION_RULE_FORMAT = Format.OPTION;
		
		NEGATIVE_WEIGHT_RULE = AnalyzeGroup.getPropNumber() + 2;
		NEGATIVE_WEIGHT_RULE_TAG = 'NEGATIVE_WEIGHT_RULE';
		NEGATIVE_WEIGHT_RULE_CATEGORY = Category.PARAMETER;
		NEGATIVE_WEIGHT_RULE_FORMAT = Format.OPTION;
	end
	methods % constructor
		function a = AnalyzeGroup_ST_MP_WU(varargin)
			%AnalyzeGroup_ST_MP_WU() creates a graph analysis with structural multiplex data.
			%
			% AnalyzeGroup_ST_MP_WU(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% AnalyzeGroup_ST_MP_WU(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			a = a@AnalyzeGroup(varargin{:});
		end
	end
	methods (Static) % inspection
		function a_class = getClass()
			%GETCLASS returns the class of the graph analysis with structural multiplex data.
			%
			% CLASS = AnalyzeGroup_ST_MP_WU.GETCLASS() returns the class 'AnalyzeGroup_ST_MP_WU'.
			%
			% Alternative forms to call this method are:
			%  CLASS = A.GETCLASS() returns the class of the graph analysis with structural multiplex data A.
			%  CLASS = Element.GETCLASS(A) returns the class of 'A'.
			%  CLASS = Element.GETCLASS('AnalyzeGroup_ST_MP_WU') returns 'AnalyzeGroup_ST_MP_WU'.
			%
			% Note that the Element.GETCLASS(A) and Element.GETCLASS('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			
			a_class = 'AnalyzeGroup_ST_MP_WU';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the graph analysis with structural multiplex data.
			%
			% LIST = AnalyzeGroup_ST_MP_WU.GETSUBCLASSES() returns all subclasses of 'AnalyzeGroup_ST_MP_WU'.
			%
			% Alternative forms to call this method are:
			%  LIST = A.GETSUBCLASSES() returns all subclasses of the graph analysis with structural multiplex data A.
			%  LIST = Element.GETSUBCLASSES(A) returns all subclasses of 'A'.
			%  LIST = Element.GETSUBCLASSES('AnalyzeGroup_ST_MP_WU') returns all subclasses of 'AnalyzeGroup_ST_MP_WU'.
			%
			% Note that the Element.GETSUBCLASSES(A) and Element.GETSUBCLASSES('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('AnalyzeGroup_ST_MP_WU', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of graph analysis with structural multiplex data.
			%
			% PROPS = AnalyzeGroup_ST_MP_WU.GETPROPS() returns the property list of graph analysis with structural multiplex data
			%  as a row vector.
			%
			% PROPS = AnalyzeGroup_ST_MP_WU.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = A.GETPROPS([CATEGORY]) returns the property list of the graph analysis with structural multiplex data A.
			%  PROPS = Element.GETPROPS(A[, CATEGORY]) returns the property list of 'A'.
			%  PROPS = Element.GETPROPS('AnalyzeGroup_ST_MP_WU'[, CATEGORY]) returns the property list of 'AnalyzeGroup_ST_MP_WU'.
			%
			% Note that the Element.GETPROPS(A) and Element.GETPROPS('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					AnalyzeGroup.getProps() ...
						AnalyzeGroup_ST_MP_WU.CORRELATION_RULE ...
						AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.PARAMETER) ...
						AnalyzeGroup_ST_MP_WU.CORRELATION_RULE ...
						AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE ...
						];
				case Category.DATA
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						AnalyzeGroup.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						AnalyzeGroup.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of graph analysis with structural multiplex data.
			%
			% N = AnalyzeGroup_ST_MP_WU.GETPROPNUMBER() returns the property number of graph analysis with structural multiplex data.
			%
			% N = AnalyzeGroup_ST_MP_WU.GETPROPNUMBER(CATEGORY) returns the property number of graph analysis with structural multiplex data
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = A.GETPROPNUMBER([CATEGORY]) returns the property number of the graph analysis with structural multiplex data A.
			%  N = Element.GETPROPNUMBER(A) returns the property number of 'A'.
			%  N = Element.GETPROPNUMBER('AnalyzeGroup_ST_MP_WU') returns the property number of 'AnalyzeGroup_ST_MP_WU'.
			%
			% Note that the Element.GETPROPNUMBER(A) and Element.GETPROPNUMBER('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(AnalyzeGroup_ST_MP_WU.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in graph analysis with structural multiplex data/error.
			%
			% CHECK = AnalyzeGroup_ST_MP_WU.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = A.EXISTSPROP(PROP) checks whether PROP exists for A.
			%  CHECK = Element.EXISTSPROP(A, PROP) checks whether PROP exists for A.
			%  CHECK = Element.EXISTSPROP(AnalyzeGroup_ST_MP_WU, PROP) checks whether PROP exists for AnalyzeGroup_ST_MP_WU.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  A.EXISTSPROP(PROP) throws error if PROP does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%  Element.EXISTSPROP(A, PROP) throws error if PROP does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%  Element.EXISTSPROP(AnalyzeGroup_ST_MP_WU, PROP) throws error if PROP does NOT exist for AnalyzeGroup_ST_MP_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%
			% Note that the Element.EXISTSPROP(A) and Element.EXISTSPROP('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == AnalyzeGroup_ST_MP_WU.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for AnalyzeGroup_ST_MP_WU.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in graph analysis with structural multiplex data/error.
			%
			% CHECK = AnalyzeGroup_ST_MP_WU.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = A.EXISTSTAG(TAG) checks whether TAG exists for A.
			%  CHECK = Element.EXISTSTAG(A, TAG) checks whether TAG exists for A.
			%  CHECK = Element.EXISTSTAG(AnalyzeGroup_ST_MP_WU, TAG) checks whether TAG exists for AnalyzeGroup_ST_MP_WU.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%
			% Alternative forms to call this method are:
			%  A.EXISTSTAG(TAG) throws error if TAG does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%  Element.EXISTSTAG(A, TAG) throws error if TAG does NOT exist for A.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%  Element.EXISTSTAG(AnalyzeGroup_ST_MP_WU, TAG) throws error if TAG does NOT exist for AnalyzeGroup_ST_MP_WU.
			%   Error id: [BRAPH2:AnalyzeGroup_ST_MP_WU:WrongInput]
			%
			% Note that the Element.EXISTSTAG(A) and Element.EXISTSTAG('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			analyzegroup_st_mp_wu_tag_list = cellfun(@(x) AnalyzeGroup_ST_MP_WU.getPropTag(x), num2cell(AnalyzeGroup_ST_MP_WU.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, analyzegroup_st_mp_wu_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for AnalyzeGroup_ST_MP_WU.'] ...
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
			%  PROPERTY = A.GETPROPPROP(POINTER) returns property number of POINTER of A.
			%  PROPERTY = Element.GETPROPPROP(AnalyzeGroup_ST_MP_WU, POINTER) returns property number of POINTER of AnalyzeGroup_ST_MP_WU.
			%  PROPERTY = A.GETPROPPROP(AnalyzeGroup_ST_MP_WU, POINTER) returns property number of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPPROP(A) and Element.GETPROPPROP('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				analyzegroup_st_mp_wu_tag_list = cellfun(@(x) AnalyzeGroup_ST_MP_WU.getPropTag(x), num2cell(AnalyzeGroup_ST_MP_WU.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, analyzegroup_st_mp_wu_tag_list)); % tag = pointer
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
			%  TAG = A.GETPROPTAG(POINTER) returns tag of POINTER of A.
			%  TAG = Element.GETPROPTAG(AnalyzeGroup_ST_MP_WU, POINTER) returns tag of POINTER of AnalyzeGroup_ST_MP_WU.
			%  TAG = A.GETPROPTAG(AnalyzeGroup_ST_MP_WU, POINTER) returns tag of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPTAG(A) and Element.GETPROPTAG('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
						tag = AnalyzeGroup_ST_MP_WU.CORRELATION_RULE_TAG;
					case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
						tag = AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE_TAG;
					otherwise
						tag = getPropTag@AnalyzeGroup(prop);
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
			%  CATEGORY = A.GETPROPCATEGORY(POINTER) returns category of POINTER of A.
			%  CATEGORY = Element.GETPROPCATEGORY(AnalyzeGroup_ST_MP_WU, POINTER) returns category of POINTER of AnalyzeGroup_ST_MP_WU.
			%  CATEGORY = A.GETPROPCATEGORY(AnalyzeGroup_ST_MP_WU, POINTER) returns category of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPCATEGORY(A) and Element.GETPROPCATEGORY('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
					prop_category = AnalyzeGroup_ST_MP_WU.CORRELATION_RULE_CATEGORY;
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
					prop_category = AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE_CATEGORY;
				otherwise
					prop_category = getPropCategory@AnalyzeGroup(prop);
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
			%  FORMAT = A.GETPROPFORMAT(POINTER) returns format of POINTER of A.
			%  FORMAT = Element.GETPROPFORMAT(AnalyzeGroup_ST_MP_WU, POINTER) returns format of POINTER of AnalyzeGroup_ST_MP_WU.
			%  FORMAT = A.GETPROPFORMAT(AnalyzeGroup_ST_MP_WU, POINTER) returns format of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPFORMAT(A) and Element.GETPROPFORMAT('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
					prop_format = AnalyzeGroup_ST_MP_WU.CORRELATION_RULE_FORMAT;
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
					prop_format = AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE_FORMAT;
				otherwise
					prop_format = getPropFormat@AnalyzeGroup(prop);
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
			%  DESCRIPTION = A.GETPROPDESCRIPTION(POINTER) returns description of POINTER of A.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(AnalyzeGroup_ST_MP_WU, POINTER) returns description of POINTER of AnalyzeGroup_ST_MP_WU.
			%  DESCRIPTION = A.GETPROPDESCRIPTION(AnalyzeGroup_ST_MP_WU, POINTER) returns description of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPDESCRIPTION(A) and Element.GETPROPDESCRIPTION('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
					prop_description = 'CORRELATION_RULE (parameter, option) is the correlation type.';
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
					prop_description = 'NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights.';
				case AnalyzeGroup_ST_MP_WU.NAME
					prop_description = 'NAME (constant, string) is the name of the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.ID
					prop_description = 'ID (data, string) is a few-letter code for the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the graph analysis with structural multiplex data.';
				case AnalyzeGroup_ST_MP_WU.GR
					prop_description = 'GR (data, item) is the subject group, which also defines the subject class SubjectST_MP.';
				case AnalyzeGroup_ST_MP_WU.G
					prop_description = 'G (result, item) is the graph obtained from this analysis.';
				otherwise
					prop_description = getPropDescription@AnalyzeGroup(prop);
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
			%  SETTINGS = A.GETPROPSETTINGS(POINTER) returns settings of POINTER of A.
			%  SETTINGS = Element.GETPROPSETTINGS(AnalyzeGroup_ST_MP_WU, POINTER) returns settings of POINTER of AnalyzeGroup_ST_MP_WU.
			%  SETTINGS = A.GETPROPSETTINGS(AnalyzeGroup_ST_MP_WU, POINTER) returns settings of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPSETTINGS(A) and Element.GETPROPSETTINGS('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
					prop_settings = Correlation.CORRELATION_RULE_LIST;
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
					prop_settings = Correlation.NEGATIVE_WEIGHT_RULE_LIST;
				case AnalyzeGroup_ST_MP_WU.TEMPLATE
					prop_settings = 'AnalyzeGroup_ST_MP_WU';
				case AnalyzeGroup_ST_MP_WU.G
					prop_settings = 'MultiplexWU';
				otherwise
					prop_settings = getPropSettings@AnalyzeGroup(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = AnalyzeGroup_ST_MP_WU.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = AnalyzeGroup_ST_MP_WU.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = A.GETPROPDEFAULT(POINTER) returns the default value of POINTER of A.
			%  DEFAULT = Element.GETPROPDEFAULT(AnalyzeGroup_ST_MP_WU, POINTER) returns the default value of POINTER of AnalyzeGroup_ST_MP_WU.
			%  DEFAULT = A.GETPROPDEFAULT(AnalyzeGroup_ST_MP_WU, POINTER) returns the default value of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPDEFAULT(A) and Element.GETPROPDEFAULT('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE
					prop_default = Correlation.PEARSON;
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE
					prop_default = Correlation.ZERO;
				case AnalyzeGroup_ST_MP_WU.NAME
					prop_default = 'AnalyzeGroup_ST_MP_WU';
				case AnalyzeGroup_ST_MP_WU.DESCRIPTION
					prop_default = 'This graph analysis uses structural multiplex data and analyzes them using weighted undirected multiplexes, binary undirected multiplexes with fixed thresholds, or binary undirected multiplexes with fixed densities.';
				case AnalyzeGroup_ST_MP_WU.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, AnalyzeGroup_ST_MP_WU.getPropSettings(prop));
				case AnalyzeGroup_ST_MP_WU.ID
					prop_default = 'AnalyzeGroup_ST_MP_WU ID';
				case AnalyzeGroup_ST_MP_WU.LABEL
					prop_default = 'AnalyzeGroup_ST_MP_WU label';
				case AnalyzeGroup_ST_MP_WU.NOTES
					prop_default = 'AnalyzeGroup_ST_MP_WU notes';
				case AnalyzeGroup_ST_MP_WU.GR
					prop_default = Group('SUB_CLASS', 'SubjectST_MP');
				case AnalyzeGroup_ST_MP_WU.G
					prop_default = MultiplexWU();
				otherwise
					prop_default = getPropDefault@AnalyzeGroup(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = AnalyzeGroup_ST_MP_WU.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = AnalyzeGroup_ST_MP_WU.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = A.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of A.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(AnalyzeGroup_ST_MP_WU, POINTER) returns the conditioned default value of POINTER of AnalyzeGroup_ST_MP_WU.
			%  DEFAULT = A.GETPROPDEFAULTCONDITIONED(AnalyzeGroup_ST_MP_WU, POINTER) returns the conditioned default value of POINTER of AnalyzeGroup_ST_MP_WU.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(A) and Element.GETPROPDEFAULTCONDITIONED('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			prop_default = AnalyzeGroup_ST_MP_WU.conditioning(prop, AnalyzeGroup_ST_MP_WU.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = A.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = A.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of A.
			%  CHECK = Element.CHECKPROP(AnalyzeGroup_ST_MP_WU, PROP, VALUE) checks VALUE format for PROP of AnalyzeGroup_ST_MP_WU.
			%  CHECK = A.CHECKPROP(AnalyzeGroup_ST_MP_WU, PROP, VALUE) checks VALUE format for PROP of AnalyzeGroup_ST_MP_WU.
			% 
			% A.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:AnalyzeGroup_ST_MP_WU:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  A.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of A.
			%   Error id: €BRAPH2.STR€:AnalyzeGroup_ST_MP_WU:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(AnalyzeGroup_ST_MP_WU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AnalyzeGroup_ST_MP_WU.
			%   Error id: €BRAPH2.STR€:AnalyzeGroup_ST_MP_WU:€BRAPH2.WRONG_INPUT€
			%  A.CHECKPROP(AnalyzeGroup_ST_MP_WU, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AnalyzeGroup_ST_MP_WU.
			%   Error id: €BRAPH2.STR€:AnalyzeGroup_ST_MP_WU:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(A) and Element.CHECKPROP('AnalyzeGroup_ST_MP_WU')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = AnalyzeGroup_ST_MP_WU.getPropProp(pointer);
			
			switch prop
				case AnalyzeGroup_ST_MP_WU.CORRELATION_RULE % __AnalyzeGroup_ST_MP_WU.CORRELATION_RULE__
					check = Format.checkFormat(Format.OPTION, value, AnalyzeGroup_ST_MP_WU.getPropSettings(prop));
				case AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE % __AnalyzeGroup_ST_MP_WU.NEGATIVE_WEIGHT_RULE__
					check = Format.checkFormat(Format.OPTION, value, AnalyzeGroup_ST_MP_WU.getPropSettings(prop));
				case AnalyzeGroup_ST_MP_WU.TEMPLATE % __AnalyzeGroup_ST_MP_WU.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, AnalyzeGroup_ST_MP_WU.getPropSettings(prop));
				case AnalyzeGroup_ST_MP_WU.G % __AnalyzeGroup_ST_MP_WU.G__
					check = Format.checkFormat(Format.ITEM, value, AnalyzeGroup_ST_MP_WU.getPropSettings(prop));
				otherwise
					if prop <= AnalyzeGroup.getPropNumber()
						check = checkProp@AnalyzeGroup(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AnalyzeGroup_ST_MP_WU:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' AnalyzeGroup_ST_MP_WU.getPropTag(prop) ' (' AnalyzeGroup_ST_MP_WU.getFormatTag(AnalyzeGroup_ST_MP_WU.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(a, prop, varargin)
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
				case AnalyzeGroup_ST_MP_WU.G % __AnalyzeGroup_ST_MP_WU.G__
					rng_settings_ = rng(); rng(a.getPropSeed(AnalyzeGroup_ST_MP_WU.G), 'twister')
					
					gr = a.get('GR');
					data_list = cellfun(@(x) x.get('ST_MP'), gr.get('SUB_DICT').get('IT_LIST'), 'UniformOutput', false);
					
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
					        if any(strcmp(a.get('CORRELATION_RULE'), {Correlation.PEARSON_CV, Correlation.SPEARMAN_CV}))
					            A(i) = {Correlation.getAdjacencyMatrix(data{i}, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'), gr.get('COVARIATES'))};
					        else
					            A(i) = {Correlation.getAdjacencyMatrix(data{i}, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'))};
					        end
					    end
					end
					
					L = length(A);
					g = MultiplexWU( ...
					    'ID', ['Graph ' gr.get('ID')], ...
					    'B', A, ... % % % 'LAYERTICKS', [1:1:L], ... 
					    'LAYERLABELS', cellfun(@(x) ['L' num2str(x)], num2cell([1:1:L]), 'UniformOutput', false) ...
					    );
					
					if ~isa(a.getr('TEMPLATE'), 'NoValue') % the analysis has a template
					    g.set('TEMPLATE', a.get('TEMPLATE').memorize('G')) % the template is memorized
					end
					
					if a.get('GR').get('SUB_DICT').get('LENGTH')
					    g.set('NODELABELS', a.get('GR').get('SUB_DICT').get('IT', 1).get('BA').get('BR_DICT').get('KEYS'))
					end
					
					value = g;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= AnalyzeGroup.getPropNumber()
						value = calculateValue@AnalyzeGroup(a, prop, varargin{:});
					else
						value = calculateValue@Element(a, prop, varargin{:});
					end
			end
			
		end
	end
end
