classdef AssortInward < Measure
	%AssortInward is the graph in-in-assortativity.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The in-in-assortativity coefficient of a graph is the correlation coefficient between 
	%   the degrees/strengths of all nodes on two opposite ends of an edge within a layer. 
	% The corresponding coefficient for directed and weighted networks is calculated by 
	%   using the weighted and directed variants of in-degree/in-strength.
	%
	% AssortInward methods (constructor):
	%  AssortInward - constructor
	%
	% AssortInward methods:
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
	% AssortInward methods (display):
	%  tostring - string with information about the in-in-assortativity
	%  disp - displays information about the in-in-assortativity
	%  tree - displays the tree of the in-in-assortativity
	%
	% AssortInward methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two in-in-assortativity are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the in-in-assortativity
	%
	% AssortInward methods (save/load, Static):
	%  save - saves BRAPH2 in-in-assortativity as b2 file
	%  load - loads a BRAPH2 in-in-assortativity from a b2 file
	%
	% AssortInward method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the in-in-assortativity
	%
	% AssortInward method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the in-in-assortativity
	%
	% AssortInward methods (inspection, Static):
	%  getClass - returns the class of the in-in-assortativity
	%  getSubclasses - returns all subclasses of AssortInward
	%  getProps - returns the property list of the in-in-assortativity
	%  getPropNumber - returns the property number of the in-in-assortativity
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
	% AssortInward methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% AssortInward methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% AssortInward methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% AssortInward methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?AssortInward; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">AssortInward constants</a>.
	%
	
	methods % constructor
		function m = AssortInward(varargin)
			%AssortInward() creates a in-in-assortativity.
			%
			% AssortInward(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% AssortInward(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the in-in-assortativity.
			%
			% CLASS = AssortInward.GETCLASS() returns the class 'AssortInward'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the in-in-assortativity M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('AssortInward') returns 'AssortInward'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('AssortInward')
			%  are less computationally efficient.
			
			m_class = 'AssortInward';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the in-in-assortativity.
			%
			% LIST = AssortInward.GETSUBCLASSES() returns all subclasses of 'AssortInward'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the in-in-assortativity M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('AssortInward') returns all subclasses of 'AssortInward'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('AssortInward')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('AssortInward', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of in-in-assortativity.
			%
			% PROPS = AssortInward.GETPROPS() returns the property list of in-in-assortativity
			%  as a row vector.
			%
			% PROPS = AssortInward.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the in-in-assortativity M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('AssortInward'[, CATEGORY]) returns the property list of 'AssortInward'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('AssortInward')
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
			%GETPROPNUMBER returns the property number of in-in-assortativity.
			%
			% N = AssortInward.GETPROPNUMBER() returns the property number of in-in-assortativity.
			%
			% N = AssortInward.GETPROPNUMBER(CATEGORY) returns the property number of in-in-assortativity
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the in-in-assortativity M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('AssortInward') returns the property number of 'AssortInward'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('AssortInward')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(AssortInward.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in in-in-assortativity/error.
			%
			% CHECK = AssortInward.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(AssortInward, PROP) checks whether PROP exists for AssortInward.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:AssortInward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%  Element.EXISTSPROP(AssortInward, PROP) throws error if PROP does NOT exist for AssortInward.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('AssortInward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == AssortInward.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for AssortInward.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in in-in-assortativity/error.
			%
			% CHECK = AssortInward.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(AssortInward, TAG) checks whether TAG exists for AssortInward.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:AssortInward:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%  Element.EXISTSTAG(AssortInward, TAG) throws error if TAG does NOT exist for AssortInward.
			%   Error id: [BRAPH2:AssortInward:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('AssortInward')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			assortinward_tag_list = cellfun(@(x) AssortInward.getPropTag(x), num2cell(AssortInward.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, assortinward_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for AssortInward.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(AssortInward, POINTER) returns property number of POINTER of AssortInward.
			%  PROPERTY = M.GETPROPPROP(AssortInward, POINTER) returns property number of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('AssortInward')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				assortinward_tag_list = cellfun(@(x) AssortInward.getPropTag(x), num2cell(AssortInward.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, assortinward_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(AssortInward, POINTER) returns tag of POINTER of AssortInward.
			%  TAG = M.GETPROPTAG(AssortInward, POINTER) returns tag of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('AssortInward')
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
			%  CATEGORY = Element.GETPROPCATEGORY(AssortInward, POINTER) returns category of POINTER of AssortInward.
			%  CATEGORY = M.GETPROPCATEGORY(AssortInward, POINTER) returns category of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('AssortInward')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
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
			%  FORMAT = Element.GETPROPFORMAT(AssortInward, POINTER) returns format of POINTER of AssortInward.
			%  FORMAT = M.GETPROPFORMAT(AssortInward, POINTER) returns format of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('AssortInward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(AssortInward, POINTER) returns description of POINTER of AssortInward.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(AssortInward, POINTER) returns description of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('AssortInward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
			switch prop
				case AssortInward.NAME
					prop_description = 'NAME (constant, string) is the name of the in-in-assortativity.';
				case AssortInward.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the in-in-assortativity.';
				case AssortInward.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the in-in-assortativity.';
				case AssortInward.ID
					prop_description = 'ID (data, string) is a few-letter code of the in-in-assortativity.';
				case AssortInward.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the in-in-assortativity.';
				case AssortInward.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the in-in-assortativity.';
				case AssortInward.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.GLOBAL__.';
				case AssortInward.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case AssortInward.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case AssortInward.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case AssortInward.M
					prop_description = 'M (result, cell) is the in-in-assortativity.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(AssortInward, POINTER) returns settings of POINTER of AssortInward.
			%  SETTINGS = M.GETPROPSETTINGS(AssortInward, POINTER) returns settings of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('AssortInward')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
			switch prop
				case AssortInward.TEMPLATE
					prop_settings = 'AssortInward';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = AssortInward.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortInward.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(AssortInward, POINTER) returns the default value of POINTER of AssortInward.
			%  DEFAULT = M.GETPROPDEFAULT(AssortInward, POINTER) returns the default value of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('AssortInward')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
			switch prop
				case AssortInward.NAME
					prop_default = 'AssortInward';
				case AssortInward.DESCRIPTION
					prop_default = 'The in-in-assortativity coefficient of a graph is the correlation coefficient between the degrees/strengths of all nodes on two opposite ends of an edge within a layer. The corresponding coefficient for directed and weighted networks is calculated by using the weighted and directed variants of in-degree/in-strength.';
				case AssortInward.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, AssortInward.getPropSettings(prop));
				case AssortInward.ID
					prop_default = 'AssortInward ID';
				case AssortInward.LABEL
					prop_default = 'AssortInward label';
				case AssortInward.NOTES
					prop_default = 'AssortInward notes';
				case AssortInward.SHAPE
					prop_default = Measure.GLOBAL;
				case AssortInward.SCOPE
					prop_default = Measure.UNILAYER;
				case AssortInward.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case AssortInward.COMPATIBLE_GRAPHS
					prop_default = {'GraphBD' 'GraphWD' 'MultiplexWD' 'MultiplexBD'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = AssortInward.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = AssortInward.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(AssortInward, POINTER) returns the conditioned default value of POINTER of AssortInward.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(AssortInward, POINTER) returns the conditioned default value of POINTER of AssortInward.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('AssortInward')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = AssortInward.getPropProp(pointer);
			
			prop_default = AssortInward.conditioning(prop, AssortInward.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(AssortInward, PROP, VALUE) checks VALUE format for PROP of AssortInward.
			%  CHECK = M.CHECKPROP(AssortInward, PROP, VALUE) checks VALUE format for PROP of AssortInward.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:AssortInward:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:AssortInward:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(AssortInward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortInward.
			%   Error id: €BRAPH2.STR€:AssortInward:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(AssortInward, PROP, VALUE) throws error if VALUE has not a valid format for PROP of AssortInward.
			%   Error id: €BRAPH2.STR€:AssortInward:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('AssortInward')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = AssortInward.getPropProp(pointer);
			
			switch prop
				case AssortInward.TEMPLATE % __AssortInward.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, AssortInward.getPropSettings(prop));
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':AssortInward:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' AssortInward.getPropTag(prop) ' (' AssortInward.getFormatTag(AssortInward.getPropFormat(prop)) ').'] ...
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
				case AssortInward.M % __AssortInward.M__
					rng_settings_ = rng(); rng(m.getPropSeed(AssortInward.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					N = g.get('NODENUMBER');
					in_in_assortativity = cell(L, 1);
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
					        d = in_strength{li};
					    else  % binary graphs
					        in_degree = DegreeIn('G', g).get('M');
					        d= in_degree{li};
					    end
					    
					    k_i(:, li) = d(i);  % in-degree/in-strength node i
					    k_j(:, li) = d(j);  % in-degree/in-strength node j
					    % compute assortativity
					    assortativity_layer = (sum(k_i(:, li) .* k_j(:, li)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2)...
					        / (sum(0.5 * (k_i(:, li).^2 + k_j(:, li).^2)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2);
					    assortativity_layer(isnan(assortativity_layer)) = 0;  % Should return zeros, not NaN
					    
					    in_in_assortativity(li) = {assortativity_layer};
					end
					
					value = in_in_assortativity;
					
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
