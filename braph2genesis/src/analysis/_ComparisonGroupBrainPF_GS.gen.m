%% ¡header!
ComparisonGroupBrainPF_GS < ComparisonGroupBrainPF (pf, panel global superglobal group comparison on brain surface figure) is the base element to plot a global superglobal group comparison on brain surface figure.

%%% ¡description!
ComparisonGroupBrainPF_GS manages the  % % % .

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupBrainPF_GS.ST_AXIS
%%%% ¡title!
AXIS

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS manages the basic functionalities to plot of a global superglobal group comparison on brain surface figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡settings!
'ComparisonGroupBrainPF_GS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure global superglobal group comparison on brain surface figure.
%%%% ¡default!
'ComparisonGroupBrainPF_GS notes'

%%% ¡prop!
DRAW (query, logical) draws the figure brain atlas.
%%%% ¡calculate!
value = calculateValue@ComparisonGroupBrainPF(pf, ComparisonGroupBrainPF.DRAW, varargin{:}); % also warning
if value
    % reset the ambient lighting
    pf.get('ST_AMBIENT').get('SETUP')

    % call setup
    pf.get('SETUP');
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
%%%% ¡calculate!
value = calculateValue@ComparisonGroupBrainPF(pf, ComparisonGroupBrainPF.DELETE, varargin{:}); % also warning
if value

end

%%% ¡prop!
SETUP (query, empty) calculates the group comparison on brain surface figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];


%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupBrainPF_GS.PARENT ComparisonGroupBrainPF_GS.H ComparisonGroupBrainPF_GS.ST_POSITION ComparisonGroupBrainPF_GS.ST_AXIS ComparisonGroupBrainPF_GS.ST_SURFACE ComparisonGroupBrainPF_GS.ST_AMBIENT ComparisonGroupBrainPF_GS.CP] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupBrainPF_GS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupBrainPF_GS'])
