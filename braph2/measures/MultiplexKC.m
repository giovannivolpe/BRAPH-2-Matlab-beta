classdef MultiplexKC < Measure
	%MultiplexKC is the graph  multiplex k-core.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The multiplex k-core of a graph is the largest subnetwork comprising nodes of overlapping degree k or higher. 
	% k is set by the user; the default value is equal to 1.
	%
	% MultiplexKC methods (constructor):
	%  MultiplexKC - constructor
	%
	% MultiplexKC methods:
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
	% MultiplexKC methods (display):
	%  tostring - string with information about the multiplex k-core
	%  disp - displays information about the multiplex k-core
	%  tree - displays the tree of the multiplex k-core
	%
	% MultiplexKC methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two multiplex k-core are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the multiplex k-core
	%
	% MultiplexKC methods (save/load, Static):
	%  save - saves BRAPH2 multiplex k-core as b2 file
	%  load - loads a BRAPH2 multiplex k-core from a b2 file
	%
	% MultiplexKC method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the multiplex k-core
	%
	% MultiplexKC method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the multiplex k-core
	%
	% MultiplexKC methods (inspection, Static):
	%  getClass - returns the class of the multiplex k-core
	%  getSubclasses - returns all subclasses of MultiplexKC
	%  getProps - returns the property list of the multiplex k-core
	%  getPropNumber - returns the property number of the multiplex k-core
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
	% MultiplexKC methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexKC methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexKC methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexKC methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexKC; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexKC constants</a>.
	%
	
	properties (Constant) % properties
		MULTIPLEXKCORETHRESHOLD = Measure.getPropNumber() + 1;
		MULTIPLEXKCORETHRESHOLD_TAG = 'MULTIPLEXKCORETHRESHOLD';
		MULTIPLEXKCORETHRESHOLD_CATEGORY = Category.PARAMETER;
		MULTIPLEXKCORETHRESHOLD_FORMAT = Format.SCALAR;
	end
	methods % constructor
		function m = MultiplexKC(varargin)
			%MultiplexKC() creates a multiplex k-core.
			%
			% MultiplexKC(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexKC(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Measure(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the multiplex k-core.
			%
			% CLASS = MultiplexKC.GETCLASS() returns the class 'MultiplexKC'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the multiplex k-core M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexKC') returns 'MultiplexKC'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexKC')
			%  are less computationally efficient.
			
			m_class = 'MultiplexKC';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the multiplex k-core.
			%
			% LIST = MultiplexKC.GETSUBCLASSES() returns all subclasses of 'MultiplexKC'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the multiplex k-core M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexKC') returns all subclasses of 'MultiplexKC'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexKC', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of multiplex k-core.
			%
			% PROPS = MultiplexKC.GETPROPS() returns the property list of multiplex k-core
			%  as a row vector.
			%
			% PROPS = MultiplexKC.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the multiplex k-core M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexKC'[, CATEGORY]) returns the property list of 'MultiplexKC'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Measure.getProps() ...
						MultiplexKC.MULTIPLEXKCORETHRESHOLD ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Measure.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Measure.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Measure.getProps(Category.PARAMETER) ...
						MultiplexKC.MULTIPLEXKCORETHRESHOLD ...
						];
				case Category.DATA
					prop_list = [ ...
						Measure.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Measure.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Measure.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Measure.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Measure.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Measure.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of multiplex k-core.
			%
			% N = MultiplexKC.GETPROPNUMBER() returns the property number of multiplex k-core.
			%
			% N = MultiplexKC.GETPROPNUMBER(CATEGORY) returns the property number of multiplex k-core
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the multiplex k-core M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexKC') returns the property number of 'MultiplexKC'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexKC.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in multiplex k-core/error.
			%
			% CHECK = MultiplexKC.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexKC, PROP) checks whether PROP exists for MultiplexKC.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexKC:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%  Element.EXISTSPROP(MultiplexKC, PROP) throws error if PROP does NOT exist for MultiplexKC.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexKC.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexKC.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in multiplex k-core/error.
			%
			% CHECK = MultiplexKC.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexKC, TAG) checks whether TAG exists for MultiplexKC.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexKC:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%  Element.EXISTSTAG(MultiplexKC, TAG) throws error if TAG does NOT exist for MultiplexKC.
			%   Error id: [BRAPH2:MultiplexKC:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexkc_tag_list = cellfun(@(x) MultiplexKC.getPropTag(x), num2cell(MultiplexKC.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexkc_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexKC.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexKC, POINTER) returns property number of POINTER of MultiplexKC.
			%  PROPERTY = M.GETPROPPROP(MultiplexKC, POINTER) returns property number of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexkc_tag_list = cellfun(@(x) MultiplexKC.getPropTag(x), num2cell(MultiplexKC.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexkc_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexKC, POINTER) returns tag of POINTER of MultiplexKC.
			%  TAG = M.GETPROPTAG(MultiplexKC, POINTER) returns tag of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case MultiplexKC.MULTIPLEXKCORETHRESHOLD
						tag = MultiplexKC.MULTIPLEXKCORETHRESHOLD_TAG;
					otherwise
						tag = getPropTag@Measure(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexKC, POINTER) returns category of POINTER of MultiplexKC.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexKC, POINTER) returns category of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD
					prop_category = MultiplexKC.MULTIPLEXKCORETHRESHOLD_CATEGORY;
				otherwise
					prop_category = getPropCategory@Measure(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexKC, POINTER) returns format of POINTER of MultiplexKC.
			%  FORMAT = M.GETPROPFORMAT(MultiplexKC, POINTER) returns format of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD
					prop_format = MultiplexKC.MULTIPLEXKCORETHRESHOLD_FORMAT;
				otherwise
					prop_format = getPropFormat@Measure(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexKC, POINTER) returns description of POINTER of MultiplexKC.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexKC, POINTER) returns description of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD
					prop_description = 'MULTIPLEXKCORETHRESHOLD (parameter, scalar) is the multiplex k-core threshold';
				case MultiplexKC.NAME
					prop_description = 'NAME (constant, string) is the name of the multiplex rich-club strength.';
				case MultiplexKC.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the multiplex rich-club strength.';
				case MultiplexKC.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the multiplex rich-club strength.';
				case MultiplexKC.ID
					prop_description = 'ID (data, string) is a few-letter code of the multiplex rich-club strength.';
				case MultiplexKC.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the multiplex rich-club strength.';
				case MultiplexKC.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the multiplex rich-club strength.';
				case MultiplexKC.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexKC.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexKC.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexKC.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexKC.M
					prop_description = 'M (result, cell) is the multiplex rich-club strength.';
				otherwise
					prop_description = getPropDescription@Measure(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexKC, POINTER) returns settings of POINTER of MultiplexKC.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexKC, POINTER) returns settings of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case MultiplexKC.TEMPLATE
					prop_settings = 'MultiplexKC';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexKC.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexKC.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexKC, POINTER) returns the default value of POINTER of MultiplexKC.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexKC, POINTER) returns the default value of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD
					prop_default = 1;
				case MultiplexKC.NAME
					prop_default = 'MultiplexKC';
				case MultiplexKC.DESCRIPTION
					prop_default = 'The multiplex k-core of a graph is the largest subnetwork comprising nodes of overlapping degree k or higher. k is set by the user; the default value is equal to 1.';
				case MultiplexKC.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexKC.getPropSettings(prop));
				case MultiplexKC.ID
					prop_default = 'MultiplexKC ID';
				case MultiplexKC.LABEL
					prop_default = 'MultiplexKC label';
				case MultiplexKC.NOTES
					prop_default = 'MultiplexKC notes';
				case MultiplexKC.SHAPE
					prop_default = Measure.BINODAL;
				case MultiplexKC.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexKC.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexKC.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexKC.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexKC.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexKC, POINTER) returns the conditioned default value of POINTER of MultiplexKC.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexKC, POINTER) returns the conditioned default value of POINTER of MultiplexKC.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			prop_default = MultiplexKC.conditioning(prop, MultiplexKC.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexKC, PROP, VALUE) checks VALUE format for PROP of MultiplexKC.
			%  CHECK = M.CHECKPROP(MultiplexKC, PROP, VALUE) checks VALUE format for PROP of MultiplexKC.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexKC:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexKC:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexKC, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexKC.
			%   Error id: €BRAPH2.STR€:MultiplexKC:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexKC, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexKC.
			%   Error id: €BRAPH2.STR€:MultiplexKC:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexKC')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexKC.getPropProp(pointer);
			
			switch prop
				case MultiplexKC.MULTIPLEXKCORETHRESHOLD % __MultiplexKC.MULTIPLEXKCORETHRESHOLD__
					check = Format.checkFormat(Format.SCALAR, value, MultiplexKC.getPropSettings(prop));
				case MultiplexKC.TEMPLATE % __MultiplexKC.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexKC.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKC:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexKC.getPropTag(prop) ' (' MultiplexKC.getFormatTag(MultiplexKC.getPropFormat(prop)) ').'] ...
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
				case MultiplexKC.M % __MultiplexKC.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexKC.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');  
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    multiplex_kcore_threshold = m.get('MULTIPLEXKCORETHRESHOLD');
					    assert(mod(multiplex_kcore_threshold, 1) == 0, ...
					        [BRAPH2.STR ':MultiplexKCore:' BRAPH2.WRONG_INPUT], ...
					        ['MultiplexKCore threshold must be an integer value ' ...
					        'while it is ' tostring(multiplex_kcore_threshold)])
					    
					    directionality_layer = g.get('DIRECTIONALITY_TYPE', l);
					    multiplex_k_core = cell(length(ls), 1);
					    for i = 1:1:length(ls)
					        A_sum = zeros(N(1), N(1));
					        for j = 1:1:length(l)
					            A_sum = A_sum + A{j, j};
					        end
					        iter = 0;
					        subAii = binarize(A_sum);
					        while 1
					            if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					                ovdeg = sum(subAii, 1)';   % ov. degree undirected 
					            else
					                ovdeg = (sum(subAii, 1)' + sum(subAii, 2));  % ov. degree directed
					            end
					         
					            % find nodes with degree < k
					            low_k_nodes = find((ovdeg < multiplex_kcore_threshold) & (ovdeg > 0));
					
					            % if none found -> stop
					            if (isempty(low_k_nodes)) break; end; %#ok<SEPEX>
					
					            % peel away found nodes
					            iter = iter + 1;
					            subAii(low_k_nodes, :) = 0;
					            subAii(:, low_k_nodes) = 0;
					        end
					        multiplex_k_core(i) = {subAii};  % add multiplex k-core 
					    end
					    value = multiplex_k_core;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Measure.getPropNumber()
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
