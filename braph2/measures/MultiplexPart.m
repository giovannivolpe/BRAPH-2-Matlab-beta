classdef MultiplexPart < Measure
	%MultiplexPart is the graph multiplex participation.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The multiplex participation is the nodal homogeneity of the number of 
	%  neighbours of a node across the layers. 
	% It is calculated as: Pi = L/(L - 1) [1 - sum_{l=1}^{L} (ki(l)/oi)^2] 
	%  where L is the number of layers, ki(l) is the degree in the l-th 
	%  layer and oi is the overlapping degree of the node. 
	% Pi = 1 when the degree is the same in all layers and Pi = 0 when a 
	%  node has non-zero degree in only one layer.
	%
	% MultiplexPart methods (constructor):
	%  MultiplexPart - constructor
	%
	% MultiplexPart methods:
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
	% MultiplexPart methods (display):
	%  tostring - string with information about the mxpart
	%  disp - displays information about the mxpart
	%  tree - displays the tree of the mxpart
	%
	% MultiplexPart methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two mxpart are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the mxpart
	%
	% MultiplexPart methods (save/load, Static):
	%  save - saves BRAPH2 mxpart as b2 file
	%  load - loads a BRAPH2 mxpart from a b2 file
	%
	% MultiplexPart method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the mxpart
	%
	% MultiplexPart method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the mxpart
	%
	% MultiplexPart methods (inspection, Static):
	%  getClass - returns the class of the mxpart
	%  getSubclasses - returns all subclasses of MultiplexPart
	%  getProps - returns the property list of the mxpart
	%  getPropNumber - returns the property number of the mxpart
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
	% MultiplexPart methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexPart methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexPart methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexPart methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexPart; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexPart constants</a>.
	%
	
	methods % constructor
		function m = MultiplexPart(varargin)
			%MultiplexPart() creates a mxpart.
			%
			% MultiplexPart(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexPart(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the mxpart.
			%
			% CLASS = MultiplexPart.GETCLASS() returns the class 'MultiplexPart'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the mxpart M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexPart') returns 'MultiplexPart'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexPart')
			%  are less computationally efficient.
			
			m_class = 'MultiplexPart';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the mxpart.
			%
			% LIST = MultiplexPart.GETSUBCLASSES() returns all subclasses of 'MultiplexPart'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the mxpart M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexPart') returns all subclasses of 'MultiplexPart'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexPart', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of mxpart.
			%
			% PROPS = MultiplexPart.GETPROPS() returns the property list of mxpart
			%  as a row vector.
			%
			% PROPS = MultiplexPart.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the mxpart M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexPart'[, CATEGORY]) returns the property list of 'MultiplexPart'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexPart')
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
			%GETPROPNUMBER returns the property number of mxpart.
			%
			% N = MultiplexPart.GETPROPNUMBER() returns the property number of mxpart.
			%
			% N = MultiplexPart.GETPROPNUMBER(CATEGORY) returns the property number of mxpart
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the mxpart M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexPart') returns the property number of 'MultiplexPart'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexPart.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in mxpart/error.
			%
			% CHECK = MultiplexPart.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexPart, PROP) checks whether PROP exists for MultiplexPart.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexPart:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%  Element.EXISTSPROP(MultiplexPart, PROP) throws error if PROP does NOT exist for MultiplexPart.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexPart.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexPart.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in mxpart/error.
			%
			% CHECK = MultiplexPart.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexPart, TAG) checks whether TAG exists for MultiplexPart.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexPart:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%  Element.EXISTSTAG(MultiplexPart, TAG) throws error if TAG does NOT exist for MultiplexPart.
			%   Error id: [BRAPH2:MultiplexPart:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexpart_tag_list = cellfun(@(x) MultiplexPart.getPropTag(x), num2cell(MultiplexPart.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexpart_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexPart.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexPart, POINTER) returns property number of POINTER of MultiplexPart.
			%  PROPERTY = M.GETPROPPROP(MultiplexPart, POINTER) returns property number of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexpart_tag_list = cellfun(@(x) MultiplexPart.getPropTag(x), num2cell(MultiplexPart.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexpart_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexPart, POINTER) returns tag of POINTER of MultiplexPart.
			%  TAG = M.GETPROPTAG(MultiplexPart, POINTER) returns tag of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexPart')
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexPart, POINTER) returns category of POINTER of MultiplexPart.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexPart, POINTER) returns category of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexPart, POINTER) returns format of POINTER of MultiplexPart.
			%  FORMAT = M.GETPROPFORMAT(MultiplexPart, POINTER) returns format of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexPart, POINTER) returns description of POINTER of MultiplexPart.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexPart, POINTER) returns description of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
			switch prop
				case MultiplexPart.NAME
					prop_description = 'NAME (constant, string) is the name of the multiplex participation.';
				case MultiplexPart.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the multiplex participation.';
				case MultiplexPart.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the multiplex participation.';
				case MultiplexPart.ID
					prop_description = 'ID (data, string) is a few-letter code of the multiplex participation.';
				case MultiplexPart.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the multiplex participation.';
				case MultiplexPart.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the multiplex participation.';
				case MultiplexPart.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexPart.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexPart.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexPart.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexPart.M
					prop_description = 'M (result, cell) is the multiplex participation.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexPart, POINTER) returns settings of POINTER of MultiplexPart.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexPart, POINTER) returns settings of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
			switch prop
				case MultiplexPart.TEMPLATE
					prop_settings = 'MultiplexPart';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexPart.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexPart.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexPart, POINTER) returns the default value of POINTER of MultiplexPart.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexPart, POINTER) returns the default value of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
			switch prop
				case MultiplexPart.NAME
					prop_default = 'MultiplexPart';
				case MultiplexPart.DESCRIPTION
					prop_default = 'The multiplex participation is the nodal homogeneity of the number of neighbours of a node across the layers. It is calculated as: Pi = L/(L - 1) [1 - sum_{l=1}^{L} (ki(l)/oi)^2] where L is the number of layers, ki(l) is the degree in the l-th layer and oi is the overlapping degree of the node. Pi = 1 when the degree is the same in all layers and Pi = 0 when a node has non-zero degree in only one layer.';
				case MultiplexPart.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexPart.getPropSettings(prop));
				case MultiplexPart.ID
					prop_default = 'MultiplexPart ID';
				case MultiplexPart.LABEL
					prop_default = 'MultiplexPart label';
				case MultiplexPart.NOTES
					prop_default = 'MultiplexPart notes';
				case MultiplexPart.SHAPE
					prop_default = Measure.NODAL;
				case MultiplexPart.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexPart.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexPart.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexPart.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexPart.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexPart, POINTER) returns the conditioned default value of POINTER of MultiplexPart.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexPart, POINTER) returns the conditioned default value of POINTER of MultiplexPart.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexPart.getPropProp(pointer);
			
			prop_default = MultiplexPart.conditioning(prop, MultiplexPart.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexPart, PROP, VALUE) checks VALUE format for PROP of MultiplexPart.
			%  CHECK = M.CHECKPROP(MultiplexPart, PROP, VALUE) checks VALUE format for PROP of MultiplexPart.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexPart:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexPart:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexPart, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexPart.
			%   Error id: €BRAPH2.STR€:MultiplexPart:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexPart, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexPart.
			%   Error id: €BRAPH2.STR€:MultiplexPart:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexPart')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexPart.getPropProp(pointer);
			
			switch prop
				case MultiplexPart.TEMPLATE % __MultiplexPart.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexPart.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexPart:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexPart.getPropTag(prop) ' (' MultiplexPart.getFormatTag(MultiplexPart.getPropFormat(prop)) ').'] ...
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
				case MultiplexPart.M % __MultiplexPart.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexPart.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    degree = Degree('G', g).get('M');
					    overlapping_degree = OverlappingDgr('G', g).get('M'); 
					    multiplex_participation = cell(length(ls), 1);
					    
					    count = 1;
					    for i = 1:1:length(ls)
					       multiplex_participation_partition = zeros(N(1), 1);
					        for li = count:1:ls(i) + count - 1
					            multiplex_participation_partition = multiplex_participation_partition + (degree{li}./overlapping_degree{i}).^2;
					        end
					        multiplex_participation_partition = ls(i) / (ls(i) - 1) * (1 - multiplex_participation_partition);
					        multiplex_participation_partition(isnan(multiplex_participation_partition)) = 0;  % Should return zeros, since NaN happens when strength = 0 and overlapping strength = 0 for all regions
					        count = count + ls(i);
					        multiplex_participation(i) = {multiplex_participation_partition};
					    end
					    value = multiplex_participation;
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
