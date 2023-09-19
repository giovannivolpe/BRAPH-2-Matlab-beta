classdef OverlappingStrOut < StrengthOut
	%OverlappingStrOut is the graph overlapping strength.
	% It is a subclass of <a href="matlab:help StrengthOut">StrengthOut</a>.
	%
	% The overlapping out-strength of a graph is the sum of the out-strengths of a 
	% node in all layers.
	%
	% OverlappingStrOut methods (constructor):
	%  OverlappingStrOut - constructor
	%
	% OverlappingStrOut methods:
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
	% OverlappingStrOut methods (display):
	%  tostring - string with information about the ovrlapstrout
	%  disp - displays information about the ovrlapstrout
	%  tree - displays the tree of the ovrlapstrout
	%
	% OverlappingStrOut methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two ovrlapstrout are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the ovrlapstrout
	%
	% OverlappingStrOut methods (save/load, Static):
	%  save - saves BRAPH2 ovrlapstrout as b2 file
	%  load - loads a BRAPH2 ovrlapstrout from a b2 file
	%
	% OverlappingStrOut method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the ovrlapstrout
	%
	% OverlappingStrOut method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the ovrlapstrout
	%
	% OverlappingStrOut methods (inspection, Static):
	%  getClass - returns the class of the ovrlapstrout
	%  getSubclasses - returns all subclasses of OverlappingStrOut
	%  getProps - returns the property list of the ovrlapstrout
	%  getPropNumber - returns the property number of the ovrlapstrout
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
	% OverlappingStrOut methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingStrOut methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingStrOut methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingStrOut methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingStrOut; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingStrOut constants</a>.
	%
	
	methods % constructor
		function m = OverlappingStrOut(varargin)
			%OverlappingStrOut() creates a ovrlapstrout.
			%
			% OverlappingStrOut(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingStrOut(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@StrengthOut(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the ovrlapstrout.
			%
			% CLASS = OverlappingStrOut.GETCLASS() returns the class 'OverlappingStrOut'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the ovrlapstrout M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingStrOut') returns 'OverlappingStrOut'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingStrOut')
			%  are less computationally efficient.
			
			m_class = 'OverlappingStrOut';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the ovrlapstrout.
			%
			% LIST = OverlappingStrOut.GETSUBCLASSES() returns all subclasses of 'OverlappingStrOut'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the ovrlapstrout M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingStrOut') returns all subclasses of 'OverlappingStrOut'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('OverlappingStrOut', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of ovrlapstrout.
			%
			% PROPS = OverlappingStrOut.GETPROPS() returns the property list of ovrlapstrout
			%  as a row vector.
			%
			% PROPS = OverlappingStrOut.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the ovrlapstrout M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingStrOut'[, CATEGORY]) returns the property list of 'OverlappingStrOut'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					StrengthOut.getProps() ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						StrengthOut.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						StrengthOut.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						StrengthOut.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						StrengthOut.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						StrengthOut.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						StrengthOut.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						StrengthOut.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						StrengthOut.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						StrengthOut.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of ovrlapstrout.
			%
			% N = OverlappingStrOut.GETPROPNUMBER() returns the property number of ovrlapstrout.
			%
			% N = OverlappingStrOut.GETPROPNUMBER(CATEGORY) returns the property number of ovrlapstrout
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the ovrlapstrout M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingStrOut') returns the property number of 'OverlappingStrOut'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(OverlappingStrOut.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in ovrlapstrout/error.
			%
			% CHECK = OverlappingStrOut.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingStrOut, PROP) checks whether PROP exists for OverlappingStrOut.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%  Element.EXISTSPROP(OverlappingStrOut, PROP) throws error if PROP does NOT exist for OverlappingStrOut.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == OverlappingStrOut.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingStrOut.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in ovrlapstrout/error.
			%
			% CHECK = OverlappingStrOut.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingStrOut, TAG) checks whether TAG exists for OverlappingStrOut.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%  Element.EXISTSTAG(OverlappingStrOut, TAG) throws error if TAG does NOT exist for OverlappingStrOut.
			%   Error id: [BRAPH2:OverlappingStrOut:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			overlappingstrout_tag_list = cellfun(@(x) OverlappingStrOut.getPropTag(x), num2cell(OverlappingStrOut.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, overlappingstrout_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingStrOut.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingStrOut, POINTER) returns property number of POINTER of OverlappingStrOut.
			%  PROPERTY = M.GETPROPPROP(OverlappingStrOut, POINTER) returns property number of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				overlappingstrout_tag_list = cellfun(@(x) OverlappingStrOut.getPropTag(x), num2cell(OverlappingStrOut.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, overlappingstrout_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(OverlappingStrOut, POINTER) returns tag of POINTER of OverlappingStrOut.
			%  TAG = M.GETPROPTAG(OverlappingStrOut, POINTER) returns tag of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingStrOut')
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
						tag = getPropTag@StrengthOut(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingStrOut, POINTER) returns category of POINTER of OverlappingStrOut.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingStrOut, POINTER) returns category of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_category = getPropCategory@StrengthOut(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingStrOut, POINTER) returns format of POINTER of OverlappingStrOut.
			%  FORMAT = M.GETPROPFORMAT(OverlappingStrOut, POINTER) returns format of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_format = getPropFormat@StrengthOut(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingStrOut, POINTER) returns description of POINTER of OverlappingStrOut.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingStrOut, POINTER) returns description of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingStrOut.NAME
					prop_description = 'NAME (constant, string) is the name of the overlapping strength.';
				case OverlappingStrOut.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the overlapping strength.';
				case OverlappingStrOut.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the overlapping strength.';
				case OverlappingStrOut.ID
					prop_description = 'ID (data, string) is a few-letter code of the overlapping strength.';
				case OverlappingStrOut.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the overlapping strength.';
				case OverlappingStrOut.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the overlapping strength.';
				case OverlappingStrOut.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case OverlappingStrOut.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case OverlappingStrOut.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case OverlappingStrOut.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case OverlappingStrOut.M
					prop_description = 'M (result, cell) is the overlapping strength.';
				otherwise
					prop_description = getPropDescription@StrengthOut(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingStrOut, POINTER) returns settings of POINTER of OverlappingStrOut.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingStrOut, POINTER) returns settings of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingStrOut.TEMPLATE
					prop_settings = 'OverlappingStrOut';
				otherwise
					prop_settings = getPropSettings@StrengthOut(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingStrOut.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrOut.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingStrOut, POINTER) returns the default value of POINTER of OverlappingStrOut.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingStrOut, POINTER) returns the default value of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingStrOut.NAME
					prop_default = 'OverlappingStrOut';
				case OverlappingStrOut.DESCRIPTION
					prop_default = 'The overlapping out-strength of a graph is the sum of the out-strengths of a node in all layers.';
				case OverlappingStrOut.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, OverlappingStrOut.getPropSettings(prop));
				case OverlappingStrOut.ID
					prop_default = 'OverlappingStrOut ID';
				case OverlappingStrOut.LABEL
					prop_default = 'OverlappingStrOut label';
				case OverlappingStrOut.NOTES
					prop_default = 'OverlappingStrOut notes';
				case OverlappingStrOut.SHAPE
					prop_default = Measure.NODAL;
				case OverlappingStrOut.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case OverlappingStrOut.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case OverlappingStrOut.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD'};;
				otherwise
					prop_default = getPropDefault@StrengthOut(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingStrOut.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingStrOut.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingStrOut, POINTER) returns the conditioned default value of POINTER of OverlappingStrOut.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingStrOut, POINTER) returns the conditioned default value of POINTER of OverlappingStrOut.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			prop_default = OverlappingStrOut.conditioning(prop, OverlappingStrOut.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingStrOut, PROP, VALUE) checks VALUE format for PROP of OverlappingStrOut.
			%  CHECK = M.CHECKPROP(OverlappingStrOut, PROP, VALUE) checks VALUE format for PROP of OverlappingStrOut.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:OverlappingStrOut:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:OverlappingStrOut:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(OverlappingStrOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrOut.
			%   Error id: €BRAPH2.STR€:OverlappingStrOut:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(OverlappingStrOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingStrOut.
			%   Error id: €BRAPH2.STR€:OverlappingStrOut:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingStrOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingStrOut.getPropProp(pointer);
			
			switch prop
				case OverlappingStrOut.TEMPLATE % __OverlappingStrOut.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, OverlappingStrOut.getPropSettings(prop));
				otherwise
					if prop <= StrengthOut.getPropNumber()
						check = checkProp@StrengthOut(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':OverlappingStrOut:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingStrOut.getPropTag(prop) ' (' OverlappingStrOut.getFormatTag(OverlappingStrOut.getPropFormat(prop)) ').'] ...
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
				case OverlappingStrOut.M % __OverlappingStrOut.M__
					rng_settings_ = rng(); rng(m.getPropSeed(OverlappingStrOut.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    strength = calculateValue@StrengthOut(m, prop);	
					    overlapping_strength = zeros(N(1), 1);
					    for li = 1:l  
					        overlapping_strength = overlapping_strength + strength{li};
					    end
					    value = {overlapping_strength};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= StrengthOut.getPropNumber()
						value = calculateValue@StrengthOut(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
