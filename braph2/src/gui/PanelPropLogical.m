classdef PanelPropLogical < PanelProp
	%PanelPropLogical plots the panel of a property logical.
	% It is a subclass of <a href="matlab:help PanelProp">PanelProp</a>.
	%
	% PanelPropLogical plots the panel for a LOGICAL property with a checkbox.
	% It works for all categories.
	%
	% The list of PanelPropLogical properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the logical property panel.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the logical property panel.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the logical property panel.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the logical property panel.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the logical property panel.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the logical property panel.
	%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the property panel.
	%  <strong>10</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>11</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>12</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>13</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>14</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
	%  <strong>15</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
	%  <strong>16</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
	%  <strong>17</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
	%  <strong>18</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the property panel.
	%  <strong>19</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the checkbox.
	%  <strong>20</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
	%  <strong>21</strong> <strong>EL</strong> 	EL (data, item) is the element.
	%  <strong>22</strong> <strong>PROP</strong> 	PROP (data, scalar) is the property number.
	%  <strong>23</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the property panel.
	%  <strong>24</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
	%  <strong>25</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
	%  <strong>26</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
	%  <strong>27</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
	%  <strong>28</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
	%  <strong>29</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>30</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>31</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
	%  <strong>32</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
	%  <strong>33</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
	%  <strong>34</strong> <strong>CHECKBOX</strong> 	CHECKBOX (evanescent, handle) is the logical value checkbox.
	%
	% PanelPropLogical methods (constructor):
	%  PanelPropLogical - constructor
	%
	% PanelPropLogical methods:
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
	% PanelPropLogical methods (display):
	%  tostring - string with information about the panel property logical
	%  disp - displays information about the panel property logical
	%  tree - displays the tree of the panel property logical
	%
	% PanelPropLogical methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel property logical are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel property logical
	%
	% PanelPropLogical methods (save/load, Static):
	%  save - saves BRAPH2 panel property logical as b2 file
	%  load - loads a BRAPH2 panel property logical from a b2 file
	%
	% PanelPropLogical method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel property logical
	%
	% PanelPropLogical method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel property logical
	%
	% PanelPropLogical methods (inspection, Static):
	%  getClass - returns the class of the panel property logical
	%  getSubclasses - returns all subclasses of PanelPropLogical
	%  getProps - returns the property list of the panel property logical
	%  getPropNumber - returns the property number of the panel property logical
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
	% PanelPropLogical methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% PanelPropLogical methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% PanelPropLogical methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% PanelPropLogical methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?PanelPropLogical; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">PanelPropLogical constants</a>.
	%
	%
	% See also uicheckbox, GUI, PanelElement.
	
	properties (Constant) % properties
		CHECKBOX = 34; %CET: Computational Efficiency Trick
		CHECKBOX_TAG = 'CHECKBOX';
		CHECKBOX_CATEGORY = 7;
		CHECKBOX_FORMAT = 18;
	end
	methods % constructor
		function pr = PanelPropLogical(varargin)
			%PanelPropLogical() creates a panel property logical.
			%
			% PanelPropLogical(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% PanelPropLogical(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of PanelPropLogical properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the logical property panel.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the logical property panel.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the logical property panel.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the logical property panel.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the logical property panel.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the logical property panel.
			%  <strong>7</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>8</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>9</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the property panel.
			%  <strong>10</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>11</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>12</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>13</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>14</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
			%  <strong>15</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
			%  <strong>16</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
			%  <strong>17</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
			%  <strong>18</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the property panel.
			%  <strong>19</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the checkbox.
			%  <strong>20</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
			%  <strong>21</strong> <strong>EL</strong> 	EL (data, item) is the element.
			%  <strong>22</strong> <strong>PROP</strong> 	PROP (data, scalar) is the property number.
			%  <strong>23</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the property panel.
			%  <strong>24</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
			%  <strong>25</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
			%  <strong>26</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
			%  <strong>27</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
			%  <strong>28</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
			%  <strong>29</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>30</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>31</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
			%  <strong>32</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
			%  <strong>33</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
			%  <strong>34</strong> <strong>CHECKBOX</strong> 	CHECKBOX (evanescent, handle) is the logical value checkbox.
			%
			% See also Category, Format.
			
			pr = pr@PanelProp(varargin{:});
		end
	end
	methods (Static) % inspection
		function pr_class = getClass()
			%GETCLASS returns the class of the panel property logical.
			%
			% CLASS = PanelPropLogical.GETCLASS() returns the class 'PanelPropLogical'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PR.GETCLASS() returns the class of the panel property logical PR.
			%  CLASS = Element.GETCLASS(PR) returns the class of 'PR'.
			%  CLASS = Element.GETCLASS('PanelPropLogical') returns 'PanelPropLogical'.
			%
			% Note that the Element.GETCLASS(PR) and Element.GETCLASS('PanelPropLogical')
			%  are less computationally efficient.
			
			pr_class = 'PanelPropLogical';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel property logical.
			%
			% LIST = PanelPropLogical.GETSUBCLASSES() returns all subclasses of 'PanelPropLogical'.
			%
			% Alternative forms to call this method are:
			%  LIST = PR.GETSUBCLASSES() returns all subclasses of the panel property logical PR.
			%  LIST = Element.GETSUBCLASSES(PR) returns all subclasses of 'PR'.
			%  LIST = Element.GETSUBCLASSES('PanelPropLogical') returns all subclasses of 'PanelPropLogical'.
			%
			% Note that the Element.GETSUBCLASSES(PR) and Element.GETSUBCLASSES('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'PanelPropLogical' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel property logical.
			%
			% PROPS = PanelPropLogical.GETPROPS() returns the property list of panel property logical
			%  as a row vector.
			%
			% PROPS = PanelPropLogical.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PR.GETPROPS([CATEGORY]) returns the property list of the panel property logical PR.
			%  PROPS = Element.GETPROPS(PR[, CATEGORY]) returns the property list of 'PR'.
			%  PROPS = Element.GETPROPS('PanelPropLogical'[, CATEGORY]) returns the property list of 'PanelPropLogical'.
			%
			% Note that the Element.GETPROPS(PR) and Element.GETPROPS('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34];
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
					prop_list = [4 21 22 27];
				case 6 % Category.QUERY
					prop_list = [9 10 14 15 16 17 18 19 20];
				case 7 % Category.EVANESCENT
					prop_list = [8 13 25 26 28 29 30 31 32 33 34];
				case 8 % Category.FIGURE
					prop_list = 12;
				case 9 % Category.GUI
					prop_list = [7 11 23 24];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel property logical.
			%
			% N = PanelPropLogical.GETPROPNUMBER() returns the property number of panel property logical.
			%
			% N = PanelPropLogical.GETPROPNUMBER(CATEGORY) returns the property number of panel property logical
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PR.GETPROPNUMBER([CATEGORY]) returns the property number of the panel property logical PR.
			%  N = Element.GETPROPNUMBER(PR) returns the property number of 'PR'.
			%  N = Element.GETPROPNUMBER('PanelPropLogical') returns the property number of 'PanelPropLogical'.
			%
			% Note that the Element.GETPROPNUMBER(PR) and Element.GETPROPNUMBER('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 34;
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
					prop_number = 9;
				case 7 % Category.EVANESCENT
					prop_number = 11;
				case 8 % Category.FIGURE
					prop_number = 1;
				case 9 % Category.GUI
					prop_number = 4;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel property logical/error.
			%
			% CHECK = PanelPropLogical.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSPROP(PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(PR, PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(PanelPropLogical, PROP) checks whether PROP exists for PanelPropLogical.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSPROP(PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%  Element.EXISTSPROP(PR, PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%  Element.EXISTSPROP(PanelPropLogical, PROP) throws error if PROP does NOT exist for PanelPropLogical.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PR) and Element.EXISTSPROP('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 34 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for PanelPropLogical.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel property logical/error.
			%
			% CHECK = PanelPropLogical.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSTAG(TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(PR, TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(PanelPropLogical, TAG) checks whether TAG exists for PanelPropLogical.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSTAG(TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%  Element.EXISTSTAG(PR, TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%  Element.EXISTSTAG(PanelPropLogical, TAG) throws error if TAG does NOT exist for PanelPropLogical.
			%   Error id: [BRAPH2:PanelPropLogical:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PR) and Element.EXISTSTAG('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'CHECKBOX' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for PanelPropLogical.'] ...
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
			%  PROPERTY = Element.GETPROPPROP(PanelPropLogical, POINTER) returns property number of POINTER of PanelPropLogical.
			%  PROPERTY = PR.GETPROPPROP(PanelPropLogical, POINTER) returns property number of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPPROP(PR) and Element.GETPROPPROP('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'CHECKBOX' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = Element.GETPROPTAG(PanelPropLogical, POINTER) returns tag of POINTER of PanelPropLogical.
			%  TAG = PR.GETPROPTAG(PanelPropLogical, POINTER) returns tag of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPTAG(PR) and Element.GETPROPTAG('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				panelproplogical_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'CHECKBOX' };
				tag = panelproplogical_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = Element.GETPROPCATEGORY(PanelPropLogical, POINTER) returns category of POINTER of PanelPropLogical.
			%  CATEGORY = PR.GETPROPCATEGORY(PanelPropLogical, POINTER) returns category of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPCATEGORY(PR) and Element.GETPROPCATEGORY('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelproplogical_category_list = { 1  1  3  4  2  2  9  7  6  6  9  8  7  6  6  6  6  6  6  6  4  4  9  9  7  7  4  7  7  7  7  7  7  7 };
			prop_category = panelproplogical_category_list{prop};
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
			%  FORMAT = Element.GETPROPFORMAT(PanelPropLogical, POINTER) returns format of POINTER of PanelPropLogical.
			%  FORMAT = PR.GETPROPFORMAT(PanelPropLogical, POINTER) returns format of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPFORMAT(PR) and Element.GETPROPFORMAT('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelproplogical_format_list = { 2  2  8  2  2  2  4  18  4  4  8  20  18  4  4  4  4  4  4  4  8  11  22  2  18  18  8  18  18  18  19  19  19  18 };
			prop_format = panelproplogical_format_list{prop};
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
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(PanelPropLogical, POINTER) returns description of POINTER of PanelPropLogical.
			%  DESCRIPTION = PR.GETPROPDESCRIPTION(PanelPropLogical, POINTER) returns description of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPDESCRIPTION(PR) and Element.GETPROPDESCRIPTION('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			panelproplogical_description_list = { 'NAME (constant, string) is the name of the logical property panel.'  'DESCRIPTION (constant, string) is the description of the logical property panel.'  'TEMPLATE (parameter, item) is the template of the logical property panel.'  'ID (data, string) is a few-letter code for the logical property panel.'  'LABEL (metadata, string) is an extended label of the logical property panel.'  'NOTES (metadata, string) are some specific notes about the logical property panel.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the property panel.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.'  'HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.'  'DELETE (query, logical) resets the handles when the panel is deleted.'  'CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.'  'X_DRAW (query, logical) draws the property panel.'  'UPDATE (query, logical) updates the content and permissions of the checkbox.'  'REDRAW (query, logical) resizes the property panel and repositions its graphical objects.'  'EL (data, item) is the element.'  'PROP (data, scalar) is the property number.'  'HEIGHT (gui, size) is the pixel height of the property panel.'  'TITLE (gui, string) is the property title.'  'LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.'  'BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].'  'GUI_CB (data, item) is the handle to the item figure.'  'LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.'  'BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].'  'BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].'  'LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.'  'LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.'  'LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.'  'CHECKBOX (evanescent, handle) is the logical value checkbox.' };
			prop_description = panelproplogical_description_list{prop};
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
			%  SETTINGS = Element.GETPROPSETTINGS(PanelPropLogical, POINTER) returns settings of POINTER of PanelPropLogical.
			%  SETTINGS = PR.GETPROPSETTINGS(PanelPropLogical, POINTER) returns settings of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPSETTINGS(PR) and Element.GETPROPSETTINGS('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 34 % PanelPropLogical.CHECKBOX
					prop_settings = Format.getFormatSettings(18);
				case 3 % PanelPropLogical.TEMPLATE
					prop_settings = 'PanelPropLogical';
				otherwise
					prop_settings = getPropSettings@PanelProp(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = PanelPropLogical.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = PanelPropLogical.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULT(PanelPropLogical, POINTER) returns the default value of POINTER of PanelPropLogical.
			%  DEFAULT = PR.GETPROPDEFAULT(PanelPropLogical, POINTER) returns the default value of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPDEFAULT(PR) and Element.GETPROPDEFAULT('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 34 % PanelPropLogical.CHECKBOX
					prop_default = Format.getFormatDefault(18, PanelPropLogical.getPropSettings(prop));
				case 1 % PanelPropLogical.NAME
					prop_default = 'PanelPropLogical';
				case 2 % PanelPropLogical.DESCRIPTION
					prop_default = 'PanelPropLogical plots the panel for a LOGICAL property with a checkbox. It works for all categories.';
				case 3 % PanelPropLogical.TEMPLATE
					prop_default = Format.getFormatDefault(8, PanelPropLogical.getPropSettings(prop));
				case 4 % PanelPropLogical.ID
					prop_default = 'PanelPropLogical ID';
				case 5 % PanelPropLogical.LABEL
					prop_default = 'PanelPropLogical label';
				case 6 % PanelPropLogical.NOTES
					prop_default = 'PanelPropLogical notes';
				case 21 % PanelPropLogical.EL
					prop_default = PanelProp();
				case 22 % PanelPropLogical.PROP
					prop_default = 9;
				case 23 % PanelPropLogical.HEIGHT
					prop_default = 48;
				otherwise
					prop_default = getPropDefault@PanelProp(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = PanelPropLogical.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = PanelPropLogical.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(PanelPropLogical, POINTER) returns the conditioned default value of POINTER of PanelPropLogical.
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(PanelPropLogical, POINTER) returns the conditioned default value of POINTER of PanelPropLogical.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PR) and Element.GETPROPDEFAULTCONDITIONED('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			prop_default = PanelPropLogical.conditioning(prop, PanelPropLogical.getPropDefault(prop));
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
			%  CHECK = Element.CHECKPROP(PanelPropLogical, PROP, VALUE) checks VALUE format for PROP of PanelPropLogical.
			%  CHECK = PR.CHECKPROP(PanelPropLogical, PROP, VALUE) checks VALUE format for PROP of PanelPropLogical.
			% 
			% PR.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:PanelPropLogical:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PR.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PR.
			%   Error id: BRAPH2:PanelPropLogical:WrongInput
			%  Element.CHECKPROP(PanelPropLogical, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PanelPropLogical.
			%   Error id: BRAPH2:PanelPropLogical:WrongInput
			%  PR.CHECKPROP(PanelPropLogical, PROP, VALUE) throws error if VALUE has not a valid format for PROP of PanelPropLogical.
			%   Error id: BRAPH2:PanelPropLogical:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PR) and Element.CHECKPROP('PanelPropLogical')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = PanelPropLogical.getPropProp(pointer);
			
			switch prop
				case 34 % PanelPropLogical.CHECKBOX
					check = Format.checkFormat(18, value, PanelPropLogical.getPropSettings(prop));
				case 3 % PanelPropLogical.TEMPLATE
					check = Format.checkFormat(8, value, PanelPropLogical.getPropSettings(prop));
				otherwise
					if prop <= 33
						check = checkProp@PanelProp(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput'], ...
					['BRAPH2' ':PanelPropLogical:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' PanelPropLogical.getPropTag(prop) ' (' PanelPropLogical.getFormatTag(PanelPropLogical.getPropFormat(prop)) ').'] ...
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
				case 34 % PanelPropLogical.CHECKBOX
					el = pr.get('EL');
					prop = pr.get('PROP');
					
					checkbox = uicheckbox( ...
					    'Parent', pr.memorize('H'), ... % H = p for Panel
					    'Tag', 'CHECKBOX', ...
					    'Text', '', ...
					    'FontSize', 12, ...
					    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
					    'ValueChangedFcn', {@cb_checkbox} ...
					    );
					
					value = checkbox;
					
				case 18 % PanelPropLogical.X_DRAW
					value = calculateValue@PanelProp(pr, 18, varargin{:}); % also warning
					if value
					    pr.memorize('CHECKBOX')
					end
					
				case 19 % PanelPropLogical.UPDATE
					value = calculateValue@PanelProp(pr, 19, varargin{:}); % also warning
					if value
					
					    el = pr.get('EL');
					    prop = pr.get('PROP');
					    
					    switch el.getPropCategory(prop)
					        case 1
					            set(pr.get('CHECKBOX'), ...
					                'Value', el.get(prop), ...
					                'Enable', 'off' ...
					                )
					
					        case 2
					            set(pr.get('CHECKBOX'), 'Value', el.get(prop))
					
					            if el.isLocked(prop)
					                set(pr.get('CHECKBOX'), 'Enable', 'off')
					            end
					            
					        case {3, 4, 8, 9}
					            set(pr.get('CHECKBOX'), 'Value', el.get(prop))
					
					            prop_value = el.getr(prop);
					            if el.isLocked(prop) || isa(prop_value, 'Callback')
					                set(pr.get('CHECKBOX'), 'Enable', 'off')
					            end
					            
					        case {5 6 7}
					            prop_value = el.getr(prop);
					
					            if isa(prop_value, 'NoValue')
					                set(pr.get('CHECKBOX'), 'Value', el.getPropDefault(prop))
					            else
					                set(pr.get('CHECKBOX'), 'Value', el.get(prop))
					            end
					            
					            set(pr.get('CHECKBOX'), 'Enable', 'off')
					    end
					end
					
				case 20 % PanelPropLogical.REDRAW
					value = calculateValue@PanelProp(pr, 20, varargin{:}); % also warning
					if value
					    w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
					    
					    set(pr.get('CHECKBOX'), 'Position', [4 4 .70*w_p 21])
					end
					
				case 16 % PanelPropLogical.DELETE
					value = calculateValue@PanelProp(pr, 16, varargin{:}); % also warning
					if value
					    pr.set('CHECKBOX', Element.getNoValue())
					end
					
				otherwise
					if prop <= 33
						value = calculateValue@PanelProp(pr, prop, varargin{:});
					else
						value = calculateValue@Element(pr, prop, varargin{:});
					end
			end
			
			function cb_checkbox(~, ~)
			    pr.get('EL').set(pr.get('PROP'), logical(get(pr.get('CHECKBOX'), 'Value')))
			end
		end
	end
end
