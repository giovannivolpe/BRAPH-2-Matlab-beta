classdef RichClubStr < Strength
	%RichClubStr is the graph richclubstrength.
	% It is a subclass of <a href="matlab:help Strength">Strength</a>.
	%
	% The rich-club strength of a node at level s is the sum of the weighted edges 
	%   that connect nodes of strength s or higher within a layer. 
	%   s is set by the user and it can be a vector containting all the strength thresholds 
	%   the default value is equal to 1.
	%
	% RichClubStr methods (constructor):
	%  RichClubStr - constructor
	%
	% RichClubStr methods:
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
	% RichClubStr methods (display):
	%  tostring - string with information about the rich-club strength
	%  disp - displays information about the rich-club strength
	%  tree - displays the tree of the rich-club strength
	%
	% RichClubStr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two rich-club strength are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the rich-club strength
	%
	% RichClubStr methods (save/load, Static):
	%  save - saves BRAPH2 rich-club strength as b2 file
	%  load - loads a BRAPH2 rich-club strength from a b2 file
	%
	% RichClubStr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the rich-club strength
	%
	% RichClubStr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the rich-club strength
	%
	% RichClubStr methods (inspection, Static):
	%  getClass - returns the class of the rich-club strength
	%  getSubclasses - returns all subclasses of RichClubStr
	%  getProps - returns the property list of the rich-club strength
	%  getPropNumber - returns the property number of the rich-club strength
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
	% RichClubStr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% RichClubStr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% RichClubStr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% RichClubStr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?RichClubStr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">RichClubStr constants</a>.
	%
	
	properties (Constant) % properties
		PARAMETRIC_VALUE = Strength.getPropNumber() + 1;
		PARAMETRIC_VALUE_TAG = 'PARAMETRIC_VALUE';
		PARAMETRIC_VALUE_CATEGORY = Category.PARAMETER;
		PARAMETRIC_VALUE_FORMAT = Format.RVECTOR;
	end
	methods % constructor
		function m = RichClubStr(varargin)
			%RichClubStr() creates a rich-club strength.
			%
			% RichClubStr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% RichClubStr(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Strength(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the rich-club strength.
			%
			% CLASS = RichClubStr.GETCLASS() returns the class 'RichClubStr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the rich-club strength M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('RichClubStr') returns 'RichClubStr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('RichClubStr')
			%  are less computationally efficient.
			
			m_class = 'RichClubStr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the rich-club strength.
			%
			% LIST = RichClubStr.GETSUBCLASSES() returns all subclasses of 'RichClubStr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the rich-club strength M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('RichClubStr') returns all subclasses of 'RichClubStr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('RichClubStr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('RichClubStr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of rich-club strength.
			%
			% PROPS = RichClubStr.GETPROPS() returns the property list of rich-club strength
			%  as a row vector.
			%
			% PROPS = RichClubStr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the rich-club strength M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('RichClubStr'[, CATEGORY]) returns the property list of 'RichClubStr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Strength.getProps() ...
						RichClubStr.PARAMETRIC_VALUE ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Strength.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Strength.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Strength.getProps(Category.PARAMETER) ...
						RichClubStr.PARAMETRIC_VALUE ...
						];
				case Category.DATA
					prop_list = [ ...
						Strength.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Strength.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Strength.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Strength.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Strength.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Strength.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of rich-club strength.
			%
			% N = RichClubStr.GETPROPNUMBER() returns the property number of rich-club strength.
			%
			% N = RichClubStr.GETPROPNUMBER(CATEGORY) returns the property number of rich-club strength
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the rich-club strength M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('RichClubStr') returns the property number of 'RichClubStr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(RichClubStr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in rich-club strength/error.
			%
			% CHECK = RichClubStr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(RichClubStr, PROP) checks whether PROP exists for RichClubStr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:RichClubStr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%  Element.EXISTSPROP(RichClubStr, PROP) throws error if PROP does NOT exist for RichClubStr.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == RichClubStr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for RichClubStr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in rich-club strength/error.
			%
			% CHECK = RichClubStr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(RichClubStr, TAG) checks whether TAG exists for RichClubStr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:RichClubStr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%  Element.EXISTSTAG(RichClubStr, TAG) throws error if TAG does NOT exist for RichClubStr.
			%   Error id: [BRAPH2:RichClubStr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			richclubstr_tag_list = cellfun(@(x) RichClubStr.getPropTag(x), num2cell(RichClubStr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, richclubstr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for RichClubStr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(RichClubStr, POINTER) returns property number of POINTER of RichClubStr.
			%  PROPERTY = M.GETPROPPROP(RichClubStr, POINTER) returns property number of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				richclubstr_tag_list = cellfun(@(x) RichClubStr.getPropTag(x), num2cell(RichClubStr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, richclubstr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(RichClubStr, POINTER) returns tag of POINTER of RichClubStr.
			%  TAG = M.GETPROPTAG(RichClubStr, POINTER) returns tag of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case RichClubStr.PARAMETRIC_VALUE
						tag = RichClubStr.PARAMETRIC_VALUE_TAG;
					otherwise
						tag = getPropTag@Strength(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(RichClubStr, POINTER) returns category of POINTER of RichClubStr.
			%  CATEGORY = M.GETPROPCATEGORY(RichClubStr, POINTER) returns category of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('RichClubStr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE
					prop_category = RichClubStr.PARAMETRIC_VALUE_CATEGORY;
				otherwise
					prop_category = getPropCategory@Strength(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(RichClubStr, POINTER) returns format of POINTER of RichClubStr.
			%  FORMAT = M.GETPROPFORMAT(RichClubStr, POINTER) returns format of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('RichClubStr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE
					prop_format = RichClubStr.PARAMETRIC_VALUE_FORMAT;
				otherwise
					prop_format = getPropFormat@Strength(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(RichClubStr, POINTER) returns description of POINTER of RichClubStr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(RichClubStr, POINTER) returns description of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE
					prop_description = 'PARAMETRIC_VALUE (parameter, RVECTOR) ';
				case RichClubStr.NAME
					prop_description = 'NAME (constant, string) is the name of the richclubstrength.';
				case RichClubStr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the richclubstrength.';
				case RichClubStr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the richclubstrength.';
				case RichClubStr.ID
					prop_description = 'ID (data, string) is a few-letter code of the richclubstrength.';
				case RichClubStr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the richclubstrength.';
				case RichClubStr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the richclubstrength.';
				case RichClubStr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case RichClubStr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case RichClubStr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case RichClubStr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case RichClubStr.M
					prop_description = 'M (result, cell) is the richclubstrength.';
				otherwise
					prop_description = getPropDescription@Strength(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(RichClubStr, POINTER) returns settings of POINTER of RichClubStr.
			%  SETTINGS = M.GETPROPSETTINGS(RichClubStr, POINTER) returns settings of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE
					prop_settings = Format.getFormatSettings(Format.RVECTOR);
				case RichClubStr.TEMPLATE
					prop_settings = 'RichClubStr';
				otherwise
					prop_settings = getPropSettings@Strength(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = RichClubStr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = RichClubStr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(RichClubStr, POINTER) returns the default value of POINTER of RichClubStr.
			%  DEFAULT = M.GETPROPDEFAULT(RichClubStr, POINTER) returns the default value of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('RichClubStr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE
					prop_default = 1;
				case RichClubStr.NAME
					prop_default = 'RichClubStr';
				case RichClubStr.DESCRIPTION
					prop_default = 'The rich-club strength of a node at level s is the sum of the weighted edges that connect nodes of strength s or higher within a layer. s is set by the user and it can be a vector containting all the strength thresholds the default value is equal to 1.';
				case RichClubStr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, RichClubStr.getPropSettings(prop));
				case RichClubStr.ID
					prop_default = 'RichClubStr ID';
				case RichClubStr.LABEL
					prop_default = 'RichClubStr label';
				case RichClubStr.NOTES
					prop_default = 'RichClubStr notes';
				case RichClubStr.SHAPE
					prop_default = Measure.NODAL;
				case RichClubStr.SCOPE
					prop_default = Measure.UNILAYER;
				case RichClubStr.PARAMETRICITY
					prop_default = Measure.PARAMETRIC;
				case RichClubStr.COMPATIBLE_GRAPHS
					prop_default = {'GraphWU' 'GraphWD' 'MultiplexWU' 'MultiplexWD'};;
				otherwise
					prop_default = getPropDefault@Strength(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = RichClubStr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = RichClubStr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(RichClubStr, POINTER) returns the conditioned default value of POINTER of RichClubStr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(RichClubStr, POINTER) returns the conditioned default value of POINTER of RichClubStr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('RichClubStr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = RichClubStr.getPropProp(pointer);
			
			prop_default = RichClubStr.conditioning(prop, RichClubStr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(RichClubStr, PROP, VALUE) checks VALUE format for PROP of RichClubStr.
			%  CHECK = M.CHECKPROP(RichClubStr, PROP, VALUE) checks VALUE format for PROP of RichClubStr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:RichClubStr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:RichClubStr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(RichClubStr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of RichClubStr.
			%   Error id: €BRAPH2.STR€:RichClubStr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(RichClubStr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of RichClubStr.
			%   Error id: €BRAPH2.STR€:RichClubStr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('RichClubStr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = RichClubStr.getPropProp(pointer);
			
			switch prop
				case RichClubStr.PARAMETRIC_VALUE % __RichClubStr.PARAMETRIC_VALUE__
					check = Format.checkFormat(Format.RVECTOR, value, RichClubStr.getPropSettings(prop));
				case RichClubStr.TEMPLATE % __RichClubStr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, RichClubStr.getPropSettings(prop));
				otherwise
					if prop <= Strength.getPropNumber()
						check = checkProp@Strength(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' RichClubStr.getPropTag(prop) ' (' RichClubStr.getFormatTag(RichClubStr.getPropFormat(prop)) ').'] ...
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
				case RichClubStr.M % __RichClubStr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(RichClubStr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					N = g.get('NODENUMBER');
					
					rich_club_strength = cell(L, 1); 
					directionality_type = g.get('DIRECTIONALITY_TYPE', L);
					richclub_threshold = m.get('PARAMETRIC_VALUE');
					assert(mod(richclub_threshold, 1) == 0, ...
					    [BRAPH2.STR ':RichClubStr:' BRAPH2.WRONG_INPUT], ...
					    ['RichClubStr threshold must be an integer value ' ...
					    'while it is ' tostring(richclub_threshold)])
					
					s_levels = abs(richclub_threshold);
					for li = 1:1:L
					    
					    Aii = A{li, li};
					    directionality_layer = directionality_type(li, li);
					
					    if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					       
					        strength = calculateValue@Strength(m, prop);
					        st = strength{li};
					
					    else  % directed graphs
					      
					        in_strength = StrengthIn('G', g).get('M');        
					        out_strength = StrengthOut('G', g).get('M');       
					
					        st = (in_strength{li} + out_strength{li})/2;
					    end
					
					    rich_club_strength_layer = zeros(N(1), 1, length(s_levels));
					    count = 1;
					    for s = s_levels
					        low_rich_nodes = find(st <= s);  % get lower rich nodes with strength <= s
					        subAii = Aii;  % extract subnetwork of nodes >s by removing nodes <=s of Aii
					        subAii(low_rich_nodes, :) = 0;  % remove rows
					        subAii(:, low_rich_nodes) = 0;  % remove columns
					        
					        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					            rich_club_strength_layer(:, :, count) = round(sum(subAii, 1), 6)';  % strength of high rich nodes
					        else
					            rich_club_strength_layer(:, :, count) = round((sum(subAii, 1)' + sum(subAii, 2)), 6)/2;  % strength of high rich nodes
					        end
					        count = count + 1;
					    end
					    rich_club_strength(li) = {rich_club_strength_layer};  %#ok<SAGROW> % add rich club strength of layer li
					end
					
					value = rich_club_strength;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Strength.getPropNumber()
						value = calculateValue@Strength(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
