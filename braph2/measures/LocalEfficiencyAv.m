classdef LocalEfficiencyAv < LocalEfficiency
	%LocalEfficiencyAv is the graphaverage local efficiency.
	% It is a subclass of <a href="matlab:help LocalEfficiency">LocalEfficiency</a>.
	%
	% The average local efficiency is the average of all the local efficiencies 
	%   within each layer.
	%
	% LocalEfficiencyAv methods (constructor):
	%  LocalEfficiencyAv - constructor
	%
	% LocalEfficiencyAv methods:
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
	% LocalEfficiencyAv methods (display):
	%  tostring - string with information about the average local efficiency
	%  disp - displays information about the average local efficiency
	%  tree - displays the tree of the average local efficiency
	%
	% LocalEfficiencyAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average local efficiency are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average local efficiency
	%
	% LocalEfficiencyAv methods (save/load, Static):
	%  save - saves BRAPH2 average local efficiency as b2 file
	%  load - loads a BRAPH2 average local efficiency from a b2 file
	%
	% LocalEfficiencyAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average local efficiency
	%
	% LocalEfficiencyAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average local efficiency
	%
	% LocalEfficiencyAv methods (inspection, Static):
	%  getClass - returns the class of the average local efficiency
	%  getSubclasses - returns all subclasses of LocalEfficiencyAv
	%  getProps - returns the property list of the average local efficiency
	%  getPropNumber - returns the property number of the average local efficiency
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
	% LocalEfficiencyAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% LocalEfficiencyAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% LocalEfficiencyAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% LocalEfficiencyAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?LocalEfficiencyAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">LocalEfficiencyAv constants</a>.
	%
	
	methods % constructor
		function m = LocalEfficiencyAv(varargin)
			%LocalEfficiencyAv() creates a average local efficiency.
			%
			% LocalEfficiencyAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% LocalEfficiencyAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@LocalEfficiency(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average local efficiency.
			%
			% CLASS = LocalEfficiencyAv.GETCLASS() returns the class 'LocalEfficiencyAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average local efficiency M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('LocalEfficiencyAv') returns 'LocalEfficiencyAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('LocalEfficiencyAv')
			%  are less computationally efficient.
			
			m_class = 'LocalEfficiencyAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average local efficiency.
			%
			% LIST = LocalEfficiencyAv.GETSUBCLASSES() returns all subclasses of 'LocalEfficiencyAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average local efficiency M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('LocalEfficiencyAv') returns all subclasses of 'LocalEfficiencyAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('LocalEfficiencyAv', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average local efficiency.
			%
			% PROPS = LocalEfficiencyAv.GETPROPS() returns the property list of average local efficiency
			%  as a row vector.
			%
			% PROPS = LocalEfficiencyAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average local efficiency M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('LocalEfficiencyAv'[, CATEGORY]) returns the property list of 'LocalEfficiencyAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					LocalEfficiency.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						LocalEfficiency.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						LocalEfficiency.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						LocalEfficiency.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						LocalEfficiency.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						LocalEfficiency.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						LocalEfficiency.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						LocalEfficiency.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						LocalEfficiency.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						LocalEfficiency.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average local efficiency.
			%
			% N = LocalEfficiencyAv.GETPROPNUMBER() returns the property number of average local efficiency.
			%
			% N = LocalEfficiencyAv.GETPROPNUMBER(CATEGORY) returns the property number of average local efficiency
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average local efficiency M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('LocalEfficiencyAv') returns the property number of 'LocalEfficiencyAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(LocalEfficiencyAv.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average local efficiency/error.
			%
			% CHECK = LocalEfficiencyAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(LocalEfficiencyAv, PROP) checks whether PROP exists for LocalEfficiencyAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%  Element.EXISTSPROP(LocalEfficiencyAv, PROP) throws error if PROP does NOT exist for LocalEfficiencyAv.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == LocalEfficiencyAv.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for LocalEfficiencyAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average local efficiency/error.
			%
			% CHECK = LocalEfficiencyAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(LocalEfficiencyAv, TAG) checks whether TAG exists for LocalEfficiencyAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%  Element.EXISTSTAG(LocalEfficiencyAv, TAG) throws error if TAG does NOT exist for LocalEfficiencyAv.
			%   Error id: [BRAPH2:LocalEfficiencyAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			localefficiencyav_tag_list = cellfun(@(x) LocalEfficiencyAv.getPropTag(x), num2cell(LocalEfficiencyAv.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, localefficiencyav_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for LocalEfficiencyAv.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(LocalEfficiencyAv, POINTER) returns property number of POINTER of LocalEfficiencyAv.
			%  PROPERTY = M.GETPROPPROP(LocalEfficiencyAv, POINTER) returns property number of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				localefficiencyav_tag_list = cellfun(@(x) LocalEfficiencyAv.getPropTag(x), num2cell(LocalEfficiencyAv.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, localefficiencyav_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(LocalEfficiencyAv, POINTER) returns tag of POINTER of LocalEfficiencyAv.
			%  TAG = M.GETPROPTAG(LocalEfficiencyAv, POINTER) returns tag of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('LocalEfficiencyAv')
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
						tag = getPropTag@LocalEfficiency(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(LocalEfficiencyAv, POINTER) returns category of POINTER of LocalEfficiencyAv.
			%  CATEGORY = M.GETPROPCATEGORY(LocalEfficiencyAv, POINTER) returns category of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@LocalEfficiency(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(LocalEfficiencyAv, POINTER) returns format of POINTER of LocalEfficiencyAv.
			%  FORMAT = M.GETPROPFORMAT(LocalEfficiencyAv, POINTER) returns format of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@LocalEfficiency(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(LocalEfficiencyAv, POINTER) returns description of POINTER of LocalEfficiencyAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(LocalEfficiencyAv, POINTER) returns description of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				case LocalEfficiencyAv.NAME
					prop_description = 'NAME (constant, string) is the name of theaverage local efficiency.';
				case LocalEfficiencyAv.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of theaverage local efficiency.';
				case LocalEfficiencyAv.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of theaverage local efficiency.';
				case LocalEfficiencyAv.ID
					prop_description = 'ID (data, string) is a few-letter code of theaverage local efficiency.';
				case LocalEfficiencyAv.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of theaverage local efficiency.';
				case LocalEfficiencyAv.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about theaverage local efficiency.';
				case LocalEfficiencyAv.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.GLOBAL__.';
				case LocalEfficiencyAv.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case LocalEfficiencyAv.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case LocalEfficiencyAv.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case LocalEfficiencyAv.M
					prop_description = 'M (result, cell) is theaverage local efficiency.';
				otherwise
					prop_description = getPropDescription@LocalEfficiency(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(LocalEfficiencyAv, POINTER) returns settings of POINTER of LocalEfficiencyAv.
			%  SETTINGS = M.GETPROPSETTINGS(LocalEfficiencyAv, POINTER) returns settings of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				case LocalEfficiencyAv.TEMPLATE
					prop_settings = 'LocalEfficiencyAv';
				otherwise
					prop_settings = getPropSettings@LocalEfficiency(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = LocalEfficiencyAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = LocalEfficiencyAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(LocalEfficiencyAv, POINTER) returns the default value of POINTER of LocalEfficiencyAv.
			%  DEFAULT = M.GETPROPDEFAULT(LocalEfficiencyAv, POINTER) returns the default value of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				case LocalEfficiencyAv.NAME
					prop_default = 'LocalEfficiencyAv';
				case LocalEfficiencyAv.DESCRIPTION
					prop_default = 'The average local efficiency is the average of all the local efficiencies within each layer.';
				case LocalEfficiencyAv.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, LocalEfficiencyAv.getPropSettings(prop));
				case LocalEfficiencyAv.ID
					prop_default = 'LocalEfficiencyAv ID';
				case LocalEfficiencyAv.LABEL
					prop_default = 'LocalEfficiencyAv label';
				case LocalEfficiencyAv.NOTES
					prop_default = 'LocalEfficiencyAv notes';
				case LocalEfficiencyAv.SHAPE
					prop_default = Measure.GLOBAL;
				case LocalEfficiencyAv.SCOPE
					prop_default = Measure.UNILAYER;
				case LocalEfficiencyAv.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				otherwise
					prop_default = getPropDefault@LocalEfficiency(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = LocalEfficiencyAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = LocalEfficiencyAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(LocalEfficiencyAv, POINTER) returns the conditioned default value of POINTER of LocalEfficiencyAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(LocalEfficiencyAv, POINTER) returns the conditioned default value of POINTER of LocalEfficiencyAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			prop_default = LocalEfficiencyAv.conditioning(prop, LocalEfficiencyAv.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(LocalEfficiencyAv, PROP, VALUE) checks VALUE format for PROP of LocalEfficiencyAv.
			%  CHECK = M.CHECKPROP(LocalEfficiencyAv, PROP, VALUE) checks VALUE format for PROP of LocalEfficiencyAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:LocalEfficiencyAv:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:LocalEfficiencyAv:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(LocalEfficiencyAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of LocalEfficiencyAv.
			%   Error id: €BRAPH2.STR€:LocalEfficiencyAv:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(LocalEfficiencyAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of LocalEfficiencyAv.
			%   Error id: €BRAPH2.STR€:LocalEfficiencyAv:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('LocalEfficiencyAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = LocalEfficiencyAv.getPropProp(pointer);
			
			switch prop
				case LocalEfficiencyAv.TEMPLATE % __LocalEfficiencyAv.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, LocalEfficiencyAv.getPropSettings(prop));
				otherwise
					if prop <= LocalEfficiency.getPropNumber()
						check = checkProp@LocalEfficiency(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':LocalEfficiencyAv:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' LocalEfficiencyAv.getPropTag(prop) ' (' LocalEfficiencyAv.getFormatTag(LocalEfficiencyAv.getPropFormat(prop)) ').'] ...
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
				case LocalEfficiencyAv.M % __LocalEfficiencyAv.M__
					rng_settings_ = rng(); rng(m.getPropSeed(LocalEfficiencyAv.M), 'twister')
					
					local_efficiency = calculateValue@LocalEfficiency(m, prop);
					g = m.get('G');  % graph from measure class
					
					local_efficiency_av = cell(g.get('LAYERNUMBER'), 1);
					ls = g.get('PARTITIONS');
					L = g.get('LAYERNUMBER');
					
					if L == 0
					    value = {};
					    return;
					end
					
					parfor li = 1:L
					    local_efficiency_av(li) ={mean(local_efficiency{li})};
					end
					
					value = local_efficiency_av;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= LocalEfficiency.getPropNumber()
						value = calculateValue@LocalEfficiency(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
