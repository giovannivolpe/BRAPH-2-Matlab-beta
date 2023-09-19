classdef OverlappingDgrInAv < OverlappingDgrIn
	%OverlappingDgrInAv is the graph average overlapping in-degree.
	% It is a subclass of <a href="matlab:help OverlappingDgrIn">OverlappingDgrIn</a>.
	%
	% The average overlapping in-degree of a graph is the average of the sum of the 
	% in-degrees of a node in all layers.
	%
	% OverlappingDgrInAv methods (constructor):
	%  OverlappingDgrInAv - constructor
	%
	% OverlappingDgrInAv methods:
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
	% OverlappingDgrInAv methods (display):
	%  tostring - string with information about the average overlapping in-degree
	%  disp - displays information about the average overlapping in-degree
	%  tree - displays the tree of the average overlapping in-degree
	%
	% OverlappingDgrInAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average overlapping in-degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average overlapping in-degree
	%
	% OverlappingDgrInAv methods (save/load, Static):
	%  save - saves BRAPH2 average overlapping in-degree as b2 file
	%  load - loads a BRAPH2 average overlapping in-degree from a b2 file
	%
	% OverlappingDgrInAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average overlapping in-degree
	%
	% OverlappingDgrInAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average overlapping in-degree
	%
	% OverlappingDgrInAv methods (inspection, Static):
	%  getClass - returns the class of the average overlapping in-degree
	%  getSubclasses - returns all subclasses of OverlappingDgrInAv
	%  getProps - returns the property list of the average overlapping in-degree
	%  getPropNumber - returns the property number of the average overlapping in-degree
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
	% OverlappingDgrInAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingDgrInAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingDgrInAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingDgrInAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingDgrInAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingDgrInAv constants</a>.
	%
	
	methods % constructor
		function m = OverlappingDgrInAv(varargin)
			%OverlappingDgrInAv() creates a average overlapping in-degree.
			%
			% OverlappingDgrInAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingDgrInAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@OverlappingDgrIn(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average overlapping in-degree.
			%
			% CLASS = OverlappingDgrInAv.GETCLASS() returns the class 'OverlappingDgrInAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average overlapping in-degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingDgrInAv') returns 'OverlappingDgrInAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingDgrInAv')
			%  are less computationally efficient.
			
			m_class = 'OverlappingDgrInAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average overlapping in-degree.
			%
			% LIST = OverlappingDgrInAv.GETSUBCLASSES() returns all subclasses of 'OverlappingDgrInAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average overlapping in-degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingDgrInAv') returns all subclasses of 'OverlappingDgrInAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingDgrInAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average overlapping in-degree.
			%
			% PROPS = OverlappingDgrInAv.GETPROPS() returns the property list of average overlapping in-degree
			%  as a row vector.
			%
			% PROPS = OverlappingDgrInAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average overlapping in-degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingDgrInAv'[, CATEGORY]) returns the property list of 'OverlappingDgrInAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					OverlappingDgrIn.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						OverlappingDgrIn.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						OverlappingDgrIn.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average overlapping in-degree.
			%
			% N = OverlappingDgrInAv.GETPROPNUMBER() returns the property number of average overlapping in-degree.
			%
			% N = OverlappingDgrInAv.GETPROPNUMBER(CATEGORY) returns the property number of average overlapping in-degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average overlapping in-degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingDgrInAv') returns the property number of 'OverlappingDgrInAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingDgrInAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average overlapping in-degree/error.
			%
			% CHECK = OverlappingDgrInAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingDgrInAv, PROP) checks whether PROP exists for OverlappingDgrInAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%  Element.EXISTSPROP(OverlappingDgrInAv, PROP) throws error if PROP does NOT exist for OverlappingDgrInAv.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingDgrInAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingDgrInAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average overlapping in-degree/error.
			%
			% CHECK = OverlappingDgrInAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingDgrInAv, TAG) checks whether TAG exists for OverlappingDgrInAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%  Element.EXISTSTAG(OverlappingDgrInAv, TAG) throws error if TAG does NOT exist for OverlappingDgrInAv.
			%   Error id: [BRAPH2:OverlappingDgrInAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingdgrinav_tag_list = cellfun(@(x) OverlappingDgrInAv.getPropTag(x), num2cell(OverlappingDgrInAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingdgrinav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingDgrInAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingDgrInAv, POINTER) returns property number of POINTER of OverlappingDgrInAv.
			%  PROPERTY = M.GETPROPPROP(OverlappingDgrInAv, POINTER) returns property number of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingdgrinav_tag_list = cellfun(@(x) OverlappingDgrInAv.getPropTag(x), num2cell(OverlappingDgrInAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingdgrinav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingDgrInAv, POINTER) returns tag of POINTER of OverlappingDgrInAv.
			%  TAG = M.GETPROPTAG(OverlappingDgrInAv, POINTER) returns tag of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingDgrInAv')
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
						tag = getPropTag@OverlappingDgrIn(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingDgrInAv, POINTER) returns category of POINTER of OverlappingDgrInAv.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingDgrInAv, POINTER) returns category of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@OverlappingDgrIn(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingDgrInAv, POINTER) returns format of POINTER of OverlappingDgrInAv.
			%  FORMAT = M.GETPROPFORMAT(OverlappingDgrInAv, POINTER) returns format of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@OverlappingDgrIn(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingDgrInAv, POINTER) returns description of POINTER of OverlappingDgrInAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingDgrInAv, POINTER) returns description of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrInAv.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping in-degree.';
				case OverlappingDgrInAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping in-degree.';
				case OverlappingDgrInAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping in-degree.';
				case OverlappingDgrInAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping in-degree.';
				case OverlappingDgrInAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping in-degree.';
				case OverlappingDgrInAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping in-degree.';
				case OverlappingDgrInAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingDgrInAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingDgrInAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingDgrInAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingDgrInAv.M
					prop_description = 'M (result, cell) is the overlapping in-degree.';
				otherwise
					prop_description = getPropDescription@OverlappingDgrIn(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingDgrInAv, POINTER) returns settings of POINTER of OverlappingDgrInAv.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingDgrInAv, POINTER) returns settings of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrInAv.TEMPLATE
					prop_settings = 'OverlappingDgrInAv';
				otherwise
					prop_settings = getPropSettings@OverlappingDgrIn(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingDgrInAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrInAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingDgrInAv, POINTER) returns the default value of POINTER of OverlappingDgrInAv.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingDgrInAv, POINTER) returns the default value of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrInAv.NAME
					prop_default = 'OverlappingDgrInAv';
				case OverlappingDgrInAv.DESCRIPTION
					prop_default = 'The average overlapping in-degree of a graph is the average of the sum of the in-degrees of a node in all layers.';
				case OverlappingDgrInAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingDgrInAv.getPropSettings(prop));
				case OverlappingDgrInAv.ID
					prop_default = 'OverlappingDgrInAv ID';
				case OverlappingDgrInAv.LABEL
					prop_default = 'OverlappingDgrInAv label';
				case OverlappingDgrInAv.NOTES
					prop_default = 'OverlappingDgrInAv notes';
				case OverlappingDgrInAv.SHAPE
					prop_default = Measure.GLOBAL;
				case OverlappingDgrInAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingDgrInAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingDgrInAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@OverlappingDgrIn(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingDgrInAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrInAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingDgrInAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrInAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingDgrInAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrInAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			prop_default = OverlappingDgrInAv.conditioning(prop, OverlappingDgrInAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingDgrInAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrInAv.
			%  CHECK = M.CHECKPROP(OverlappingDgrInAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrInAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingDgrInAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingDgrInAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingDgrInAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrInAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrInAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingDgrInAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrInAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrInAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingDgrInAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingDgrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrInAv.TEMPLATE % __OverlappingDgrInAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingDgrInAv.getPropSettings(prop));
				otherwise
					if prop <= OverlappingDgrIn.getPropNumber()
						check = checkProp@OverlappingDgrIn(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingDgrInAv.getPropTag(prop) ' (' OverlappingDgrInAv.getFormatTag(OverlappingDgrInAv.getPropFormat(prop)) ').'] ...
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
				case OverlappingDgrInAv.M % __OverlappingDgrInAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingDgrInAv.M), 'twister')
					
					g = m.get('G');  % graph from measure class
					overlapping_in_degree_av = calculateValue@OverlappingDgrIn(m, prop);
					
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					    return;
					end
					
					value = {mean(cell2mat(overlapping_in_degree_av))};
					
					rng(rng_settings_)
					
				otherwise
					if prop <= OverlappingDgrIn.getPropNumber()
						value = calculateValue@OverlappingDgrIn(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
