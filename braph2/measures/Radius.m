classdef Radius < Measure
	%Radius is the graph radius.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The radius is the minimum eccentricity among the vertice within a layer.
	%
	% The list of Radius properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the radius.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the radius.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the radius.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the radius.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the radius.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the radius.
	%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>8</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.
	%  <strong>9</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
	%  <strong>10</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
	%  <strong>11</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
	%  <strong>12</strong> <strong>G</strong> 	G (data, item) is the measure graph.
	%  <strong>13</strong> <strong>M</strong> 	M (result, cell) is the radius.
	%  <strong>14</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
	%  <strong>15</strong> <strong>RULE</strong> 	RULE (parameter, OPTION) % calculation in a graph or its subgraph
	%
	% Radius methods (constructor):
	%  Radius - constructor
	%
	% Radius methods:
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
	% Radius methods (display):
	%  tostring - string with information about the radius
	%  disp - displays information about the radius
	%  tree - displays the tree of the radius
	%
	% Radius methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two radius are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the radius
	%
	% Radius methods (save/load, Static):
	%  save - saves BRAPH2 radius as b2 file
	%  load - loads a BRAPH2 radius from a b2 file
	%
	% Radius method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the radius
	%
	% Radius method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the radius
	%
	% Radius methods (inspection, Static):
	%  getClass - returns the class of the radius
	%  getSubclasses - returns all subclasses of Radius
	%  getProps - returns the property list of the radius
	%  getPropNumber - returns the property number of the radius
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
	% Radius methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% Radius methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% Radius methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% Radius methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?Radius; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">Radius constants</a>.
	%
	
	properties (Constant) % properties
		RULE = 15; %CET: Computational Efficiency Trick
		RULE_TAG = 'RULE';
		RULE_CATEGORY = 3;
		RULE_FORMAT = 5;
	end
	methods % constructor
		function m = Radius(varargin)
			%Radius() creates a radius.
			%
			% Radius(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% Radius(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of Radius properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the radius.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the radius.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the radius.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the radius.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the radius.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the radius.
			%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>8</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.
			%  <strong>9</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
			%  <strong>10</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
			%  <strong>11</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
			%  <strong>12</strong> <strong>G</strong> 	G (data, item) is the measure graph.
			%  <strong>13</strong> <strong>M</strong> 	M (result, cell) is the radius.
			%  <strong>14</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
			%  <strong>15</strong> <strong>RULE</strong> 	RULE (parameter, OPTION) % calculation in a graph or its subgraph
			%
			% See also Category, Format.
			
			m = m@Measure(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the radius.
			%
			% CLASS = Radius.GETCLASS() returns the class 'Radius'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the radius M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('Radius') returns 'Radius'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('Radius')
			%  are less computationally efficient.
			
			m_class = 'Radius';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the radius.
			%
			% LIST = Radius.GETSUBCLASSES() returns all subclasses of 'Radius'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the radius M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('Radius') returns all subclasses of 'Radius'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('Radius')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'Radius' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of radius.
			%
			% PROPS = Radius.GETPROPS() returns the property list of radius
			%  as a row vector.
			%
			% PROPS = Radius.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the radius M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('Radius'[, CATEGORY]) returns the property list of 'Radius'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('Radius')
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
					prop_list = [1 2 8 9 10 11];
				case 2 % Category.METADATA
					prop_list = [5 6];
				case 3 % Category.PARAMETER
					prop_list = [3 15];
				case 4 % Category.DATA
					prop_list = [4 12];
				case 5 % Category.RESULT
					prop_list = 13;
				case 6 % Category.QUERY
					prop_list = 7;
				case 9 % Category.GUI
					prop_list = 14;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of radius.
			%
			% N = Radius.GETPROPNUMBER() returns the property number of radius.
			%
			% N = Radius.GETPROPNUMBER(CATEGORY) returns the property number of radius
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the radius M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('Radius') returns the property number of 'Radius'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('Radius')
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
					prop_number = 6;
				case 2 % Category.METADATA
					prop_number = 2;
				case 3 % Category.PARAMETER
					prop_number = 2;
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
			%EXISTSPROP checks whether property exists in radius/error.
			%
			% CHECK = Radius.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(Radius, PROP) checks whether PROP exists for Radius.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:Radius:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%  Element.EXISTSPROP(Radius, PROP) throws error if PROP does NOT exist for Radius.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('Radius')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 15 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Radius:' 'WrongInput'], ...
					['BRAPH2' ':Radius:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for Radius.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in radius/error.
			%
			% CHECK = Radius.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(Radius, TAG) checks whether TAG exists for Radius.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:Radius:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%  Element.EXISTSTAG(Radius, TAG) throws error if TAG does NOT exist for Radius.
			%   Error id: [BRAPH2:Radius:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('Radius')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM'  'RULE' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Radius:' 'WrongInput'], ...
					['BRAPH2' ':Radius:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for Radius.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(Radius, POINTER) returns property number of POINTER of Radius.
			%  PROPERTY = M.GETPROPPROP(Radius, POINTER) returns property number of POINTER of Radius.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('Radius')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM'  'RULE' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = Element.GETPROPTAG(Radius, POINTER) returns tag of POINTER of Radius.
			%  TAG = M.GETPROPTAG(Radius, POINTER) returns tag of POINTER of Radius.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('Radius')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				radius_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM'  'RULE' };
				tag = radius_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(Radius, POINTER) returns category of POINTER of Radius.
			%  CATEGORY = M.GETPROPCATEGORY(Radius, POINTER) returns category of POINTER of Radius.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('Radius')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			radius_category_list = { 1  1  3  4  2  2  6  1  1  1  1  4  5  9  3 };
			prop_category = radius_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(Radius, POINTER) returns format of POINTER of Radius.
			%  FORMAT = M.GETPROPFORMAT(Radius, POINTER) returns format of POINTER of Radius.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('Radius')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			radius_format_list = { 2  2  8  2  2  2  2  11  11  11  7  8  16  8  5 };
			prop_format = radius_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(Radius, POINTER) returns description of POINTER of Radius.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(Radius, POINTER) returns description of POINTER of Radius.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('Radius')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			radius_description_list = { 'NAME (constant, string) is the name of the radius.'  'DESCRIPTION (constant, string) is the description of the radius.'  'TEMPLATE (parameter, item) is the template of the radius.'  'ID (data, string) is a few-letter code of the radius.'  'LABEL (metadata, string) is an extended label of the radius.'  'NOTES (metadata, string) are some specific notes about the radius.'  'TOSTRING (query, string) returns a string that represents the object.'  'SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.'  'SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.'  'PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.'  'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.'  'G (data, item) is the measure graph.'  'M (result, cell) is the radius.'  'PFM (gui, item) contains the panel figure of the measure.'  'RULE (parameter, OPTION) % calculation in a graph or its subgraph' };
			prop_description = radius_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(Radius, POINTER) returns settings of POINTER of Radius.
			%  SETTINGS = M.GETPROPSETTINGS(Radius, POINTER) returns settings of POINTER of Radius.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('Radius')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 15 % Radius.RULE
					prop_settings = {'all', 'subgraphs'};
				case 3 % Radius.TEMPLATE
					prop_settings = 'Radius';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = Radius.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = Radius.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(Radius, POINTER) returns the default value of POINTER of Radius.
			%  DEFAULT = M.GETPROPDEFAULT(Radius, POINTER) returns the default value of POINTER of Radius.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('Radius')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 15 % Radius.RULE
					prop_default = 'all';
				case 1 % Radius.NAME
					prop_default = 'Radius';
				case 2 % Radius.DESCRIPTION
					prop_default = 'The radius is the minimum eccentricity among the vertice within a layer.';
				case 3 % Radius.TEMPLATE
					prop_default = Format.getFormatDefault(8, Radius.getPropSettings(prop));
				case 4 % Radius.ID
					prop_default = 'Radius ID';
				case 5 % Radius.LABEL
					prop_default = 'Radius label';
				case 6 % Radius.NOTES
					prop_default = 'Radius notes';
				case 8 % Radius.SHAPE
					prop_default = 1;
				case 9 % Radius.SCOPE
					prop_default = 2;
				case 10 % Radius.PARAMETRICITY
					prop_default = 2;
				case 11 % Radius.COMPATIBLE_GRAPHS
					prop_default = {'GraphWU' 'GraphBU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = Radius.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = Radius.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(Radius, POINTER) returns the conditioned default value of POINTER of Radius.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(Radius, POINTER) returns the conditioned default value of POINTER of Radius.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('Radius')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = Radius.getPropProp(pointer);
			
			prop_default = Radius.conditioning(prop, Radius.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(Radius, PROP, VALUE) checks VALUE format for PROP of Radius.
			%  CHECK = M.CHECKPROP(Radius, PROP, VALUE) checks VALUE format for PROP of Radius.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:Radius:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: BRAPH2:Radius:WrongInput
			%  Element.CHECKPROP(Radius, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Radius.
			%   Error id: BRAPH2:Radius:WrongInput
			%  M.CHECKPROP(Radius, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Radius.
			%   Error id: BRAPH2:Radius:WrongInput]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('Radius')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = Radius.getPropProp(pointer);
			
			switch prop
				case 15 % Radius.RULE
					check = Format.checkFormat(5, value, Radius.getPropSettings(prop));
				case 3 % Radius.TEMPLATE
					check = Format.checkFormat(8, value, Radius.getPropSettings(prop));
				otherwise
					if prop <= 14
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Radius:' 'WrongInput'], ...
					['BRAPH2' ':Radius:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' Radius.getPropTag(prop) ' (' Radius.getFormatTag(Radius.getPropFormat(prop)) ').'] ...
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
				case 13 % Radius.M
					rng_settings_ = rng(); rng(m.getPropSeed(13), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell matrix for graph, multigraph, or multiplex, etc
					L = g.get('LAYERNUMBER');
					eccentricity = Eccentricity('G', g, 'RULE', m.get('RULE')).get('M');
					radius = cell(L, 1);
					
					parfor li = 1:1:L
					    radius(li) = {min(eccentricity{li})};
					end
					
					value = radius;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= 14
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
