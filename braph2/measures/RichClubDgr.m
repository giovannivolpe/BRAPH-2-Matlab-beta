classdef RichClubDgr < Degree
	%RichClubDgr is the graph richclubdegree.
	% It is a subclass of <a href="matlab:help Degree">Degree</a>.
	%
	% The rich-club degree of a node at level k is the sum of 
	%  the edges that connect nodes of degree k or higher within a layer. 
	%  k is set by the user; the default value is equal to 1.
	%
	% RichClubDgr methods (constructor):
	%  RichClubDgr - constructor
	%
	% RichClubDgr methods:
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
	% RichClubDgr methods (display):
	%  tostring - string with information about the rich-club degree
	%  disp - displays information about the rich-club degree
	%  tree - displays the tree of the rich-club degree
	%
	% RichClubDgr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two rich-club degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the rich-club degree
	%
	% RichClubDgr methods (save/load, Static):
	%  save - saves BRAPH2 rich-club degree as b2 file
	%  load - loads a BRAPH2 rich-club degree from a b2 file
	%
	% RichClubDgr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the rich-club degree
	%
	% RichClubDgr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the rich-club degree
	%
	% RichClubDgr methods (inspection, Static):
	%  getClass - returns the class of the rich-club degree
	%  getSubclasses - returns all subclasses of RichClubDgr
	%  getProps - returns the property list of the rich-club degree
	%  getPropNumber - returns the property number of the rich-club degree
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
	% RichClubDgr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% RichClubDgr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% RichClubDgr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% RichClubDgr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?RichClubDgr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">RichClubDgr constants</a>.
	%
	
	properties (Constant) % properties
		PARAMETRIC_VALUE = Degree.getPropNumber() + 1;
		PARAMETRIC_VALUE_TAG = 'PARAMETRIC_VALUE';
		PARAMETRIC_VALUE_CATEGORY = Category.PARAMETER;
		PARAMETRIC_VALUE_FORMAT = Format.SCALAR;
	end
	methods % constructor
		function m = RichClubDgr(varargin)
			%RichClubDgr() creates a rich-club degree.
			%
			% RichClubDgr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% RichClubDgr(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Degree(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the rich-club degree.
			%
			% CLASS = RichClubDgr.GETCLASS() returns the class 'RichClubDgr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the rich-club degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('RichClubDgr') returns 'RichClubDgr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('RichClubDgr')
			%  are less computationally efficient.
			
			m_class = 'RichClubDgr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the rich-club degree.
			%
			% LIST = RichClubDgr.GETSUBCLASSES() returns all subclasses of 'RichClubDgr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the rich-club degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('RichClubDgr') returns all subclasses of 'RichClubDgr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('RichClubDgr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of rich-club degree.
			%
			% PROPS = RichClubDgr.GETPROPS() returns the property list of rich-club degree
			%  as a row vector.
			%
			% PROPS = RichClubDgr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the rich-club degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('RichClubDgr'[, CATEGORY]) returns the property list of 'RichClubDgr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Degree.getProps() ...
						RichClubDgr.PARAMETRIC_VALUE ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Degree.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Degree.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Degree.getProps(Category.PARAMETER) ...
						RichClubDgr.PARAMETRIC_VALUE ...
						];
				case Category.DATA
					prop_list = [ ...
						Degree.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Degree.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Degree.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Degree.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Degree.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Degree.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of rich-club degree.
			%
			% N = RichClubDgr.GETPROPNUMBER() returns the property number of rich-club degree.
			%
			% N = RichClubDgr.GETPROPNUMBER(CATEGORY) returns the property number of rich-club degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the rich-club degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('RichClubDgr') returns the property number of 'RichClubDgr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(RichClubDgr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in rich-club degree/error.
			%
			% CHECK = RichClubDgr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(RichClubDgr, PROP) checks whether PROP exists for RichClubDgr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:RichClubDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%  Element.EXISTSPROP(RichClubDgr, PROP) throws error if PROP does NOT exist for RichClubDgr.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == RichClubDgr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for RichClubDgr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in rich-club degree/error.
			%
			% CHECK = RichClubDgr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(RichClubDgr, TAG) checks whether TAG exists for RichClubDgr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:RichClubDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%  Element.EXISTSTAG(RichClubDgr, TAG) throws error if TAG does NOT exist for RichClubDgr.
			%   Error id: [BRAPH2:RichClubDgr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			richclubdgr_tag_list = cellfun(@(x) RichClubDgr.getPropTag(x), num2cell(RichClubDgr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, richclubdgr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for RichClubDgr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(RichClubDgr, POINTER) returns property number of POINTER of RichClubDgr.
			%  PROPERTY = M.GETPROPPROP(RichClubDgr, POINTER) returns property number of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				richclubdgr_tag_list = cellfun(@(x) RichClubDgr.getPropTag(x), num2cell(RichClubDgr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, richclubdgr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(RichClubDgr, POINTER) returns tag of POINTER of RichClubDgr.
			%  TAG = M.GETPROPTAG(RichClubDgr, POINTER) returns tag of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case RichClubDgr.PARAMETRIC_VALUE
						tag = RichClubDgr.PARAMETRIC_VALUE_TAG;
					otherwise
						tag = getPropTag@Degree(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(RichClubDgr, POINTER) returns category of POINTER of RichClubDgr.
			%  CATEGORY = M.GETPROPCATEGORY(RichClubDgr, POINTER) returns category of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE
					prop_category = RichClubDgr.PARAMETRIC_VALUE_CATEGORY;
				otherwise
					prop_category = getPropCategory@Degree(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(RichClubDgr, POINTER) returns format of POINTER of RichClubDgr.
			%  FORMAT = M.GETPROPFORMAT(RichClubDgr, POINTER) returns format of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE
					prop_format = RichClubDgr.PARAMETRIC_VALUE_FORMAT;
				otherwise
					prop_format = getPropFormat@Degree(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(RichClubDgr, POINTER) returns description of POINTER of RichClubDgr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(RichClubDgr, POINTER) returns description of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE
					prop_description = 'PARAMETRIC_VALUE (parameter, SCALAR) ';
				case RichClubDgr.NAME
					prop_description = 'NAME (constant, string) is the name of the richclubdegree.';
				case RichClubDgr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the richclubdegree.';
				case RichClubDgr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the richclubdegree.';
				case RichClubDgr.ID
					prop_description = 'ID (data, string) is a few-letter code of the richclubdegree.';
				case RichClubDgr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the richclubdegree.';
				case RichClubDgr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the richclubdegree.';
				case RichClubDgr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case RichClubDgr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case RichClubDgr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case RichClubDgr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case RichClubDgr.M
					prop_description = 'M (result, cell) is the richclubdegree.';
				otherwise
					prop_description = getPropDescription@Degree(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(RichClubDgr, POINTER) returns settings of POINTER of RichClubDgr.
			%  SETTINGS = M.GETPROPSETTINGS(RichClubDgr, POINTER) returns settings of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case RichClubDgr.TEMPLATE
					prop_settings = 'RichClubDgr';
				otherwise
					prop_settings = getPropSettings@Degree(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = RichClubDgr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = RichClubDgr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(RichClubDgr, POINTER) returns the default value of POINTER of RichClubDgr.
			%  DEFAULT = M.GETPROPDEFAULT(RichClubDgr, POINTER) returns the default value of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE
					prop_default = 1;
				case RichClubDgr.NAME
					prop_default = 'RichClubDgr';
				case RichClubDgr.DESCRIPTION
					prop_default = 'The rich-club degree of a node at level k is the sum of the edges that connect nodes of degree k or higher within a layer. k is set by the user; the default value is equal to 1.';
				case RichClubDgr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, RichClubDgr.getPropSettings(prop));
				case RichClubDgr.ID
					prop_default = 'RichClubDgr ID';
				case RichClubDgr.LABEL
					prop_default = 'RichClubDgr label';
				case RichClubDgr.NOTES
					prop_default = 'RichClubDgr notes';
				case RichClubDgr.SHAPE
					prop_default = Measure.NODAL;
				case RichClubDgr.SCOPE
					prop_default = Measure.UNILAYER;
				case RichClubDgr.PARAMETRICITY
					prop_default = Measure.PARAMETRIC;
				case RichClubDgr.COMPATIBLE_GRAPHS
					prop_default = {'GraphWU' 'GraphWD' 'GraphBU' 'GraphBD' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Degree(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = RichClubDgr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = RichClubDgr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(RichClubDgr, POINTER) returns the conditioned default value of POINTER of RichClubDgr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(RichClubDgr, POINTER) returns the conditioned default value of POINTER of RichClubDgr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			prop_default = RichClubDgr.conditioning(prop, RichClubDgr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(RichClubDgr, PROP, VALUE) checks VALUE format for PROP of RichClubDgr.
			%  CHECK = M.CHECKPROP(RichClubDgr, PROP, VALUE) checks VALUE format for PROP of RichClubDgr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:RichClubDgr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:RichClubDgr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(RichClubDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of RichClubDgr.
			%   Error id: €BRAPH2.STR€:RichClubDgr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(RichClubDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of RichClubDgr.
			%   Error id: €BRAPH2.STR€:RichClubDgr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('RichClubDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = RichClubDgr.getPropProp(pointer);
			
			switch prop
				case RichClubDgr.PARAMETRIC_VALUE % __RichClubDgr.PARAMETRIC_VALUE__
					check = Format.checkFormat(Format.SCALAR, value, RichClubDgr.getPropSettings(prop));
				case RichClubDgr.TEMPLATE % __RichClubDgr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, RichClubDgr.getPropSettings(prop));
				otherwise
					if prop <= Degree.getPropNumber()
						check = checkProp@Degree(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' RichClubDgr.getPropTag(prop) ' (' RichClubDgr.getFormatTag(RichClubDgr.getPropFormat(prop)) ').'] ...
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
				case RichClubDgr.M % __RichClubDgr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(RichClubDgr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					N = g.get('NODENUMBER');
					
					rich_club_degree = cell(L, 1); 
					directionality_type = g.get('DIRECTIONALITY_TYPE', L);
					richclub_threshold = m.get('PARAMETRIC_VALUE');
					assert(mod(richclub_threshold, 1) == 0, ...
					    [BRAPH2.STR ':RichClubDgr:' BRAPH2.WRONG_INPUT], ...
					    ['RichClubDgr threshold must be an integer value ' ...
					    'while it is ' tostring(richclub_threshold)])
					
					k_level = abs(richclub_threshold);
					for li = 1:1:L
					    
					    Aii = A{li, li};
					    directionality_layer = directionality_type(li, li);
					
					    if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					       
					        degree = calculateValue@Degree(m, prop); 
					        deg = degree{li};
					
					    else  % directed graphs
					      
					        in_degree = DegreeIn('G', g).get('M');        
					        out_degree = DegreeOut('G', g).get('M');       
					
					        deg = (in_degree{li} + out_degree{li})/2;
					    end
					
					    richclub_layer = zeros(N(1), 1, k_level);
					    for k = 1:1:k_level
					        low_rich_nodes = find(deg <= k);  % get lower rich nodes with degree <= k
					        Aii = binarize(Aii);  % binarizes the adjacency matrix
					        subAii = Aii;  % extract subnetwork of nodes >k by removing nodes <= k of Aii
					        subAii(low_rich_nodes, :) = 0;  % remove rows
					        subAii(:, low_rich_nodes) = 0;  % remove columns
					
					        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					            richclub_layer(:, :, k) = sum(subAii, 1)';  % degree of high rich nodes
					        else
					            richclub_layer(:, :, k) = (sum(subAii, 1)' + sum(subAii, 2))/2;  % degree of high rich nodes
					        end
					
					    end
					    rich_club_degree(li) = {richclub_layer};  % add rich club degree of layer li          
					end
					
					value = rich_club_degree;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Degree.getPropNumber()
						value = calculateValue@Degree(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
