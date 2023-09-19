classdef MultiplexClustrAv < MultiplexClustr
	%MultiplexClustrAv is the graph average weighted multiplex clustering.
	% It is a subclass of <a href="matlab:help MultiplexClustr">MultiplexClustr</a>.
	%
	% The average multiplex clustering coefficient of a multilayer graph is 
	%   the average of the two-multiplex clustering coefficients of all nodes.
	%
	% MultiplexClustrAv methods (constructor):
	%  MultiplexClustrAv - constructor
	%
	% MultiplexClustrAv methods:
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
	% MultiplexClustrAv methods (display):
	%  tostring - string with information about the average weighted clustering
	%  disp - displays information about the average weighted clustering
	%  tree - displays the tree of the average weighted clustering
	%
	% MultiplexClustrAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average weighted clustering are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average weighted clustering
	%
	% MultiplexClustrAv methods (save/load, Static):
	%  save - saves BRAPH2 average weighted clustering as b2 file
	%  load - loads a BRAPH2 average weighted clustering from a b2 file
	%
	% MultiplexClustrAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average weighted clustering
	%
	% MultiplexClustrAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average weighted clustering
	%
	% MultiplexClustrAv methods (inspection, Static):
	%  getClass - returns the class of the average weighted clustering
	%  getSubclasses - returns all subclasses of MultiplexClustrAv
	%  getProps - returns the property list of the average weighted clustering
	%  getPropNumber - returns the property number of the average weighted clustering
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
	% MultiplexClustrAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexClustrAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexClustrAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexClustrAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexClustrAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexClustrAv constants</a>.
	%
	
	methods % constructor
		function m = MultiplexClustrAv(varargin)
			%MultiplexClustrAv() creates a average weighted clustering.
			%
			% MultiplexClustrAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexClustrAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@MultiplexClustr(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average weighted clustering.
			%
			% CLASS = MultiplexClustrAv.GETCLASS() returns the class 'MultiplexClustrAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average weighted clustering M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexClustrAv') returns 'MultiplexClustrAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexClustrAv')
			%  are less computationally efficient.
			
			m_class = 'MultiplexClustrAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average weighted clustering.
			%
			% LIST = MultiplexClustrAv.GETSUBCLASSES() returns all subclasses of 'MultiplexClustrAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average weighted clustering M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexClustrAv') returns all subclasses of 'MultiplexClustrAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexClustrAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average weighted clustering.
			%
			% PROPS = MultiplexClustrAv.GETPROPS() returns the property list of average weighted clustering
			%  as a row vector.
			%
			% PROPS = MultiplexClustrAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average weighted clustering M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexClustrAv'[, CATEGORY]) returns the property list of 'MultiplexClustrAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					MultiplexClustr.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						MultiplexClustr.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						MultiplexClustr.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						MultiplexClustr.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						MultiplexClustr.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						MultiplexClustr.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						MultiplexClustr.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						MultiplexClustr.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						MultiplexClustr.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						MultiplexClustr.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average weighted clustering.
			%
			% N = MultiplexClustrAv.GETPROPNUMBER() returns the property number of average weighted clustering.
			%
			% N = MultiplexClustrAv.GETPROPNUMBER(CATEGORY) returns the property number of average weighted clustering
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average weighted clustering M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexClustrAv') returns the property number of 'MultiplexClustrAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexClustrAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average weighted clustering/error.
			%
			% CHECK = MultiplexClustrAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexClustrAv, PROP) checks whether PROP exists for MultiplexClustrAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%  Element.EXISTSPROP(MultiplexClustrAv, PROP) throws error if PROP does NOT exist for MultiplexClustrAv.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexClustrAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexClustrAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average weighted clustering/error.
			%
			% CHECK = MultiplexClustrAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexClustrAv, TAG) checks whether TAG exists for MultiplexClustrAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%  Element.EXISTSTAG(MultiplexClustrAv, TAG) throws error if TAG does NOT exist for MultiplexClustrAv.
			%   Error id: [BRAPH2:MultiplexClustrAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexclustrav_tag_list = cellfun(@(x) MultiplexClustrAv.getPropTag(x), num2cell(MultiplexClustrAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexclustrav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexClustrAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexClustrAv, POINTER) returns property number of POINTER of MultiplexClustrAv.
			%  PROPERTY = M.GETPROPPROP(MultiplexClustrAv, POINTER) returns property number of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexclustrav_tag_list = cellfun(@(x) MultiplexClustrAv.getPropTag(x), num2cell(MultiplexClustrAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexclustrav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexClustrAv, POINTER) returns tag of POINTER of MultiplexClustrAv.
			%  TAG = M.GETPROPTAG(MultiplexClustrAv, POINTER) returns tag of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexClustrAv')
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
						tag = getPropTag@MultiplexClustr(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexClustrAv, POINTER) returns category of POINTER of MultiplexClustrAv.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexClustrAv, POINTER) returns category of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@MultiplexClustr(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexClustrAv, POINTER) returns format of POINTER of MultiplexClustrAv.
			%  FORMAT = M.GETPROPFORMAT(MultiplexClustrAv, POINTER) returns format of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@MultiplexClustr(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexClustrAv, POINTER) returns description of POINTER of MultiplexClustrAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexClustrAv, POINTER) returns description of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				case MultiplexClustrAv.NAME
					prop_description = 'NAME (constant, string) is the name of the weighted multiplex particiption.';
				case MultiplexClustrAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.';
				case MultiplexClustrAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.';
				case MultiplexClustrAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the weighted multiplex particiption.';
				case MultiplexClustrAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the weighted multiplex particiption.';
				case MultiplexClustrAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.';
				case MultiplexClustrAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexClustrAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexClustrAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexClustrAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexClustrAv.M
					prop_description = 'M (result, cell) is the weighted multiplex particiption.';
				otherwise
					prop_description = getPropDescription@MultiplexClustr(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexClustrAv, POINTER) returns settings of POINTER of MultiplexClustrAv.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexClustrAv, POINTER) returns settings of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				case MultiplexClustrAv.TEMPLATE
					prop_settings = 'MultiplexClustrAv';
				otherwise
					prop_settings = getPropSettings@MultiplexClustr(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexClustrAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClustrAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexClustrAv, POINTER) returns the default value of POINTER of MultiplexClustrAv.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexClustrAv, POINTER) returns the default value of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				case MultiplexClustrAv.NAME
					prop_default = 'MultiplexClustrAv';
				case MultiplexClustrAv.DESCRIPTION
					prop_default = 'The average multiplex clustering coefficient of a multilayer graph is the average of the two-multiplex clustering coefficients of all nodes.';
				case MultiplexClustrAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexClustrAv.getPropSettings(prop));
				case MultiplexClustrAv.ID
					prop_default = 'MultiplexClustrAv ID';
				case MultiplexClustrAv.LABEL
					prop_default = 'MultiplexClustrAv label';
				case MultiplexClustrAv.NOTES
					prop_default = 'MultiplexClustrAv notes';
				case MultiplexClustrAv.SHAPE
					prop_default = Measure.GLOBAL;
				case MultiplexClustrAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexClustrAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexClustrAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@MultiplexClustr(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexClustrAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClustrAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexClustrAv, POINTER) returns the conditioned default value of POINTER of MultiplexClustrAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexClustrAv, POINTER) returns the conditioned default value of POINTER of MultiplexClustrAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			prop_default = MultiplexClustrAv.conditioning(prop, MultiplexClustrAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexClustrAv, PROP, VALUE) checks VALUE format for PROP of MultiplexClustrAv.
			%  CHECK = M.CHECKPROP(MultiplexClustrAv, PROP, VALUE) checks VALUE format for PROP of MultiplexClustrAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexClustrAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexClustrAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexClustrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClustrAv.
			%   Error id: €BRAPH2.STR€:MultiplexClustrAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexClustrAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClustrAv.
			%   Error id: €BRAPH2.STR€:MultiplexClustrAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexClustrAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexClustrAv.getPropProp(pointer);
			
			switch prop
				case MultiplexClustrAv.TEMPLATE % __MultiplexClustrAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexClustrAv.getPropSettings(prop));
				otherwise
					if prop <= MultiplexClustr.getPropNumber()
						check = checkProp@MultiplexClustr(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustrAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexClustrAv.getPropTag(prop) ' (' MultiplexClustrAv.getFormatTag(MultiplexClustrAv.getPropFormat(prop)) ').'] ...
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
				case MultiplexClustrAv.M % __MultiplexClustrAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexClustrAv.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    multiplex_clustering = calculateValue@MultiplexClustr(m, prop);
					    multiplex_clustering_av = cell(length(ls), 1);
					
					    for i=1:length(ls)
					        multiplex_clustering_av(i) = {mean(multiplex_clustering{i})};
					    end
					    value = multiplex_clustering_av;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= MultiplexClustr.getPropNumber()
						value = calculateValue@MultiplexClustr(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
