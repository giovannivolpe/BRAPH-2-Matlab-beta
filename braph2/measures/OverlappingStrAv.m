classdef OverlappingStrAv < OverlappingStr
	%OverlappingStrAv is the graph averge overlapping degree.
	% It is a subclass of <a href="matlab:help OverlappingStr">OverlappingStr</a>.
	%
	% The average overlapping strength of a graph is the average of the sum of the 
	% strengths of a node in all layers.
	%
	% OverlappingStrAv methods (constructor):
	%  OverlappingStrAv - constructor
	%
	% OverlappingStrAv methods:
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
	% OverlappingStrAv methods (display):
	%  tostring - string with information about the averge overlapping strength
	%  disp - displays information about the averge overlapping strength
	%  tree - displays the tree of the averge overlapping strength
	%
	% OverlappingStrAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two averge overlapping strength are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the averge overlapping strength
	%
	% OverlappingStrAv methods (save/load, Static):
	%  save - saves BRAPH2 averge overlapping strength as b2 file
	%  load - loads a BRAPH2 averge overlapping strength from a b2 file
	%
	% OverlappingStrAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the averge overlapping strength
	%
	% OverlappingStrAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the averge overlapping strength
	%
	% OverlappingStrAv methods (inspection, Static):
	%  getClass - returns the class of the averge overlapping strength
	%  getSubclasses - returns all subclasses of OverlappingStrAv
	%  getProps - returns the property list of the averge overlapping strength
	%  getPropNumber - returns the property number of the averge overlapping strength
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
	% OverlappingStrAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingStrAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingStrAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingStrAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingStrAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingStrAv constants</a>.
	%
	
	methods % constructor
		function m = OverlappingStrAv(varargin)
			%OverlappingStrAv() creates a averge overlapping strength.
			%
			% OverlappingStrAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingStrAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@OverlappingStr(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the averge overlapping strength.
			%
			% CLASS = OverlappingStrAv.GETCLASS() returns the class 'OverlappingStrAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the averge overlapping strength M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingStrAv') returns 'OverlappingStrAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingStrAv')
			%  are less computationally efficient.
			
			m_class = 'OverlappingStrAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the averge overlapping strength.
			%
			% LIST = OverlappingStrAv.GETSUBCLASSES() returns all subclasses of 'OverlappingStrAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the averge overlapping strength M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingStrAv') returns all subclasses of 'OverlappingStrAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingStrAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of averge overlapping strength.
			%
			% PROPS = OverlappingStrAv.GETPROPS() returns the property list of averge overlapping strength
			%  as a row vector.
			%
			% PROPS = OverlappingStrAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the averge overlapping strength M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingStrAv'[, CATEGORY]) returns the property list of 'OverlappingStrAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					OverlappingStr.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						OverlappingStr.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						OverlappingStr.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						OverlappingStr.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						OverlappingStr.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						OverlappingStr.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						OverlappingStr.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						OverlappingStr.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						OverlappingStr.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						OverlappingStr.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of averge overlapping strength.
			%
			% N = OverlappingStrAv.GETPROPNUMBER() returns the property number of averge overlapping strength.
			%
			% N = OverlappingStrAv.GETPROPNUMBER(CATEGORY) returns the property number of averge overlapping strength
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the averge overlapping strength M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingStrAv') returns the property number of 'OverlappingStrAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingStrAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in averge overlapping strength/error.
			%
			% CHECK = OverlappingStrAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingStrAv, PROP) checks whether PROP exists for OverlappingStrAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%  Element.EXISTSPROP(OverlappingStrAv, PROP) throws error if PROP does NOT exist for OverlappingStrAv.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingStrAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingStrAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in averge overlapping strength/error.
			%
			% CHECK = OverlappingStrAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingStrAv, TAG) checks whether TAG exists for OverlappingStrAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%  Element.EXISTSTAG(OverlappingStrAv, TAG) throws error if TAG does NOT exist for OverlappingStrAv.
			%   Error id: [BRAPH2:OverlappingStrAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingstrav_tag_list = cellfun(@(x) OverlappingStrAv.getPropTag(x), num2cell(OverlappingStrAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingstrav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingStrAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingStrAv, POINTER) returns property number of POINTER of OverlappingStrAv.
			%  PROPERTY = M.GETPROPPROP(OverlappingStrAv, POINTER) returns property number of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingstrav_tag_list = cellfun(@(x) OverlappingStrAv.getPropTag(x), num2cell(OverlappingStrAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingstrav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingStrAv, POINTER) returns tag of POINTER of OverlappingStrAv.
			%  TAG = M.GETPROPTAG(OverlappingStrAv, POINTER) returns tag of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingStrAv')
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
						tag = getPropTag@OverlappingStr(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingStrAv, POINTER) returns category of POINTER of OverlappingStrAv.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingStrAv, POINTER) returns category of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@OverlappingStr(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingStrAv, POINTER) returns format of POINTER of OverlappingStrAv.
			%  FORMAT = M.GETPROPFORMAT(OverlappingStrAv, POINTER) returns format of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@OverlappingStr(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingStrAv, POINTER) returns description of POINTER of OverlappingStrAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingStrAv, POINTER) returns description of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrAv.NAME
					prop_description = 'NAME (constant, string) is the name of the averge overlapping degree.';
				case OverlappingStrAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the averge overlapping degree.';
				case OverlappingStrAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the averge overlapping degree.';
				case OverlappingStrAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the averge overlapping degree.';
				case OverlappingStrAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the averge overlapping degree.';
				case OverlappingStrAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the averge overlapping degree.';
				case OverlappingStrAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingStrAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingStrAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingStrAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingStrAv.M
					prop_description = 'M (result, cell) is the averge overlapping degree.';
				otherwise
					prop_description = getPropDescription@OverlappingStr(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingStrAv, POINTER) returns settings of POINTER of OverlappingStrAv.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingStrAv, POINTER) returns settings of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrAv.TEMPLATE
					prop_settings = 'OverlappingStrAv';
				otherwise
					prop_settings = getPropSettings@OverlappingStr(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingStrAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingStrAv, POINTER) returns the default value of POINTER of OverlappingStrAv.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingStrAv, POINTER) returns the default value of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrAv.NAME
					prop_default = 'OverlappingStrAv';
				case OverlappingStrAv.DESCRIPTION
					prop_default = 'The average overlapping strength of a graph is the average of the sum of the strengths of a node in all layers.';
				case OverlappingStrAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingStrAv.getPropSettings(prop));
				case OverlappingStrAv.ID
					prop_default = 'OverlappingStrAv ID';
				case OverlappingStrAv.LABEL
					prop_default = 'OverlappingStrAv label';
				case OverlappingStrAv.NOTES
					prop_default = 'OverlappingStrAv notes';
				case OverlappingStrAv.SHAPE
					prop_default = Measure.GLOBAL;
				case OverlappingStrAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingStrAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingStrAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@OverlappingStr(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingStrAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingStrAv, POINTER) returns the conditioned default value of POINTER of OverlappingStrAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingStrAv, POINTER) returns the conditioned default value of POINTER of OverlappingStrAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			prop_default = OverlappingStrAv.conditioning(prop, OverlappingStrAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingStrAv, PROP, VALUE) checks VALUE format for PROP of OverlappingStrAv.
			%  CHECK = M.CHECKPROP(OverlappingStrAv, PROP, VALUE) checks VALUE format for PROP of OverlappingStrAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingStrAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingStrAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingStrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrAv.
			%   Error id: €BRAPH2.STR€:OverlappingStrAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingStrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrAv.
			%   Error id: €BRAPH2.STR€:OverlappingStrAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingStrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingStrAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrAv.TEMPLATE % __OverlappingStrAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingStrAv.getPropSettings(prop));
				otherwise
					if prop <= OverlappingStr.getPropNumber()
						check = checkProp@OverlappingStr(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingStrAv.getPropTag(prop) ' (' OverlappingStrAv.getFormatTag(OverlappingStrAv.getPropFormat(prop)) ').'] ...
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
				case OverlappingStrAv.M % __OverlappingStrAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingStrAv.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					overlapping_strength = calculateValue@OverlappingStr(m, prop);
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					
					    value = {mean(cell2mat(overlapping_strength))};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= OverlappingStr.getPropNumber()
						value = calculateValue@OverlappingStr(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
