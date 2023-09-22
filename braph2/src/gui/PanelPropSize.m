classdef PanelPropSize < PanelProp
	%PanelPropSize plots the panel of a property size.
	% It is a subclass of <a href="matlab:help PanelProp">PanelProp</a>.
	%
	% PanelPropSize plots the panel for a SIZE property with a numeric edit field.
	% It works for all categories.
	%
	% The list of PanelPropSize properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the size property panel.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the size property panel.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the size property panel.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the size property panel.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the size property panel.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the size property panel.
	%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>8</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>9</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>10</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the property panel.
	%  <strong>11</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>12</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>13</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>14</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>15</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
	%  <strong>16</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
	%  <strong>17</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
	%  <strong>18</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
	%  <strong>19</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the property panel.
	%  <strong>20</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the editfield.
	%  <strong>21</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
	%  <strong>22</strong> <strong>EL</strong> 	EL (data, item) is the element.
	%  <strong>23</strong> <strong>PROP</strong> 	PROP (data, scalar) is the property number.
	%  <strong>24</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the property panel.
	%  <strong>25</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
	%  <strong>26</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
	%  <strong>27</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
	%  <strong>28</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
	%  <strong>29</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
	%  <strong>30</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>31</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>32</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
	%  <strong>33</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
	%  <strong>34</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
	%  <strong>35</strong> <strong>ENABLE</strong> 	ENABLE (gui, logical) switches the editfield between active and inactive appearance when not editable.
	%  <strong>36</strong> <strong>EDITFIELD</strong> 	EDITFIELD (evanescent, handle) is the size value edit field.
	%  <strong>37</strong> <strong>AXES</strong> 	AXES (evanescent, handle) is the marker value axes.
	%  <strong>38</strong> <strong>LN</strong> 	LN (evanescent, handle) is the marker value line.
	%
	% PanelPropSize methods (constructor):
	%  PanelPropSize - constructor
	%
	% PanelPropSize methods:
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
	% PanelPropSize methods (display):
	%  tostring - string with information about the panel property size
	%  disp - displays information about the panel property size
	%  tree - displays the tree of the panel property size
	%
	% PanelPropSize methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel property size are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel property size
	%
	% PanelPropSize methods (save/load, Static):
	%  save - saves BRAPH2 panel property size as b2 file
	%  load - loads a BRAPH2 panel property size from a b2 file
	%
	% PanelPropSize method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel property size
	%
	% PanelPropSize method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel property size
	%
	% PanelPropSize methods (inspection, Static):
	%  getClass - returns the class of the panel property size
	%  getSubclasses - returns all subclasses of PanelPropSize
	%  getProps - returns the property list of the panel property size
	%  getPropNumber - returns the property number of the panel property size
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
	% PanelPropSize methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% PanelPropSize methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% PanelPropSize methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% PanelPropSize methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?PanelPropSize; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">PanelPropSize constants</a>.
	%
	%
	% See also uieditfield, uiaxes, line, GUI, PanelElement.
	
	properties (Constant) % properties
		ENABLE = 35; %CET: Computational Efficiency Trick
		ENABLE_TAG = 'ENABLE';
		ENABLE_CATEGORY = 9;
		ENABLE_FORMAT = 4;
		
		EDITFIELD = 36; %CET: Computational Efficiency Trick
		EDITFIELD_TAG = 'EDITFIELD';
		EDITFIELD_CATEGORY = 7;
		EDITFIELD_FORMAT = 18;
		
		AXES = 37; %CET: Computational Efficiency Trick
		AXES_TAG = 'AXES';
		AXES_CATEGORY = 7;
		AXES_FORMAT = 18;
		
		LN = 38; %CET: Computational Efficiency Trick
		LN_TAG = 'LN';
		LN_CATEGORY = 7;
		LN_FORMAT = 18;
	end
	methods % constructor
		function pr = PanelPropSize(varargin)
			%PanelPropSize() creates a panel property size.
			%
			% PanelPropSize(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% PanelPropSize(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of PanelPropSize properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the size property panel.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the size property panel.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the size property panel.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the size property panel.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the size property panel.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the size property panel.
			%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>8</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>9</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>10</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the property panel.
			%  <strong>11</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>12</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>13</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>14</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>15</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
			%  <strong>16</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
			%  <strong>17</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
			%  <strong>18</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
			%  <strong>19</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the property panel.
			%  <strong>20</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the editfield.
			%  <strong>21</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
			%  <strong>22</strong> <strong>EL</strong> 	EL (data, item) is the element.
			%  <strong>23</strong> <strong>PROP</strong> 	PROP (data, scalar) is the property number.
			%  <strong>24</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the property panel.
			%  <strong>25</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
			%  <strong>26</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
			%  <strong>27</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
			%  <strong>28</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
			%  <strong>29</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
			%  <strong>30</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>31</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>32</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
			%  <strong>33</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
			%  <strong>34</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
			%  <strong>35</strong> <strong>ENABLE</strong> 	ENABLE (gui, logical) switches the editfield between active and inactive appearance when not editable.
			%  <strong>36</strong> <strong>EDITFIELD</strong> 	EDITFIELD (evanescent, handle) is the size value edit field.
			%  <strong>37</strong> <strong>AXES</strong> 	AXES (evanescent, handle) is the marker value axes.
			%  <strong>38</strong> <strong>LN</strong> 	LN (evanescent, handle) is the marker value line.
			%
			% See also Category, Format.
			
			pr = pr@PanelProp(varargin{:});
		end
	end
	methods (Static) % inspection
		function pr_class = getClass()
			%GETCLASS returns the class of the panel property size.
			%
			% CLASS = PanelPropSize.GETCLASS() returns the class 'PanelPropSize'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PR.GETCLASS() returns the class of the panel property size PR.
			%  CLASS = Element.GETCLASS(PR) returns the class of 'PR'.
			%  CLASS = Element.GETCLASS('PanelPropSize') returns 'PanelPropSize'.
			%
			% Note that the Element.GETCLASS(PR) and Element.GETCLASS('PanelPropSize')
			%  are less computationally efficient.
			
			pr_class = 'PanelPropSize';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel property size.
			%
			% LIST = PanelPropSize.GETSUBCLASSES() returns all subclasses of 'PanelPropSize'.
			%
			% Alternative forms to call this method are:
			%  LIST = PR.GETSUBCLASSES() returns all subclasses of the panel property size PR.
			%  LIST = Element.GETSUBCLASSES(PR) returns all subclasses of 'PR'.
			%  LIST = Element.GETSUBCLASSES('PanelPropSize') returns all subclasses of 'PanelPropSize'.
			%
			% Note that the Element.GETSUBCLASSES(PR) and Element.GETSUBCLASSES('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'PanelPropSize' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel property size.
			%
			% PROPS = PanelPropSize.GETPROPS() returns the property list of panel property size
			%  as a row vector.
			%
			% PROPS = PanelPropSize.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PR.GETPROPS([CATEGORY]) returns the property list of the panel property size PR.
			%  PROPS = Element.GETPROPS(PR[, CATEGORY]) returns the property list of 'PR'.
			%  PROPS = Element.GETPROPS('PanelPropSize'[, CATEGORY]) returns the property list of 'PanelPropSize'.
			%
			% Note that the Element.GETPROPS(PR) and Element.GETPROPS('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2];
				case 2 % Category.METADATA
					prop_list = [5 6];
				case 3 % Category.PARAMETER
					prop_list = 3;
				case 4 % Category.DATA
					prop_list = [4 22 23 28];
				case 6 % Category.QUERY
					prop_list = [7 10 11 15 16 17 18 19 20 21];
				case 7 % Category.EVANESCENT
					prop_list = [9 14 26 27 29 30 31 32 33 34 36 37 38];
				case 8 % Category.FIGURE
					prop_list = 13;
				case 9 % Category.GUI
					prop_list = [8 12 24 25 35];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel property size.
			%
			% N = PanelPropSize.GETPROPNUMBER() returns the property number of panel property size.
			%
			% N = PanelPropSize.GETPROPNUMBER(CATEGORY) returns the property number of panel property size
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PR.GETPROPNUMBER([CATEGORY]) returns the property number of the panel property size PR.
			%  N = Element.GETPROPNUMBER(PR) returns the property number of 'PR'.
			%  N = Element.GETPROPNUMBER('PanelPropSize') returns the property number of 'PanelPropSize'.
			%
			% Note that the Element.GETPROPNUMBER(PR) and Element.GETPROPNUMBER('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 38;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 2;
				case 2 % Category.METADATA
					prop_number = 2;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 4;
				case 6 % Category.QUERY
					prop_number = 10;
				case 7 % Category.EVANESCENT
					prop_number = 13;
				case 8 % Category.FIGURE
					prop_number = 1;
				case 9 % Category.GUI
					prop_number = 5;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel property size/error.
			%
			% CHECK = PanelPropSize.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSPROP(PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(PR, PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(PanelPropSize, PROP) checks whether PROP exists for PanelPropSize.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:PanelPropSize:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSPROP(PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%  Element.EXISTSPROP(PR, PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%  Element.EXISTSPROP(PanelPropSize, PROP) throws error if PROP does NOT exist for PanelPropSize.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PR) and Element.EXISTSPROP('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 38 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for PanelPropSize.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel property size/error.
			%
			% CHECK = PanelPropSize.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSTAG(TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(PR, TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(PanelPropSize, TAG) checks whether TAG exists for PanelPropSize.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:PanelPropSize:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSTAG(TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%  Element.EXISTSTAG(PR, TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%  Element.EXISTSTAG(PanelPropSize, TAG) throws error if TAG does NOT exist for PanelPropSize.
			%   Error id: [BRAPH2:PanelPropSize:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PR) and Element.EXISTSTAG('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'ENABLE'  'EDITFIELD'  'AXES'  'LN' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for PanelPropSize.'] ...
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
			%  PROPERTY = PR.GETPROPPROP(POINTER) returns property number of POINTER of PR.
			%  PROPERTY = Element.GETPROPPROP(PanelPropSize, POINTER) returns property number of POINTER of PanelPropSize.
			%  PROPERTY = PR.GETPROPPROP(PanelPropSize, POINTER) returns property number of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPPROP(PR) and Element.GETPROPPROP('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'ENABLE'  'EDITFIELD'  'AXES'  'LN' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = PR.GETPROPTAG(POINTER) returns tag of POINTER of PR.
			%  TAG = Element.GETPROPTAG(PanelPropSize, POINTER) returns tag of POINTER of PanelPropSize.
			%  TAG = PR.GETPROPTAG(PanelPropSize, POINTER) returns tag of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPTAG(PR) and Element.GETPROPTAG('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				panelpropsize_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'ENABLE'  'EDITFIELD'  'AXES'  'LN' };
				tag = panelpropsize_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = PR.GETPROPCATEGORY(POINTER) returns category of POINTER of PR.
			%  CATEGORY = Element.GETPROPCATEGORY(PanelPropSize, POINTER) returns category of POINTER of PanelPropSize.
			%  CATEGORY = PR.GETPROPCATEGORY(PanelPropSize, POINTER) returns category of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPCATEGORY(PR) and Element.GETPROPCATEGORY('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelpropsize_category_list = { 1  1  3  4  2  2  6  9  7  6  6  9  8  7  6  6  6  6  6  6  6  4  4  9  9  7  7  4  7  7  7  7  7  7  9  7  7  7 };
			prop_category = panelpropsize_category_list{prop};
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
			%  FORMAT = PR.GETPROPFORMAT(POINTER) returns format of POINTER of PR.
			%  FORMAT = Element.GETPROPFORMAT(PanelPropSize, POINTER) returns format of POINTER of PanelPropSize.
			%  FORMAT = PR.GETPROPFORMAT(PanelPropSize, POINTER) returns format of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPFORMAT(PR) and Element.GETPROPFORMAT('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelpropsize_format_list = { 2  2  8  2  2  2  2  4  18  4  4  8  20  18  4  4  4  4  4  4  4  8  11  22  2  18  18  8  18  18  18  19  19  19  4  18  18  18 };
			prop_format = panelpropsize_format_list{prop};
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
			%  DESCRIPTION = PR.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PR.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(PanelPropSize, POINTER) returns description of POINTER of PanelPropSize.
			%  DESCRIPTION = PR.GETPROPDESCRIPTION(PanelPropSize, POINTER) returns description of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPDESCRIPTION(PR) and Element.GETPROPDESCRIPTION('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelpropsize_description_list = { 'NAME (constant, string) is the name of the size property panel.'  'DESCRIPTION (constant, string) is the description of the size property panel.'  'TEMPLATE (parameter, item) is the template of the size property panel.'  'ID (data, string) is a few-letter code for the size property panel.'  'LABEL (metadata, string) is an extended label of the size property panel.'  'NOTES (metadata, string) are some specific notes about the size property panel.'  'TOSTRING (query, string) returns a string that represents the object.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the property panel.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.'  'HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.'  'DELETE (query, logical) resets the handles when the panel is deleted.'  'CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.'  'X_DRAW (query, logical) draws the property panel.'  'UPDATE (query, logical) updates the content and permissions of the editfield.'  'REDRAW (query, logical) resizes the property panel and repositions its graphical objects.'  'EL (data, item) is the element.'  'PROP (data, scalar) is the property number.'  'HEIGHT (gui, size) is the pixel height of the property panel.'  'TITLE (gui, string) is the property title.'  'LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.'  'BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].'  'GUI_CB (data, item) is the handle to the item figure.'  'LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.'  'BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].'  'BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].'  'LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.'  'LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.'  'LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.'  'ENABLE (gui, logical) switches the editfield between active and inactive appearance when not editable.'  'EDITFIELD (evanescent, handle) is the size value edit field.'  'AXES (evanescent, handle) is the marker value axes.'  'LN (evanescent, handle) is the marker value line.' };
			prop_description = panelpropsize_description_list{prop};
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
			%  SETTINGS = PR.GETPROPSETTINGS(POINTER) returns settings of POINTER of PR.
			%  SETTINGS = Element.GETPROPSETTINGS(PanelPropSize, POINTER) returns settings of POINTER of PanelPropSize.
			%  SETTINGS = PR.GETPROPSETTINGS(PanelPropSize, POINTER) returns settings of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPSETTINGS(PR) and Element.GETPROPSETTINGS('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 35 % PanelPropSize.ENABLE
					prop_settings = Format.getFormatSettings(4);
				case 36 % PanelPropSize.EDITFIELD
					prop_settings = Format.getFormatSettings(18);
				case 37 % PanelPropSize.AXES
					prop_settings = Format.getFormatSettings(18);
				case 38 % PanelPropSize.LN
					prop_settings = Format.getFormatSettings(18);
				case 3 % PanelPropSize.TEMPLATE
					prop_settings = 'PanelPropSize';
				otherwise
					prop_settings = getPropSettings@PanelProp(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = PanelPropSize.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = PanelPropSize.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULT(PanelPropSize, POINTER) returns the default value of POINTER of PanelPropSize.
			%  DEFAULT = PR.GETPROPDEFAULT(PanelPropSize, POINTER) returns the default value of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPDEFAULT(PR) and Element.GETPROPDEFAULT('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 35 % PanelPropSize.ENABLE
					prop_default = true;
				case 36 % PanelPropSize.EDITFIELD
					prop_default = Format.getFormatDefault(18, PanelPropSize.getPropSettings(prop));
				case 37 % PanelPropSize.AXES
					prop_default = Format.getFormatDefault(18, PanelPropSize.getPropSettings(prop));
				case 38 % PanelPropSize.LN
					prop_default = Format.getFormatDefault(18, PanelPropSize.getPropSettings(prop));
				case 1 % PanelPropSize.NAME
					prop_default = 'PanelPropSize';
				case 2 % PanelPropSize.DESCRIPTION
					prop_default = 'PanelPropSize plots the panel for a SIZE property with a numeric edit field. It works for all categories.';
				case 3 % PanelPropSize.TEMPLATE
					prop_default = Format.getFormatDefault(8, PanelPropSize.getPropSettings(prop));
				case 4 % PanelPropSize.ID
					prop_default = 'PanelPropSize ID';
				case 5 % PanelPropSize.LABEL
					prop_default = 'PanelPropSize label';
				case 6 % PanelPropSize.NOTES
					prop_default = 'PanelPropSize notes';
				case 22 % PanelPropSize.EL
					prop_default = PanelProp();
				case 23 % PanelPropSize.PROP
					prop_default = 24;
				case 24 % PanelPropSize.HEIGHT
					prop_default = 48;
				otherwise
					prop_default = getPropDefault@PanelProp(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = PanelPropSize.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = PanelPropSize.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(PanelPropSize, POINTER) returns the conditioned default value of POINTER of PanelPropSize.
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(PanelPropSize, POINTER) returns the conditioned default value of POINTER of PanelPropSize.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PR) and Element.GETPROPDEFAULTCONDITIONED('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			prop_default = PanelPropSize.conditioning(prop, PanelPropSize.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PR.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PR.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PR.
			%  CHECK = Element.CHECKPROP(PanelPropSize, PROP, VALUE) checks VALUE format for PROP of PanelPropSize.
			%  CHECK = PR.CHECKPROP(PanelPropSize, PROP, VALUE) checks VALUE format for PROP of PanelPropSize.
			% 
			% PR.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:PanelPropSize:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PR.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PR.
			%   Error id: BRAPH2:PanelPropSize:WrongInput
			%  Element.CHECKPROP(PanelPropSize, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PanelPropSize.
			%   Error id: BRAPH2:PanelPropSize:WrongInput
			%  PR.CHECKPROP(PanelPropSize, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PanelPropSize.
			%   Error id: BRAPH2:PanelPropSize:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PR) and Element.CHECKPROP('PanelPropSize')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = PanelPropSize.getPropProp(pointer);
			
			switch prop
				case 35 % PanelPropSize.ENABLE
					check = Format.checkFormat(4, value, PanelPropSize.getPropSettings(prop));
				case 36 % PanelPropSize.EDITFIELD
					check = Format.checkFormat(18, value, PanelPropSize.getPropSettings(prop));
				case 37 % PanelPropSize.AXES
					check = Format.checkFormat(18, value, PanelPropSize.getPropSettings(prop));
				case 38 % PanelPropSize.LN
					check = Format.checkFormat(18, value, PanelPropSize.getPropSettings(prop));
				case 3 % PanelPropSize.TEMPLATE
					check = Format.checkFormat(8, value, PanelPropSize.getPropSettings(prop));
				otherwise
					if prop <= 34
						check = checkProp@PanelProp(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropSize:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' PanelPropSize.getPropTag(prop) ' (' PanelPropSize.getFormatTag(PanelPropSize.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pr, prop, varargin)
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
				case 36 % PanelPropSize.EDITFIELD
					el = pr.get('EL');
					prop = pr.get('PROP');
					
					editfield = uieditfield('numeric', ...
					    'Parent', pr.memorize('H'), ... % H = p for Panel
					    'Tag', 'EDITFIELD', ...
					    'Limits', [0 +Inf], ...
					    'LowerLimitInclusive', false, ...
					    'FontSize', 12, ...
					    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
					    'ValueChangedFcn', {@cb_editfield} ...
					    );
					
					value = editfield;
					
				case 37 % PanelPropSize.AXES
					axes = uiaxes( ...
					    'Parent', pr.memorize('H'), ... % H = p for Panel
					    'Tag', 'AXES' ...
					    );
					axis(axes, 'off')
					axes.Toolbar.Visible = 'off';
					axes.Interactions = [];
					
					value = axes;
					
				case 38 % PanelPropSize.LN
					axes = pr.memorize('AXES');
					
					ln = plot(axes, ...
					    [-100 0 100], ...
					    [0 0 0], ...
					    'Marker', 's', ...
					    'Color', 'k');
					xlim(axes, [-1 1])        
					ylim(axes, [-1 1])
					
					value = ln;
					
				case 19 % PanelPropSize.X_DRAW
					value = calculateValue@PanelProp(pr, 19, varargin{:}); % also warning
					if value
					    pr.memorize('EDITFIELD')
					    pr.memorize('AXES')
					    pr.memorize('LN')
					end
					
				case 20 % PanelPropSize.UPDATE
					value = calculateValue@PanelProp(pr, 20, varargin{:}); % also warning
					if value
					    el = pr.get('EL');
					    prop = pr.get('PROP');
					    
					    switch el.getPropCategory(prop)
					        case 1
					            set(pr.get('EDITFIELD'), ...
					                'Value', el.get(prop), ...
					                'Editable', 'off', ...
					                'Enable', pr.get('ENABLE') ...
					                )
					            set(pr.get('LN'), ...
					                'LineWidth', el.get(prop), ...
					                'MarkerSize', el.get(prop) ...
					                )
					            
					        case 2
					            set(pr.get('EDITFIELD'), 'Value', el.get(prop))
					            set(pr.get('LN'), ...
					                'LineWidth', el.get(prop), ...
					                'MarkerSize', el.get(prop) ...
					                )
					
					            if el.isLocked(prop)
					                set(pr.get('EDITFIELD'), ...
					                    'Editable', 'off', ...
					                    'Enable', pr.get('ENABLE') ...
					                    )
					            end
					            
					        case {3, 4, 8, 9}
					            set(pr.get('EDITFIELD'), 'Value', el.get(prop))
					            set(pr.get('LN'), ...
					                'LineWidth', el.get(prop), ...
					                'MarkerSize', el.get(prop) ...
					                )
					
					            prop_value = el.getr(prop);
					            if el.isLocked(prop) || isa(prop_value, 'Callback')
					                set(pr.get('EDITFIELD'), ...
					                    'Editable', 'off', ...
					                    'Enable', pr.get('ENABLE') ...
					                    )
					            end
					
					        case {5 6 7}
					            prop_value = el.getr(prop);
					
					            if isa(prop_value, 'NoValue')
					                set(pr.get('EDITFIELD'), 'Value', el.getPropDefault(prop))
					                set(pr.get('LN'), ...
					                    'LineWidth', el.getPropDefault(prop), ...
					                    'MarkerSize', el.getPropDefault(prop) ...
					                    )
					            else
					                set(pr.get('EDITFIELD'), 'Value', el.get(prop))
					                set(pr.get('LN'), ...
					                    'LineWidth', el.get(prop), ...
					                    'MarkerSize', el.get(prop) ...
					                    )
					            end
					            
					            set(pr.get('EDITFIELD'), ...
					                'Editable', 'off', ...
					                'Enable', pr.get('ENABLE') ...
					                )
					    end
					end
					
				case 21 % PanelPropSize.REDRAW
					value = calculateValue@PanelProp(pr, 21, varargin{:}); % also warning
					if value
					    w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
					    
					    set(pr.get('EDITFIELD'), 'Position', [4 4 .15*w_p 21])
					    set(pr.get('AXES'), 'InnerPosition', [4+.15*w_p+8 4 .70*w_p 21])
					end
					
				case 17 % PanelPropSize.DELETE
					value = calculateValue@PanelProp(pr, 17, varargin{:}); % also warning
					if value
					    pr.set('EDITFIELD', Element.getNoValue())
					    pr.set('AXES', Element.getNoValue())
					    pr.set('LN', Element.getNoValue())
					end
					
				otherwise
					if prop <= 34
						value = calculateValue@PanelProp(pr, prop, varargin{:});
					else
						value = calculateValue@Element(pr, prop, varargin{:});
					end
			end
			
			function cb_editfield(~, ~)
			    pr.get('EL').set(pr.get('PROP'), get(pr.get('EDITFIELD'), 'Value'))
			end
		end
	end
end
