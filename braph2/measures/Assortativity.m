classdef Assortativity < Measure
	%Assortativity is the graph Assortativity.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The Assortativity coefficient (Assortativity) of a graph is the correlation coefficient 
	%  between the degrees/strengths of all nodes on two opposite ends of an edge 
	%  within a layer.
	% The corresponding coefficient for directed and weighted networks is 
	%  calculated by using the weighted and directed variants of degree/strength.
	%
	% The list of Assortativity properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Assortativity.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Assortativity.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Assortativity.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Assortativity.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Assortativity.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Assortativity.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Assortativity.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.
	%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
	%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
	%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
	%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
	%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the cell containing the assortativity value.
	%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
	%
	% Assortativity methods (constructor):
	%  Assortativity - constructor
	%
	% Assortativity methods:
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
	% Assortativity methods (display):
	%  tostring - string with information about the assortativity
	%  disp - displays information about the assortativity
	%  tree - displays the tree of the assortativity
	%
	% Assortativity methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two assortativity are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the assortativity
	%
	% Assortativity methods (save/load, Static):
	%  save - saves BRAPH2 assortativity as b2 file
	%  load - loads a BRAPH2 assortativity from a b2 file
	%
	% Assortativity method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the assortativity
	%
	% Assortativity method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the assortativity
	%
	% Assortativity methods (inspection, Static):
	%  getClass - returns the class of the assortativity
	%  getSubclasses - returns all subclasses of Assortativity
	%  getProps - returns the property list of the assortativity
	%  getPropNumber - returns the property number of the assortativity
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
	% Assortativity methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% Assortativity methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% Assortativity methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% Assortativity methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?Assortativity; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">Assortativity constants</a>.
	%
	
	methods % constructor
		function m = Assortativity(varargin)
			%Assortativity() creates a assortativity.
			%
			% Assortativity(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% Assortativity(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of Assortativity properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Assortativity.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Assortativity.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Assortativity.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Assortativity.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Assortativity.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Assortativity.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Assortativity.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.
			%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
			%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
			%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
			%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
			%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the cell containing the assortativity value.
			%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
			%
			% See also Category, Format.
			
			m = m@Measure(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the assortativity.
			%
			% CLASS = Assortativity.GETCLASS() returns the class 'Assortativity'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the assortativity M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('Assortativity') returns 'Assortativity'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('Assortativity')
			%  are less computationally efficient.
			
			m_class = 'Assortativity';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the assortativity.
			%
			% LIST = Assortativity.GETSUBCLASSES() returns all subclasses of 'Assortativity'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the assortativity M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('Assortativity') returns all subclasses of 'Assortativity'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('Assortativity')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'Assortativity' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of assortativity.
			%
			% PROPS = Assortativity.GETPROPS() returns the property list of assortativity
			%  as a row vector.
			%
			% PROPS = Assortativity.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the assortativity M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('Assortativity'[, CATEGORY]) returns the property list of 'Assortativity'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('Assortativity')
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
			%GETPROPNUMBER returns the property number of assortativity.
			%
			% N = Assortativity.GETPROPNUMBER() returns the property number of assortativity.
			%
			% N = Assortativity.GETPROPNUMBER(CATEGORY) returns the property number of assortativity
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the assortativity M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('Assortativity') returns the property number of 'Assortativity'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('Assortativity')
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
			%EXISTSPROP checks whether property exists in assortativity/error.
			%
			% CHECK = Assortativity.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(Assortativity, PROP) checks whether PROP exists for Assortativity.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:Assortativity:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%  Element.EXISTSPROP(Assortativity, PROP) throws error if PROP does NOT exist for Assortativity.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('Assortativity')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 15 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Assortativity:' 'WrongInput'], ...
					['BRAPH2' ':Assortativity:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for Assortativity.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in assortativity/error.
			%
			% CHECK = Assortativity.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(Assortativity, TAG) checks whether TAG exists for Assortativity.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:Assortativity:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%  Element.EXISTSTAG(Assortativity, TAG) throws error if TAG does NOT exist for Assortativity.
			%   Error id: [BRAPH2:Assortativity:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('Assortativity')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Assortativity:' 'WrongInput'], ...
					['BRAPH2' ':Assortativity:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for Assortativity.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(Assortativity, POINTER) returns property number of POINTER of Assortativity.
			%  PROPERTY = M.GETPROPPROP(Assortativity, POINTER) returns property number of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('Assortativity')
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
			%  TAG = Element.GETPROPTAG(Assortativity, POINTER) returns tag of POINTER of Assortativity.
			%  TAG = M.GETPROPTAG(Assortativity, POINTER) returns tag of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('Assortativity')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				assortativity_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' };
				tag = assortativity_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(Assortativity, POINTER) returns category of POINTER of Assortativity.
			%  CATEGORY = M.GETPROPCATEGORY(Assortativity, POINTER) returns category of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('Assortativity')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			assortativity_category_list = { 1  1  1  3  4  2  2  6  1  1  1  1  4  5  9 };
			prop_category = assortativity_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(Assortativity, POINTER) returns format of POINTER of Assortativity.
			%  FORMAT = M.GETPROPFORMAT(Assortativity, POINTER) returns format of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('Assortativity')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			assortativity_format_list = { 2  2  2  8  2  2  2  2  11  11  11  7  8  16  8 };
			prop_format = assortativity_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(Assortativity, POINTER) returns description of POINTER of Assortativity.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(Assortativity, POINTER) returns description of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('Assortativity')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			assortativity_description_list = { 'ELCLASS (constant, string) is the class of the Assortativity.'  'NAME (constant, string) is the name of the Assortativity.'  'DESCRIPTION (constant, string) is the description of the Assortativity.'  'TEMPLATE (parameter, item) is the template of the Assortativity.'  'ID (data, string) is a few-letter code of the Assortativity.'  'LABEL (metadata, string) is an extended label of the Assortativity.'  'NOTES (metadata, string) are some specific notes about the Assortativity.'  'TOSTRING (query, string) returns a string that represents the object.'  'SHAPE (constant, scalar) is the measure shape Measure.GLOBAL.'  'SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.'  'PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.'  'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.'  'G (data, item) is the measure graph.'  'M (result, cell) is the cell containing the assortativity value.'  'PFM (gui, item) contains the panel figure of the measure.' };
			prop_description = assortativity_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(Assortativity, POINTER) returns settings of POINTER of Assortativity.
			%  SETTINGS = M.GETPROPSETTINGS(Assortativity, POINTER) returns settings of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('Assortativity')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 4 % Assortativity.TEMPLATE
					prop_settings = 'Assortativity';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = Assortativity.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = Assortativity.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(Assortativity, POINTER) returns the default value of POINTER of Assortativity.
			%  DEFAULT = M.GETPROPDEFAULT(Assortativity, POINTER) returns the default value of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('Assortativity')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 1 % Assortativity.ELCLASS
					prop_default = 'Assortativity';
				case 2 % Assortativity.NAME
					prop_default = 'Assortativity';
				case 3 % Assortativity.DESCRIPTION
					prop_default = 'The Assortativity coefficient (Assortativity) of a graph is the shortest path between all pairs of nodes within a layer of the graph. For weighted graphs, the assortativity is calculated with the Dijkstra algorithm using the inverse weight as the assortativity associated to the edge.';
				case 4 % Assortativity.TEMPLATE
					prop_default = Format.getFormatDefault(8, Assortativity.getPropSettings(prop));
				case 5 % Assortativity.ID
					prop_default = 'Assortativity ID';
				case 6 % Assortativity.LABEL
					prop_default = 'Assortativity label';
				case 7 % Assortativity.NOTES
					prop_default = 'Assortativity notes';
				case 9 % Assortativity.SHAPE
					prop_default = 1;
				case 10 % Assortativity.SCOPE
					prop_default = 2;
				case 11 % Assortativity.PARAMETRICITY
					prop_default = 2;
				case 12 % Assortativity.COMPATIBLE_GRAPHS
					prop_default = {'GraphBU' 'GraphWU' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexBU' 'MultiplexWU' 'MultiplexBUD' 'MultiplexBUT' 'MultilayerWU'};
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = Assortativity.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = Assortativity.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(Assortativity, POINTER) returns the conditioned default value of POINTER of Assortativity.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(Assortativity, POINTER) returns the conditioned default value of POINTER of Assortativity.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('Assortativity')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = Assortativity.getPropProp(pointer);
			
			prop_default = Assortativity.conditioning(prop, Assortativity.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(Assortativity, PROP, VALUE) checks VALUE format for PROP of Assortativity.
			%  CHECK = M.CHECKPROP(Assortativity, PROP, VALUE) checks VALUE format for PROP of Assortativity.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:Assortativity:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: BRAPH2:Assortativity:WrongInput
			%  Element.CHECKPROP(Assortativity, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Assortativity.
			%   Error id: BRAPH2:Assortativity:WrongInput
			%  M.CHECKPROP(Assortativity, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Assortativity.
			%   Error id: BRAPH2:Assortativity:WrongInput]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('Assortativity')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = Assortativity.getPropProp(pointer);
			
			switch prop
				case 4 % Assortativity.TEMPLATE
					check = Format.checkFormat(8, value, Assortativity.getPropSettings(prop));
				otherwise
					if prop <= 15
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':Assortativity:' 'WrongInput'], ...
					['BRAPH2' ':Assortativity:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' Assortativity.getPropTag(prop) ' (' Assortativity.getFormatTag(Assortativity.getPropFormat(prop)) ').'] ...
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
				case 14 % Assortativity.M
					rng_settings_ = rng(); rng(m.getPropSeed(14), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					
					assortativity = cell(L, 1);
					connectivity_layer =  g.get('CONNECTIVITY_TYPE', g.get('LAYERNUMBER'));
					for li = 1:1:L
					    Aii = A{li, li};
					    [i, j] = find(triu(Aii) ~= 0);  % nodes [i, j]
					    M = length(i);  % Number of edges
					    k_i = zeros(M, L);
					    k_j = zeros(length(j), L);
					    
					    if connectivity_layer == 2 
					        
					        degree = Degree('G', g).get('M');        
					        d = degree{li};
					        
					    elseif connectivity_layer == 1 
					        
					        strength = Strength('G', g).get('M');        
					        d = strength{li};
					    end
					    k_i(:, li) = d(i);  % degree/strength node i
					    k_j(:, li) = d(j);  % degree/strength node j
					    % compute assortativity
					    assortativity_layer = (sum(k_i(:, li) .* k_j(:, li)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2)...
					        / (sum(0.5 * (k_i(:, li).^2 + k_j(:, li).^2)) / M - (sum(0.5 * (k_i(:, li) + k_j(:, li))) / M)^2);
					    assortativity_layer(isnan(assortativity_layer)) = 0;  % Should return zeros, not NaN
					    assortativity(li) = {assortativity_layer};
					end
					
					value = assortativity;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= 15
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
