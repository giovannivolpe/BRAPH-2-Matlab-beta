classdef OverlappingDgrOut < DegreeOut
	%OverlappingDgrOut is the graph overlapping out-degree.
	% It is a subclass of <a href="matlab:help DegreeOut">DegreeOut</a>.
	%
	% The overlapping out-degree of a graph is the sum of the out-degrees of a node 
	% in all layers.
	%
	% OverlappingDgrOut methods (constructor):
	%  OverlappingDgrOut - constructor
	%
	% OverlappingDgrOut methods:
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
	% OverlappingDgrOut methods (display):
	%  tostring - string with information about the overlapping out-degree
	%  disp - displays information about the overlapping out-degree
	%  tree - displays the tree of the overlapping out-degree
	%
	% OverlappingDgrOut methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two overlapping out-degree are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the overlapping out-degree
	%
	% OverlappingDgrOut methods (save/load, Static):
	%  save - saves BRAPH2 overlapping out-degree as b2 file
	%  load - loads a BRAPH2 overlapping out-degree from a b2 file
	%
	% OverlappingDgrOut method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the overlapping out-degree
	%
	% OverlappingDgrOut method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the overlapping out-degree
	%
	% OverlappingDgrOut methods (inspection, Static):
	%  getClass - returns the class of the overlapping out-degree
	%  getSubclasses - returns all subclasses of OverlappingDgrOut
	%  getProps - returns the property list of the overlapping out-degree
	%  getPropNumber - returns the property number of the overlapping out-degree
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
	% OverlappingDgrOut methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingDgrOut methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingDgrOut methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingDgrOut methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingDgrOut; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingDgrOut constants</a>.
	%
	
	methods % constructor
		function m = OverlappingDgrOut(varargin)
			%OverlappingDgrOut() creates a overlapping out-degree.
			%
			% OverlappingDgrOut(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingDgrOut(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@DegreeOut(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the overlapping out-degree.
			%
			% CLASS = OverlappingDgrOut.GETCLASS() returns the class 'OverlappingDgrOut'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the overlapping out-degree M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingDgrOut') returns 'OverlappingDgrOut'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingDgrOut')
			%  are less computationally efficient.
			
			m_class = 'OverlappingDgrOut';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the overlapping out-degree.
			%
			% LIST = OverlappingDgrOut.GETSUBCLASSES() returns all subclasses of 'OverlappingDgrOut'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the overlapping out-degree M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingDgrOut') returns all subclasses of 'OverlappingDgrOut'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingDgrOut', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of overlapping out-degree.
			%
			% PROPS = OverlappingDgrOut.GETPROPS() returns the property list of overlapping out-degree
			%  as a row vector.
			%
			% PROPS = OverlappingDgrOut.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the overlapping out-degree M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingDgrOut'[, CATEGORY]) returns the property list of 'OverlappingDgrOut'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					DegreeOut.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						DegreeOut.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						DegreeOut.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						DegreeOut.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						DegreeOut.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						DegreeOut.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						DegreeOut.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						DegreeOut.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						DegreeOut.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						DegreeOut.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of overlapping out-degree.
			%
			% N = OverlappingDgrOut.GETPROPNUMBER() returns the property number of overlapping out-degree.
			%
			% N = OverlappingDgrOut.GETPROPNUMBER(CATEGORY) returns the property number of overlapping out-degree
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the overlapping out-degree M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingDgrOut') returns the property number of 'OverlappingDgrOut'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingDgrOut.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in overlapping out-degree/error.
			%
			% CHECK = OverlappingDgrOut.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingDgrOut, PROP) checks whether PROP exists for OverlappingDgrOut.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%  Element.EXISTSPROP(OverlappingDgrOut, PROP) throws error if PROP does NOT exist for OverlappingDgrOut.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingDgrOut.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingDgrOut.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in overlapping out-degree/error.
			%
			% CHECK = OverlappingDgrOut.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingDgrOut, TAG) checks whether TAG exists for OverlappingDgrOut.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%  Element.EXISTSTAG(OverlappingDgrOut, TAG) throws error if TAG does NOT exist for OverlappingDgrOut.
			%   Error id: [BRAPH2:OverlappingDgrOut:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingdgrout_tag_list = cellfun(@(x) OverlappingDgrOut.getPropTag(x), num2cell(OverlappingDgrOut.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingdgrout_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingDgrOut.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingDgrOut, POINTER) returns property number of POINTER of OverlappingDgrOut.
			%  PROPERTY = M.GETPROPPROP(OverlappingDgrOut, POINTER) returns property number of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingdgrout_tag_list = cellfun(@(x) OverlappingDgrOut.getPropTag(x), num2cell(OverlappingDgrOut.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingdgrout_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingDgrOut, POINTER) returns tag of POINTER of OverlappingDgrOut.
			%  TAG = M.GETPROPTAG(OverlappingDgrOut, POINTER) returns tag of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingDgrOut')
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
						tag = getPropTag@DegreeOut(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingDgrOut, POINTER) returns category of POINTER of OverlappingDgrOut.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingDgrOut, POINTER) returns category of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@DegreeOut(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingDgrOut, POINTER) returns format of POINTER of OverlappingDgrOut.
			%  FORMAT = M.GETPROPFORMAT(OverlappingDgrOut, POINTER) returns format of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@DegreeOut(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingDgrOut, POINTER) returns description of POINTER of OverlappingDgrOut.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingDgrOut, POINTER) returns description of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOut.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping out-degree.';
				case OverlappingDgrOut.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping out-degree.';
				case OverlappingDgrOut.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping out-degree.';
				case OverlappingDgrOut.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping out-degree.';
				case OverlappingDgrOut.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping out-degree.';
				case OverlappingDgrOut.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping out-degree.';
				case OverlappingDgrOut.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingDgrOut.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingDgrOut.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingDgrOut.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingDgrOut.M
					prop_description = 'M (result, cell) is the overlapping out-degree.';
				otherwise
					prop_description = getPropDescription@DegreeOut(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingDgrOut, POINTER) returns settings of POINTER of OverlappingDgrOut.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingDgrOut, POINTER) returns settings of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOut.TEMPLATE
					prop_settings = 'OverlappingDgrOut';
				otherwise
					prop_settings = getPropSettings@DegreeOut(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingDgrOut.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrOut.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingDgrOut, POINTER) returns the default value of POINTER of OverlappingDgrOut.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingDgrOut, POINTER) returns the default value of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOut.NAME
					prop_default = 'OverlappingDgrOut';
				case OverlappingDgrOut.DESCRIPTION
					prop_default = 'The overlapping out-degree of a graph is the sum of the out-degrees of a node in all layers.';
				case OverlappingDgrOut.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingDgrOut.getPropSettings(prop));
				case OverlappingDgrOut.ID
					prop_default = 'OverlappingDgrOut ID';
				case OverlappingDgrOut.LABEL
					prop_default = 'OverlappingDgrOut label';
				case OverlappingDgrOut.NOTES
					prop_default = 'OverlappingDgrOut notes';
				case OverlappingDgrOut.SHAPE
					prop_default = Measure.NODAL;
				case OverlappingDgrOut.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingDgrOut.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingDgrOut.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@DegreeOut(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingDgrOut.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingDgrOut.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingDgrOut, POINTER) returns the conditioned default value of POINTER of OverlappingDgrOut.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingDgrOut, POINTER) returns the conditioned default value of POINTER of OverlappingDgrOut.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			prop_default = OverlappingDgrOut.conditioning(prop, OverlappingDgrOut.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingDgrOut, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrOut.
			%  CHECK = M.CHECKPROP(OverlappingDgrOut, PROP, VALUE) checks VALUE format for PROP of OverlappingDgrOut.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingDgrOut:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOut:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingDgrOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrOut.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOut:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingDgrOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingDgrOut.
			%   Error id: €BRAPH2.STR€:OverlappingDgrOut:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingDgrOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingDgrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingDgrOut.TEMPLATE % __OverlappingDgrOut.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingDgrOut.getPropSettings(prop));
				otherwise
					if prop <= DegreeOut.getPropNumber()
						check = checkProp@DegreeOut(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingDgrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingDgrOut.getPropTag(prop) ' (' OverlappingDgrOut.getFormatTag(OverlappingDgrOut.getPropFormat(prop)) ').'] ...
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
				case OverlappingDgrOut.M % __OverlappingDgrOut.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingDgrOut.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    out_degree = calculateValue@DegreeOut(m, prop);
					    overlapping_out_degree = zeros(N(1), 1);
					
					    for li = 1:l 
					        overlapping_out_degree = overlapping_out_degree + out_degree{li};
					    end
					    value = {overlapping_out_degree};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= DegreeOut.getPropNumber()
						value = calculateValue@DegreeOut(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
