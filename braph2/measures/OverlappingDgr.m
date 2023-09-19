classdef OverlappingDgr < Degree
	%OverlappingDgr is the graph overlapping degree.
	% It is a subclass of <a href="matlab:help Degree">Degree</a>.
	%
	% The overlapping degree of a graph is the sum of the degrees of a node in 
	% all layers.
	%
	% OverlappingDgr methods (constructor):
	%  OverlappingDgr - constructor
	%
	% OverlappingDgr methods:
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
	% OverlappingDgr methods (display):
	%  tostring - string with information about the ovrlapdeg
	%  disp - displays information about the ovrlapdeg
	%  tree - displays the tree of the ovrlapdeg
	%
	% OverlappingDgr methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two ovrlapdeg are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the ovrlapdeg
	%
	% OverlappingDgr methods (save/load, Static):
	%  save - saves BRAPH2 ovrlapdeg as b2 file
	%  load - loads a BRAPH2 ovrlapdeg from a b2 file
	%
	% OverlappingDgr method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the ovrlapdeg
	%
	% OverlappingDgr method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the ovrlapdeg
	%
	% OverlappingDgr methods (inspection, Static):
	%  getClass - returns the class of the ovrlapdeg
	%  getSubclasses - returns all subclasses of OverlappingDgr
	%  getProps - returns the property list of the ovrlapdeg
	%  getPropNumber - returns the property number of the ovrlapdeg
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
	% OverlappingDgr methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingDgr methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingDgr methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingDgr methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingDgr; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingDgr constants</a>.
	%
	
	methods % constructor
		function m = OverlappingDgr(varargin)
			%OverlappingDgr() creates a ovrlapdeg.
			%
			% OverlappingDgr(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingDgr(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Degree(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the ovrlapdeg.
			%
			% CLASS = OverlappingDgr.GETCLASS() returns the class 'OverlappingDgr'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the ovrlapdeg M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingDgr') returns 'OverlappingDgr'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingDgr')
			%  are less computationally efficient.
			
			m_class = 'OverlappingDgr';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the ovrlapdeg.
			%
			% LIST = OverlappingDgr.GETSUBCLASSES() returns all subclasses of 'OverlappingDgr'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the ovrlapdeg M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingDgr') returns all subclasses of 'OverlappingDgr'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingDgr', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of ovrlapdeg.
			%
			% PROPS = OverlappingDgr.GETPROPS() returns the property list of ovrlapdeg
			%  as a row vector.
			%
			% PROPS = OverlappingDgr.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the ovrlapdeg M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingDgr'[, CATEGORY]) returns the property list of 'OverlappingDgr'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Degree.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Degree.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Degree.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Degree.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						Degree.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Degree.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Degree.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Degree.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Degree.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Degree.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of ovrlapdeg.
			%
			% N = OverlappingDgr.GETPROPNUMBER() returns the property number of ovrlapdeg.
			%
			% N = OverlappingDgr.GETPROPNUMBER(CATEGORY) returns the property number of ovrlapdeg
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the ovrlapdeg M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingDgr') returns the property number of 'OverlappingDgr'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingDgr.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in ovrlapdeg/error.
			%
			% CHECK = OverlappingDgr.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingDgr, PROP) checks whether PROP exists for OverlappingDgr.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%  Element.EXISTSPROP(OverlappingDgr, PROP) throws error if PROP does NOT exist for OverlappingDgr.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingDgr.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingDgr.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in ovrlapdeg/error.
			%
			% CHECK = OverlappingDgr.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingDgr, TAG) checks whether TAG exists for OverlappingDgr.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%  Element.EXISTSTAG(OverlappingDgr, TAG) throws error if TAG does NOT exist for OverlappingDgr.
			%   Error id: [BRAPH2:OverlappingDgr:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingdgr_tag_list = cellfun(@(x) OverlappingDgr.getPropTag(x), num2cell(OverlappingDgr.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingdgr_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingDgr.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingDgr, POINTER) returns property number of POINTER of OverlappingDgr.
			%  PROPERTY = M.GETPROPPROP(OverlappingDgr, POINTER) returns property number of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingdgr_tag_list = cellfun(@(x) OverlappingDgr.getPropTag(x), num2cell(OverlappingDgr.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingdgr_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingDgr, POINTER) returns tag of POINTER of OverlappingDgr.
			%  TAG = M.GETPROPTAG(OverlappingDgr, POINTER) returns tag of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingDgr')
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
						tag = getPropTag@Degree(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingDgr, POINTER) returns category of POINTER of OverlappingDgr.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingDgr, POINTER) returns category of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@Degree(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingDgr, POINTER) returns format of POINTER of OverlappingDgr.
			%  FORMAT = M.GETPROPFORMAT(OverlappingDgr, POINTER) returns format of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@Degree(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingDgr, POINTER) returns description of POINTER of OverlappingDgr.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingDgr, POINTER) returns description of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				case OverlappingDgr.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping degree.';
				case OverlappingDgr.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping degree.';
				case OverlappingDgr.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping degree.';
				case OverlappingDgr.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping degree.';
				case OverlappingDgr.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping degree.';
				case OverlappingDgr.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping degree.';
				case OverlappingDgr.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingDgr.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingDgr.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingDgr.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingDgr.M
					prop_description = 'M (result, cell) is the overlapping degree.';
				otherwise
					prop_description = getPropDescription@Degree(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingDgr, POINTER) returns settings of POINTER of OverlappingDgr.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingDgr, POINTER) returns settings of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				case OverlappingDgr.TEMPLATE
					prop_settings = 'OverlappingDgr';
				otherwise
					prop_settings = getPropSettings@Degree(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingDgr.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgr.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingDgr, POINTER) returns the default value of POINTER of OverlappingDgr.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingDgr, POINTER) returns the default value of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				case OverlappingDgr.NAME
					prop_default = 'OverlappingDgr';
				case OverlappingDgr.DESCRIPTION
					prop_default = 'The overlapping degree of a graph is the sum of the degrees of a node in all layers.';
				case OverlappingDgr.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingDgr.getPropSettings(prop));
				case OverlappingDgr.ID
					prop_default = 'OverlappingDgr ID';
				case OverlappingDgr.LABEL
					prop_default = 'OverlappingDgr label';
				case OverlappingDgr.NOTES
					prop_default = 'OverlappingDgr notes';
				case OverlappingDgr.SHAPE
					prop_default = Measure.NODAL;
				case OverlappingDgr.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingDgr.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingDgr.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Degree(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingDgr.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgr.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingDgr, POINTER) returns the conditioned default value of POINTER of OverlappingDgr.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingDgr, POINTER) returns the conditioned default value of POINTER of OverlappingDgr.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			prop_default = OverlappingDgr.conditioning(prop, OverlappingDgr.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingDgr, PROP, VALUE) checks VALUE format for PROP of OverlappingDgr.
			%  CHECK = M.CHECKPROP(OverlappingDgr, PROP, VALUE) checks VALUE format for PROP of OverlappingDgr.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingDgr:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingDgr:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgr.
			%   Error id: €BRAPH2.STR€:OverlappingDgr:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingDgr, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgr.
			%   Error id: €BRAPH2.STR€:OverlappingDgr:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingDgr')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingDgr.getPropProp(pointer);
			
			switch prop
				case OverlappingDgr.TEMPLATE % __OverlappingDgr.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingDgr.getPropSettings(prop));
				otherwise
					if prop <= Degree.getPropNumber()
						check = checkProp@Degree(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgr:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingDgr.getPropTag(prop) ' (' OverlappingDgr.getFormatTag(OverlappingDgr.getPropFormat(prop)) ').'] ...
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
				case OverlappingDgr.M % __OverlappingDgr.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingDgr.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    degree = calculateValue@Degree(m, prop);
					    overlapping_degree = cell(length(ls), 1);
					    
					    count = 1;
					    for i = 1:1:length(ls)
					        overlapping_degree_partition = zeros(N(1), 1);
					        for li = count:1:ls(i) + count - 1
					            overlapping_degree_partition = overlapping_degree_partition + degree{li};
					        end
					        count = count + ls(i);
					        overlapping_degree(i) = {overlapping_degree_partition};
					    end
					    value = overlapping_degree;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Degree.getPropNumber()
						value = calculateValue@Degree(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
