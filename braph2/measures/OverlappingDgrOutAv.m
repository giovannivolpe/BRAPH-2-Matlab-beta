classdef OverlappingDgrOutAv < OverlappingDgrOut
	%OverlappingDgrOutAv is the graph average overlapping out-degree.
	% It is a subclass of <a href="matlab:help OverlappingDgrOut">OverlappingDgrOut</a>.
	%
	% The average overlapping out-degree of a graph is the average of the sum of the 
	% out-degrees of a node in all layers.
	%
	% OverlappingDgrOutAv methods (constructor):
	%  OverlappingDgrOutAv - constructor
	%
	% OverlappingDgrOutAv methods:
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
	% OverlappingDgrOutAv methods (display):
	%  tostring - string with information about the average overlapping out-degree
	%  disp - displays information about the average overlapping out-degree
	%  tree - displays the tree of the average overlapping out-degree
	%
	% OverlappingDgrOutAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average overlapping out-degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average overlapping out-degree
	%
	% OverlappingDgrOutAv methods (save/load, Static):
	%  save - saves BRAPH2 average overlapping out-degree as b2 file
	%  load - loads a BRAPH2 average overlapping out-degree from a b2 file
	%
	% OverlappingDgrOutAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average overlapping out-degree
	%
	% OverlappingDgrOutAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average overlapping out-degree
	%
	% OverlappingDgrOutAv methods (inspection, Static):
	%  getClass - returns the class of the average overlapping out-degree
	%  getSubclasses - returns all subclasses of OverlappingDgrOutAv
	%  getProps - returns the property list of the average overlapping out-degree
	%  getPropNumber - returns the property number of the average overlapping out-degree
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
	% OverlappingDgrOutAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingDgrOutAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingDgrOutAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingDgrOutAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingDgrOutAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingDgrOutAv constants</a>.
	%
	
	methods % constructor
		function m = OverlappingDgrOutAv(varargin)
			%OverlappingDgrOutAv() creates a average overlapping out-degree.
			%
			% OverlappingDgrOutAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingDgrOutAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@OverlappingDgrOut(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average overlapping out-degree.
			%
			% CLASS = OverlappingDgrOutAv.GETCLASS() returns the class 'OverlappingDgrOutAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average overlapping out-degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingDgrOutAv') returns 'OverlappingDgrOutAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingDgrOutAv')
			%  are less computationally efficient.
			
			m_class = 'OverlappingDgrOutAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average overlapping out-degree.
			%
			% LIST = OverlappingDgrOutAv.GETSUBCLASSES() returns all subclasses of 'OverlappingDgrOutAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average overlapping out-degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingDgrOutAv') returns all subclasses of 'OverlappingDgrOutAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingDgrOutAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average overlapping out-degree.
			%
			% PROPS = OverlappingDgrOutAv.GETPROPS() returns the property list of average overlapping out-degree
			%  as a row vector.
			%
			% PROPS = OverlappingDgrOutAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average overlapping out-degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingDgrOutAv'[, CATEGORY]) returns the property list of 'OverlappingDgrOutAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					OverlappingDgrOut.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						OverlappingDgrOut.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						OverlappingDgrOut.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average overlapping out-degree.
			%
			% N = OverlappingDgrOutAv.GETPROPNUMBER() returns the property number of average overlapping out-degree.
			%
			% N = OverlappingDgrOutAv.GETPROPNUMBER(CATEGORY) returns the property number of average overlapping out-degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average overlapping out-degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingDgrOutAv') returns the property number of 'OverlappingDgrOutAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingDgrOutAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average overlapping out-degree/error.
			%
			% CHECK = OverlappingDgrOutAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingDgrOutAv, PROP) checks whether PROP exists for OverlappingDgrOutAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%  Element.EXISTSPROP(OverlappingDgrOutAv, PROP) throws error if PROP does NOT exist for OverlappingDgrOutAv.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingDgrOutAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingDgrOutAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average overlapping out-degree/error.
			%
			% CHECK = OverlappingDgrOutAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingDgrOutAv, TAG) checks whether TAG exists for OverlappingDgrOutAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%  Element.EXISTSTAG(OverlappingDgrOutAv, TAG) throws error if TAG does NOT exist for OverlappingDgrOutAv.
			%   Error id: [BRAPH2:OverlappingDgrOutAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingdgroutav_tag_list = cellfun(@(x) OverlappingDgrOutAv.getPropTag(x), num2cell(OverlappingDgrOutAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingdgroutav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingDgrOutAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingDgrOutAv, POINTER) returns property number of POINTER of OverlappingDgrOutAv.
			%  PROPERTY = M.GETPROPPROP(OverlappingDgrOutAv, POINTER) returns property number of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingdgroutav_tag_list = cellfun(@(x) OverlappingDgrOutAv.getPropTag(x), num2cell(OverlappingDgrOutAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingdgroutav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingDgrOutAv, POINTER) returns tag of POINTER of OverlappingDgrOutAv.
			%  TAG = M.GETPROPTAG(OverlappingDgrOutAv, POINTER) returns tag of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingDgrOutAv')
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
						tag = getPropTag@OverlappingDgrOut(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingDgrOutAv, POINTER) returns category of POINTER of OverlappingDgrOutAv.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingDgrOutAv, POINTER) returns category of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@OverlappingDgrOut(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingDgrOutAv, POINTER) returns format of POINTER of OverlappingDgrOutAv.
			%  FORMAT = M.GETPROPFORMAT(OverlappingDgrOutAv, POINTER) returns format of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@OverlappingDgrOut(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingDgrOutAv, POINTER) returns description of POINTER of OverlappingDgrOutAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingDgrOutAv, POINTER) returns description of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOutAv.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping in-degree.';
				case OverlappingDgrOutAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping in-degree.';
				case OverlappingDgrOutAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping in-degree.';
				case OverlappingDgrOutAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping in-degree.';
				case OverlappingDgrOutAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping in-degree.';
				case OverlappingDgrOutAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping in-degree.';
				case OverlappingDgrOutAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingDgrOutAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingDgrOutAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingDgrOutAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingDgrOutAv.M
					prop_description = 'M (result, cell) is the overlapping in-degree.';
				otherwise
					prop_description = getPropDescription@OverlappingDgrOut(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingDgrOutAv, POINTER) returns settings of POINTER of OverlappingDgrOutAv.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingDgrOutAv, POINTER) returns settings of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOutAv.TEMPLATE
					prop_settings = 'OverlappingDgrOutAv';
				otherwise
					prop_settings = getPropSettings@OverlappingDgrOut(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingDgrOutAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrOutAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingDgrOutAv, POINTER) returns the default value of POINTER of OverlappingDgrOutAv.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingDgrOutAv, POINTER) returns the default value of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOutAv.NAME
					prop_default = 'OverlappingDgrOutAv';
				case OverlappingDgrOutAv.DESCRIPTION
					prop_default = 'The average overlapping out-degree of a graph is the average of the sum of the out-degrees of a node in all layers.';
				case OverlappingDgrOutAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingDgrOutAv.getPropSettings(prop));
				case OverlappingDgrOutAv.ID
					prop_default = 'OverlappingDgrOutAv ID';
				case OverlappingDgrOutAv.LABEL
					prop_default = 'OverlappingDgrOutAv label';
				case OverlappingDgrOutAv.NOTES
					prop_default = 'OverlappingDgrOutAv notes';
				case OverlappingDgrOutAv.SHAPE
					prop_default = Measure.GLOBAL;
				case OverlappingDgrOutAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingDgrOutAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingDgrOutAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@OverlappingDgrOut(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingDgrOutAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrOutAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingDgrOutAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrOutAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingDgrOutAv, POINTER) returns the conditioned default value of POINTER of OverlappingDgrOutAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			prop_default = OverlappingDgrOutAv.conditioning(prop, OverlappingDgrOutAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingDgrOutAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrOutAv.
			%  CHECK = M.CHECKPROP(OverlappingDgrOutAv, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrOutAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingDgrOutAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOutAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingDgrOutAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrOutAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOutAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingDgrOutAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrOutAv.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOutAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingDgrOutAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingDgrOutAv.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOutAv.TEMPLATE % __OverlappingDgrOutAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingDgrOutAv.getPropSettings(prop));
				otherwise
					if prop <= OverlappingDgrOut.getPropNumber()
						check = checkProp@OverlappingDgrOut(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOutAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingDgrOutAv.getPropTag(prop) ' (' OverlappingDgrOutAv.getFormatTag(OverlappingDgrOutAv.getPropFormat(prop)) ').'] ...
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
				case OverlappingDgrOutAv.M % __OverlappingDgrOutAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingDgrOutAv.M), 'twister')
					
					g = m.get('G');  % graph from measure class
					overlapping_in_degree_av = calculateValue@OverlappingDgrOut(m, prop);
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					    return;
					end
					
					value = {mean(cell2mat(overlapping_in_degree_av))};
					
					rng(rng_settings_)
					
				otherwise
					if prop <= OverlappingDgrOut.getPropNumber()
						value = calculateValue@OverlappingDgrOut(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
