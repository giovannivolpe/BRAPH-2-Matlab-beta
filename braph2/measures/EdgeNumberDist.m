classdef EdgeNumberDist < Measure
	%EdgeNumberDist is the edgenumberdistance.
	% It is a subclass of <a href="matlab:help Measure">Measure</a>.
	%
	% The edge distance number of a graph is the number of edges in the shortest 
	% weighted path between two nodes within a layer.
	%
	% EdgeNumberDist methods (constructor):
	%  EdgeNumberDist - constructor
	%
	% EdgeNumberDist methods:
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
	% EdgeNumberDist methods (display):
	%  tostring - string with information about the edgenumberdistance
	%  disp - displays information about the edgenumberdistance
	%  tree - displays the tree of the edgenumberdistance
	%
	% EdgeNumberDist methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two edgenumberdistance are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the edgenumberdistance
	%
	% EdgeNumberDist methods (save/load, Static):
	%  save - saves BRAPH2 edgenumberdistance as b2 file
	%  load - loads a BRAPH2 edgenumberdistance from a b2 file
	%
	% EdgeNumberDist method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the edgenumberdistance
	%
	% EdgeNumberDist method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the edgenumberdistance
	%
	% EdgeNumberDist methods (inspection, Static):
	%  getClass - returns the class of the edgenumberdistance
	%  getSubclasses - returns all subclasses of EdgeNumberDist
	%  getProps - returns the property list of the edgenumberdistance
	%  getPropNumber - returns the property number of the edgenumberdistance
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
	% EdgeNumberDist methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% EdgeNumberDist methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% EdgeNumberDist methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% EdgeNumberDist methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?EdgeNumberDist; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">EdgeNumberDist constants</a>.
	%
	
	methods % constructor
		function m = EdgeNumberDist(varargin)
			%EdgeNumberDist() creates a edgenumberdistance.
			%
			% EdgeNumberDist(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% EdgeNumberDist(TAG, VALUE, ...) with property TAG set to VALUE.
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
			%GETCLASS returns the class of the edgenumberdistance.
			%
			% CLASS = EdgeNumberDist.GETCLASS() returns the class 'EdgeNumberDist'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the edgenumberdistance M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('EdgeNumberDist') returns 'EdgeNumberDist'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('EdgeNumberDist')
			%  are less computationally efficient.
			
			m_class = 'EdgeNumberDist';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the edgenumberdistance.
			%
			% LIST = EdgeNumberDist.GETSUBCLASSES() returns all subclasses of 'EdgeNumberDist'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the edgenumberdistance M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('EdgeNumberDist') returns all subclasses of 'EdgeNumberDist'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('EdgeNumberDist', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of edgenumberdistance.
			%
			% PROPS = EdgeNumberDist.GETPROPS() returns the property list of edgenumberdistance
			%  as a row vector.
			%
			% PROPS = EdgeNumberDist.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the edgenumberdistance M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('EdgeNumberDist'[, CATEGORY]) returns the property list of 'EdgeNumberDist'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('EdgeNumberDist')
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
			%GETPROPNUMBER returns the property number of edgenumberdistance.
			%
			% N = EdgeNumberDist.GETPROPNUMBER() returns the property number of edgenumberdistance.
			%
			% N = EdgeNumberDist.GETPROPNUMBER(CATEGORY) returns the property number of edgenumberdistance
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the edgenumberdistance M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('EdgeNumberDist') returns the property number of 'EdgeNumberDist'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(EdgeNumberDist.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in edgenumberdistance/error.
			%
			% CHECK = EdgeNumberDist.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(EdgeNumberDist, PROP) checks whether PROP exists for EdgeNumberDist.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%  Element.EXISTSPROP(EdgeNumberDist, PROP) throws error if PROP does NOT exist for EdgeNumberDist.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == EdgeNumberDist.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for EdgeNumberDist.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in edgenumberdistance/error.
			%
			% CHECK = EdgeNumberDist.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(EdgeNumberDist, TAG) checks whether TAG exists for EdgeNumberDist.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%  Element.EXISTSTAG(EdgeNumberDist, TAG) throws error if TAG does NOT exist for EdgeNumberDist.
			%   Error id: [BRAPH2:EdgeNumberDist:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			edgenumberdist_tag_list = cellfun(@(x) EdgeNumberDist.getPropTag(x), num2cell(EdgeNumberDist.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, edgenumberdist_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for EdgeNumberDist.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(EdgeNumberDist, POINTER) returns property number of POINTER of EdgeNumberDist.
			%  PROPERTY = M.GETPROPPROP(EdgeNumberDist, POINTER) returns property number of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				edgenumberdist_tag_list = cellfun(@(x) EdgeNumberDist.getPropTag(x), num2cell(EdgeNumberDist.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, edgenumberdist_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(EdgeNumberDist, POINTER) returns tag of POINTER of EdgeNumberDist.
			%  TAG = M.GETPROPTAG(EdgeNumberDist, POINTER) returns tag of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('EdgeNumberDist')
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
			%  CATEGORY = Element.GETPROPCATEGORY(EdgeNumberDist, POINTER) returns category of POINTER of EdgeNumberDist.
			%  CATEGORY = M.GETPROPCATEGORY(EdgeNumberDist, POINTER) returns category of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
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
			%  FORMAT = Element.GETPROPFORMAT(EdgeNumberDist, POINTER) returns format of POINTER of EdgeNumberDist.
			%  FORMAT = M.GETPROPFORMAT(EdgeNumberDist, POINTER) returns format of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(EdgeNumberDist, POINTER) returns description of POINTER of EdgeNumberDist.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(EdgeNumberDist, POINTER) returns description of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
			switch prop
				case EdgeNumberDist.NAME
					prop_description = 'NAME (constant, string) is the name of the edgenumberdistance.';
				case EdgeNumberDist.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the edgenumberdistance.';
				case EdgeNumberDist.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the edgenumberdistance.';
				case EdgeNumberDist.ID
					prop_description = 'ID (data, string) is a few-letter code of the edgenumberdistance.';
				case EdgeNumberDist.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the edgenumberdistance.';
				case EdgeNumberDist.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the edgenumberdistance.';
				case EdgeNumberDist.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.BINODAL__.';
				case EdgeNumberDist.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case EdgeNumberDist.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case EdgeNumberDist.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case EdgeNumberDist.M
					prop_description = 'M (result, cell) is the edgenumberdistance.';
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
			%  SETTINGS = Element.GETPROPSETTINGS(EdgeNumberDist, POINTER) returns settings of POINTER of EdgeNumberDist.
			%  SETTINGS = M.GETPROPSETTINGS(EdgeNumberDist, POINTER) returns settings of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
			switch prop
				otherwise
					prop_settings = getPropSettings@Measure(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = EdgeNumberDist.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = EdgeNumberDist.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(EdgeNumberDist, POINTER) returns the default value of POINTER of EdgeNumberDist.
			%  DEFAULT = M.GETPROPDEFAULT(EdgeNumberDist, POINTER) returns the default value of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
			switch prop
				case EdgeNumberDist.NAME
					prop_default = 'EdgeNumberDist';
				case EdgeNumberDist.DESCRIPTION
					prop_default = 'The edge distance number of a graph is the number of edges in the shortest weighted path between two nodes within a layer.';
				case EdgeNumberDist.ID
					prop_default = 'EdgeNumberDist ID';
				case EdgeNumberDist.LABEL
					prop_default = 'EdgeNumberDist label';
				case EdgeNumberDist.NOTES
					prop_default = 'EdgeNumberDist notes';
				case EdgeNumberDist.SHAPE
					prop_default = Measure.BINODAL;
				case EdgeNumberDist.SCOPE
					prop_default = Measure.UNILAYER;
				case EdgeNumberDist.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case EdgeNumberDist.COMPATIBLE_GRAPHS
					prop_default = {'GraphWD' 'GraphWU' 'MultiplexWD' 'MultiplexWU'};;
				otherwise
					prop_default = getPropDefault@Measure(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = EdgeNumberDist.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = EdgeNumberDist.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(EdgeNumberDist, POINTER) returns the conditioned default value of POINTER of EdgeNumberDist.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(EdgeNumberDist, POINTER) returns the conditioned default value of POINTER of EdgeNumberDist.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
			prop_default = EdgeNumberDist.conditioning(prop, EdgeNumberDist.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(EdgeNumberDist, PROP, VALUE) checks VALUE format for PROP of EdgeNumberDist.
			%  CHECK = M.CHECKPROP(EdgeNumberDist, PROP, VALUE) checks VALUE format for PROP of EdgeNumberDist.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:EdgeNumberDist:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:EdgeNumberDist:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(EdgeNumberDist, PROP, VALUE) throws error if VALUE has not a valid format for PROP of EdgeNumberDist.
			%   Error id: €BRAPH2.STR€:EdgeNumberDist:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(EdgeNumberDist, PROP, VALUE) throws error if VALUE has not a valid format for PROP of EdgeNumberDist.
			%   Error id: €BRAPH2.STR€:EdgeNumberDist:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('EdgeNumberDist')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = EdgeNumberDist.getPropProp(pointer);
			
			switch prop
				otherwise
					if prop <= Measure.getPropNumber()
						check = checkProp@Measure(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':EdgeNumberDist:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' EdgeNumberDist.getPropTag(prop) ' (' EdgeNumberDist.getFormatTag(EdgeNumberDist.getPropFormat(prop)) ').'] ...
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
				case EdgeNumberDist.M % __EdgeNumberDist.M__
					rng_settings_ = rng(); rng(m.getPropSeed(EdgeNumberDist.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					L = g.get('LAYERNUMBER');
					edge_number_distance = cell(L, 1);
					
					for li = 1:L
					    Aii = A{li, li};
					    edge_number_distance(li) = {getEdgeNumberDistance(Aii)};
					end
					
					value = edge_number_distance;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Measure.getPropNumber()
						value = calculateValue@Measure(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
			function edge_number_distance = getEdgeNumberDistance(A)
			    %GETEDGENUMBERDISTANCE calculates the edge distance number of a graph.
			    
			    ind = A~=0;
			    A(ind) = A(ind).^-1;
			    n = length(A);
			    D = inf(n);
			    D(1:n+1:end) = 0; % distance matrix
			    B = zeros(n); % number of edges matrix
			    
			    for u = 1:n
			        S = true(1, n); % distance permanence (true is temporary)
			        L1 = A;
			        V = u;
			    
			        while 1
			            S(V) = 0; % distance u->V is now permanent
			            L1(:, V) = 0; % no in-edges as already shortest
			    
			            for v = V
			                T = find(L1(v, :)); % neighbours of shortest nodes
			                [d, wi] = min([D(u, T);D(u, v)+L1(v, T)]);
			                D(u, T) = d; % smallest of old/new path lengths
			                ind = T(wi==2); % indices of lengthened paths
			                B(u, ind) = B(u, v) + 1; % increment no. of edges in lengthened paths
			            end
			    
			            minD = min(D(u, S));
			            if isempty(minD) || isinf(minD) % isempty: all nodes reached;
			                break % isinf: some nodes cannot be reached
			            end
			    
			            V = find(D(u,:)==minD);
			        end
			    end
			    edge_number_distance = B;
			end
		end
	end
end
