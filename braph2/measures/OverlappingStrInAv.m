classdef OverlappingStrInAv < OverlappingStrIn
	%OverlappingStrInAv is the graph average overlapping strength.
	% It is a subclass of <a href="matlab:help OverlappingStrIn">OverlappingStrIn</a>.
	%
	% The average overlapping in-strength of a graph is the average of the sum of the 
	% in-strengths of a node in all layers.
	%
	% OverlappingStrInAv methods (constructor):
	%  OverlappingStrInAv - constructor
	%
	% OverlappingStrInAv methods:
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
	% OverlappingStrInAv methods (display):
	%  tostring - string with information about the average ovrlapstrin
	%  disp - displays information about the average ovrlapstrin
	%  tree - displays the tree of the average ovrlapstrin
	%
	% OverlappingStrInAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average ovrlapstrin are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average ovrlapstrin
	%
	% OverlappingStrInAv methods (save/load, Static):
	%  save - saves BRAPH2 average ovrlapstrin as b2 file
	%  load - loads a BRAPH2 average ovrlapstrin from a b2 file
	%
	% OverlappingStrInAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average ovrlapstrin
	%
	% OverlappingStrInAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average ovrlapstrin
	%
	% OverlappingStrInAv methods (inspection, Static):
	%  getClass - returns the class of the average ovrlapstrin
	%  getSubclasses - returns all subclasses of OverlappingStrInAv
	%  getProps - returns the property list of the average ovrlapstrin
	%  getPropNumber - returns the property number of the average ovrlapstrin
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
	% OverlappingStrInAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingStrInAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingStrInAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingStrInAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingStrInAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingStrInAv constants</a>.
	%
	
	methods % constructor
		function m = OverlappingStrInAv(varargin)
			%OverlappingStrInAv() creates a average ovrlapstrin.
			%
			% OverlappingStrInAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingStrInAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@OverlappingStrIn(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average ovrlapstrin.
			%
			% CLASS = OverlappingStrInAv.GETCLASS() returns the class 'OverlappingStrInAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average ovrlapstrin M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingStrInAv') returns 'OverlappingStrInAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingStrInAv')
			%  are less computationally efficient.
			
			m_class = 'OverlappingStrInAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average ovrlapstrin.
			%
			% LIST = OverlappingStrInAv.GETSUBCLASSES() returns all subclasses of 'OverlappingStrInAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average ovrlapstrin M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingStrInAv') returns all subclasses of 'OverlappingStrInAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingStrInAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average ovrlapstrin.
			%
			% PROPS = OverlappingStrInAv.GETPROPS() returns the property list of average ovrlapstrin
			%  as a row vector.
			%
			% PROPS = OverlappingStrInAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average ovrlapstrin M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingStrInAv'[, CATEGORY]) returns the property list of 'OverlappingStrInAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					OverlappingStrIn.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						OverlappingStrIn.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						OverlappingStrIn.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average ovrlapstrin.
			%
			% N = OverlappingStrInAv.GETPROPNUMBER() returns the property number of average ovrlapstrin.
			%
			% N = OverlappingStrInAv.GETPROPNUMBER(CATEGORY) returns the property number of average ovrlapstrin
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average ovrlapstrin M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingStrInAv') returns the property number of 'OverlappingStrInAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingStrInAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average ovrlapstrin/error.
			%
			% CHECK = OverlappingStrInAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingStrInAv, PROP) checks whether PROP exists for OverlappingStrInAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%  Element.EXISTSPROP(OverlappingStrInAv, PROP) throws error if PROP does NOT exist for OverlappingStrInAv.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingStrInAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingStrInAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average ovrlapstrin/error.
			%
			% CHECK = OverlappingStrInAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingStrInAv, TAG) checks whether TAG exists for OverlappingStrInAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%  Element.EXISTSTAG(OverlappingStrInAv, TAG) throws error if TAG does NOT exist for OverlappingStrInAv.
			%   Error id: [BRAPH2:OverlappingStrInAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingstrinav_tag_list = cellfun(@(x) OverlappingStrInAv.getPropTag(x), num2cell(OverlappingStrInAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingstrinav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingStrInAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingStrInAv, POINTER) returns property number of POINTER of OverlappingStrInAv.
			%  PROPERTY = M.GETPROPPROP(OverlappingStrInAv, POINTER) returns property number of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingstrinav_tag_list = cellfun(@(x) OverlappingStrInAv.getPropTag(x), num2cell(OverlappingStrInAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingstrinav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingStrInAv, POINTER) returns tag of POINTER of OverlappingStrInAv.
			%  TAG = M.GETPROPTAG(OverlappingStrInAv, POINTER) returns tag of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingStrInAv')
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
						tag = getPropTag@OverlappingStrIn(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingStrInAv, POINTER) returns category of POINTER of OverlappingStrInAv.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingStrInAv, POINTER) returns category of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@OverlappingStrIn(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingStrInAv, POINTER) returns format of POINTER of OverlappingStrInAv.
			%  FORMAT = M.GETPROPFORMAT(OverlappingStrInAv, POINTER) returns format of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@OverlappingStrIn(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingStrInAv, POINTER) returns description of POINTER of OverlappingStrInAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingStrInAv, POINTER) returns description of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrInAv.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping strength.';
				case OverlappingStrInAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping strength.';
				case OverlappingStrInAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping strength.';
				case OverlappingStrInAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping strength.';
				case OverlappingStrInAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping strength.';
				case OverlappingStrInAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping strength.';
				case OverlappingStrInAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingStrInAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingStrInAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingStrInAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingStrInAv.M
					prop_description = 'M (result, cell) is the overlapping strength.';
				otherwise
					prop_description = getPropDescription@OverlappingStrIn(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingStrInAv, POINTER) returns settings of POINTER of OverlappingStrInAv.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingStrInAv, POINTER) returns settings of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrInAv.TEMPLATE
					prop_settings = 'OverlappingStrInAv';
				otherwise
					prop_settings = getPropSettings@OverlappingStrIn(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingStrInAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrInAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingStrInAv, POINTER) returns the default value of POINTER of OverlappingStrInAv.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingStrInAv, POINTER) returns the default value of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrInAv.NAME
					prop_default = 'OverlappingStrInAv';
				case OverlappingStrInAv.DESCRIPTION
					prop_default = 'The average overlapping in-strength of a graph is the average of the sum of the in-strengths of a node in all layers.';
				case OverlappingStrInAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingStrInAv.getPropSettings(prop));
				case OverlappingStrInAv.ID
					prop_default = 'OverlappingStrInAv ID';
				case OverlappingStrInAv.LABEL
					prop_default = 'OverlappingStrInAv label';
				case OverlappingStrInAv.NOTES
					prop_default = 'OverlappingStrInAv notes';
				case OverlappingStrInAv.SHAPE
					prop_default = Measure.GLOBAL;
				case OverlappingStrInAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingStrInAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingStrInAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD'};;
				otherwise
					prop_default = getPropDefault@OverlappingStrIn(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingStrInAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrInAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingStrInAv, POINTER) returns the conditioned default value of POINTER of OverlappingStrInAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingStrInAv, POINTER) returns the conditioned default value of POINTER of OverlappingStrInAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			prop_default = OverlappingStrInAv.conditioning(prop, OverlappingStrInAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingStrInAv, PROP, VALUE) checks VALUE format for PROP of OverlappingStrInAv.
			%  CHECK = M.CHECKPROP(OverlappingStrInAv, PROP, VALUE) checks VALUE format for PROP of OverlappingStrInAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingStrInAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingStrInAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingStrInAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrInAv.
			%   Error id: €BRAPH2.STR€:OverlappingStrInAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingStrInAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrInAv.
			%   Error id: €BRAPH2.STR€:OverlappingStrInAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingStrInAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingStrInAv.getPropProp(pointer);
			
			switch prop
				case OverlappingStrInAv.TEMPLATE % __OverlappingStrInAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingStrInAv.getPropSettings(prop));
				otherwise
					if prop <= OverlappingStrIn.getPropNumber()
						check = checkProp@OverlappingStrIn(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrInAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingStrInAv.getPropTag(prop) ' (' OverlappingStrInAv.getFormatTag(OverlappingStrInAv.getPropFormat(prop)) ').'] ...
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
				case OverlappingStrInAv.M % __OverlappingStrInAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingStrInAv.M), 'twister')
					
					g = m.get('G');  % graph from measure class
					overlapping_in_strength = calculateValue@OverlappingStrIn(m, prop);
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    value = {mean(cell2mat(overlapping_in_strength))};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= OverlappingStrIn.getPropNumber()
						value = calculateValue@OverlappingStrIn(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
