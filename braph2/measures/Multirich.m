classdef Multirich < Richness
	%Multirich is the graph wmultirichness.
	% It is a subclass of <a href="matlab:help Richness">Richness</a>.
	%
	% The multirichness of a node is the sum of the edges that connect nodes 
	%  of degree k or higher in all layers. The relevance of each layer is 
	%  controlled by the coefficients c that are between 0 and 1; 
	%  the default coefficients are (1/layernumber).
	%
	% Multirich methods (constructor):
	%  Multirich - constructor
	%
	% Multirich methods:
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
	% Multirich methods (display):
	%  tostring - string with information about the multirichness
	%  disp - displays information about the multirichness
	%  tree - displays the tree of the multirichness
	%
	% Multirich methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two multirichness are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the multirichness
	%
	% Multirich methods (save/load, Static):
	%  save - saves BRAPH2 multirichness as b2 file
	%  load - loads a BRAPH2 multirichness from a b2 file
	%
	% Multirich method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the multirichness
	%
	% Multirich method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the multirichness
	%
	% Multirich methods (inspection, Static):
	%  getClass - returns the class of the multirichness
	%  getSubclasses - returns all subclasses of Multirich
	%  getProps - returns the property list of the multirichness
	%  getPropNumber - returns the property number of the multirichness
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
	% Multirich methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% Multirich methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% Multirich methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% Multirich methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?Multirich; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">Multirich constants</a>.
	%
	
	properties (Constant) % properties
		MULTIRICHNESS_COEFFICIENTS = Richness.getPropNumber() + 1;
		MULTIRICHNESS_COEFFICIENTS_TAG = 'MULTIRICHNESS_COEFFICIENTS';
		MULTIRICHNESS_COEFFICIENTS_CATEGORY = Category.PARAMETER;
		MULTIRICHNESS_COEFFICIENTS_FORMAT = Format.RVECTOR;
	end
	methods % constructor
		function m = Multirich(varargin)
			%Multirich() creates a multirichness.
			%
			% Multirich(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% Multirich(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			m = m@Richness(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the multirichness.
			%
			% CLASS = Multirich.GETCLASS() returns the class 'Multirich'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the multirichness M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('Multirich') returns 'Multirich'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('Multirich')
			%  are less computationally efficient.
			
			m_class = 'Multirich';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the multirichness.
			%
			% LIST = Multirich.GETSUBCLASSES() returns all subclasses of 'Multirich'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the multirichness M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('Multirich') returns all subclasses of 'Multirich'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('Multirich')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('Multirich', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of multirichness.
			%
			% PROPS = Multirich.GETPROPS() returns the property list of multirichness
			%  as a row vector.
			%
			% PROPS = Multirich.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the multirichness M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('Multirich'[, CATEGORY]) returns the property list of 'Multirich'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Richness.getProps() ...
						Multirich.MULTIRICHNESS_COEFFICIENTS ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Richness.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Richness.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Richness.getProps(Category.PARAMETER) ...
						Multirich.MULTIRICHNESS_COEFFICIENTS ...
						];
				case Category.DATA
					prop_list = [ ...
						Richness.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						Richness.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						Richness.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Richness.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Richness.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Richness.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of multirichness.
			%
			% N = Multirich.GETPROPNUMBER() returns the property number of multirichness.
			%
			% N = Multirich.GETPROPNUMBER(CATEGORY) returns the property number of multirichness
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the multirichness M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('Multirich') returns the property number of 'Multirich'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('Multirich')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(Multirich.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in multirichness/error.
			%
			% CHECK = Multirich.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(Multirich, PROP) checks whether PROP exists for Multirich.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:Multirich:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%  Element.EXISTSPROP(Multirich, PROP) throws error if PROP does NOT exist for Multirich.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('Multirich')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == Multirich.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for Multirich.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in multirichness/error.
			%
			% CHECK = Multirich.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(Multirich, TAG) checks whether TAG exists for Multirich.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:Multirich:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%  Element.EXISTSTAG(Multirich, TAG) throws error if TAG does NOT exist for Multirich.
			%   Error id: [BRAPH2:Multirich:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('Multirich')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			multirich_tag_list = cellfun(@(x) Multirich.getPropTag(x), num2cell(Multirich.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, multirich_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for Multirich.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(Multirich, POINTER) returns property number of POINTER of Multirich.
			%  PROPERTY = M.GETPROPPROP(Multirich, POINTER) returns property number of POINTER of Multirich.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				multirich_tag_list = cellfun(@(x) Multirich.getPropTag(x), num2cell(Multirich.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, multirich_tag_list)); % tag = pointer
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
			%  TAG = Element.GETPROPTAG(Multirich, POINTER) returns tag of POINTER of Multirich.
			%  TAG = M.GETPROPTAG(Multirich, POINTER) returns tag of POINTER of Multirich.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case Multirich.MULTIRICHNESS_COEFFICIENTS
						tag = Multirich.MULTIRICHNESS_COEFFICIENTS_TAG;
					otherwise
						tag = getPropTag@Richness(prop);
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
			%  CATEGORY = Element.GETPROPCATEGORY(Multirich, POINTER) returns category of POINTER of Multirich.
			%  CATEGORY = M.GETPROPCATEGORY(Multirich, POINTER) returns category of POINTER of Multirich.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('Multirich')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS
					prop_category = Multirich.MULTIRICHNESS_COEFFICIENTS_CATEGORY;
				otherwise
					prop_category = getPropCategory@Richness(prop);
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
			%  FORMAT = Element.GETPROPFORMAT(Multirich, POINTER) returns format of POINTER of Multirich.
			%  FORMAT = M.GETPROPFORMAT(Multirich, POINTER) returns format of POINTER of Multirich.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('Multirich')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS
					prop_format = Multirich.MULTIRICHNESS_COEFFICIENTS_FORMAT;
				otherwise
					prop_format = getPropFormat@Richness(prop);
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(Multirich, POINTER) returns description of POINTER of Multirich.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(Multirich, POINTER) returns description of POINTER of Multirich.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS
					prop_description = 'MULTIRICHNESS_COEFFICIENTS (parameter, RVECTOR)';
				case Multirich.NAME
					prop_description = 'NAME (constant, string) is the name of the weighted multiplex particiption.';
				case Multirich.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the weighted multiplex particiption.';
				case Multirich.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the weighted multiplex particiption.';
				case Multirich.ID
					prop_description = 'ID (data, string) is a few-letter code of the weighted multiplex particiption.';
				case Multirich.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the weighted multiplex particiption.';
				case Multirich.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the weighted multiplex particiption.';
				case Multirich.SHAPE
					prop_description = 'SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.';
				case Multirich.SCOPE
					prop_description = 'SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.';
				case Multirich.PARAMETRICITY
					prop_description = 'PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.';
				case Multirich.COMPATIBLE_GRAPHS
					prop_description = 'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.';
				case Multirich.M
					prop_description = 'M (result, cell) is the weighted multiplex particiption.';
				otherwise
					prop_description = getPropDescription@Richness(prop);
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
			%  SETTINGS = Element.GETPROPSETTINGS(Multirich, POINTER) returns settings of POINTER of Multirich.
			%  SETTINGS = M.GETPROPSETTINGS(Multirich, POINTER) returns settings of POINTER of Multirich.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS
					prop_settings = Format.getFormatSettings(Format.RVECTOR);
				case Multirich.TEMPLATE
					prop_settings = 'Multirich';
				otherwise
					prop_settings = getPropSettings@Richness(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = Multirich.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = Multirich.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(Multirich, POINTER) returns the default value of POINTER of Multirich.
			%  DEFAULT = M.GETPROPDEFAULT(Multirich, POINTER) returns the default value of POINTER of Multirich.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('Multirich')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS
					prop_default = [0];
				case Multirich.NAME
					prop_default = 'Multirich';
				case Multirich.DESCRIPTION
					prop_default = 'The multirichness of a node is the sum of the edges that connect nodes of degree k or higher in all layers. The relevance of each layer is controlled by the coefficients c that are between 0 and 1; the default coefficients are (1/layernumber).';
				case Multirich.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, Multirich.getPropSettings(prop));
				case Multirich.ID
					prop_default = 'Multirich ID';
				case Multirich.LABEL
					prop_default = 'Multirich label';
				case Multirich.NOTES
					prop_default = 'Multirich notes';
				case Multirich.SHAPE
					prop_default = Measure.NODAL;
				case Multirich.SCOPE
					prop_default = Measure.SUPERGLOBAL;
				case Multirich.PARAMETRICITY
					prop_default = Measure.NONPARAMETRIC;
				case Multirich.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBD' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@Richness(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = Multirich.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = Multirich.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(Multirich, POINTER) returns the conditioned default value of POINTER of Multirich.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(Multirich, POINTER) returns the conditioned default value of POINTER of Multirich.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('Multirich')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = Multirich.getPropProp(pointer);
			
			prop_default = Multirich.conditioning(prop, Multirich.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(Multirich, PROP, VALUE) checks VALUE format for PROP of Multirich.
			%  CHECK = M.CHECKPROP(Multirich, PROP, VALUE) checks VALUE format for PROP of Multirich.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:Multirich:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: €BRAPH2.STR€:Multirich:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(Multirich, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Multirich.
			%   Error id: €BRAPH2.STR€:Multirich:€BRAPH2.WRONG_INPUT€
			%  M.CHECKPROP(Multirich, PROP, VALUE) throws error if VALUE has not a valid format for PROP of Multirich.
			%   Error id: €BRAPH2.STR€:Multirich:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('Multirich')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = Multirich.getPropProp(pointer);
			
			switch prop
				case Multirich.MULTIRICHNESS_COEFFICIENTS % __Multirich.MULTIRICHNESS_COEFFICIENTS__
					check = Format.checkFormat(Format.RVECTOR, value, Multirich.getPropSettings(prop));
				case Multirich.TEMPLATE % __Multirich.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, Multirich.getPropSettings(prop));
				otherwise
					if prop <= Richness.getPropNumber()
						check = checkProp@Richness(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':Multirich:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' Multirich.getPropTag(prop) ' (' Multirich.getFormatTag(Multirich.getPropFormat(prop)) ').'] ...
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
				case Multirich.M % __Multirich.M__
					rng_settings_ = rng(); rng(m.getPropSeed(Multirich.M), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					richness = calculateValue@Richness(m, prop);
					
					if l == 0
					    value = {};
					else
					    N = g.get('NODENUMBER');
					    multirichness_coefficients = m.get('MULTIRICHNESS_COEFFICIENTS');
					    assert(length(multirichness_coefficients) == ls(1) || all(multirichness_coefficients == 0), ...
					        [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
					        ['Multirichness coefficients must have the same length than the ' ...
					        'number of layers (' tostring(ls(1)) ') while its length is ' tostring(length(multirichness_coefficients))])
					
					    if length(multirichness_coefficients) == ls(1)
					        assert(all(multirichness_coefficients <= 1) && all(multirichness_coefficients >= 0), ...
					            [BRAPH2.STR ':Multirichness:' BRAPH2.WRONG_INPUT], ...
					            ['Multirichness coefficients must be between 0 and 1 ' ...
					            'while they are ' tostring(multirichness_coefficients)])
					        c = multirichness_coefficients;
					
					    else  % same relevance for each layer
					        c = ones(1, l)/ls(1);
					    end
					    multirichness = cell(length(ls), 1);
					    count = 1;
					    for i = 1:1:length(ls)
					        multirichness_partition = zeros(N(1), 1);
					        for li = count:1:ls(i) + count - 1
					            multirichness_partition = multirichness_partition + c(li)*richness{li};
					        end
					        count = count + ls(i);
					        multirichness(i) = {multirichness_partition};
					    end
					    value = multirichness;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Richness.getPropNumber()
						value = calculateValue@Richness(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end
