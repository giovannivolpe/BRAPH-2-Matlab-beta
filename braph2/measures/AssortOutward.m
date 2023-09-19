classdef AssortOutward < Measure
	%AssortOutward is the graph out-out-assortativity.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The out-out-assortativity coefficient of a graph is the correlation coefficient between 
	%   the degrees/strengths of all nodes on two opposite ends of an edge within a layer. 
	% The corresponding coefficient for directed and weighted networks is calculated by using 
	%   the weighted and directed variants of out-degree/out-strength.
	%
	% AssortOutward methods (constructor):
	%  AssortOutward - constructor
	%
	% AssortOutward methods:
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
	% AssortOutward methods (display):
	%  tostring - string with information about the out-out-assortativity
	%  disp - displays information about the out-out-assortativity
	%  tree - displays the tree of the out-out-assortativity
	%
	% AssortOutward methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two out-out-assortativity are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the out-out-assortativity
	%
	% AssortOutward methods (save/load, Static):
	%  save - saves BRAPH2 out-out-assortativity as b2 file
	%  load - loads a BRAPH2 out-out-assortativity from a b2 file
	%
	% AssortOutward method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the out-out-assortativity
	%
	% AssortOutward method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the out-out-assortativity
	%
	% AssortOutward methods (inspection, Static):
	%  getClass - returns the class of the out-out-assortativity
	%  getSubclasses - returns all subclasses of AssortOutward
	%  getProps - returns the property list of the out-out-assortativity
	%  getPropNumber - returns the property number of the out-out-assortativity
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
	% AssortOutward methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% AssortOutward methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% AssortOutward methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% AssortOutward methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?AssortOutward; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">AssortOutward constants</a>.
	%
	
	methods % constructor
		function m = AssortOutward(varargin)
			%AssortOutward() creates a out-out-assortativity.
			%
			% AssortOutward(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% AssortOutward(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the out-out-assortativity.
			%
			% CLASS = AssortOutward.GETCLASS() returns the class 'AssortOutward'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the out-out-assortativity M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('AssortOutward') returns 'AssortOutward'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('AssortOutward')
			%  are less computationally efficient.
			
			m_class = 'AssortOutward';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the out-out-assortativity.
			%
			% LIST = AssortOutward.GETSUBCLASSES() returns all subclasses of 'AssortOutward'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the out-out-assortativity M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('AssortOutward') returns all subclasses of 'AssortOutward'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('AssortOutward')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('AssortOutward', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of out-out-assortativity.
			%
			% PROPS = AssortOutward.GETPROPS() returns the property list of out-out-assortativity
			%  as a row vector.
			%
			% PROPS = AssortOutward.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the out-out-assortativity M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('AssortOutward'[, CATEGORY]) returns the property list of 'AssortOutward'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('AssortOutward')
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
			%GETPROPNUMBER returns the property number of out-out-assortativity.
			%
			% N = AssortOutward.GETPROPNUMBER() returns the property number of out-out-assortativity.
			%
			% N = AssortOutward.GETPROPNUMBER(CATEGORY) returns the property number of out-out-assortativity
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the out-out-assortativity M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('AssortOutward') returns the property number of 'AssortOutward'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(AssortOutward.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in out-out-assortativity/error.
			%
			% CHECK = AssortOutward.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(AssortOutward, PROP) checks whether PROP exists for AssortOutward.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:AssortOutward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%  Element.EXISTSPROP(AssortOutward, PROP) throws error if PROP does NOT exist for AssortOutward.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == AssortOutward.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for AssortOutward.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in out-out-assortativity/error.
			%
			% CHECK = AssortOutward.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(AssortOutward, TAG) checks whether TAG exists for AssortOutward.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:AssortOutward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%  Element.EXISTSTAG(AssortOutward, TAG) throws error if TAG does NOT exist for AssortOutward.
			%   Error id: [BRAPH2:AssortOutward:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			assortoutward_tag_list = cellfun(@(x) AssortOutward.getPropTag(x), num2cell(AssortOutward.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, assortoutward_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for AssortOutward.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(AssortOutward, POINTER) returns property number of POINTER of AssortOutward.
			%  PROPERTY = M.GETPROPPROP(AssortOutward, POINTER) returns property number of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				assortoutward_tag_list = cellfun(@(x) AssortOutward.getPropTag(x), num2cell(AssortOutward.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, assortoutward_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(AssortOutward, POINTER) returns tag of POINTER of AssortOutward.
			%  TAG = M.GETPROPTAG(AssortOutward, POINTER) returns tag of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('AssortOutward')
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
			%  CATEGORY = Element.GETPROPCATEGORY(AssortOutward, POINTER) returns category of POINTER of AssortOutward.
			%  CATEGORY = M.GETPROPCATEGORY(AssortOutward, POINTER) returns category of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('AssortOutward')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
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
			%  FORMAT = Element.GETPROPFORMAT(AssortOutward, POINTER) returns format of POINTER of AssortOutward.
			%  FORMAT = M.GETPROPFORMAT(AssortOutward, POINTER) returns format of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('AssortOutward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(AssortOutward, POINTER) returns description of POINTER of AssortOutward.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(AssortOutward, POINTER) returns description of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
			switch prop
				case AssortOutward.NAME
					prop_description = 'NAME (constant, string) is the name of the out-out-assortativity.';
				case AssortOutward.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the out-out-assortativity.';
				case AssortOutward.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the out-out-assortativity.';
				case AssortOutward.ID
					prop_description = 'ID (data, string) is a few-letter code of the out-out-assortativity.';
				case AssortOutward.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the out-out-assortativity.';
				case AssortOutward.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the out-out-assortativity.';
				case AssortOutward.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.GLOBAL__.';
				case AssortOutward.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case AssortOutward.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case AssortOutward.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case AssortOutward.M
					prop_description = 'M (result, cell) is the out-out-assortativity.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(AssortOutward, POINTER) returns settings of POINTER of AssortOutward.
			%  SETTINGS = M.GETPROPSETTINGS(AssortOutward, POINTER) returns settings of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
			switch prop
				case AssortOutward.TEMPLATE
					prop_settings = 'AssortOutward';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = AssortOutward.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortOutward.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(AssortOutward, POINTER) returns the default value of POINTER of AssortOutward.
			%  DEFAULT = M.GETPROPDEFAULT(AssortOutward, POINTER) returns the default value of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('AssortOutward')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
			switch prop
				case AssortOutward.NAME
					prop_default = 'AssortOutward';
				case AssortOutward.DESCRIPTION
					prop_default = 'The out-out-assortativity coefficient of a graph is the correlation coefficient between the degrees/strengths of all nodes on two opposite ends of an edge within a layer. The corresponding coefficient for directed and weighted networks is calculated by using the weighted and directed variants of out-degree/out-strength.';
				case AssortOutward.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, AssortOutward.getPropSettings(prop));
				case AssortOutward.ID
					prop_default = 'AssortOutward ID';
				case AssortOutward.LABEL
					prop_default = 'AssortOutward label';
				case AssortOutward.NOTES
					prop_default = 'AssortOutward notes';
				case AssortOutward.SHAPE
					prop_default = Measure.GLOBAL;
				case AssortOutward.SCOPE
					prop_default = Measure.UNILAYER;
				case AssortOutward.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case AssortOutward.COMPATIBLE_GRAPHS
					prop_default = {'GraphBD' 'GraphWD' 'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = AssortOutward.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortOutward.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(AssortOutward, POINTER) returns the conditioned default value of POINTER of AssortOutward.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(AssortOutward, POINTER) returns the conditioned default value of POINTER of AssortOutward.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('AssortOutward')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = AssortOutward.getPropProp(pointer);
			
			prop_default = AssortOutward.conditioning(prop, AssortOutward.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(AssortOutward, PROP, VALUE) checks VALUE format for PROP of AssortOutward.
			%  CHECK = M.CHECKPROP(AssortOutward, PROP, VALUE) checks VALUE format for PROP of AssortOutward.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:AssortOutward:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:AssortOutward:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(AssortOutward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortOutward.
			%   Error id: €BRAPH2.STR€:AssortOutward:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(AssortOutward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortOutward.
			%   Error id: €BRAPH2.STR€:AssortOutward:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('AssortOutward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = AssortOutward.getPropProp(pointer);
			
			switch prop
				case AssortOutward.TEMPLATE % __AssortOutward.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, AssortOutward.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortOutward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' AssortOutward.getPropTag(prop) ' (' AssortOutward.getFormatTag(AssortOutward.getPropFormat(prop)) ').'] ...
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
				case AssortOutward.M % __AssortOutward.M__
					rng_settings_ = rng(); rng(m.getPropSeed(AssortOutward.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					N = g.get('NODENUMBER');
					out_out_assortativity = cell(L, 1);
					connectivity_types = g.get('CONNECTIVITY_TYPE', L);  
					parfor li = 1:L
					    Aii = A{li, li};
					    connectivity_type = connectivity_types(li, li);
					    [i, j] = find(Aii ~= 0);  % nodes [i, j]
					    M = length(i);  % Number of edges
					    k_i = zeros(M, L);
					    k_j = zeros(length(j), L);
					    
					    if connectivity_type == Graph.WEIGHTED  % weighted graphs
					        out_strength = StrengthOut('G', g).get('M');
					        d = out_strength{li};
					    else  % binary graphs
					        out_degree = DegreeOut('G', g).get('M');
					        d= out_degree{li};
					    end
					    
					    k_i(:, li) = d(i);  % in-degree/in-strength node i
					    k_j(:, li) = d(j);  % in-degree/in-strength node j
					    % compute assortativity
					    assortativity_layer = (sum(k_i(:, li) .* k_j(:, li)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2)...
					        / (sum(0.5 * (k_i(:, li).^2 + k_j(:, li).^2)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2);
					    assortativity_layer(isnan(assortativity_layer)) = 0;  % Should return zeros, not NaN    
					    out_out_assortativity(li) = {assortativity_layer};
					end
					
					value = out_out_assortativity;
					
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
