classdef WeightedMxPOut < Measure
	%WeightedMxPOut is the graph Weighted Multiplex Out-Participation.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The Weighted Multiplex Out-Participation (WeightedMxPOut) of a graph is the nodal homogeneity 
	%  of its number of outward neighbours across the layers.
	%
	% The list of WeightedMxPOut properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Weighted Multiplex Out-Participation.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Weighted Multiplex Out-Participation.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Weighted Multiplex Out-Participation.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Weighted Multiplex Out-Participation.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Weighted Multiplex Out-Participation.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Weighted Multiplex Out-Participation.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Weighted Multiplex Out-Participation.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
	%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
	%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
	%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
	%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
	%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the Weighted Multiplex Out-Participation.
	%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
	%
	% WeightedMxPOut methods (constructor):
	%  WeightedMxPOut - constructor
	%
	% WeightedMxPOut methods:
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
	% WeightedMxPOut methods (display):
	%  tostring - string with information about the weighted out-participation
	%  disp - displays information about the weighted out-participation
	%  tree - displays the tree of the weighted out-participation
	%
	% WeightedMxPOut methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two weighted out-participation are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the weighted out-participation
	%
	% WeightedMxPOut methods (save/load, Static):
	%  save - saves BRAPH2 weighted out-participation as b2 file
	%  load - loads a BRAPH2 weighted out-participation from a b2 file
	%
	% WeightedMxPOut method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the weighted out-participation
	%
	% WeightedMxPOut method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the weighted out-participation
	%
	% WeightedMxPOut methods (inspection, Static):
	%  getClass - returns the class of the weighted out-participation
	%  getSubclasses - returns all subclasses of WeightedMxPOut
	%  getProps - returns the property list of the weighted out-participation
	%  getPropNumber - returns the property number of the weighted out-participation
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
	% WeightedMxPOut methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% WeightedMxPOut methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% WeightedMxPOut methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% WeightedMxPOut methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?WeightedMxPOut; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">WeightedMxPOut constants</a>.
	%
	
	methods % constructor
		function m = WeightedMxPOut(varargin)
			%WeightedMxPOut() creates a weighted out-participation.
			%
			% WeightedMxPOut(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% WeightedMxPOut(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of WeightedMxPOut properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the Weighted Multiplex Out-Participation.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the Weighted Multiplex Out-Participation.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the Weighted Multiplex Out-Participation.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the Weighted Multiplex Out-Participation.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the Weighted Multiplex Out-Participation.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the Weighted Multiplex Out-Participation.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the Weighted Multiplex Out-Participation.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>9</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
			%  <strong>10</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
			%  <strong>11</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
			%  <strong>12</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
			%  <strong>13</strong> <strong>G</strong> 	G (data, item) is the measure graph.
			%  <strong>14</strong> <strong>M</strong> 	M (result, cell) is the Weighted Multiplex Out-Participation.
			%  <strong>15</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
			%
			% See also Category, Format.
			
			m = m@Measure(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the weighted out-participation.
			%
			% CLASS = WeightedMxPOut.GETCLASS() returns the class 'WeightedMxPOut'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the weighted out-participation M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('WeightedMxPOut') returns 'WeightedMxPOut'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('WeightedMxPOut')
			%  are less computationally efficient.
			
			m_class = 'WeightedMxPOut';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the weighted out-participation.
			%
			% LIST = WeightedMxPOut.GETSUBCLASSES() returns all subclasses of 'WeightedMxPOut'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the weighted out-participation M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('WeightedMxPOut') returns all subclasses of 'WeightedMxPOut'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'WeightedMxPOut' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of weighted out-participation.
			%
			% PROPS = WeightedMxPOut.GETPROPS() returns the property list of weighted out-participation
			%  as a row vector.
			%
			% PROPS = WeightedMxPOut.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the weighted out-participation M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('WeightedMxPOut'[, CATEGORY]) returns the property list of 'WeightedMxPOut'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('WeightedMxPOut')
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
			%GETPROPNUMBER returns the property number of weighted out-participation.
			%
			% N = WeightedMxPOut.GETPROPNUMBER() returns the property number of weighted out-participation.
			%
			% N = WeightedMxPOut.GETPROPNUMBER(CATEGORY) returns the property number of weighted out-participation
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the weighted out-participation M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('WeightedMxPOut') returns the property number of 'WeightedMxPOut'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('WeightedMxPOut')
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
			%EXISTSPROP checks whether property exists in weighted out-participation/error.
			%
			% CHECK = WeightedMxPOut.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(WeightedMxPOut, PROP) checks whether PROP exists for WeightedMxPOut.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%  Element.EXISTSPROP(WeightedMxPOut, PROP) throws error if PROP does NOT exist for WeightedMxPOut.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 15 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput'], ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for WeightedMxPOut.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in weighted out-participation/error.
			%
			% CHECK = WeightedMxPOut.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(WeightedMxPOut, TAG) checks whether TAG exists for WeightedMxPOut.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%  Element.EXISTSTAG(WeightedMxPOut, TAG) throws error if TAG does NOT exist for WeightedMxPOut.
			%   Error id: [BRAPH2:WeightedMxPOut:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput'], ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for WeightedMxPOut.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(WeightedMxPOut, POINTER) returns property number of POINTER of WeightedMxPOut.
			%  PROPERTY = M.GETPROPPROP(WeightedMxPOut, POINTER) returns property number of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('WeightedMxPOut')
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
			%  TAG = Element.GETPROPTAG(WeightedMxPOut, POINTER) returns tag of POINTER of WeightedMxPOut.
			%  TAG = M.GETPROPTAG(WeightedMxPOut, POINTER) returns tag of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				weightedmxpout_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' };
				tag = weightedmxpout_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(WeightedMxPOut, POINTER) returns category of POINTER of WeightedMxPOut.
			%  CATEGORY = M.GETPROPCATEGORY(WeightedMxPOut, POINTER) returns category of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			weightedmxpout_category_list = { 1  1  1  3  4  2  2  6  1  1  1  1  4  5  9 };
			prop_category = weightedmxpout_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(WeightedMxPOut, POINTER) returns format of POINTER of WeightedMxPOut.
			%  FORMAT = M.GETPROPFORMAT(WeightedMxPOut, POINTER) returns format of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			weightedmxpout_format_list = { 2  2  2  8  2  2  2  2  11  11  11  7  8  16  8 };
			prop_format = weightedmxpout_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(WeightedMxPOut, POINTER) returns description of POINTER of WeightedMxPOut.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(WeightedMxPOut, POINTER) returns description of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			weightedmxpout_description_list = { 'ELCLASS (constant, string) is the class of the Weighted Multiplex Out-Participation.'  'NAME (constant, string) is the name of the Weighted Multiplex Out-Participation.'  'DESCRIPTION (constant, string) is the description of the Weighted Multiplex Out-Participation.'  'TEMPLATE (parameter, item) is the template of the Weighted Multiplex Out-Participation.'  'ID (data, string) is a few-letter code of the Weighted Multiplex Out-Participation.'  'LABEL (metadata, string) is an extended label of the Weighted Multiplex Out-Participation.'  'NOTES (metadata, string) are some specific notes about the Weighted Multiplex Out-Participation.'  'TOSTRING (query, string) returns a string that represents the object.'  'SHAPE (constant, scalar) is the measure shape Measure.NODAL.'  'SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.'  'PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.'  'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.'  'G (data, item) is the measure graph.'  'M (result, cell) is the Weighted Multiplex Out-Participation.'  'PFM (gui, item) contains the panel figure of the measure.' };
			prop_description = weightedmxpout_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(WeightedMxPOut, POINTER) returns settings of POINTER of WeightedMxPOut.
			%  SETTINGS = M.GETPROPSETTINGS(WeightedMxPOut, POINTER) returns settings of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 4 % WeightedMxPOut.TEMPLATE
					prop_settings = 'WeightedMxPOut';
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = WeightedMxPOut.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = WeightedMxPOut.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(WeightedMxPOut, POINTER) returns the default value of POINTER of WeightedMxPOut.
			%  DEFAULT = M.GETPROPDEFAULT(WeightedMxPOut, POINTER) returns the default value of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 1 % WeightedMxPOut.ELCLASS
					prop_default = 'WeightedMxPOut';
				case 2 % WeightedMxPOut.NAME
					prop_default = 'Weighted Multiplex Out-Participation ';
				case 3 % WeightedMxPOut.DESCRIPTION
					prop_default = 'The Weighted Multiplex Out-Participation (WeightedMxPOut) of a graph is the nodal homogeneity of its number of outward neighbours across the layers.';
				case 4 % WeightedMxPOut.TEMPLATE
					prop_default = Format.getFormatDefault(8, WeightedMxPOut.getPropSettings(prop));
				case 5 % WeightedMxPOut.ID
					prop_default = 'WeightedMxPOut ID';
				case 6 % WeightedMxPOut.LABEL
					prop_default = 'Weighted Multiplex Out-Participation label';
				case 7 % WeightedMxPOut.NOTES
					prop_default = 'Weighted Multiplex Out-Participation notes';
				case 9 % WeightedMxPOut.SHAPE
					prop_default = 2;
				case 10 % WeightedMxPOut.SCOPE
					prop_default = 1;
				case 11 % WeightedMxPOut.PARAMETRICITY
					prop_default = 2;
				case 12 % WeightedMxPOut.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWD' 'OrdMxWD' 'MultilayerWD' 'OrdMlWD'};
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = WeightedMxPOut.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = WeightedMxPOut.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(WeightedMxPOut, POINTER) returns the conditioned default value of POINTER of WeightedMxPOut.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(WeightedMxPOut, POINTER) returns the conditioned default value of POINTER of WeightedMxPOut.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			prop_default = WeightedMxPOut.conditioning(prop, WeightedMxPOut.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(WeightedMxPOut, PROP, VALUE) checks VALUE format for PROP of WeightedMxPOut.
			%  CHECK = M.CHECKPROP(WeightedMxPOut, PROP, VALUE) checks VALUE format for PROP of WeightedMxPOut.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:WeightedMxPOut:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: BRAPH2:WeightedMxPOut:WrongInput
			%  Element.CHECKPROP(WeightedMxPOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of WeightedMxPOut.
			%   Error id: BRAPH2:WeightedMxPOut:WrongInput
			%  M.CHECKPROP(WeightedMxPOut, PROP, VALUE) throws error if VALUE has not a valid format for PROP of WeightedMxPOut.
			%   Error id: BRAPH2:WeightedMxPOut:WrongInput]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('WeightedMxPOut')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = WeightedMxPOut.getPropProp(pointer);
			
			switch prop
				case 4 % WeightedMxPOut.TEMPLATE
					check = Format.checkFormat(8, value, WeightedMxPOut.getPropSettings(prop));
				otherwise
					if prop <= 15
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput'], ...
					['BRAPH2' ':WeightedMxPOut:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' WeightedMxPOut.getPropTag(prop) ' (' WeightedMxPOut.getFormatTag(WeightedMxPOut.getPropFormat(prop)) ').'] ...
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
				case 14 % WeightedMxPOut.M
					rng_settings_ = rng(); rng(m.getPropSeed(14), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    out_strength = StrengthOut('G', g).get('M');
					    overlapping_out_strength = OverlappingSOut('G', g).get('M');
					
					    weighted_multiplex_out_participation =  zeros(N(1), 1);
					    for li = 1:l
					        weighted_multiplex_out_participation = weighted_multiplex_out_participation + (out_strength{li}./overlapping_out_strength{1}).^2;
					    end
					    weighted_multiplex_out_participation = l / (l - 1) * (1 - weighted_multiplex_out_participation);
					    weighted_multiplex_out_participation(isnan(weighted_multiplex_out_participation)) = 0;  % Should return zeros, since NaN happens when strength = 0 and overlapping strength = 0 for all regions
					    value = {weighted_multiplex_out_participation};
					end
					
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
