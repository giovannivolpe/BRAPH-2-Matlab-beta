classdef MultiplexCorePeriph < Multirich
	%MultiplexCorePeriph is the graph multiplex core-periphery.
	% It is a subclass of <a href="matlab:help Multirich">Multirich</a>.
	%
	% The multiplex core-periphery of a node is the value of the rank corresponding 
	%  to the maximum multirichness nodes. It returns 1 for a node belonging to the 
	%  core and zero otherwise. The relevance of each layer is controlled by the 
	%  multirichness coefficients that are between 0 and 1, and add up to one; 
	%  the default coefficients are (1/layernumber).
	%
	% MultiplexCorePeriph methods (constructor):
	%  MultiplexCorePeriph - constructor
	%
	% MultiplexCorePeriph methods:
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
	% MultiplexCorePeriph methods (display):
	%  tostring - string with information about the multiplex core-periphery
	%  disp - displays information about the multiplex core-periphery
	%  tree - displays the tree of the multiplex core-periphery
	%
	% MultiplexCorePeriph methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two multiplex core-periphery are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the multiplex core-periphery
	%
	% MultiplexCorePeriph methods (save/load, Static):
	%  save - saves BRAPH2 multiplex core-periphery as b2 file
	%  load - loads a BRAPH2 multiplex core-periphery from a b2 file
	%
	% MultiplexCorePeriph method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the multiplex core-periphery
	%
	% MultiplexCorePeriph method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the multiplex core-periphery
	%
	% MultiplexCorePeriph methods (inspection, Static):
	%  getClass - returns the class of the multiplex core-periphery
	%  getSubclasses - returns all subclasses of MultiplexCorePeriph
	%  getProps - returns the property list of the multiplex core-periphery
	%  getPropNumber - returns the property number of the multiplex core-periphery
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
	% MultiplexCorePeriph methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexCorePeriph methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexCorePeriph methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexCorePeriph methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexCorePeriph; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexCorePeriph constants</a>.
	%
	
	methods % constructor
		function m = MultiplexCorePeriph(varargin)
			%MultiplexCorePeriph() creates a multiplex core-periphery.
			%
			% MultiplexCorePeriph(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexCorePeriph(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Multirich(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the multiplex core-periphery.
			%
			% CLASS = MultiplexCorePeriph.GETCLASS() returns the class 'MultiplexCorePeriph'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the multiplex core-periphery M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexCorePeriph') returns 'MultiplexCorePeriph'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexCorePeriph')
			%  are less computationally efficient.
			
			m_class = 'MultiplexCorePeriph';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the multiplex core-periphery.
			%
			% LIST = MultiplexCorePeriph.GETSUBCLASSES() returns all subclasses of 'MultiplexCorePeriph'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the multiplex core-periphery M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexCorePeriph') returns all subclasses of 'MultiplexCorePeriph'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexCorePeriph', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of multiplex core-periphery.
			%
			% PROPS = MultiplexCorePeriph.GETPROPS() returns the property list of multiplex core-periphery
			%  as a row vector.
			%
			% PROPS = MultiplexCorePeriph.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the multiplex core-periphery M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexCorePeriph'[, CATEGORY]) returns the property list of 'MultiplexCorePeriph'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Multirich.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Multirich.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Multirich.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Multirich.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						Multirich.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Multirich.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Multirich.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Multirich.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Multirich.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Multirich.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of multiplex core-periphery.
			%
			% N = MultiplexCorePeriph.GETPROPNUMBER() returns the property number of multiplex core-periphery.
			%
			% N = MultiplexCorePeriph.GETPROPNUMBER(CATEGORY) returns the property number of multiplex core-periphery
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the multiplex core-periphery M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexCorePeriph') returns the property number of 'MultiplexCorePeriph'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexCorePeriph.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in multiplex core-periphery/error.
			%
			% CHECK = MultiplexCorePeriph.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexCorePeriph, PROP) checks whether PROP exists for MultiplexCorePeriph.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%  Element.EXISTSPROP(MultiplexCorePeriph, PROP) throws error if PROP does NOT exist for MultiplexCorePeriph.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexCorePeriph.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexCorePeriph.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in multiplex core-periphery/error.
			%
			% CHECK = MultiplexCorePeriph.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexCorePeriph, TAG) checks whether TAG exists for MultiplexCorePeriph.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%  Element.EXISTSTAG(MultiplexCorePeriph, TAG) throws error if TAG does NOT exist for MultiplexCorePeriph.
			%   Error id: [BRAPH2:MultiplexCorePeriph:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexcoreperiph_tag_list = cellfun(@(x) MultiplexCorePeriph.getPropTag(x), num2cell(MultiplexCorePeriph.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexcoreperiph_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexCorePeriph.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexCorePeriph, POINTER) returns property number of POINTER of MultiplexCorePeriph.
			%  PROPERTY = M.GETPROPPROP(MultiplexCorePeriph, POINTER) returns property number of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexcoreperiph_tag_list = cellfun(@(x) MultiplexCorePeriph.getPropTag(x), num2cell(MultiplexCorePeriph.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexcoreperiph_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexCorePeriph, POINTER) returns tag of POINTER of MultiplexCorePeriph.
			%  TAG = M.GETPROPTAG(MultiplexCorePeriph, POINTER) returns tag of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexCorePeriph')
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
						tag = getPropTag@Multirich(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexCorePeriph, POINTER) returns category of POINTER of MultiplexCorePeriph.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexCorePeriph, POINTER) returns category of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@Multirich(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexCorePeriph, POINTER) returns format of POINTER of MultiplexCorePeriph.
			%  FORMAT = M.GETPROPFORMAT(MultiplexCorePeriph, POINTER) returns format of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@Multirich(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexCorePeriph, POINTER) returns description of POINTER of MultiplexCorePeriph.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexCorePeriph, POINTER) returns description of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				case MultiplexCorePeriph.NAME
					prop_description = 'NAME (constant, string) is the name of the weighted multiplex particiption.';
				case MultiplexCorePeriph.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.';
				case MultiplexCorePeriph.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.';
				case MultiplexCorePeriph.ID
					prop_description = 'ID (data, string) is a few-letter code of the weighted multiplex particiption.';
				case MultiplexCorePeriph.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the weighted multiplex particiption.';
				case MultiplexCorePeriph.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.';
				case MultiplexCorePeriph.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexCorePeriph.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexCorePeriph.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexCorePeriph.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexCorePeriph.M
					prop_description = 'M (result, cell) is the weighted multiplex particiption.';
				otherwise
					prop_description = getPropDescription@Multirich(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexCorePeriph, POINTER) returns settings of POINTER of MultiplexCorePeriph.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexCorePeriph, POINTER) returns settings of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				case MultiplexCorePeriph.TEMPLATE
					prop_settings = 'MultiplexCorePeriph';
				otherwise
					prop_settings = getPropSettings@Multirich(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexCorePeriph.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexCorePeriph.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexCorePeriph, POINTER) returns the default value of POINTER of MultiplexCorePeriph.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexCorePeriph, POINTER) returns the default value of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				case MultiplexCorePeriph.NAME
					prop_default = 'MultiplexCorePeriph';
				case MultiplexCorePeriph.DESCRIPTION
					prop_default = 'The multiplex core-periphery of a node is the value of the rank corresponding to the maximum multirichness nodes. It returns 1 for a node belonging to the  core and zero otherwise. The relevance of each layer is controlled by the  multirichness coefficients that are between 0 and 1, and add up to one;  the default coefficients are (1/layernumber).';
				case MultiplexCorePeriph.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexCorePeriph.getPropSettings(prop));
				case MultiplexCorePeriph.ID
					prop_default = 'MultiplexCorePeriph ID';
				case MultiplexCorePeriph.LABEL
					prop_default = 'MultiplexCorePeriph label';
				case MultiplexCorePeriph.NOTES
					prop_default = 'MultiplexCorePeriph notes';
				case MultiplexCorePeriph.SHAPE
					prop_default = Measure.NODAL;
				case MultiplexCorePeriph.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexCorePeriph.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexCorePeriph.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Multirich(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexCorePeriph.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexCorePeriph.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexCorePeriph, POINTER) returns the conditioned default value of POINTER of MultiplexCorePeriph.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexCorePeriph, POINTER) returns the conditioned default value of POINTER of MultiplexCorePeriph.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			prop_default = MultiplexCorePeriph.conditioning(prop, MultiplexCorePeriph.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexCorePeriph, PROP, VALUE) checks VALUE format for PROP of MultiplexCorePeriph.
			%  CHECK = M.CHECKPROP(MultiplexCorePeriph, PROP, VALUE) checks VALUE format for PROP of MultiplexCorePeriph.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexCorePeriph:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexCorePeriph:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexCorePeriph, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexCorePeriph.
			%   Error id: €BRAPH2.STR€:MultiplexCorePeriph:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexCorePeriph, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexCorePeriph.
			%   Error id: €BRAPH2.STR€:MultiplexCorePeriph:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexCorePeriph')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexCorePeriph.getPropProp(pointer);
			
			switch prop
				case MultiplexCorePeriph.TEMPLATE % __MultiplexCorePeriph.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexCorePeriph.getPropSettings(prop));
				otherwise
					if prop <= Multirich.getPropNumber()
						check = checkProp@Multirich(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexCorePeriph:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexCorePeriph.getPropTag(prop) ' (' MultiplexCorePeriph.getFormatTag(MultiplexCorePeriph.getPropFormat(prop)) ').'] ...
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
				case MultiplexCorePeriph.M % __MultiplexCorePeriph.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexCorePeriph.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					multirichness = calculateValue@Multirich(m, prop);
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    multirichness_coefficients = m.get('MULTIRICHNESS_COEFFICIENTS');
					    assert(length(multirichness_coefficients) == ls(1) || all(multirichness_coefficients == 0), ...
					        [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
					        ['Multirichness coefficients must have the same length than the ' ...
					        'number of layers (' tostring(ls(1)) ') while its length is ' tostring(length(multirichness_coefficients))])
					
					    if length(multirichness_coefficients) == ls(1)
					        assert(all(multirichness_coefficients <= 1) && all(multirichness_coefficients >= 0), ...
					            [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
					            ['Multirichness coefficients must be between 0 and 1 ' ...
					            'while they are ' tostring(multirichness_coefficients)])
					        c = multirichness_coefficients;
					
					    else  % same relevance for each layer
					        c = ones(1, l)/ls(1);
					    end
					
					    directionality_layer =  g.get('DIRECTIONALITY_TYPE', l);
					    connectivity_layer =  g.get('CONNECTIVITY_TYPE', l);
					    multiplex_core_periphery = cell(length(ls), 1);
					    count = 1;
					    for i = 1:1:length(ls)
					        overlapping_coefficients = zeros(N(1), 1);
					        multiplex_core_periphery_partition = zeros(N(1), 1);
					        for li = count:1:ls(i) + count - 1
					            if connectivity_layer == Graph.WEIGHTED  % weighted graphs
					                if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					
					                    strength = Strength('G', g).get('M');
					                    deg = strength{li};
					
					                else  % directed graphs
					
					                    in_strength = StrengthIn('G', g).get('M');
					                    out_strength = StrengthOut('G', g).get('M');
					                    deg = (in_strength{li} + out_strength{li})/2;
					                end
					
					            else  % binary graphs
					                if directionality_layer == Graph.UNDIRECTED  % undirected graphs
					
					                    degree = Degree('G', g).get('M');
					                    deg = degree{li};
					
					                else  % directed graphs
					
					                    in_degree = DegreeIn('G', g).get('M');
					                    out_degree = DegreeOut('G', g).get('M');
					                    deg = (in_degree{li} + out_degree{li})/2;
					                end
					            end
					            overlapping_coefficients = overlapping_coefficients + c(li)*deg;
					        end
					        [~, rankingInd] = sort(overlapping_coefficients, 'descend');
					        multirichness_partition = multirichness{i};
					        [~, rankOfMaxMultirichness] = max(multirichness_partition(rankingInd));  
					        multiplex_core_periphery_partition(rankingInd(1:rankOfMaxMultirichness)) = 1;
					        count = count + ls(i);
					        multiplex_core_periphery(i) = {multiplex_core_periphery_partition};
					    end
					    value = multiplex_core_periphery;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Multirich.getPropNumber()
						value = calculateValue@Multirich(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
