classdef OverlappingDgrAv < OverlappingDgr
	%OverlappingDgrAv is the graph averge overlapping degree.
	% It is a subclass of <a href="matlab:help OverlappingDgr">OverlappingDgr</a>.
	%
	% The average overlapping degree of a graph is the average of the sum of the 
	% degrees of a node in all layers.
	%
	% OverlappingDgrAv methods (constructor):
	%  OverlappingDgrAv - constructor
	%
	% OverlappingDgrAv methods:
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
	% OverlappingDgrAv methods (display):
	%  tostring - string with information about the averge overlapping-degree
	%  disp - displays information about the averge overlapping-degree
	%  tree - displays the tree of the averge overlapping-degree
	%
	% OverlappingDgrAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two averge overlapping-degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the averge overlapping-degree
	%
	% OverlappingDgrAv methods (save/load, Static):
	%  save - saves BRAPH2 averge overlapping-degree as b2 file
	%  load - loads a BRAPH2 averge overlapping-degree from a b2 file
	%
	% OverlappingDgrAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the averge overlapping-degree
	%
	% OverlappingDgrAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the averge overlapping-degree
	%
	% OverlappingDgrAv methods (inspection, Static):
	%  getClass - returns the class of the averge overlapping-degree
	%  getSubclasses - returns all subclasses of OverlappingDgrAv
	%  getProps - returns the property list of the averge overlapping-degree
	%  getPropNumber - returns the property number of the averge overlapping-degree
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
	% OverlappingDgrAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingDgrAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingDgrAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingDgrAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingDgrAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingDgrAv constants</a>.
	%
	
	methods % constructor
		function m = OverlappingDgrAv(varargin)
			%OverlappingDgrAv() creates a averge overlapping-degree.
			%
			% OverlappingDgrAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingDgrAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@OverlappingDgr(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the averge overlapping-degree.
			%
			% CLASS = OverlappingDgrAv.GETCLASS() returns the class 'OverlappingDgrAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the averge overlapping-degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingDgrAv') returns 'OverlappingDgrAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingDgrAv')
			%  are less computationally efficient.
			
			m_class = 'OverlappingDgrAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the averge overlapping-degree.
			%
			% LIST = OverlappingDgrAv.GETSUBCLASSES() returns all subclasses of 'OverlappingDgrAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the averge overlapping-degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingDgrAv') returns all subclasses of 'OverlappingDgrAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingDgrAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of averge overlapping-degree.
			%
			% PROPS = OverlappingDgrAv.GETPROPS() returns the property list of averge overlapping-degree
			%  as a row vector.
			%
			% PROPS = OverlappingDgrAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the averge overlapping-degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingDgrAv'[, CATEGORY]) returns the property list of 'OverlappingDgrAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					OverlappingDgr.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						OverlappingDgr.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						OverlappingDgr.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						OverlappingDgr.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						OverlappingDgr.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						OverlappingDgr.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						OverlappingDgr.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						OverlappingDgr.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						OverlappingDgr.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						OverlappingDgr.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of averge overlapping-degree.
			%
			% N = OverlappingDgrAv.GETPROPNUMBER() returns the property number of averge overlapping-degree.
			%
			% N = OverlappingDgrAv.GETPROPNUMBER(CATEGORY) returns the property number of averge overlapping-degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the averge overlapping-degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingDgrAv') returns the property number of 'OverlappingDgrAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingDgrAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in averge overlapping-degree/error.
			%
			% CHECK = OverlappingDgrAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingDgrAv, PROP) checks whether PROP exists for OverlappingDgrAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%  Element.EXISTSPROP(OverlappingDgrAv, PROP) throws error if PROP does NOT exist for OverlappingDgrAv.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingDgrAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingDgrAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in averge overlapping-degree/error.
			%
			% CHECK = OverlappingDgrAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingDgrAv, TAG) checks whether TAG exists for OverlappingDgrAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%  Element.EXISTSTAG(OverlappingDgrAv, TAG) throws error if TAG does NOT exist for OverlappingDgrAv.
			%   Error id: [BRAPH2:OverlappingDgrAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingdgrav_tag_list = cellfun(@(x) OverlappingDgrAv.getPropTag(x), num2cell(OverlappingDgrAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingdgrav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingDgrAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingDgrAv, POINTER) returns property number of POINTER of OverlappingDgrAv.
			%  PROPERTY = M.GETPROPPROP(OverlappingDgrAv, POINTER) returns property number of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingdgrav_tag_list = cellfun(@(x) OverlappingDgrAv.getPropTag(x), num2cell(OverlappingDgrAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingdgrav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingDgrAv, POINTER) returns tag of POINTER of OverlappingDgrAv.
			%  TAG = M.GETPROPTAG(OverlappingDgrAv, POINTER) returns tag of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					otherwise
						tag = getPropTag@OverlappingDgr(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingDgrAv, POINTER) returns category of POINTER of OverlappingDgrAv.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingDgrAv, POINTER) returns category of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@OverlappingDgr(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingDgrAv, POINTER) returns format of POINTER of OverlappingDgrAv.
			%  FORMAT = M.GETPROPFORMAT(OverlappingDgrAv, POINTER) returns format of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@OverlappingDgr(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingDgrAv, POINTER) returns description of POINTER of OverlappingDgrAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingDgrAv, POINTER) returns description of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrAv.NAME
					prop_description = 'NAME (constant, string) is the name of the averge overlapping degree.';
				case OverlappingDgrAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the averge overlapping degree.';
				case OverlappingDgrAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the averge overlapping degree.';
				case OverlappingDgrAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the averge overlapping degree.';
				case OverlappingDgrAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the averge overlapping degree.';
				case OverlappingDgrAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the averge overlapping degree.';
				case OverlappingDgrAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingDgrAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingDgrAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingDgrAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingDgrAv.M
					prop_description = 'M (result, cell) is the averge overlapping degree.';
				otherwise
					prop_description = getPropDescription@OverlappingDgr(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingDgrAv, POINTER) returns settings of POINTER of OverlappingDgrAv.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingDgrAv, POINTER) returns settings of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrAv.TEMPLATE
					prop_settings = 'OverlappingDgrAv';
				otherwise
					prop_settings = getPropSettings@OverlappingDgr(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingDgrAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingDgrAv, POINTER) returns the default value of POINTER of OverlappingDgrAv.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingDgrAv, POINTER) returns the default value of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrAv.NAME
					prop_default = 'OverlappingDgrAv';
				case OverlappingDgrAv.DESCRIPTION
					prop_default = 'The averge overlapping degree of a graph is the sum of the degrees of a node in all layers.';
				case OverlappingDgrAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingDgrAv.getPropSettings(prop));
				case OverlappingDgrAv.ID
					prop_default = 'OverlappingDgrAv ID';
				case OverlappingDgrAv.LABEL
					prop_default = 'OverlappingDgrAv label';
				case OverlappingDgrAv.NOTES
					prop_default = 'OverlappingDgrAv notes';
				case OverlappingDgrAv.SHAPE
					prop_default = Measure.GLOBAL;
				case OverlappingDgrAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingDgrAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingDgrAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@OverlappingDgr(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingDgrAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingDgrAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingDgrAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			prop_default = OverlappingDgrAv.conditioning(prop, OverlappingDgrAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingDgrAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrAv.
			%  CHECK = M.CHECKPROP(OverlappingDgrAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingDgrAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingDgrAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingDgrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingDgrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingDgrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingDgrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrAv.TEMPLATE % __OverlappingDgrAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingDgrAv.getPropSettings(prop));
				otherwise
					if prop <= OverlappingDgr.getPropNumber()
						check = checkProp@OverlappingDgr(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingDgrAv.getPropTag(prop) ' (' OverlappingDgrAv.getFormatTag(OverlappingDgrAv.getPropFormat(prop)) ').'] ...
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
				case OverlappingDgrAv.M % __OverlappingDgrAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingDgrAv.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    overlapping_degree = calculateValue@OverlappingDgr(m, prop);
					    overlapping_degree_av = cell(length(ls), 1);
					
					    for i=1:length(ls)
					        overlapping_degree_av(i) = {mean(overlapping_degree{i})};
					    end
					    value = overlapping_degree_av;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= OverlappingDgr.getPropNumber()
						value = calculateValue@OverlappingDgr(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
