classdef ImporterBrainAtlasXLS < Importer
	%ImporterBrainAtlasXLS imports a brain atlas from an XLS/XLSX file.
	% It is a subclass of <a href="matlab:help Importer">Importer</a>.
	%
	% ImporterBrainAtlasXLS imports a brain atlas from an XLS/XLSX file.
	% The XLS file consists of 6 columns and many rows.
	% The first 4 rows: BrainAtlas ID (row 1, column 1), BrainAtlas LABEL 
	% (row 2, column 1), BrainAtlas NOTES (row 3, column 1), BrainSurface Name 
	% (row 4, column 1).
	% And from row 5 to the end, the following columns: BrainRegion ID (column 1),
	% BrainRegion LABEL (column 2), BrainRegions (column 3 to column 5; 
	% coordinates x, y, z, one per column), and BrainRegion NOTES (column 6).
	%
	% ImporterBrainAtlasXLS methods (constructor):
	%  ImporterBrainAtlasXLS - constructor
	%
	% ImporterBrainAtlasXLS methods:
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
	% ImporterBrainAtlasXLS methods (display):
	%  tostring - string with information about the importer of brain atlas from XLS/XLSX
	%  disp - displays information about the importer of brain atlas from XLS/XLSX
	%  tree - displays the tree of the importer of brain atlas from XLS/XLSX
	%
	% ImporterBrainAtlasXLS methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two importer of brain atlas from XLS/XLSX are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the importer of brain atlas from XLS/XLSX
	%
	% ImporterBrainAtlasXLS methods (save/load, Static):
	%  save - saves BRAPH2 importer of brain atlas from XLS/XLSX as b2 file
	%  load - loads a BRAPH2 importer of brain atlas from XLS/XLSX from a b2 file
	%
	% ImporterBrainAtlasXLS method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the importer of brain atlas from XLS/XLSX
	%
	% ImporterBrainAtlasXLS method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the importer of brain atlas from XLS/XLSX
	%
	% ImporterBrainAtlasXLS methods (inspection, Static):
	%  getClass - returns the class of the importer of brain atlas from XLS/XLSX
	%  getSubclasses - returns all subclasses of ImporterBrainAtlasXLS
	%  getProps - returns the property list of the importer of brain atlas from XLS/XLSX
	%  getPropNumber - returns the property number of the importer of brain atlas from XLS/XLSX
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
	% ImporterBrainAtlasXLS methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% ImporterBrainAtlasXLS methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% ImporterBrainAtlasXLS methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% ImporterBrainAtlasXLS methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?ImporterBrainAtlasXLS; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">ImporterBrainAtlasXLS constants</a>.
	%
	%
	% See also BrainAtlas, ExporterBrainAtlasXLS.
	
	properties (Constant) % properties
		FILE = Importer.getPropNumber() + 1;
		FILE_TAG = 'FILE';
		FILE_CATEGORY = Category.DATA;
		FILE_FORMAT = Format.STRING;
		
		GET_FILE = Importer.getPropNumber() + 2;
		GET_FILE_TAG = 'GET_FILE';
		GET_FILE_CATEGORY = Category.QUERY;
		GET_FILE_FORMAT = Format.ITEM;
		
		BA = Importer.getPropNumber() + 3;
		BA_TAG = 'BA';
		BA_CATEGORY = Category.RESULT;
		BA_FORMAT = Format.ITEM;
	end
	methods % constructor
		function im = ImporterBrainAtlasXLS(varargin)
			%ImporterBrainAtlasXLS() creates a importer of brain atlas from XLS/XLSX.
			%
			% ImporterBrainAtlasXLS(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% ImporterBrainAtlasXLS(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			im = im@Importer(varargin{:});
		end
	end
	methods (Static) % inspection
		function im_class = getClass()
			%GETCLASS returns the class of the importer of brain atlas from XLS/XLSX.
			%
			% CLASS = ImporterBrainAtlasXLS.GETCLASS() returns the class 'ImporterBrainAtlasXLS'.
			%
			% Alternative forms to call this method are:
			%  CLASS = IM.GETCLASS() returns the class of the importer of brain atlas from XLS/XLSX IM.
			%  CLASS = Element.GETCLASS(IM) returns the class of 'IM'.
			%  CLASS = Element.GETCLASS('ImporterBrainAtlasXLS') returns 'ImporterBrainAtlasXLS'.
			%
			% Note that the Element.GETCLASS(IM) and Element.GETCLASS('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			
			im_class = 'ImporterBrainAtlasXLS';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the importer of brain atlas from XLS/XLSX.
			%
			% LIST = ImporterBrainAtlasXLS.GETSUBCLASSES() returns all subclasses of 'ImporterBrainAtlasXLS'.
			%
			% Alternative forms to call this method are:
			%  LIST = IM.GETSUBCLASSES() returns all subclasses of the importer of brain atlas from XLS/XLSX IM.
			%  LIST = Element.GETSUBCLASSES(IM) returns all subclasses of 'IM'.
			%  LIST = Element.GETSUBCLASSES('ImporterBrainAtlasXLS') returns all subclasses of 'ImporterBrainAtlasXLS'.
			%
			% Note that the Element.GETSUBCLASSES(IM) and Element.GETSUBCLASSES('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('ImporterBrainAtlasXLS', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of importer of brain atlas from XLS/XLSX.
			%
			% PROPS = ImporterBrainAtlasXLS.GETPROPS() returns the property list of importer of brain atlas from XLS/XLSX
			%  as a row vector.
			%
			% PROPS = ImporterBrainAtlasXLS.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = IM.GETPROPS([CATEGORY]) returns the property list of the importer of brain atlas from XLS/XLSX IM.
			%  PROPS = Element.GETPROPS(IM[, CATEGORY]) returns the property list of 'IM'.
			%  PROPS = Element.GETPROPS('ImporterBrainAtlasXLS'[, CATEGORY]) returns the property list of 'ImporterBrainAtlasXLS'.
			%
			% Note that the Element.GETPROPS(IM) and Element.GETPROPS('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					Importer.getProps() ...
						ImporterBrainAtlasXLS.FILE ...
						ImporterBrainAtlasXLS.GET_FILE ...
						ImporterBrainAtlasXLS.BA ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						Importer.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						Importer.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						Importer.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						Importer.getProps(Category.DATA) ...
						ImporterBrainAtlasXLS.FILE ...
						];
				case Category.RESULT
					prop_list = [
						Importer.getProps(Category.RESULT) ...
						ImporterBrainAtlasXLS.BA ...
						];
				case Category.QUERY
					prop_list = [ ...
						Importer.getProps(Category.QUERY) ...
						ImporterBrainAtlasXLS.GET_FILE ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						Importer.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						Importer.getProps(Category.FIGURE) ...
						];
				case Category.GUI
					prop_list = [ ...
						Importer.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of importer of brain atlas from XLS/XLSX.
			%
			% N = ImporterBrainAtlasXLS.GETPROPNUMBER() returns the property number of importer of brain atlas from XLS/XLSX.
			%
			% N = ImporterBrainAtlasXLS.GETPROPNUMBER(CATEGORY) returns the property number of importer of brain atlas from XLS/XLSX
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = IM.GETPROPNUMBER([CATEGORY]) returns the property number of the importer of brain atlas from XLS/XLSX IM.
			%  N = Element.GETPROPNUMBER(IM) returns the property number of 'IM'.
			%  N = Element.GETPROPNUMBER('ImporterBrainAtlasXLS') returns the property number of 'ImporterBrainAtlasXLS'.
			%
			% Note that the Element.GETPROPNUMBER(IM) and Element.GETPROPNUMBER('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(ImporterBrainAtlasXLS.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in importer of brain atlas from XLS/XLSX/error.
			%
			% CHECK = ImporterBrainAtlasXLS.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = IM.EXISTSPROP(PROP) checks whether PROP exists for IM.
			%  CHECK = Element.EXISTSPROP(IM, PROP) checks whether PROP exists for IM.
			%  CHECK = Element.EXISTSPROP(ImporterBrainAtlasXLS, PROP) checks whether PROP exists for ImporterBrainAtlasXLS.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  IM.EXISTSPROP(PROP) throws error if PROP does NOT exist for IM.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%  Element.EXISTSPROP(IM, PROP) throws error if PROP does NOT exist for IM.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%  Element.EXISTSPROP(ImporterBrainAtlasXLS, PROP) throws error if PROP does NOT exist for ImporterBrainAtlasXLS.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%
			% Note that the Element.EXISTSPROP(IM) and Element.EXISTSPROP('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == ImporterBrainAtlasXLS.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for ImporterBrainAtlasXLS.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in importer of brain atlas from XLS/XLSX/error.
			%
			% CHECK = ImporterBrainAtlasXLS.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = IM.EXISTSTAG(TAG) checks whether TAG exists for IM.
			%  CHECK = Element.EXISTSTAG(IM, TAG) checks whether TAG exists for IM.
			%  CHECK = Element.EXISTSTAG(ImporterBrainAtlasXLS, TAG) checks whether TAG exists for ImporterBrainAtlasXLS.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  IM.EXISTSTAG(TAG) throws error if TAG does NOT exist for IM.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%  Element.EXISTSTAG(IM, TAG) throws error if TAG does NOT exist for IM.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%  Element.EXISTSTAG(ImporterBrainAtlasXLS, TAG) throws error if TAG does NOT exist for ImporterBrainAtlasXLS.
			%   Error id: [BRAPH2:ImporterBrainAtlasXLS:WrongInput]
			%
			% Note that the Element.EXISTSTAG(IM) and Element.EXISTSTAG('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			importerbrainatlasxls_tag_list = cellfun(@(x) ImporterBrainAtlasXLS.getPropTag(x), num2cell(ImporterBrainAtlasXLS.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, importerbrainatlasxls_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for ImporterBrainAtlasXLS.'] ...
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
			%  PROPERTY = IM.GETPROPPROP(POINTER) returns property number of POINTER of IM.
			%  PROPERTY = Element.GETPROPPROP(ImporterBrainAtlasXLS, POINTER) returns property number of POINTER of ImporterBrainAtlasXLS.
			%  PROPERTY = IM.GETPROPPROP(ImporterBrainAtlasXLS, POINTER) returns property number of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPPROP(IM) and Element.GETPROPPROP('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				importerbrainatlasxls_tag_list = cellfun(@(x) ImporterBrainAtlasXLS.getPropTag(x), num2cell(ImporterBrainAtlasXLS.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, importerbrainatlasxls_tag_list)); % tag = pointer
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
			%  TAG = IM.GETPROPTAG(POINTER) returns tag of POINTER of IM.
			%  TAG = Element.GETPROPTAG(ImporterBrainAtlasXLS, POINTER) returns tag of POINTER of ImporterBrainAtlasXLS.
			%  TAG = IM.GETPROPTAG(ImporterBrainAtlasXLS, POINTER) returns tag of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPTAG(IM) and Element.GETPROPTAG('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case ImporterBrainAtlasXLS.FILE
						tag = ImporterBrainAtlasXLS.FILE_TAG;
					case ImporterBrainAtlasXLS.GET_FILE
						tag = ImporterBrainAtlasXLS.GET_FILE_TAG;
					case ImporterBrainAtlasXLS.BA
						tag = ImporterBrainAtlasXLS.BA_TAG;
					otherwise
						tag = getPropTag@Importer(prop);
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
			%  CATEGORY = IM.GETPROPCATEGORY(POINTER) returns category of POINTER of IM.
			%  CATEGORY = Element.GETPROPCATEGORY(ImporterBrainAtlasXLS, POINTER) returns category of POINTER of ImporterBrainAtlasXLS.
			%  CATEGORY = IM.GETPROPCATEGORY(ImporterBrainAtlasXLS, POINTER) returns category of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPCATEGORY(IM) and Element.GETPROPCATEGORY('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE
					prop_category = ImporterBrainAtlasXLS.FILE_CATEGORY;
				case ImporterBrainAtlasXLS.GET_FILE
					prop_category = ImporterBrainAtlasXLS.GET_FILE_CATEGORY;
				case ImporterBrainAtlasXLS.BA
					prop_category = ImporterBrainAtlasXLS.BA_CATEGORY;
				otherwise
					prop_category = getPropCategory@Importer(prop);
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
			%  FORMAT = IM.GETPROPFORMAT(POINTER) returns format of POINTER of IM.
			%  FORMAT = Element.GETPROPFORMAT(ImporterBrainAtlasXLS, POINTER) returns format of POINTER of ImporterBrainAtlasXLS.
			%  FORMAT = IM.GETPROPFORMAT(ImporterBrainAtlasXLS, POINTER) returns format of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPFORMAT(IM) and Element.GETPROPFORMAT('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE
					prop_format = ImporterBrainAtlasXLS.FILE_FORMAT;
				case ImporterBrainAtlasXLS.GET_FILE
					prop_format = ImporterBrainAtlasXLS.GET_FILE_FORMAT;
				case ImporterBrainAtlasXLS.BA
					prop_format = ImporterBrainAtlasXLS.BA_FORMAT;
				otherwise
					prop_format = getPropFormat@Importer(prop);
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
			%  DESCRIPTION = IM.GETPROPDESCRIPTION(POINTER) returns description of POINTER of IM.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(ImporterBrainAtlasXLS, POINTER) returns description of POINTER of ImporterBrainAtlasXLS.
			%  DESCRIPTION = IM.GETPROPDESCRIPTION(ImporterBrainAtlasXLS, POINTER) returns description of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPDESCRIPTION(IM) and Element.GETPROPDESCRIPTION('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE
					prop_description = 'FILE (data, string) is the XLS/XLSX file from where to load the brain atlas.';
				case ImporterBrainAtlasXLS.GET_FILE
					prop_description = 'GET_FILE (query, item) opens a dialog box to get the XLS/XLSX file from where to load the brain atlas.';
				case ImporterBrainAtlasXLS.BA
					prop_description = 'BA (result, item) is a brain atlas.';
				case ImporterBrainAtlasXLS.NAME
					prop_description = 'NAME (constant, string) is the name of the brain atlas importer from XLS/XLSX.';
				case ImporterBrainAtlasXLS.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the brain atlas importer from XLS/XLSX.';
				case ImporterBrainAtlasXLS.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the brain atlas importer from XLS/XLSX.';
				case ImporterBrainAtlasXLS.ID
					prop_description = 'ID (data, string) is a few-letter code for the brain atlas importer from XLS/XLSX.';
				case ImporterBrainAtlasXLS.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the brain atlas importer from XLS/XLSX.';
				case ImporterBrainAtlasXLS.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the brain atlas importer from XLS/XLSX.';
				otherwise
					prop_description = getPropDescription@Importer(prop);
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
			%  SETTINGS = IM.GETPROPSETTINGS(POINTER) returns settings of POINTER of IM.
			%  SETTINGS = Element.GETPROPSETTINGS(ImporterBrainAtlasXLS, POINTER) returns settings of POINTER of ImporterBrainAtlasXLS.
			%  SETTINGS = IM.GETPROPSETTINGS(ImporterBrainAtlasXLS, POINTER) returns settings of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPSETTINGS(IM) and Element.GETPROPSETTINGS('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE
					prop_settings = Format.getFormatSettings(Format.STRING);
				case ImporterBrainAtlasXLS.GET_FILE
					prop_settings = 'ImporterBrainAtlasXLS';
				case ImporterBrainAtlasXLS.BA
					prop_settings = 'BrainAtlas';
				case ImporterBrainAtlasXLS.TEMPLATE
					prop_settings = 'ImporterBrainAtlasXLS';
				otherwise
					prop_settings = getPropSettings@Importer(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = ImporterBrainAtlasXLS.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = ImporterBrainAtlasXLS.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = IM.GETPROPDEFAULT(POINTER) returns the default value of POINTER of IM.
			%  DEFAULT = Element.GETPROPDEFAULT(ImporterBrainAtlasXLS, POINTER) returns the default value of POINTER of ImporterBrainAtlasXLS.
			%  DEFAULT = IM.GETPROPDEFAULT(ImporterBrainAtlasXLS, POINTER) returns the default value of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPDEFAULT(IM) and Element.GETPROPDEFAULT('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE
					prop_default = 'desikan_atlas.xlsx';
				case ImporterBrainAtlasXLS.GET_FILE
					prop_default = Format.getFormatDefault(Format.ITEM, ImporterBrainAtlasXLS.getPropSettings(prop));
				case ImporterBrainAtlasXLS.BA
					prop_default = BrainAtlas();
				case ImporterBrainAtlasXLS.NAME
					prop_default = 'ImporterBrainAtlasXLS';
				case ImporterBrainAtlasXLS.DESCRIPTION
					prop_default = 'ImporterBrainAtlasXLS imports a brain atlas from an XLS/XLSX file. The XLS file consists of 6 columns and many rows. The first 4 rows: BrainAtlas ID (row 1, column 1), BrainAtlas LABEL (row 2, column 1), BrainAtlas NOTES (row 3, column 1), BrainSurface Name (row 4, column 1). And from row 5 to the end, the following columns: BrainRegion ID (column 1), BrainRegion LABEL (column 2), BrainRegions (column 3 to column 5; coordinates x, y, z, one per column), and BrainRegion NOTES (column 6).';
				case ImporterBrainAtlasXLS.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, ImporterBrainAtlasXLS.getPropSettings(prop));
				case ImporterBrainAtlasXLS.ID
					prop_default = 'ImporterBrainAtlasXLS ID';
				case ImporterBrainAtlasXLS.LABEL
					prop_default = 'ImporterBrainAtlasXLS label';
				case ImporterBrainAtlasXLS.NOTES
					prop_default = 'ImporterBrainAtlasXLS notes';
				otherwise
					prop_default = getPropDefault@Importer(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = ImporterBrainAtlasXLS.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = ImporterBrainAtlasXLS.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = IM.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of IM.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(ImporterBrainAtlasXLS, POINTER) returns the conditioned default value of POINTER of ImporterBrainAtlasXLS.
			%  DEFAULT = IM.GETPROPDEFAULTCONDITIONED(ImporterBrainAtlasXLS, POINTER) returns the conditioned default value of POINTER of ImporterBrainAtlasXLS.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(IM) and Element.GETPROPDEFAULTCONDITIONED('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			prop_default = ImporterBrainAtlasXLS.conditioning(prop, ImporterBrainAtlasXLS.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = IM.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = IM.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of IM.
			%  CHECK = Element.CHECKPROP(ImporterBrainAtlasXLS, PROP, VALUE) checks VALUE format for PROP of ImporterBrainAtlasXLS.
			%  CHECK = IM.CHECKPROP(ImporterBrainAtlasXLS, PROP, VALUE) checks VALUE format for PROP of ImporterBrainAtlasXLS.
			% 
			% IM.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:ImporterBrainAtlasXLS:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  IM.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of IM.
			%   Error id: €BRAPH2.STR€:ImporterBrainAtlasXLS:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(ImporterBrainAtlasXLS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ImporterBrainAtlasXLS.
			%   Error id: €BRAPH2.STR€:ImporterBrainAtlasXLS:€BRAPH2.WRONG_INPUT€
			%  IM.CHECKPROP(ImporterBrainAtlasXLS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ImporterBrainAtlasXLS.
			%   Error id: €BRAPH2.STR€:ImporterBrainAtlasXLS:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(IM) and Element.CHECKPROP('ImporterBrainAtlasXLS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = ImporterBrainAtlasXLS.getPropProp(pointer);
			
			switch prop
				case ImporterBrainAtlasXLS.FILE % __ImporterBrainAtlasXLS.FILE__
					check = Format.checkFormat(Format.STRING, value, ImporterBrainAtlasXLS.getPropSettings(prop));
				case ImporterBrainAtlasXLS.GET_FILE % __ImporterBrainAtlasXLS.GET_FILE__
					check = Format.checkFormat(Format.ITEM, value, ImporterBrainAtlasXLS.getPropSettings(prop));
				case ImporterBrainAtlasXLS.BA % __ImporterBrainAtlasXLS.BA__
					check = Format.checkFormat(Format.ITEM, value, ImporterBrainAtlasXLS.getPropSettings(prop));
				case ImporterBrainAtlasXLS.TEMPLATE % __ImporterBrainAtlasXLS.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, ImporterBrainAtlasXLS.getPropSettings(prop));
				otherwise
					if prop <= Importer.getPropNumber()
						check = checkProp@Importer(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' ImporterBrainAtlasXLS.getPropTag(prop) ' (' ImporterBrainAtlasXLS.getFormatTag(ImporterBrainAtlasXLS.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(im, prop, varargin)
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
				case ImporterBrainAtlasXLS.GET_FILE % __ImporterBrainAtlasXLS.GET_FILE__
					[filename, filepath, filterindex] = uigetfile({'*.xlsx';'*.xls'}, 'Select Excel file');
					if filterindex
					    file = [filepath filename];
					    im.set('FILE', file);
					end
					value = im;
					
				case ImporterBrainAtlasXLS.BA % __ImporterBrainAtlasXLS.BA__
					rng_settings_ = rng(); rng(im.getPropSeed(ImporterBrainAtlasXLS.BA), 'twister')
					
					% creates empty BrainAtlas
					ba = BrainAtlas();
					
					% analyzes file
					file = im.get('FILE');
					if ~isfile(file)
					    file = [fileparts(which('braph2')) filesep 'atlases' filesep file];
					end
					
					if isfile(file)
						wb = braph2waitbar(im.get('WAITBAR'), 0, 'Reading File ...');
					
					    try
					        [~, ~, raw] = xlsread(file);
					        
					        % adds props
					        braph2waitbar(wb, .15, 'Loading brain atlas file ...');
					        
					        ba.set( ...
					            'ID', raw{1, 1}, ...
					            'LABEL', raw{2, 1}, ...
					            'NOTES', raw{3, 1} ...
					            );
					        
					        idict = ba.get('BR_DICT');
					        
					        % adds brain regions
					        braph2waitbar(wb, .25, 'Extracting brain regions ...')
					        
					        for i = 5:1:size(raw, 1)
					            braph2waitbar(wb, .25 + .75 * (i - 4) / (size(raw, 1) - 4), ['Loading brain region ' num2str(i - 4) ' of ' num2str(size(raw, 1) - 4) ' ...'])
					            
					            br = BrainRegion( ...
					                'ID', raw{i, 1}, ...
					                'LABEL', raw{i, 2}, ...
					                'X', raw{i, 3}, ...
					                'Y', raw{i, 4}, ...
					                'Z', raw{i, 5}, ...
					                'NOTES', raw{i, 6} ...
					                );
					            idict.get('ADD', br);
					        end
					        ba.set('BR_DICT', idict);
					    catch e
					        braph2waitbar(wb, 'close')
					
					        rethrow(e)
					    end
					    
					    braph2waitbar(wb, 'close')
					else
					    error([BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.CANCEL_IO], ...
					        [BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.CANCEL_IO '\n' ...
					        'The prop FILE must be an existing file, but it is ''' file '''.'] ...
					        );
					end
					
					value = ba;
					
					rng(rng_settings_)
					
				otherwise
					if prop <= Importer.getPropNumber()
						value = calculateValue@Importer(im, prop, varargin{:});
					else
						value = calculateValue@Element(im, prop, varargin{:});
					end
			end
			
		end
	end
end
