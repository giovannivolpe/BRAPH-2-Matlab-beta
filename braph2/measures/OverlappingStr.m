classdef OverlappingStr < Strength
	%OverlappingStr is the graph overlapping strength.
	% It is a subclass of <a href="matlab:help Strength">Strength</a>.
	%
	% The overlapping strength of a graph is the sum of the strengths of a node in 
	% all layers.
	%
	% OverlappingStr methods (constructor):
	%  OverlappingStr - constructor
	%
	% OverlappingStr methods:
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
	% OverlappingStr methods (display):
	%  tostring - string with information about the ovrlapstr
	%  disp - displays information about the ovrlapstr
	%  tree - displays the tree of the ovrlapstr
	%
	% OverlappingStr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two ovrlapstr are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the ovrlapstr
	%
	% OverlappingStr methods (save/load, Static):
	%  save - saves BRAPH2 ovrlapstr as b2 file
	%  load - loads a BRAPH2 ovrlapstr from a b2 file
	%
	% OverlappingStr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the ovrlapstr
	%
	% OverlappingStr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the ovrlapstr
	%
	% OverlappingStr methods (inspection, Static):
	%  getClass - returns the class of the ovrlapstr
	%  getSubclasses - returns all subclasses of OverlappingStr
	%  getProps - returns the property list of the ovrlapstr
	%  getPropNumber - returns the property number of the ovrlapstr
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
	% OverlappingStr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingStr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingStr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingStr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingStr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingStr constants</a>.
	%
	
	methods % constructor
		function m = OverlappingStr(varargin)
			%OverlappingStr() creates a ovrlapstr.
			%
			% OverlappingStr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingStr(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the ovrlapstr.
			%
			% CLASS = OverlappingStr.GETCLASS() returns the class 'OverlappingStr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the ovrlapstr M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingStr') returns 'OverlappingStr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingStr')
			%  are less computationally efficient.
			
			m_class = 'OverlappingStr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the ovrlapstr.
			%
			% LIST = OverlappingStr.GETSUBCLASSES() returns all subclasses of 'OverlappingStr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the ovrlapstr M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingStr') returns all subclasses of 'OverlappingStr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingStr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of ovrlapstr.
			%
			% PROPS = OverlappingStr.GETPROPS() returns the property list of ovrlapstr
			%  as a row vector.
			%
			% PROPS = OverlappingStr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the ovrlapstr M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingStr'[, CATEGORY]) returns the property list of 'OverlappingStr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Strength.getProps() ...
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
			%GETPROPNUMBER returns the property number of ovrlapstr.
			%
			% N = OverlappingStr.GETPROPNUMBER() returns the property number of ovrlapstr.
			%
			% N = OverlappingStr.GETPROPNUMBER(CATEGORY) returns the property number of ovrlapstr
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the ovrlapstr M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingStr') returns the property number of 'OverlappingStr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingStr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in ovrlapstr/error.
			%
			% CHECK = OverlappingStr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingStr, PROP) checks whether PROP exists for OverlappingStr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingStr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%  Element.EXISTSPROP(OverlappingStr, PROP) throws error if PROP does NOT exist for OverlappingStr.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingStr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingStr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in ovrlapstr/error.
			%
			% CHECK = OverlappingStr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingStr, TAG) checks whether TAG exists for OverlappingStr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingStr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%  Element.EXISTSTAG(OverlappingStr, TAG) throws error if TAG does NOT exist for OverlappingStr.
			%   Error id: [BRAPH2:OverlappingStr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingstr_tag_list = cellfun(@(x) OverlappingStr.getPropTag(x), num2cell(OverlappingStr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingstr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingStr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingStr, POINTER) returns property number of POINTER of OverlappingStr.
			%  PROPERTY = M.GETPROPPROP(OverlappingStr, POINTER) returns property number of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingstr_tag_list = cellfun(@(x) OverlappingStr.getPropTag(x), num2cell(OverlappingStr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingstr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingStr, POINTER) returns tag of POINTER of OverlappingStr.
			%  TAG = M.GETPROPTAG(OverlappingStr, POINTER) returns tag of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingStr')
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingStr, POINTER) returns category of POINTER of OverlappingStr.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingStr, POINTER) returns category of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingStr, POINTER) returns format of POINTER of OverlappingStr.
			%  FORMAT = M.GETPROPFORMAT(OverlappingStr, POINTER) returns format of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingStr, POINTER) returns description of POINTER of OverlappingStr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingStr, POINTER) returns description of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
				case OverlappingStr.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping strength.';
				case OverlappingStr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping strength.';
				case OverlappingStr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping strength.';
				case OverlappingStr.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping strength.';
				case OverlappingStr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping strength.';
				case OverlappingStr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping strength.';
				case OverlappingStr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingStr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingStr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingStr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingStr.M
					prop_description = 'M (result, cell) is the overlapping strength.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingStr, POINTER) returns settings of POINTER of OverlappingStr.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingStr, POINTER) returns settings of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
				case OverlappingStr.TEMPLATE
					prop_settings = 'OverlappingStr';
				otherwise
					prop_settings = getPropSettings@Strength(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingStr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingStr, POINTER) returns the default value of POINTER of OverlappingStr.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingStr, POINTER) returns the default value of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
				case OverlappingStr.NAME
					prop_default = 'OverlappingStr';
				case OverlappingStr.DESCRIPTION
					prop_default = 'The overlapping strength of a graph is the sum of the strengths of a node in all layers.';
				case OverlappingStr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingStr.getPropSettings(prop));
				case OverlappingStr.ID
					prop_default = 'OverlappingStr ID';
				case OverlappingStr.LABEL
					prop_default = 'OverlappingStr label';
				case OverlappingStr.NOTES
					prop_default = 'OverlappingStr notes';
				case OverlappingStr.SHAPE
					prop_default = Measure.NODAL;
				case OverlappingStr.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingStr.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingStr.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Strength(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingStr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingStr, POINTER) returns the conditioned default value of POINTER of OverlappingStr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingStr, POINTER) returns the conditioned default value of POINTER of OverlappingStr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			prop_default = OverlappingStr.conditioning(prop, OverlappingStr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingStr, PROP, VALUE) checks VALUE format for PROP of OverlappingStr.
			%  CHECK = M.CHECKPROP(OverlappingStr, PROP, VALUE) checks VALUE format for PROP of OverlappingStr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingStr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingStr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingStr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStr.
			%   Error id: €BRAPH2.STR€:OverlappingStr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingStr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStr.
			%   Error id: €BRAPH2.STR€:OverlappingStr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingStr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingStr.getPropProp(pointer);
			
			switch prop
				case OverlappingStr.TEMPLATE % __OverlappingStr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingStr.getPropSettings(prop));
				otherwise
					if prop <= Strength.getPropNumber()
						check = checkProp@Strength(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingStr.getPropTag(prop) ' (' OverlappingStr.getFormatTag(OverlappingStr.getPropFormat(prop)) ').'] ...
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
				case OverlappingStr.M % __OverlappingStr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingStr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    strength = calculateValue@Strength(m, prop);	
					    overlapping_strength = zeros(N(1), 1);
					    for li = 1:l 
					        overlapping_strength = overlapping_strength + strength{li};
					    end
					    value = {overlapping_strength};
					end
					
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
