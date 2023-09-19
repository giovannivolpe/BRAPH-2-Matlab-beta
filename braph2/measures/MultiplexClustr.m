classdef MultiplexClustr < MultiplexTri
	%MultiplexClustr is the graph weighted multiplex clustering.
	% It is a subclass of <a href="matlab:help MultiplexTri">MultiplexTri</a>.
	%
	% The two-multiplex clustering coefficient of a node i is the fraction 
	%  of two-multiplex triangles (triangles which use edges from two different 
	%  layers) with a vertex in node i and the number of one-triads centered in i.
	%
	% MultiplexClustr methods (constructor):
	%  MultiplexClustr - constructor
	%
	% MultiplexClustr methods:
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
	% MultiplexClustr methods (display):
	%  tostring - string with information about the weighted clustering
	%  disp - displays information about the weighted clustering
	%  tree - displays the tree of the weighted clustering
	%
	% MultiplexClustr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two weighted clustering are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the weighted clustering
	%
	% MultiplexClustr methods (save/load, Static):
	%  save - saves BRAPH2 weighted clustering as b2 file
	%  load - loads a BRAPH2 weighted clustering from a b2 file
	%
	% MultiplexClustr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the weighted clustering
	%
	% MultiplexClustr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the weighted clustering
	%
	% MultiplexClustr methods (inspection, Static):
	%  getClass - returns the class of the weighted clustering
	%  getSubclasses - returns all subclasses of MultiplexClustr
	%  getProps - returns the property list of the weighted clustering
	%  getPropNumber - returns the property number of the weighted clustering
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
	% MultiplexClustr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexClustr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexClustr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexClustr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexClustr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexClustr constants</a>.
	%
	
	methods % constructor
		function m = MultiplexClustr(varargin)
			%MultiplexClustr() creates a weighted clustering.
			%
			% MultiplexClustr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexClustr(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@MultiplexTri(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the weighted clustering.
			%
			% CLASS = MultiplexClustr.GETCLASS() returns the class 'MultiplexClustr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the weighted clustering M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexClustr') returns 'MultiplexClustr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexClustr')
			%  are less computationally efficient.
			
			m_class = 'MultiplexClustr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the weighted clustering.
			%
			% LIST = MultiplexClustr.GETSUBCLASSES() returns all subclasses of 'MultiplexClustr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the weighted clustering M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexClustr') returns all subclasses of 'MultiplexClustr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MultiplexClustr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of weighted clustering.
			%
			% PROPS = MultiplexClustr.GETPROPS() returns the property list of weighted clustering
			%  as a row vector.
			%
			% PROPS = MultiplexClustr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the weighted clustering M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexClustr'[, CATEGORY]) returns the property list of 'MultiplexClustr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					MultiplexTri.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						MultiplexTri.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						MultiplexTri.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						MultiplexTri.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						MultiplexTri.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						MultiplexTri.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						MultiplexTri.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						MultiplexTri.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						MultiplexTri.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						MultiplexTri.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of weighted clustering.
			%
			% N = MultiplexClustr.GETPROPNUMBER() returns the property number of weighted clustering.
			%
			% N = MultiplexClustr.GETPROPNUMBER(CATEGORY) returns the property number of weighted clustering
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the weighted clustering M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexClustr') returns the property number of 'MultiplexClustr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MultiplexClustr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in weighted clustering/error.
			%
			% CHECK = MultiplexClustr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexClustr, PROP) checks whether PROP exists for MultiplexClustr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%  Element.EXISTSPROP(MultiplexClustr, PROP) throws error if PROP does NOT exist for MultiplexClustr.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MultiplexClustr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexClustr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in weighted clustering/error.
			%
			% CHECK = MultiplexClustr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexClustr, TAG) checks whether TAG exists for MultiplexClustr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%  Element.EXISTSTAG(MultiplexClustr, TAG) throws error if TAG does NOT exist for MultiplexClustr.
			%   Error id: [BRAPH2:MultiplexClustr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multiplexclustr_tag_list = cellfun(@(x) MultiplexClustr.getPropTag(x), num2cell(MultiplexClustr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multiplexclustr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexClustr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(MultiplexClustr, POINTER) returns property number of POINTER of MultiplexClustr.
			%  PROPERTY = M.GETPROPPROP(MultiplexClustr, POINTER) returns property number of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multiplexclustr_tag_list = cellfun(@(x) MultiplexClustr.getPropTag(x), num2cell(MultiplexClustr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multiplexclustr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(MultiplexClustr, POINTER) returns tag of POINTER of MultiplexClustr.
			%  TAG = M.GETPROPTAG(MultiplexClustr, POINTER) returns tag of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexClustr')
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
						tag = getPropTag@MultiplexTri(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexClustr, POINTER) returns category of POINTER of MultiplexClustr.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexClustr, POINTER) returns category of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@MultiplexTri(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(MultiplexClustr, POINTER) returns format of POINTER of MultiplexClustr.
			%  FORMAT = M.GETPROPFORMAT(MultiplexClustr, POINTER) returns format of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@MultiplexTri(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexClustr, POINTER) returns description of POINTER of MultiplexClustr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexClustr, POINTER) returns description of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				case MultiplexClustr.NAME
					prop_description = 'NAME (constant, string) is the name of the weighted multiplex particiption.';
				case MultiplexClustr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.';
				case MultiplexClustr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.';
				case MultiplexClustr.ID
					prop_description = 'ID (data, string) is a few-letter code of the weighted multiplex particiption.';
				case MultiplexClustr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the weighted multiplex particiption.';
				case MultiplexClustr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.';
				case MultiplexClustr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case MultiplexClustr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case MultiplexClustr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case MultiplexClustr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case MultiplexClustr.M
					prop_description = 'M (result, cell) is the weighted multiplex particiption.';
				otherwise
					prop_description = getPropDescription@MultiplexTri(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexClustr, POINTER) returns settings of POINTER of MultiplexClustr.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexClustr, POINTER) returns settings of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				case MultiplexClustr.TEMPLATE
					prop_settings = 'MultiplexClustr';
				otherwise
					prop_settings = getPropSettings@MultiplexTri(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexClustr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClustr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexClustr, POINTER) returns the default value of POINTER of MultiplexClustr.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexClustr, POINTER) returns the default value of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				case MultiplexClustr.NAME
					prop_default = 'MultiplexClustr';
				case MultiplexClustr.DESCRIPTION
					prop_default = 'The two-multiplex clustering coefficient of a node i is the fraction of two-multiplex triangles (triangles which use edges from two different layers) with a vertex in node i and the number of one-triads centered in i.';
				case MultiplexClustr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MultiplexClustr.getPropSettings(prop));
				case MultiplexClustr.ID
					prop_default = 'MultiplexClustr ID';
				case MultiplexClustr.LABEL
					prop_default = 'MultiplexClustr label';
				case MultiplexClustr.NOTES
					prop_default = 'MultiplexClustr notes';
				case MultiplexClustr.SHAPE
					prop_default = Measure.NODAL;
				case MultiplexClustr.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case MultiplexClustr.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case MultiplexClustr.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@MultiplexTri(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexClustr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClustr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexClustr, POINTER) returns the conditioned default value of POINTER of MultiplexClustr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexClustr, POINTER) returns the conditioned default value of POINTER of MultiplexClustr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			prop_default = MultiplexClustr.conditioning(prop, MultiplexClustr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(MultiplexClustr, PROP, VALUE) checks VALUE format for PROP of MultiplexClustr.
			%  CHECK = M.CHECKPROP(MultiplexClustr, PROP, VALUE) checks VALUE format for PROP of MultiplexClustr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MultiplexClustr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:MultiplexClustr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MultiplexClustr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClustr.
			%   Error id: €BRAPH2.STR€:MultiplexClustr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(MultiplexClustr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClustr.
			%   Error id: €BRAPH2.STR€:MultiplexClustr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexClustr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexClustr.getPropProp(pointer);
			
			switch prop
				case MultiplexClustr.TEMPLATE % __MultiplexClustr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MultiplexClustr.getPropSettings(prop));
				otherwise
					if prop <= MultiplexTri.getPropNumber()
						check = checkProp@MultiplexTri(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MultiplexClustr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexClustr.getPropTag(prop) ' (' MultiplexClustr.getFormatTag(MultiplexClustr.getPropFormat(prop)) ').'] ...
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
				case MultiplexClustr.M % __MultiplexClustr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(MultiplexClustr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    multiplex_triangles = calculateValue@MultiplexTri(m, prop);
					    degree = Degree('G', g).get('M');
					
					    multiplex_clustering = cell(length(ls), 1);
					    count = 1;
					    for p = 1:1:length(ls)
					        multiplex_clustering_degree = zeros(N(1), 1);
					        for i = count:1:ls(p) + count - 1
					            k = degree{i};
					            multiplex_clustering_degree = multiplex_clustering_degree + (k .* (k - 1));
					        end
					        multiplex_clustering_partition = multiplex_triangles{p}./ ((ls(p)-1)*multiplex_clustering_degree);
					        multiplex_clustering_partition(isnan(multiplex_clustering_partition)) = 0;  % Should return zeros, not NaN
					        count = count + ls(p);
					        multiplex_clustering(p) = {multiplex_clustering_partition};
					    end
					    value = multiplex_clustering;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= MultiplexTri.getPropNumber()
						value = calculateValue@MultiplexTri(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
