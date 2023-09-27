classdef MeasureEnsemblePF_BB < MeasureEnsemblePF
	%MeasureEnsemblePF_BB is the base element to plot a binodal bilayer group comparison figure.
	% It is a subclass of <a href="matlab:help MeasureEnsemblePF">MeasureEnsemblePF</a>.
	%
	% MeasureEnsemblePF_BB manages the basic functionalities to plot of a binodal bilayer group comparison figure.
	%
	% MeasureEnsemblePF_BB methods (constructor):
	%  MeasureEnsemblePF_BB - constructor
	%
	% MeasureEnsemblePF_BB methods:
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
	% MeasureEnsemblePF_BB methods (display):
	%  tostring - string with information about the panel binodal bilayer group comparison figure
	%  disp - displays information about the panel binodal bilayer group comparison figure
	%  tree - displays the tree of the panel binodal bilayer group comparison figure
	%
	% MeasureEnsemblePF_BB methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel binodal bilayer group comparison figure are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel binodal bilayer group comparison figure
	%
	% MeasureEnsemblePF_BB methods (save/load, Static):
	%  save - saves BRAPH2 panel binodal bilayer group comparison figure as b2 file
	%  load - loads a BRAPH2 panel binodal bilayer group comparison figure from a b2 file
	%
	% MeasureEnsemblePF_BB method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel binodal bilayer group comparison figure
	%
	% MeasureEnsemblePF_BB method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel binodal bilayer group comparison figure
	%
	% MeasureEnsemblePF_BB methods (inspection, Static):
	%  getClass - returns the class of the panel binodal bilayer group comparison figure
	%  getSubclasses - returns all subclasses of MeasureEnsemblePF_BB
	%  getProps - returns the property list of the panel binodal bilayer group comparison figure
	%  getPropNumber - returns the property number of the panel binodal bilayer group comparison figure
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
	% MeasureEnsemblePF_BB methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MeasureEnsemblePF_BB methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MeasureEnsemblePF_BB methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MeasureEnsemblePF_BB methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MeasureEnsemblePF_BB; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MeasureEnsemblePF_BB constants</a>.
	%
	%
	% See also MeasureEnsemble.
	
	properties (Constant) % properties
		NODES = MeasureEnsemblePF.getPropNumber() + 1;
		NODES_TAG = 'NODES';
		NODES_CATEGORY = Category.FIGURE;
		NODES_FORMAT = Format.RVECTOR;
	end
	methods % constructor
		function pf = MeasureEnsemblePF_BB(varargin)
			%MeasureEnsemblePF_BB() creates a panel binodal bilayer group comparison figure.
			%
			% MeasureEnsemblePF_BB(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MeasureEnsemblePF_BB(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			pf = pf@MeasureEnsemblePF(varargin{:});
		end
	end
	methods (Static) % inspection
		function pf_class = getClass()
			%GETCLASS returns the class of the panel binodal bilayer group comparison figure.
			%
			% CLASS = MeasureEnsemblePF_BB.GETCLASS() returns the class 'MeasureEnsemblePF_BB'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel binodal bilayer group comparison figure PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('MeasureEnsemblePF_BB') returns 'MeasureEnsemblePF_BB'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			
			pf_class = 'MeasureEnsemblePF_BB';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel binodal bilayer group comparison figure.
			%
			% LIST = MeasureEnsemblePF_BB.GETSUBCLASSES() returns all subclasses of 'MeasureEnsemblePF_BB'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel binodal bilayer group comparison figure PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('MeasureEnsemblePF_BB') returns all subclasses of 'MeasureEnsemblePF_BB'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('MeasureEnsemblePF_BB', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel binodal bilayer group comparison figure.
			%
			% PROPS = MeasureEnsemblePF_BB.GETPROPS() returns the property list of panel binodal bilayer group comparison figure
			%  as a row vector.
			%
			% PROPS = MeasureEnsemblePF_BB.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel binodal bilayer group comparison figure PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('MeasureEnsemblePF_BB'[, CATEGORY]) returns the property list of 'MeasureEnsemblePF_BB'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					MeasureEnsemblePF.getProps() ...
						MeasureEnsemblePF_BB.NODES ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						MeasureEnsemblePF.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.FIGURE) ...
						MeasureEnsemblePF_BB.NODES ...
						];
				case Category.GUI
					prop_list = [ ...
						MeasureEnsemblePF.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel binodal bilayer group comparison figure.
			%
			% N = MeasureEnsemblePF_BB.GETPROPNUMBER() returns the property number of panel binodal bilayer group comparison figure.
			%
			% N = MeasureEnsemblePF_BB.GETPROPNUMBER(CATEGORY) returns the property number of panel binodal bilayer group comparison figure
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel binodal bilayer group comparison figure PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('MeasureEnsemblePF_BB') returns the property number of 'MeasureEnsemblePF_BB'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(MeasureEnsemblePF_BB.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel binodal bilayer group comparison figure/error.
			%
			% CHECK = MeasureEnsemblePF_BB.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(MeasureEnsemblePF_BB, PROP) checks whether PROP exists for MeasureEnsemblePF_BB.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%  Element.EXISTSPROP(MeasureEnsemblePF_BB, PROP) throws error if PROP does NOT exist for MeasureEnsemblePF_BB.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == MeasureEnsemblePF_BB.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MeasureEnsemblePF_BB.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel binodal bilayer group comparison figure/error.
			%
			% CHECK = MeasureEnsemblePF_BB.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(MeasureEnsemblePF_BB, TAG) checks whether TAG exists for MeasureEnsemblePF_BB.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%  Element.EXISTSTAG(MeasureEnsemblePF_BB, TAG) throws error if TAG does NOT exist for MeasureEnsemblePF_BB.
			%   Error id: [BRAPH2:MeasureEnsemblePF_BB:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			measureensemblepf_bb_tag_list = cellfun(@(x) MeasureEnsemblePF_BB.getPropTag(x), num2cell(MeasureEnsemblePF_BB.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, measureensemblepf_bb_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for MeasureEnsemblePF_BB.'] ...
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
			%  PROPERTY = PF.GETPROPPROP(POINTER) returns property number of POINTER of PF.
			%  PROPERTY = Element.GETPROPPROP(MeasureEnsemblePF_BB, POINTER) returns property number of POINTER of MeasureEnsemblePF_BB.
			%  PROPERTY = PF.GETPROPPROP(MeasureEnsemblePF_BB, POINTER) returns property number of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				measureensemblepf_bb_tag_list = cellfun(@(x) MeasureEnsemblePF_BB.getPropTag(x), num2cell(MeasureEnsemblePF_BB.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, measureensemblepf_bb_tag_list)); % tag = pointer
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
			%  TAG = PF.GETPROPTAG(POINTER) returns tag of POINTER of PF.
			%  TAG = Element.GETPROPTAG(MeasureEnsemblePF_BB, POINTER) returns tag of POINTER of MeasureEnsemblePF_BB.
			%  TAG = PF.GETPROPTAG(MeasureEnsemblePF_BB, POINTER) returns tag of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case MeasureEnsemblePF_BB.NODES
						tag = MeasureEnsemblePF_BB.NODES_TAG;
					otherwise
						tag = getPropTag@MeasureEnsemblePF(prop);
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
			%  CATEGORY = PF.GETPROPCATEGORY(POINTER) returns category of POINTER of PF.
			%  CATEGORY = Element.GETPROPCATEGORY(MeasureEnsemblePF_BB, POINTER) returns category of POINTER of MeasureEnsemblePF_BB.
			%  CATEGORY = PF.GETPROPCATEGORY(MeasureEnsemblePF_BB, POINTER) returns category of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES
					prop_category = MeasureEnsemblePF_BB.NODES_CATEGORY;
				otherwise
					prop_category = getPropCategory@MeasureEnsemblePF(prop);
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
			%  FORMAT = PF.GETPROPFORMAT(POINTER) returns format of POINTER of PF.
			%  FORMAT = Element.GETPROPFORMAT(MeasureEnsemblePF_BB, POINTER) returns format of POINTER of MeasureEnsemblePF_BB.
			%  FORMAT = PF.GETPROPFORMAT(MeasureEnsemblePF_BB, POINTER) returns format of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES
					prop_format = MeasureEnsemblePF_BB.NODES_FORMAT;
				otherwise
					prop_format = getPropFormat@MeasureEnsemblePF(prop);
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
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PF.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MeasureEnsemblePF_BB, POINTER) returns description of POINTER of MeasureEnsemblePF_BB.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(MeasureEnsemblePF_BB, POINTER) returns description of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES
					prop_description = 'NODES (figure, rvector) are the node numbers of the binodal group comparison figure.';
				case MeasureEnsemblePF_BB.NAME
					prop_description = 'NAME (constant, string) is the name of the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.ID
					prop_description = 'ID (data, string) is a few-letter code for the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the panel figure binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.SETUP
					prop_description = 'SETUP (query, empty) calculates the group comparison figure value and stores it.';
				otherwise
					prop_description = getPropDescription@MeasureEnsemblePF(prop);
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
			%  SETTINGS = PF.GETPROPSETTINGS(POINTER) returns settings of POINTER of PF.
			%  SETTINGS = Element.GETPROPSETTINGS(MeasureEnsemblePF_BB, POINTER) returns settings of POINTER of MeasureEnsemblePF_BB.
			%  SETTINGS = PF.GETPROPSETTINGS(MeasureEnsemblePF_BB, POINTER) returns settings of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES
					prop_settings = Format.getFormatSettings(Format.RVECTOR);
				case MeasureEnsemblePF_BB.TEMPLATE
					prop_settings = 'MeasureEnsemblePF_BB';
				otherwise
					prop_settings = getPropSettings@MeasureEnsemblePF(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MeasureEnsemblePF_BB.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MeasureEnsemblePF_BB.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(MeasureEnsemblePF_BB, POINTER) returns the default value of POINTER of MeasureEnsemblePF_BB.
			%  DEFAULT = PF.GETPROPDEFAULT(MeasureEnsemblePF_BB, POINTER) returns the default value of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES
					prop_default = Format.getFormatDefault(Format.RVECTOR, MeasureEnsemblePF_BB.getPropSettings(prop));
				case MeasureEnsemblePF_BB.NAME
					prop_default = 'MeasureEnsemblePF_BB';
				case MeasureEnsemblePF_BB.DESCRIPTION
					prop_default = 'MeasureEnsemblePF_BB manages the basic functionalities to plot of a binodal bilayer group comparison figure.';
				case MeasureEnsemblePF_BB.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, MeasureEnsemblePF_BB.getPropSettings(prop));
				case MeasureEnsemblePF_BB.ID
					prop_default = 'MeasureEnsemblePF_BB ID';
				case MeasureEnsemblePF_BB.LABEL
					prop_default = 'MeasureEnsemblePF_BB label';
				case MeasureEnsemblePF_BB.NOTES
					prop_default = 'MeasureEnsemblePF_BB notes';
				otherwise
					prop_default = getPropDefault@MeasureEnsemblePF(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MeasureEnsemblePF_BB.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MeasureEnsemblePF_BB.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MeasureEnsemblePF_BB, POINTER) returns the conditioned default value of POINTER of MeasureEnsemblePF_BB.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(MeasureEnsemblePF_BB, POINTER) returns the conditioned default value of POINTER of MeasureEnsemblePF_BB.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			prop_default = MeasureEnsemblePF_BB.conditioning(prop, MeasureEnsemblePF_BB.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PF.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PF.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PF.
			%  CHECK = Element.CHECKPROP(MeasureEnsemblePF_BB, PROP, VALUE) checks VALUE format for PROP of MeasureEnsemblePF_BB.
			%  CHECK = PF.CHECKPROP(MeasureEnsemblePF_BB, PROP, VALUE) checks VALUE format for PROP of MeasureEnsemblePF_BB.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:MeasureEnsemblePF_BB:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: €BRAPH2.STR€:MeasureEnsemblePF_BB:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(MeasureEnsemblePF_BB, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MeasureEnsemblePF_BB.
			%   Error id: €BRAPH2.STR€:MeasureEnsemblePF_BB:€BRAPH2.WRONG_INPUT€
			%  PF.CHECKPROP(MeasureEnsemblePF_BB, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MeasureEnsemblePF_BB.
			%   Error id: €BRAPH2.STR€:MeasureEnsemblePF_BB:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('MeasureEnsemblePF_BB')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MeasureEnsemblePF_BB.getPropProp(pointer);
			
			switch prop
				case MeasureEnsemblePF_BB.NODES % __MeasureEnsemblePF_BB.NODES__
					check = Format.checkFormat(Format.RVECTOR, value, MeasureEnsemblePF_BB.getPropSettings(prop));
				case MeasureEnsemblePF_BB.TEMPLATE % __MeasureEnsemblePF_BB.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, MeasureEnsemblePF_BB.getPropSettings(prop));
				otherwise
					if prop <= MeasureEnsemblePF.getPropNumber()
						check = checkProp@MeasureEnsemblePF(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':MeasureEnsemblePF_BB:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MeasureEnsemblePF_BB.getPropTag(prop) ' (' MeasureEnsemblePF_BB.getFormatTag(MeasureEnsemblePF_BB.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pf, prop, varargin)
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
				case MeasureEnsemblePF_BB.SETUP % __MeasureEnsemblePF_BB.SETUP__
					%%%__WARN_TBI__
					value = [];
					
				otherwise
					if prop <= MeasureEnsemblePF.getPropNumber()
						value = calculateValue@MeasureEnsemblePF(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
		end
	end
end
