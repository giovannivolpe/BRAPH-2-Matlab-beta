classdef OverlappingStrIn < StrengthIn
	%OverlappingStrIn is the graph overlapping strength.
	% It is a subclass of <a href="matlab:help StrengthIn">StrengthIn</a>.
	%
	% The overlapping in-strength of a graph is the sum of the in-strengths of a 
	% node in all layers.
	%
	% OverlappingStrIn methods (constructor):
	%  OverlappingStrIn - constructor
	%
	% OverlappingStrIn methods:
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
	% OverlappingStrIn methods (display):
	%  tostring - string with information about the ovrlapstrin
	%  disp - displays information about the ovrlapstrin
	%  tree - displays the tree of the ovrlapstrin
	%
	% OverlappingStrIn methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two ovrlapstrin are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the ovrlapstrin
	%
	% OverlappingStrIn methods (save/load, Static):
	%  save - saves BRAPH2 ovrlapstrin as b2 file
	%  load - loads a BRAPH2 ovrlapstrin from a b2 file
	%
	% OverlappingStrIn method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the ovrlapstrin
	%
	% OverlappingStrIn method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the ovrlapstrin
	%
	% OverlappingStrIn methods (inspection, Static):
	%  getClass - returns the class of the ovrlapstrin
	%  getSubclasses - returns all subclasses of OverlappingStrIn
	%  getProps - returns the property list of the ovrlapstrin
	%  getPropNumber - returns the property number of the ovrlapstrin
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
	% OverlappingStrIn methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingStrIn methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingStrIn methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingStrIn methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingStrIn; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingStrIn constants</a>.
	%
	
	methods % constructor
		function m = OverlappingStrIn(varargin)
			%OverlappingStrIn() creates a ovrlapstrin.
			%
			% OverlappingStrIn(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingStrIn(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@StrengthIn(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the ovrlapstrin.
			%
			% CLASS = OverlappingStrIn.GETCLASS() returns the class 'OverlappingStrIn'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the ovrlapstrin M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingStrIn') returns 'OverlappingStrIn'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingStrIn')
			%  are less computationally efficient.
			
			m_class = 'OverlappingStrIn';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the ovrlapstrin.
			%
			% LIST = OverlappingStrIn.GETSUBCLASSES() returns all subclasses of 'OverlappingStrIn'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the ovrlapstrin M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingStrIn') returns all subclasses of 'OverlappingStrIn'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingStrIn', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of ovrlapstrin.
			%
			% PROPS = OverlappingStrIn.GETPROPS() returns the property list of ovrlapstrin
			%  as a row vector.
			%
			% PROPS = OverlappingStrIn.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the ovrlapstrin M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingStrIn'[, CATEGORY]) returns the property list of 'OverlappingStrIn'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					StrengthIn.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						StrengthIn.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						StrengthIn.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						StrengthIn.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						StrengthIn.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						StrengthIn.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						StrengthIn.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						StrengthIn.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						StrengthIn.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						StrengthIn.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of ovrlapstrin.
			%
			% N = OverlappingStrIn.GETPROPNUMBER() returns the property number of ovrlapstrin.
			%
			% N = OverlappingStrIn.GETPROPNUMBER(CATEGORY) returns the property number of ovrlapstrin
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the ovrlapstrin M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingStrIn') returns the property number of 'OverlappingStrIn'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingStrIn.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in ovrlapstrin/error.
			%
			% CHECK = OverlappingStrIn.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingStrIn, PROP) checks whether PROP exists for OverlappingStrIn.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%  Element.EXISTSPROP(OverlappingStrIn, PROP) throws error if PROP does NOT exist for OverlappingStrIn.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingStrIn.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingStrIn.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in ovrlapstrin/error.
			%
			% CHECK = OverlappingStrIn.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingStrIn, TAG) checks whether TAG exists for OverlappingStrIn.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%  Element.EXISTSTAG(OverlappingStrIn, TAG) throws error if TAG does NOT exist for OverlappingStrIn.
			%   Error id: [BRAPH2:OverlappingStrIn:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingstrin_tag_list = cellfun(@(x) OverlappingStrIn.getPropTag(x), num2cell(OverlappingStrIn.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingstrin_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingStrIn.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingStrIn, POINTER) returns property number of POINTER of OverlappingStrIn.
			%  PROPERTY = M.GETPROPPROP(OverlappingStrIn, POINTER) returns property number of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingstrin_tag_list = cellfun(@(x) OverlappingStrIn.getPropTag(x), num2cell(OverlappingStrIn.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingstrin_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingStrIn, POINTER) returns tag of POINTER of OverlappingStrIn.
			%  TAG = M.GETPROPTAG(OverlappingStrIn, POINTER) returns tag of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingStrIn')
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
						tag = getPropTag@StrengthIn(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingStrIn, POINTER) returns category of POINTER of OverlappingStrIn.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingStrIn, POINTER) returns category of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@StrengthIn(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingStrIn, POINTER) returns format of POINTER of OverlappingStrIn.
			%  FORMAT = M.GETPROPFORMAT(OverlappingStrIn, POINTER) returns format of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@StrengthIn(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingStrIn, POINTER) returns description of POINTER of OverlappingStrIn.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingStrIn, POINTER) returns description of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				case OverlappingStrIn.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping strength.';
				case OverlappingStrIn.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping strength.';
				case OverlappingStrIn.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping strength.';
				case OverlappingStrIn.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping strength.';
				case OverlappingStrIn.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping strength.';
				case OverlappingStrIn.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping strength.';
				case OverlappingStrIn.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingStrIn.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingStrIn.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingStrIn.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingStrIn.M
					prop_description = 'M (result, cell) is the overlapping strength.';
				otherwise
					prop_description = getPropDescription@StrengthIn(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingStrIn, POINTER) returns settings of POINTER of OverlappingStrIn.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingStrIn, POINTER) returns settings of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				case OverlappingStrIn.TEMPLATE
					prop_settings = 'OverlappingStrIn';
				otherwise
					prop_settings = getPropSettings@StrengthIn(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingStrIn.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrIn.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingStrIn, POINTER) returns the default value of POINTER of OverlappingStrIn.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingStrIn, POINTER) returns the default value of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				case OverlappingStrIn.NAME
					prop_default = 'OverlappingStrIn';
				case OverlappingStrIn.DESCRIPTION
					prop_default = 'The overlapping in-strength of a graph is the sum of the in-strengths of a node in all layers.';
				case OverlappingStrIn.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingStrIn.getPropSettings(prop));
				case OverlappingStrIn.ID
					prop_default = 'OverlappingStrIn ID';
				case OverlappingStrIn.LABEL
					prop_default = 'OverlappingStrIn label';
				case OverlappingStrIn.NOTES
					prop_default = 'OverlappingStrIn notes';
				case OverlappingStrIn.SHAPE
					prop_default = Measure.NODAL;
				case OverlappingStrIn.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingStrIn.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingStrIn.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD'};;
				otherwise
					prop_default = getPropDefault@StrengthIn(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingStrIn.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrIn.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingStrIn, POINTER) returns the conditioned default value of POINTER of OverlappingStrIn.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingStrIn, POINTER) returns the conditioned default value of POINTER of OverlappingStrIn.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			prop_default = OverlappingStrIn.conditioning(prop, OverlappingStrIn.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingStrIn, PROP, VALUE) checks VALUE format for PROP of OverlappingStrIn.
			%  CHECK = M.CHECKPROP(OverlappingStrIn, PROP, VALUE) checks VALUE format for PROP of OverlappingStrIn.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingStrIn:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingStrIn:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingStrIn, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrIn.
			%   Error id: €BRAPH2.STR€:OverlappingStrIn:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingStrIn, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrIn.
			%   Error id: €BRAPH2.STR€:OverlappingStrIn:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingStrIn')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingStrIn.getPropProp(pointer);
			
			switch prop
				case OverlappingStrIn.TEMPLATE % __OverlappingStrIn.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingStrIn.getPropSettings(prop));
				otherwise
					if prop <= StrengthIn.getPropNumber()
						check = checkProp@StrengthIn(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrIn:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingStrIn.getPropTag(prop) ' (' OverlappingStrIn.getFormatTag(OverlappingStrIn.getPropFormat(prop)) ').'] ...
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
				case OverlappingStrIn.M % __OverlappingStrIn.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingStrIn.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    strength = calculateValue@StrengthIn(m, prop);	
					    overlapping_strength = zeros(N(1), 1);
					    for li = 1:l  
					        overlapping_strength = overlapping_strength + strength{li}';
					    end
					    value = {overlapping_strength};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= StrengthIn.getPropNumber()
						value = calculateValue@StrengthIn(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
