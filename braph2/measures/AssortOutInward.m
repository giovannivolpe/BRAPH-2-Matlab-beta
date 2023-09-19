classdef AssortOutInward < Measure
	%AssortOutInward is the graph out-in-assortativity.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The out-in-assortativity coefficient of a graph is the correlation coefficient between 
	%   the degrees/strengths of all nodes on two opposite ends of an edge within a layer. 
	% The corresponding coefficient for directed and weighted networks is calculated by 
	%   using the weighted and directed variants of in-out-degree/in-out-strength.
	%
	% AssortOutInward methods (constructor):
	%  AssortOutInward - constructor
	%
	% AssortOutInward methods:
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
	% AssortOutInward methods (display):
	%  tostring - string with information about the out-in-assortativity
	%  disp - displays information about the out-in-assortativity
	%  tree - displays the tree of the out-in-assortativity
	%
	% AssortOutInward methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two out-in-assortativity are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the out-in-assortativity
	%
	% AssortOutInward methods (save/load, Static):
	%  save - saves BRAPH2 out-in-assortativity as b2 file
	%  load - loads a BRAPH2 out-in-assortativity from a b2 file
	%
	% AssortOutInward method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the out-in-assortativity
	%
	% AssortOutInward method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the out-in-assortativity
	%
	% AssortOutInward methods (inspection, Static):
	%  getClass - returns the class of the out-in-assortativity
	%  getSubclasses - returns all subclasses of AssortOutInward
	%  getProps - returns the property list of the out-in-assortativity
	%  getPropNumber - returns the property number of the out-in-assortativity
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
	% AssortOutInward methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% AssortOutInward methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% AssortOutInward methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% AssortOutInward methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?AssortOutInward; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">AssortOutInward constants</a>.
	%
	
	methods % constructor
		function m = AssortOutInward(varargin)
			%AssortOutInward() creates a out-in-assortativity.
			%
			% AssortOutInward(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% AssortOutInward(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the out-in-assortativity.
			%
			% CLASS = AssortOutInward.GETCLASS() returns the class 'AssortOutInward'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the out-in-assortativity M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('AssortOutInward') returns 'AssortOutInward'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('AssortOutInward')
			%  are less computationally efficient.
			
			m_class = 'AssortOutInward';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the out-in-assortativity.
			%
			% LIST = AssortOutInward.GETSUBCLASSES() returns all subclasses of 'AssortOutInward'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the out-in-assortativity M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('AssortOutInward') returns all subclasses of 'AssortOutInward'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('AssortOutInward', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of out-in-assortativity.
			%
			% PROPS = AssortOutInward.GETPROPS() returns the property list of out-in-assortativity
			%  as a row vector.
			%
			% PROPS = AssortOutInward.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the out-in-assortativity M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('AssortOutInward'[, CATEGORY]) returns the property list of 'AssortOutInward'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('AssortOutInward')
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
			%GETPROPNUMBER returns the property number of out-in-assortativity.
			%
			% N = AssortOutInward.GETPROPNUMBER() returns the property number of out-in-assortativity.
			%
			% N = AssortOutInward.GETPROPNUMBER(CATEGORY) returns the property number of out-in-assortativity
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the out-in-assortativity M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('AssortOutInward') returns the property number of 'AssortOutInward'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(AssortOutInward.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in out-in-assortativity/error.
			%
			% CHECK = AssortOutInward.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(AssortOutInward, PROP) checks whether PROP exists for AssortOutInward.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:AssortOutInward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%  Element.EXISTSPROP(AssortOutInward, PROP) throws error if PROP does NOT exist for AssortOutInward.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == AssortOutInward.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for AssortOutInward.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in out-in-assortativity/error.
			%
			% CHECK = AssortOutInward.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(AssortOutInward, TAG) checks whether TAG exists for AssortOutInward.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:AssortOutInward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%  Element.EXISTSTAG(AssortOutInward, TAG) throws error if TAG does NOT exist for AssortOutInward.
			%   Error id: [BRAPH2:AssortOutInward:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			assortoutinward_tag_list = cellfun(@(x) AssortOutInward.getPropTag(x), num2cell(AssortOutInward.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, assortoutinward_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for AssortOutInward.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(AssortOutInward, POINTER) returns property number of POINTER of AssortOutInward.
			%  PROPERTY = M.GETPROPPROP(AssortOutInward, POINTER) returns property number of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				assortoutinward_tag_list = cellfun(@(x) AssortOutInward.getPropTag(x), num2cell(AssortOutInward.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, assortoutinward_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(AssortOutInward, POINTER) returns tag of POINTER of AssortOutInward.
			%  TAG = M.GETPROPTAG(AssortOutInward, POINTER) returns tag of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('AssortOutInward')
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
			%  CATEGORY = Element.GETPROPCATEGORY(AssortOutInward, POINTER) returns category of POINTER of AssortOutInward.
			%  CATEGORY = M.GETPROPCATEGORY(AssortOutInward, POINTER) returns category of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
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
			%  FORMAT = Element.GETPROPFORMAT(AssortOutInward, POINTER) returns format of POINTER of AssortOutInward.
			%  FORMAT = M.GETPROPFORMAT(AssortOutInward, POINTER) returns format of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(AssortOutInward, POINTER) returns description of POINTER of AssortOutInward.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(AssortOutInward, POINTER) returns description of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
			switch prop
				case AssortOutInward.NAME
					prop_description = 'NAME (constant, string) is the name of the out-in-assortativity.';
				case AssortOutInward.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the out-in-assortativity.';
				case AssortOutInward.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the out-in-assortativity.';
				case AssortOutInward.ID
					prop_description = 'ID (data, string) is a few-letter code of the out-in-assortativity.';
				case AssortOutInward.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the out-in-assortativity.';
				case AssortOutInward.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the out-in-assortativity.';
				case AssortOutInward.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.GLOBAL__.';
				case AssortOutInward.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case AssortOutInward.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case AssortOutInward.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case AssortOutInward.M
					prop_description = 'M (result, cell) is the out-in-assortativity.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(AssortOutInward, POINTER) returns settings of POINTER of AssortOutInward.
			%  SETTINGS = M.GETPROPSETTINGS(AssortOutInward, POINTER) returns settings of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
			switch prop
				case AssortOutInward.TEMPLATE
					prop_settings = 'AssortOutInward';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = AssortOutInward.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortOutInward.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(AssortOutInward, POINTER) returns the default value of POINTER of AssortOutInward.
			%  DEFAULT = M.GETPROPDEFAULT(AssortOutInward, POINTER) returns the default value of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
			switch prop
				case AssortOutInward.NAME
					prop_default = 'AssortOutInward';
				case AssortOutInward.DESCRIPTION
					prop_default = 'The out-in-assortativity coefficient of a graph is the correlation coefficient between the degrees/strengths of all nodes on two opposite ends of an edge within a layer. The corresponding coefficient for directed and weighted networks is calculated by using the weighted and directed variants of in-out-degree/in-out-strength.';
				case AssortOutInward.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, AssortOutInward.getPropSettings(prop));
				case AssortOutInward.ID
					prop_default = 'AssortOutInward ID';
				case AssortOutInward.LABEL
					prop_default = 'AssortOutInward label';
				case AssortOutInward.NOTES
					prop_default = 'AssortOutInward notes';
				case AssortOutInward.SHAPE
					prop_default = Measure.GLOBAL;
				case AssortOutInward.SCOPE
					prop_default = Measure.UNILAYER;
				case AssortOutInward.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case AssortOutInward.COMPATIBLE_GRAPHS
					prop_default = {'GraphBD' 'GraphWD' 'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = AssortOutInward.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortOutInward.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(AssortOutInward, POINTER) returns the conditioned default value of POINTER of AssortOutInward.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(AssortOutInward, POINTER) returns the conditioned default value of POINTER of AssortOutInward.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = AssortOutInward.getPropProp(pointer);
			
			prop_default = AssortOutInward.conditioning(prop, AssortOutInward.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(AssortOutInward, PROP, VALUE) checks VALUE format for PROP of AssortOutInward.
			%  CHECK = M.CHECKPROP(AssortOutInward, PROP, VALUE) checks VALUE format for PROP of AssortOutInward.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:AssortOutInward:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:AssortOutInward:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(AssortOutInward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortOutInward.
			%   Error id: €BRAPH2.STR€:AssortOutInward:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(AssortOutInward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortOutInward.
			%   Error id: €BRAPH2.STR€:AssortOutInward:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('AssortOutInward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = AssortOutInward.getPropProp(pointer);
			
			switch prop
				case AssortOutInward.TEMPLATE % __AssortOutInward.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, AssortOutInward.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' AssortOutInward.getPropTag(prop) ' (' AssortOutInward.getFormatTag(AssortOutInward.getPropFormat(prop)) ').'] ...
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
				case AssortOutInward.M % __AssortOutInward.M__
					rng_settings_ = rng(); rng(m.getPropSeed(AssortOutInward.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					N = g.get('NODENUMBER');
					out_in_assortativity = cell(L, 1);
					connectivity_types = g.get('CONNECTIVITY_TYPE', L);  
					parfor li = 1:L
					    Aii = A{li, li};
					    connectivity_type = connectivity_types(li, li);
					    [i, j] = find(Aii ~= 0);  % nodes [i, j]
					    M = length(i);  % Number of edges
					    k_i = zeros(M, L);
					    k_j = zeros(length(j), L);
					    
					    if connectivity_type == Graph.WEIGHTED  % weighted graphs
					        in_strength = StrengthIn('G', g).get('M');
					        out_strength = StrengthOut('G', g).get('M');
					        d_in = in_strength{li};
					        d_out = out_strength{li};
					    else  % binary graphs
					        in_degree = DegreeIn('G', g).get('M');
					        out_degree = DegreeOut('G', g).get('M');
					        d_in = in_degree{li};
					        d_out = out_degree{li};
					    end
					    
					     k_i(:, li) = d_out(i);  % out-degree/out-strength node i
					    k_j(:, li) = d_in(j);  % in-degree/in-strength node j
					    % compute assortativity
					    assortativity_layer = (sum(k_i(:, li) .* k_j(:, li)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2)...
					        / (sum(0.5 * (k_i(:, li).^2 + k_j(:, li).^2)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2);
					    assortativity_layer(isnan(assortativity_layer)) = 0;  % Should return zeros, not NaN
					    out_in_assortativity(li) = {assortativity_layer};
					end
					
					value = out_in_assortativity;
					
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
