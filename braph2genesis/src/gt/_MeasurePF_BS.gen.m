%% ¡header!
MeasurePF_BS < MeasurePF (pf, panel figure for binodal superglobal measure) is the base element to plot a binodal superglobal measure.

%%% ¡description!
A Panel Figure for Binodal Superglobal Measure (MeasurePF_BS) manages the basic functionalities to plot of a binodal superglobal measure.

%%% ¡seealso!
Measure

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.NODES
%%%% ¡title!
NODES SELECTION

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_AREA
%%%% ¡title!
FILLED AREA

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_LINE
%%%% ¡title!
MEASURE LINE

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
MeasurePF_BS.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure for binodal superglobal measure.
%%%% ¡default!
'MeasurePF_BS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure for binodal superglobal measure.
%%%% ¡default!
'Panel Figure for Binodal Superglobal Measure'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure for binodal superglobal measure.
%%%% ¡default!
'A Panel Figure for Binodal Superglobal Measure (MeasurePF_BS) manages the basic functionalities to plot of a binodal superglobal measure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure for binodal superglobal measure.
%%%% ¡settings!
'MeasurePF_BS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure for binodal superglobal measure.
%%%% ¡default!
'MeasurePF_BS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure for binodal superglobal measure.
%%%% ¡default!
'MeasurePF_BS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure for binodal superglobal measure.
%%%% ¡default!
'MeasurePF_BS notes'

%%% ¡prop!
SETUP (query, empty) calculates the measure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the binodal measure.
%%%% ¡gui!
pr = MeasurePF_BxPP_Node('EL', pf, 'PROP', MeasurePF_BS.NODE);

%% ¡tests!

%%% ¡excluded_props!
[MeasurePF_BS.PARENT MeasurePF_BS.H MeasurePF_BS.ST_POSITION MeasurePF_BS.ST_AXIS MeasurePF_BS.ST_AREA MeasurePF_BS.ST_LINE MeasurePF_BS.ST_TITLE MeasurePF_BS.ST_XLABEL MeasurePF_BS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':MeasurePF_BS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':MeasurePF_BS'])
