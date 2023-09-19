classdef WeightedMxPartiAv < WeightedMxParti
	%WeightedMxPartiAv is the graph average weighted multiplex participation.
	% It is a subclass of <a href="matlab:help WeightedMxParti">WeightedMxParti</a>.
	%
	% The average weighted multiplex participation of a graph is the average homogeneity 
	% of its number of neighbours across the layers.
	%
	% WeightedMxPartiAv methods (constructor):
	%  WeightedMxPartiAv - constructor
	%
	% WeightedMxPartiAv methods:
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
	% WeightedMxPartiAv methods (display):
	%  tostring - string with information about the average weighted mxpart
	%  disp - displays information about the average weighted mxpart
	%  tree - displays the tree of the average weighted mxpart
	%
	% WeightedMxPartiAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average weighted mxpart are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average weighted mxpart
	%
	% WeightedMxPartiAv methods (save/load, Static):
	%  save - saves BRAPH2 average weighted mxpart as b2 file
	%  load - loads a BRAPH2 average weighted mxpart from a b2 file
	%
	% WeightedMxPartiAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average weighted mxpart
	%
	% WeightedMxPartiAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average weighted mxpart
	%
	% WeightedMxPartiAv methods (inspection, Static):
	%  getClass - returns the class of the average weighted mxpart
	%  getSubclasses - returns all subclasses of WeightedMxPartiAv
	%  getProps - returns the property list of the average weighted mxpart
	%  getPropNumber - returns the property number of the average weighted mxpart
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
	% WeightedMxPartiAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% WeightedMxPartiAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% WeightedMxPartiAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% WeightedMxPartiAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?WeightedMxPartiAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">WeightedMxPartiAv constants</a>.
	%
	
	methods % constructor
		function m = WeightedMxPartiAv(varargin)
			%WeightedMxPartiAv() creates a average weighted mxpart.
			%
			% WeightedMxPartiAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% WeightedMxPartiAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@WeightedMxParti(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average weighted mxpart.
			%
			% CLASS = WeightedMxPartiAv.GETCLASS() returns the class 'WeightedMxPartiAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average weighted mxpart M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('WeightedMxPartiAv') returns 'WeightedMxPartiAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('WeightedMxPartiAv')
			%  are less computationally efficient.
			
			m_class = 'WeightedMxPartiAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average weighted mxpart.
			%
			% LIST = WeightedMxPartiAv.GETSUBCLASSES() returns all subclasses of 'WeightedMxPartiAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average weighted mxpart M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('WeightedMxPartiAv') returns all subclasses of 'WeightedMxPartiAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('WeightedMxPartiAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average weighted mxpart.
			%
			% PROPS = WeightedMxPartiAv.GETPROPS() returns the property list of average weighted mxpart
			%  as a row vector.
			%
			% PROPS = WeightedMxPartiAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average weighted mxpart M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('WeightedMxPartiAv'[, CATEGORY]) returns the property list of 'WeightedMxPartiAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					WeightedMxParti.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						WeightedMxParti.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						WeightedMxParti.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						WeightedMxParti.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						WeightedMxParti.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						WeightedMxParti.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						WeightedMxParti.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						WeightedMxParti.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						WeightedMxParti.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						WeightedMxParti.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average weighted mxpart.
			%
			% N = WeightedMxPartiAv.GETPROPNUMBER() returns the property number of average weighted mxpart.
			%
			% N = WeightedMxPartiAv.GETPROPNUMBER(CATEGORY) returns the property number of average weighted mxpart
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average weighted mxpart M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('WeightedMxPartiAv') returns the property number of 'WeightedMxPartiAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(WeightedMxPartiAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average weighted mxpart/error.
			%
			% CHECK = WeightedMxPartiAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(WeightedMxPartiAv, PROP) checks whether PROP exists for WeightedMxPartiAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%  Element.EXISTSPROP(WeightedMxPartiAv, PROP) throws error if PROP does NOT exist for WeightedMxPartiAv.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == WeightedMxPartiAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for WeightedMxPartiAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average weighted mxpart/error.
			%
			% CHECK = WeightedMxPartiAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(WeightedMxPartiAv, TAG) checks whether TAG exists for WeightedMxPartiAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%  Element.EXISTSTAG(WeightedMxPartiAv, TAG) throws error if TAG does NOT exist for WeightedMxPartiAv.
			%   Error id: [BRAPH2:WeightedMxPartiAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			weightedmxpartiav_tag_list = cellfun(@(x) WeightedMxPartiAv.getPropTag(x), num2cell(WeightedMxPartiAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, weightedmxpartiav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for WeightedMxPartiAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(WeightedMxPartiAv, POINTER) returns property number of POINTER of WeightedMxPartiAv.
			%  PROPERTY = M.GETPROPPROP(WeightedMxPartiAv, POINTER) returns property number of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				weightedmxpartiav_tag_list = cellfun(@(x) WeightedMxPartiAv.getPropTag(x), num2cell(WeightedMxPartiAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, weightedmxpartiav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(WeightedMxPartiAv, POINTER) returns tag of POINTER of WeightedMxPartiAv.
			%  TAG = M.GETPROPTAG(WeightedMxPartiAv, POINTER) returns tag of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('WeightedMxPartiAv')
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
						tag = getPropTag@WeightedMxParti(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(WeightedMxPartiAv, POINTER) returns category of POINTER of WeightedMxPartiAv.
			%  CATEGORY = M.GETPROPCATEGORY(WeightedMxPartiAv, POINTER) returns category of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@WeightedMxParti(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(WeightedMxPartiAv, POINTER) returns format of POINTER of WeightedMxPartiAv.
			%  FORMAT = M.GETPROPFORMAT(WeightedMxPartiAv, POINTER) returns format of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@WeightedMxParti(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(WeightedMxPartiAv, POINTER) returns description of POINTER of WeightedMxPartiAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(WeightedMxPartiAv, POINTER) returns description of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				case WeightedMxPartiAv.NAME
					prop_description = 'NAME (constant, string) is the name of the weighted multiplex particiption.';
				case WeightedMxPartiAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.';
				case WeightedMxPartiAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.';
				case WeightedMxPartiAv.ID
					prop_description = 'ID (data, string) is a few-letter code of the weighted multiplex particiption.';
				case WeightedMxPartiAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the weighted multiplex particiption.';
				case WeightedMxPartiAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.';
				case WeightedMxPartiAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case WeightedMxPartiAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case WeightedMxPartiAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case WeightedMxPartiAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case WeightedMxPartiAv.M
					prop_description = 'M (result, cell) is the weighted multiplex particiption.';
				otherwise
					prop_description = getPropDescription@WeightedMxParti(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(WeightedMxPartiAv, POINTER) returns settings of POINTER of WeightedMxPartiAv.
			%  SETTINGS = M.GETPROPSETTINGS(WeightedMxPartiAv, POINTER) returns settings of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				case WeightedMxPartiAv.TEMPLATE
					prop_settings = 'WeightedMxPartiAv';
				otherwise
					prop_settings = getPropSettings@WeightedMxParti(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = WeightedMxPartiAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = WeightedMxPartiAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(WeightedMxPartiAv, POINTER) returns the default value of POINTER of WeightedMxPartiAv.
			%  DEFAULT = M.GETPROPDEFAULT(WeightedMxPartiAv, POINTER) returns the default value of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				case WeightedMxPartiAv.NAME
					prop_default = 'WeightedMxPartiAv';
				case WeightedMxPartiAv.DESCRIPTION
					prop_default = 'The weighted multiplex participation of a graph is the nodal homogeneity of its number of inward neighbours across the layers.';
				case WeightedMxPartiAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, WeightedMxPartiAv.getPropSettings(prop));
				case WeightedMxPartiAv.ID
					prop_default = 'WeightedMxPartiAv ID';
				case WeightedMxPartiAv.LABEL
					prop_default = 'WeightedMxPartiAv label';
				case WeightedMxPartiAv.NOTES
					prop_default = 'WeightedMxPartiAv notes';
				case WeightedMxPartiAv.SHAPE
					prop_default = Measure.GLOBAL;
				case WeightedMxPartiAv.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case WeightedMxPartiAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case WeightedMxPartiAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@WeightedMxParti(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = WeightedMxPartiAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = WeightedMxPartiAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(WeightedMxPartiAv, POINTER) returns the conditioned default value of POINTER of WeightedMxPartiAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(WeightedMxPartiAv, POINTER) returns the conditioned default value of POINTER of WeightedMxPartiAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			prop_default = WeightedMxPartiAv.conditioning(prop, WeightedMxPartiAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(WeightedMxPartiAv, PROP, VALUE) checks VALUE format for PROP of WeightedMxPartiAv.
			%  CHECK = M.CHECKPROP(WeightedMxPartiAv, PROP, VALUE) checks VALUE format for PROP of WeightedMxPartiAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:WeightedMxPartiAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:WeightedMxPartiAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(WeightedMxPartiAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of WeightedMxPartiAv.
			%   Error id: €BRAPH2.STR€:WeightedMxPartiAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(WeightedMxPartiAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of WeightedMxPartiAv.
			%   Error id: €BRAPH2.STR€:WeightedMxPartiAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('WeightedMxPartiAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = WeightedMxPartiAv.getPropProp(pointer);
			
			switch prop
				case WeightedMxPartiAv.TEMPLATE % __WeightedMxPartiAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, WeightedMxPartiAv.getPropSettings(prop));
				otherwise
					if prop <= WeightedMxParti.getPropNumber()
						check = checkProp@WeightedMxParti(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':WeightedMxPartiAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' WeightedMxPartiAv.getPropTag(prop) ' (' WeightedMxPartiAv.getFormatTag(WeightedMxPartiAv.getPropFormat(prop)) ').'] ...
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
				case WeightedMxPartiAv.M % __WeightedMxPartiAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(WeightedMxPartiAv.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    weighted_multiplex_participation = calculateValue@WeightedMxParti(m, prop);
					    value = {mean(cell2mat(weighted_multiplex_participation))};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= WeightedMxParti.getPropNumber()
						value = calculateValue@WeightedMxParti(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
