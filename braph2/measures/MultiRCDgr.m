classdef MultiRCDgr < RichClubDgr
	%MultiRCDgr is the graph multiplex rich-club degree.
	% It is a subclass of <a href="matlab:help RichClubDgr">RichClubDgr</a>.
	%
	% The multi rich-club degree of a node at level k is the sum of 
	%  the edges that connect nodes of degree k or higher in all layers. 
	% The relevance of each layer is controlled by the coefficients c that are 
	%  between 0 and 1; the default coefficients are (1/layernumber).
	%
	% MultiRCDgr methods (constructor):
	%  MultiRCDgr - constructor
	%
	% MultiRCDgr methods:
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
	% MultiRCDgr methods (display):
	%  tostring - string with information about the multi rich-club degree
	%  disp - displays information about the multi rich-club degree
	%  tree - displays the tree of the multi rich-club degree
	%
	% MultiRCDgr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two multi rich-club degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the multi rich-club degree
	%
	% MultiRCDgr methods (save/load, Static):
	%  save - saves BRAPH2 multi rich-club degree as b2 file
	%  load - loads a BRAPH2 multi rich-club degree from a b2 file
	%
	% MultiRCDgr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the multi rich-club degree
	%
	% MultiRCDgr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the multi rich-club degree
	%
	% MultiRCDgr methods (inspection, Static):
	%  getClass - returns the class of the multi rich-club degree
	%  getSubclasses - returns all subclasses of MultiRCDgr
	%  getProps - returns the property list of the multi rich-club degree
	%  getPropNumber - returns the property number of the multi rich-club degree
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
	% MultiRCDgr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiRCDgr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiRCDgr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiRCDgr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiRCDgr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiRCDgr constants</a>.
	%
	
	properties (Constant) % properties
		MULTIRICHCLUB_COEFFICIENTS = RichClubDgr.getPropNumber() + 1;
		MULTIRICHCLUB_COEFFICIENTS_TAG = 'MULTIRICHCLUB_COEFFICIENTS';
		MULTIRICHCLUB_COEFFICIENTS_CATEGORY = Category.PARAMETER;
		MULTIRICHCLUB_COEFFICIENTS_FORMAT = Format.RVECTOR;
	end
	methods % constructor
		function m = MultiRCDgr(varargin)
			%MultiRCDgr() creates a multi rich-club degree.
			%
			% MultiRCDgr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiRCDgr(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@RichClubDgr(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the multi rich-club degree.
			%
			% CLASS = MultiRCDgr.GETCLASS() returns the class 'MultiRCDgr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the multi rich-club degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiRCDgr') returns 'MultiRCDgr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiRCDgr')
			%  are less computationally efficient.
			
			m_class = 'MultiRCDgr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the multi rich-club degree.
			%
			% LIST = MultiRCDgr.GETSUBCLASSES() returns all subclasses of 'MultiRCDgr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the multi rich-club degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiRCDgr') returns all subclasses of 'MultiRCDgr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiRCDgr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of multi rich-club degree.
			%
			% PROPS = MultiRCDgr.GETPROPS() returns the property list of multi rich-club degree
			%  as a row vector.
			%
			% PROPS = MultiRCDgr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the multi rich-club degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiRCDgr'[, CATEGORY]) returns the property list of 'MultiRCDgr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					RichClubDgr.getProps() ...
						MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						RichClubDgr.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						RichClubDgr.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						RichClubDgr.getProps(Category.PARAMETER) ...
						MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS ...
						];
				case Category.DATA
					prop_list = [ ...
						RichClubDgr.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						RichClubDgr.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						RichClubDgr.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						RichClubDgr.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						RichClubDgr.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						RichClubDgr.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of multi rich-club degree.
			%
			% N = MultiRCDgr.GETPROPNUMBER() returns the property number of multi rich-club degree.
			%
			% N = MultiRCDgr.GETPROPNUMBER(CATEGORY) returns the property number of multi rich-club degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the multi rich-club degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiRCDgr') returns the property number of 'MultiRCDgr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiRCDgr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in multi rich-club degree/error.
			%
			% CHECK = MultiRCDgr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiRCDgr, PROP) checks whether PROP exists for MultiRCDgr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%  Element.EXISTSPROP(MultiRCDgr, PROP) throws error if PROP does NOT exist for MultiRCDgr.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiRCDgr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiRCDgr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in multi rich-club degree/error.
			%
			% CHECK = MultiRCDgr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiRCDgr, TAG) checks whether TAG exists for MultiRCDgr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%  Element.EXISTSTAG(MultiRCDgr, TAG) throws error if TAG does NOT exist for MultiRCDgr.
			%   Error id: [BRAPH2:MultiRCDgr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multircdgr_tag_list = cellfun(@(x) MultiRCDgr.getPropTag(x), num2cell(MultiRCDgr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multircdgr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiRCDgr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiRCDgr, POINTER) returns property number of POINTER of MultiRCDgr.
			%  PROPERTY = M.GETPROPPROP(MultiRCDgr, POINTER) returns property number of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multircdgr_tag_list = cellfun(@(x) MultiRCDgr.getPropTag(x), num2cell(MultiRCDgr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multircdgr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiRCDgr, POINTER) returns tag of POINTER of MultiRCDgr.
			%  TAG = M.GETPROPTAG(MultiRCDgr, POINTER) returns tag of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
						tag = MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS_TAG;
					otherwise
						tag = getPropTag@RichClubDgr(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiRCDgr, POINTER) returns category of POINTER of MultiRCDgr.
			%  CATEGORY = M.GETPROPCATEGORY(MultiRCDgr, POINTER) returns category of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
					prop_category = MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS_CATEGORY;
				otherwise
					prop_category = getPropCategory@RichClubDgr(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(MultiRCDgr, POINTER) returns format of POINTER of MultiRCDgr.
			%  FORMAT = M.GETPROPFORMAT(MultiRCDgr, POINTER) returns format of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
					prop_format = MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS_FORMAT;
				otherwise
					prop_format = getPropFormat@RichClubDgr(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiRCDgr, POINTER) returns description of POINTER of MultiRCDgr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiRCDgr, POINTER) returns description of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
					prop_description = 'MULTIRICHCLUB_COEFFICIENTS (parameter, RVECTOR) is the multi rich-club degree coefficients';
				case MultiRCDgr.NAME
					prop_description = 'NAME (constant, string) is the name of the multiplex rich-club degree.';
				case MultiRCDgr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the multiplex rich-club degree.';
				case MultiRCDgr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the multiplex rich-club degree.';
				case MultiRCDgr.ID
					prop_description = 'ID (data, string) is a few-letter code of the multiplex rich-club degree.';
				case MultiRCDgr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the multiplex rich-club degree.';
				case MultiRCDgr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the multiplex rich-club degree.';
				case MultiRCDgr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiRCDgr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiRCDgr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiRCDgr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiRCDgr.M
					prop_description = 'M (result, cell) is the multiplex rich-club degree.';
				otherwise
					prop_description = getPropDescription@RichClubDgr(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiRCDgr, POINTER) returns settings of POINTER of MultiRCDgr.
			%  SETTINGS = M.GETPROPSETTINGS(MultiRCDgr, POINTER) returns settings of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
					prop_settings = Format.getFormatSettings(Format.RVECTOR);
				case MultiRCDgr.TEMPLATE
					prop_settings = 'MultiRCDgr';
				otherwise
					prop_settings = getPropSettings@RichClubDgr(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiRCDgr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiRCDgr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiRCDgr, POINTER) returns the default value of POINTER of MultiRCDgr.
			%  DEFAULT = M.GETPROPDEFAULT(MultiRCDgr, POINTER) returns the default value of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS
					prop_default = [0];
				case MultiRCDgr.NAME
					prop_default = 'MultiRCDgr';
				case MultiRCDgr.DESCRIPTION
					prop_default = 'The multi rich-club degree of a node at level k is the sum of the edges that connect nodes of degree k or higher in all layers. The relevance of each layer is controlled by the coefficients c that are between 0 and 1; the default coefficients are (1/layernumber).';
				case MultiRCDgr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiRCDgr.getPropSettings(prop));
				case MultiRCDgr.ID
					prop_default = 'MultiRCDgr ID';
				case MultiRCDgr.LABEL
					prop_default = 'MultiRCDgr label';
				case MultiRCDgr.NOTES
					prop_default = 'MultiRCDgr notes';
				case MultiRCDgr.SHAPE
					prop_default = Measure.NODAL;
				case MultiRCDgr.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiRCDgr.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiRCDgr.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@RichClubDgr(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiRCDgr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiRCDgr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiRCDgr, POINTER) returns the conditioned default value of POINTER of MultiRCDgr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiRCDgr, POINTER) returns the conditioned default value of POINTER of MultiRCDgr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			prop_default = MultiRCDgr.conditioning(prop, MultiRCDgr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiRCDgr, PROP, VALUE) checks VALUE format for PROP of MultiRCDgr.
			%  CHECK = M.CHECKPROP(MultiRCDgr, PROP, VALUE) checks VALUE format for PROP of MultiRCDgr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiRCDgr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiRCDgr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiRCDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiRCDgr.
			%   Error id: €BRAPH2.STR€:MultiRCDgr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiRCDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiRCDgr.
			%   Error id: €BRAPH2.STR€:MultiRCDgr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiRCDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiRCDgr.getPropProp(pointer);
			
			switch prop
				case MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS % __MultiRCDgr.MULTIRICHCLUB_COEFFICIENTS__
					check = Format.checkFormat(Format.RVECTOR, value, MultiRCDgr.getPropSettings(prop));
				case MultiRCDgr.TEMPLATE % __MultiRCDgr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiRCDgr.getPropSettings(prop));
				otherwise
					if prop <= RichClubDgr.getPropNumber()
						check = checkProp@RichClubDgr(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiRCDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiRCDgr.getPropTag(prop) ' (' MultiRCDgr.getFormatTag(MultiRCDgr.getPropFormat(prop)) ').'] ...
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
				case MultiRCDgr.M % __MultiRCDgr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiRCDgr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					rich_club_degree = calculateValue@RichClubDgr(m, prop);
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    richclub_threshold = m.get('PARAMETRIC_VALUE'); % klevel
					
					    multirichclub_coefficients = m.get('MULTIRICHCLUB_COEFFICIENTS');
					    if length(multirichclub_coefficients) == ls(1)
					        assert(all(multirichclub_coefficients <= 1) && all(multirichclub_coefficients >= 0), ...
					            [BRAPH2.STR ':MultiRichClubDegree:' BRAPH2.WRONG_INPUT], ...
					            ['MultiRichClubDegree coefficients must be between 0 and 1 ' ...
					            'while they are ' tostring(multirichclub_coefficients)])
					        c = multirichclub_coefficients;
					
					    else  % same relevance for each layer
					        c = ones(1, l)/ls(1);
					    end
					
					    multi_rich_club_degree = cell(length(ls), 1);
					    count = 1;
					    for i = 1:1:length(ls)
					        multi_rich_club_degree_partition = zeros(N(1), 1, richclub_threshold);
					        for li = count:1:ls(i) + count - 1
					            ri = rich_club_degree{li};  % to fix when making this measure also parametric
					            % loop over the 3rd dimension of rich club degree (k_level)
					            for k = 1:1:richclub_threshold
					                multi_rich_club_degree_partition(:, :, k) = multi_rich_club_degree_partition(:, :, k) + c(li)*ri(:, :, k);
					            end
					        end
					        count = count + ls(i);
					        multi_rich_club_degree(i) = {multi_rich_club_degree_partition};
					    end
					    value = multi_rich_club_degree;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= RichClubDgr.getPropNumber()
						value = calculateValue@RichClubDgr(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
