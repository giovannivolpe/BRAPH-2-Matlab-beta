classdef MultiplexKCCentrality < Measure
	%MultiplexKCCentrality is the graph multiplex k-coreness centrality.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The multiplex k-coreness centrality of a node is k if the node belongs to the k-core 
	% but not to the (k+1)-core.
	%
	% MultiplexKCCentrality methods (constructor):
	%  MultiplexKCCentrality - constructor
	%
	% MultiplexKCCentrality methods:
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
	% MultiplexKCCentrality methods (display):
	%  tostring - string with information about the multiplex k-coreness centrality
	%  disp - displays information about the multiplex k-coreness centrality
	%  tree - displays the tree of the multiplex k-coreness centrality
	%
	% MultiplexKCCentrality methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two multiplex k-coreness centrality are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the multiplex k-coreness centrality
	%
	% MultiplexKCCentrality methods (save/load, Static):
	%  save - saves BRAPH2 multiplex k-coreness centrality as b2 file
	%  load - loads a BRAPH2 multiplex k-coreness centrality from a b2 file
	%
	% MultiplexKCCentrality method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the multiplex k-coreness centrality
	%
	% MultiplexKCCentrality method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the multiplex k-coreness centrality
	%
	% MultiplexKCCentrality methods (inspection, Static):
	%  getClass - returns the class of the multiplex k-coreness centrality
	%  getSubclasses - returns all subclasses of MultiplexKCCentrality
	%  getProps - returns the property list of the multiplex k-coreness centrality
	%  getPropNumber - returns the property number of the multiplex k-coreness centrality
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
	% MultiplexKCCentrality methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexKCCentrality methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexKCCentrality methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexKCCentrality methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexKCCentrality; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexKCCentrality constants</a>.
	%
	
	methods % constructor
		function m = MultiplexKCCentrality(varargin)
			%MultiplexKCCentrality() creates a multiplex k-coreness centrality.
			%
			% MultiplexKCCentrality(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexKCCentrality(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the multiplex k-coreness centrality.
			%
			% CLASS = MultiplexKCCentrality.GETCLASS() returns the class 'MultiplexKCCentrality'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the multiplex k-coreness centrality M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexKCCentrality') returns 'MultiplexKCCentrality'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexKCCentrality')
			%  are less computationally efficient.
			
			m_class = 'MultiplexKCCentrality';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the multiplex k-coreness centrality.
			%
			% LIST = MultiplexKCCentrality.GETSUBCLASSES() returns all subclasses of 'MultiplexKCCentrality'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the multiplex k-coreness centrality M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexKCCentrality') returns all subclasses of 'MultiplexKCCentrality'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexKCCentrality', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of multiplex k-coreness centrality.
			%
			% PROPS = MultiplexKCCentrality.GETPROPS() returns the property list of multiplex k-coreness centrality
			%  as a row vector.
			%
			% PROPS = MultiplexKCCentrality.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the multiplex k-coreness centrality M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexKCCentrality'[, CATEGORY]) returns the property list of 'MultiplexKCCentrality'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Measure.getProps() ...
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
			%GETPROPNUMBER returns the property number of multiplex k-coreness centrality.
			%
			% N = MultiplexKCCentrality.GETPROPNUMBER() returns the property number of multiplex k-coreness centrality.
			%
			% N = MultiplexKCCentrality.GETPROPNUMBER(CATEGORY) returns the property number of multiplex k-coreness centrality
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the multiplex k-coreness centrality M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexKCCentrality') returns the property number of 'MultiplexKCCentrality'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexKCCentrality.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in multiplex k-coreness centrality/error.
			%
			% CHECK = MultiplexKCCentrality.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexKCCentrality, PROP) checks whether PROP exists for MultiplexKCCentrality.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%  Element.EXISTSPROP(MultiplexKCCentrality, PROP) throws error if PROP does NOT exist for MultiplexKCCentrality.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexKCCentrality.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexKCCentrality.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in multiplex k-coreness centrality/error.
			%
			% CHECK = MultiplexKCCentrality.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexKCCentrality, TAG) checks whether TAG exists for MultiplexKCCentrality.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%  Element.EXISTSTAG(MultiplexKCCentrality, TAG) throws error if TAG does NOT exist for MultiplexKCCentrality.
			%   Error id: [BRAPH2:MultiplexKCCentrality:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexkccentrality_tag_list = cellfun(@(x) MultiplexKCCentrality.getPropTag(x), num2cell(MultiplexKCCentrality.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexkccentrality_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexKCCentrality.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexKCCentrality, POINTER) returns property number of POINTER of MultiplexKCCentrality.
			%  PROPERTY = M.GETPROPPROP(MultiplexKCCentrality, POINTER) returns property number of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexkccentrality_tag_list = cellfun(@(x) MultiplexKCCentrality.getPropTag(x), num2cell(MultiplexKCCentrality.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexkccentrality_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexKCCentrality, POINTER) returns tag of POINTER of MultiplexKCCentrality.
			%  TAG = M.GETPROPTAG(MultiplexKCCentrality, POINTER) returns tag of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexKCCentrality')
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexKCCentrality, POINTER) returns category of POINTER of MultiplexKCCentrality.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexKCCentrality, POINTER) returns category of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexKCCentrality, POINTER) returns format of POINTER of MultiplexKCCentrality.
			%  FORMAT = M.GETPROPFORMAT(MultiplexKCCentrality, POINTER) returns format of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexKCCentrality, POINTER) returns description of POINTER of MultiplexKCCentrality.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexKCCentrality, POINTER) returns description of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
				case MultiplexKCCentrality.NAME
					prop_description = 'NAME (constant, string) is the name of the multiplex rich-club strength.';
				case MultiplexKCCentrality.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the multiplex rich-club strength.';
				case MultiplexKCCentrality.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the multiplex rich-club strength.';
				case MultiplexKCCentrality.ID
					prop_description = 'ID (data, string) is a few-letter code of the multiplex rich-club strength.';
				case MultiplexKCCentrality.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the multiplex rich-club strength.';
				case MultiplexKCCentrality.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the multiplex rich-club strength.';
				case MultiplexKCCentrality.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexKCCentrality.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexKCCentrality.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexKCCentrality.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexKCCentrality.M
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexKCCentrality, POINTER) returns settings of POINTER of MultiplexKCCentrality.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexKCCentrality, POINTER) returns settings of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
				case MultiplexKCCentrality.TEMPLATE
					prop_settings = 'MultiplexKCCentrality';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexKCCentrality.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexKCCentrality.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexKCCentrality, POINTER) returns the default value of POINTER of MultiplexKCCentrality.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexKCCentrality, POINTER) returns the default value of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
				case MultiplexKCCentrality.NAME
					prop_default = 'MultiplexKCCentrality';
				case MultiplexKCCentrality.DESCRIPTION
					prop_default = 'The multiplex k-coreness centrality of a node is k if the node belongs to the k-core but not to the (k+1)-core.';
				case MultiplexKCCentrality.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexKCCentrality.getPropSettings(prop));
				case MultiplexKCCentrality.ID
					prop_default = 'MultiplexKCCentrality ID';
				case MultiplexKCCentrality.LABEL
					prop_default = 'MultiplexKCCentrality label';
				case MultiplexKCCentrality.NOTES
					prop_default = 'MultiplexKCCentrality notes';
				case MultiplexKCCentrality.SHAPE
					prop_default = Measure.NODAL;
				case MultiplexKCCentrality.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexKCCentrality.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexKCCentrality.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexKCCentrality.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexKCCentrality.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexKCCentrality, POINTER) returns the conditioned default value of POINTER of MultiplexKCCentrality.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexKCCentrality, POINTER) returns the conditioned default value of POINTER of MultiplexKCCentrality.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			prop_default = MultiplexKCCentrality.conditioning(prop, MultiplexKCCentrality.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexKCCentrality, PROP, VALUE) checks VALUE format for PROP of MultiplexKCCentrality.
			%  CHECK = M.CHECKPROP(MultiplexKCCentrality, PROP, VALUE) checks VALUE format for PROP of MultiplexKCCentrality.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexKCCentrality:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexKCCentrality:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexKCCentrality, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexKCCentrality.
			%   Error id: €BRAPH2.STR€:MultiplexKCCentrality:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexKCCentrality, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexKCCentrality.
			%   Error id: €BRAPH2.STR€:MultiplexKCCentrality:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexKCCentrality')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexKCCentrality.getPropProp(pointer);
			
			switch prop
				case MultiplexKCCentrality.TEMPLATE % __MultiplexKCCentrality.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexKCCentrality.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexKCCentrality:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexKCCentrality.getPropTag(prop) ' (' MultiplexKCCentrality.getFormatTag(MultiplexKCCentrality.getPropFormat(prop)) ').'] ...
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
				case MultiplexKCCentrality.M % __MultiplexKCCentrality.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexKCCentrality.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');  
					
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    multiplex_k_coreness_centrality = cell(length(ls), 1);
					    directionality_layer = g.get('DIRECTIONALITY_TYPE', l);
					    for i = 1:1:length(ls)
					        A_sum = zeros(N(1), N(1));
					        for j = 1:1:length(l)
					            A_sum = A_sum + A{j, j};
					        end
					        multiplex_coreness = zeros(1, N(1));
					        for k = 1:N(1)
					            m_k_core = calculate_multiplexkcore(A_sum, k, directionality_layer);
					            ss = sum(m_k_core) > 0;
					            multiplex_coreness(ss) = k;
					        end
					        multiplex_k_coreness_centrality(i) = {multiplex_coreness'};
					    end
					    value = multiplex_k_coreness_centrality;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Measure.getPropNumber()
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
			function m_k_core = calculate_multiplexkcore(A, k, directionality_layer)
			    % CALCULATE MKCORE calculates the multiplex k-core value of a supra-adjacency matrix
			    %
			    % MKCORE = CALCULATEMULTIPLEXKCORE(M, A, k, directionality_layer) returns
			    % the value of the multiplex k-core of a supra-adjacency matrix
			    
			    iter = 0;
			    subAii = binarize(A);
			    while 1
			        % get degrees of matrix
			        if directionality_layer == Graph.UNDIRECTED  % undirected graphs
			            ovdeg = sum(subAii, 1)';  % degree undirected graphs
			        else
			            ovdeg = (sum(subAii, 1)' + sum(subAii, 2));  % degree directed
			        end
			    
			        % find nodes with degree < k
			        low_k_nodes = find((ovdeg < k) & (ovdeg > 0));
			    
			        % if none found -> stop
			        if (isempty(low_k_nodes)) break; end; %#ok<SEPEX>
			    
			        % peel away found nodes
			        iter = iter + 1;
			        subAii(low_k_nodes, :) = 0;
			        subAii(:, low_k_nodes) = 0;
			    end
			    m_k_core = subAii;  % add k-core of layer li
			end
		end
	end
end
