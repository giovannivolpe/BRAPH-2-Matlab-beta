classdef OverlappingS < Strength
	%OverlappingS is the graph Overlapping Strength.
	% It is a subclass of <a href="matlab:help Strength">Strength</a>.
	%
	% The Overlapping Strength (OverlappingS) of a graph is the sum of the strengths of a node in 
	% all layers.
	%
	% The list of OverlappingS properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Overlapping Strength.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Overlapping Strength.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Overlapping Strength.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Overlapping Strength.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Overlapping Strength.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Overlapping Strength.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Overlapping Strength.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
	%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
	%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
	%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
	%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
	%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the Overlapping Strength.
	%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
	%
	% OverlappingS methods (constructor):
	%  OverlappingS - constructor
	%
	% OverlappingS methods:
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
	% OverlappingS methods (display):
	%  tostring - string with information about the overlapping strength
	%  disp - displays information about the overlapping strength
	%  tree - displays the tree of the overlapping strength
	%
	% OverlappingS methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two overlapping strength are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the overlapping strength
	%
	% OverlappingS methods (save/load, Static):
	%  save - saves BRAPH2 overlapping strength as b2 file
	%  load - loads a BRAPH2 overlapping strength from a b2 file
	%
	% OverlappingS method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the overlapping strength
	%
	% OverlappingS method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the overlapping strength
	%
	% OverlappingS methods (inspection, Static):
	%  getClass - returns the class of the overlapping strength
	%  getSubclasses - returns all subclasses of OverlappingS
	%  getProps - returns the property list of the overlapping strength
	%  getPropNumber - returns the property number of the overlapping strength
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
	% OverlappingS methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% OverlappingS methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% OverlappingS methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% OverlappingS methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?OverlappingS; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">OverlappingS constants</a>.
	%
	
	methods % constructor
		function m = OverlappingS(varargin)
			%OverlappingS() creates a overlapping strength.
			%
			% OverlappingS(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% OverlappingS(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of OverlappingS properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Overlapping Strength.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Overlapping Strength.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Overlapping Strength.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Overlapping Strength.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Overlapping Strength.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Overlapping Strength.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Overlapping Strength.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
			%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
			%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
			%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
			%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
			%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the Overlapping Strength.
			%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
			%
			% See also Category, Format.
			
			m = m@Strength(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the overlapping strength.
			%
			% CLASS = OverlappingS.GETCLASS() returns the class 'OverlappingS'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the overlapping strength M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('OverlappingS') returns 'OverlappingS'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('OverlappingS')
			%  are less computationally efficient.
			
			m_class = 'OverlappingS';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the overlapping strength.
			%
			% LIST = OverlappingS.GETSUBCLASSES() returns all subclasses of 'OverlappingS'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the overlapping strength M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('OverlappingS') returns all subclasses of 'OverlappingS'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('OverlappingS')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'OverlappingS'  'OverlappingSAv' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of overlapping strength.
			%
			% PROPS = OverlappingS.GETPROPS() returns the property list of overlapping strength
			%  as a row vector.
			%
			% PROPS = OverlappingS.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the overlapping strength M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('OverlappingS'[, CATEGORY]) returns the property list of 'OverlappingS'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 3 9 10 11 12];
				case 2 % Category.METADATA
					prop_list = [6 7];
				case 3 % Category.PARAMETER
					prop_list = 4;
				case 4 % Category.DATA
					prop_list = [5 13];
				case 5 % Category.RESULT
					prop_list = 14;
				case 6 % Category.QUERY
					prop_list = 8;
				case 9 % Category.GUI
					prop_list = 15;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of overlapping strength.
			%
			% N = OverlappingS.GETPROPNUMBER() returns the property number of overlapping strength.
			%
			% N = OverlappingS.GETPROPNUMBER(CATEGORY) returns the property number of overlapping strength
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the overlapping strength M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('OverlappingS') returns the property number of 'OverlappingS'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 15;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 7;
				case 2 % Category.METADATA
					prop_number = 2;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 2;
				case 5 % Category.RESULT
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 1;
				case 9 % Category.GUI
					prop_number = 1;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in overlapping strength/error.
			%
			% CHECK = OverlappingS.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(OverlappingS, PROP) checks whether PROP exists for OverlappingS.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:OverlappingS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%  Element.EXISTSPROP(OverlappingS, PROP) throws error if PROP does NOT exist for OverlappingS.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 15 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':OverlappingS:' 'WrongInput'], ...
					['BRAPH2' ':OverlappingS:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for OverlappingS.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in overlapping strength/error.
			%
			% CHECK = OverlappingS.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(OverlappingS, TAG) checks whether TAG exists for OverlappingS.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:OverlappingS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%  Element.EXISTSTAG(OverlappingS, TAG) throws error if TAG does NOT exist for OverlappingS.
			%   Error id: [BRAPH2:OverlappingS:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':OverlappingS:' 'WrongInput'], ...
					['BRAPH2' ':OverlappingS:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for OverlappingS.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(OverlappingS, POINTER) returns property number of POINTER of OverlappingS.
			%  PROPERTY = M.GETPROPPROP(OverlappingS, POINTER) returns property number of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = Element.GETPROPTAG(OverlappingS, POINTER) returns tag of POINTER of OverlappingS.
			%  TAG = M.GETPROPTAG(OverlappingS, POINTER) returns tag of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				overlappings_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' };
				tag = overlappings_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(OverlappingS, POINTER) returns category of POINTER of OverlappingS.
			%  CATEGORY = M.GETPROPCATEGORY(OverlappingS, POINTER) returns category of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('OverlappingS')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			overlappings_category_list = { 1  1  1  3  4  2  2  6  1  1  1  1  4  5  9 };
			prop_category = overlappings_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(OverlappingS, POINTER) returns format of POINTER of OverlappingS.
			%  FORMAT = M.GETPROPFORMAT(OverlappingS, POINTER) returns format of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('OverlappingS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			overlappings_format_list = { 2  2  2  8  2  2  2  2  11  11  11  7  8  16  8 };
			prop_format = overlappings_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(OverlappingS, POINTER) returns description of POINTER of OverlappingS.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(OverlappingS, POINTER) returns description of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			overlappings_description_list = { 'ELCLASS (constant, string) is the class of the Overlapping Strength.'  'NAME (constant, string) is the name of the Overlapping Strength.'  'DESCRIPTION (constant, string) is the description of the Overlapping Strength.'  'TEMPLATE (parameter, item) is the template of the Overlapping Strength.'  'ID (data, string) is a few-letter code of the Overlapping Strength.'  'LABEL (metadata, string) is an extended label of the Overlapping Strength.'  'NOTES (metadata, string) are some specific notes about the Overlapping Strength.'  'TOSTRING (query, string) returns a string that represents the object.'  'SHAPE (constant, scalar) is the measure shape Measure.NODAL.'  'SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.'  'PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.'  'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.'  'G (data, item) is the measure graph.'  'M (result, cell) is the Overlapping Strength.'  'PFM (gui, item) contains the panel figure of the measure.' };
			prop_description = overlappings_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(OverlappingS, POINTER) returns settings of POINTER of OverlappingS.
			%  SETTINGS = M.GETPROPSETTINGS(OverlappingS, POINTER) returns settings of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 4 % OverlappingS.TEMPLATE
					prop_settings = 'OverlappingS';
				otherwise
					prop_settings = getPropSettings@Strength(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = OverlappingS.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingS.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(OverlappingS, POINTER) returns the default value of POINTER of OverlappingS.
			%  DEFAULT = M.GETPROPDEFAULT(OverlappingS, POINTER) returns the default value of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('OverlappingS')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 1 % OverlappingS.ELCLASS
					prop_default = 'OverlappingS';
				case 2 % OverlappingS.NAME
					prop_default = 'Overlapping Strength';
				case 3 % OverlappingS.DESCRIPTION
					prop_default = 'The Overlapping Strength (OverlappingS) of a graph is the sum of the strengths of a node in all layers.';
				case 4 % OverlappingS.TEMPLATE
					prop_default = Format.getFormatDefault(8, OverlappingS.getPropSettings(prop));
				case 5 % OverlappingS.ID
					prop_default = 'OverlappingS ID';
				case 6 % OverlappingS.LABEL
					prop_default = 'Overlapping Strength label';
				case 7 % OverlappingS.NOTES
					prop_default = 'Overlapping Strength notes';
				case 9 % OverlappingS.SHAPE
					prop_default = 2;
				case 10 % OverlappingS.SCOPE
					prop_default = 1;
				case 11 % OverlappingS.PARAMETRICITY
					prop_default = 2;
				case 12 % OverlappingS.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'OrdMxWU' 'MultilayerWU' 'OrdMlWU'};;
				otherwise
					prop_default = getPropDefault@Strength(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = OverlappingS.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = OverlappingS.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(OverlappingS, POINTER) returns the conditioned default value of POINTER of OverlappingS.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(OverlappingS, POINTER) returns the conditioned default value of POINTER of OverlappingS.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('OverlappingS')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = OverlappingS.getPropProp(pointer);
			
			prop_default = OverlappingS.conditioning(prop, OverlappingS.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(OverlappingS, PROP, VALUE) checks VALUE format for PROP of OverlappingS.
			%  CHECK = M.CHECKPROP(OverlappingS, PROP, VALUE) checks VALUE format for PROP of OverlappingS.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:OverlappingS:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: BRAPH2:OverlappingS:WrongInput
			%  Element.CHECKPROP(OverlappingS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingS.
			%   Error id: BRAPH2:OverlappingS:WrongInput
			%  M.CHECKPROP(OverlappingS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of OverlappingS.
			%   Error id: BRAPH2:OverlappingS:WrongInput]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('OverlappingS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = OverlappingS.getPropProp(pointer);
			
			switch prop
				case 4 % OverlappingS.TEMPLATE
					check = Format.checkFormat(8, value, OverlappingS.getPropSettings(prop));
				otherwise
					if prop <= 15
						check = checkProp@Strength(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':OverlappingS:' 'WrongInput'], ...
					['BRAPH2' ':OverlappingS:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' OverlappingS.getPropTag(prop) ' (' OverlappingS.getFormatTag(OverlappingS.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(m, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case 14 % OverlappingS.M
					rng_settings_ = rng(); rng(m.getPropSeed(14), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    strength = calculateValue@Strength(m, prop);	
					    overlapping_strength = zeros(N(1), 1);
					    for li = 1:l 
					        overlapping_strength = overlapping_strength + strength{li};
					    end
					    value = {overlapping_strength};
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= 15
						value = calculateValue@Strength(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
