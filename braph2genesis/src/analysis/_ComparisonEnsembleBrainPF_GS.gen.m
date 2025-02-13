%% ¡header!
ComparisonEnsembleBrainPF_GS < ComparisonEnsembleBrainPF (pf, panel global superglobal ensemble-based comparison figure on brain surface figure) is the base element to plot a global superglobal ensemble-based comparison figure on brain surface figure.

%%% ¡description!
ComparisonEnsembleBrainPF_GS manages the basic functionalities to plot of a global superglobal ensemble-based comparison figure on brain surface figure.

%%% ¡seealso!
ComparisonEnsemble

%% ¡props_update!

%%% ¡prop!
ELCLASS (constant, string) is the class of the % % % .
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS'

%%% ¡prop!
NAME (constant, string) is the name of the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS manages the basic functionalities to plot of a global superglobal ensemble-based comparison figure on brain surface.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡settings!
'ComparisonEnsembleBrainPF_GS'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure global superglobal ensemble-based comparison figure on brain surface.
%%%% ¡default!
'ComparisonEnsembleBrainPF_GS notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODES (figure, rvector) are the node numbers of the global group comparison figure on brain surface.
%%%% ¡_gui!
% % % bas = pf.get('M').get('G').get('BAS');
% % % ba = bas{1};
% % % 
% % % pr = PP_BrainRegion('EL', pf, 'PROP', PFMeasureNU.BR1_ID, ...
% % %     'BA', ba, ...
% % %     varargin{:});

%% ¡tests!binodal

%%% ¡excluded_props!
[ComparisonEnsembleBrainPF_GS.PARENT ComparisonEnsembleBrainPF_GS.H ComparisonEnsembleBrainPF_GS.ST_POSITION ComparisonEnsembleBrainPF_GS.ST_AXIS ComparisonEnsembleBrainPF_GS.ST_AREA ComparisonEnsembleBrainPF_GS.ST_LINE_DIFF ComparisonEnsembleBrainPF_GS.ST_LINE_CIL ComparisonEnsembleBrainPF_GS.ST_LINE_CIU ComparisonEnsembleBrainPF_GS.ST_TITLE ComparisonEnsembleBrainPF_GS.ST_XLABEL ComparisonEnsembleBrainPF_GS.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonEnsembleBrainPF_GS'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonEnsembleBrainPF_GS'])
