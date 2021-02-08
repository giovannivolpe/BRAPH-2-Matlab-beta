%% ¡header!
PlotBrainAtlas < PlotBrainSurface (pl, plot brain atlas) is a plot of a brain atlas.

%%% ¡description!
PlotBrainAtlas manages the plot of the brain regions symbols,
spheres, ids and labels. PlotBrainAtlas utilizes the surface created
from PlotBrainSurface to integrate the regions to a brain surface.

%%% ¡seealso!
Plot, BrainSurface, PlotBrainSurface

%% ¡constants!
PLOT_SYMBOL_NAME = { ...
    'point' ...
    'circle' ...
    'x-mark' ...
    'plus' ...
    'star' ...
    'square' ...
    'diamond' ...
    'triangle (down)' ...
    'triangle (up)' ...
    'triangle (left)' ...
    'triangle (right)' ...
    'pentagram' ...
    'hexagram' ...
    'none' ...
    }

PLOT_SYMBOL_TAG = { ...
    '.' ...
    'o' ...
    'x' ...
    '+' ...
    '*' ...
    's' ...
    'd' ...
    'v' ...
    '^' ...
    '>' ...
    '<' ...
    'p' ...
    'h' ...
    'none' ...
    }

%% ¡properties!
symbols % handle for the symbols structure

%% ¡props!

%%% ¡prop!
ATLAS (metadata, item) is the brain atlas with the brain regions
%%%% ¡settings!
'BrainAtlas'

%%% ¡prop!
SYMS (metadata, rvector) is symbol visibility.
%%%% ¡check_value!
check = length(value) == 1 || length(value) == pl.get('ATLAS').get('BR_DICT').length();
%%%% ¡default!
1

%%% ¡prop!
SYMS_SIZE (metadata, rvector) is the symbol size.
%%%% ¡conditioning!
value = abs(value);
%%%% ¡check_value!
check = length(value) == 1 || length(value) == pl.get('ATLAS').get('BR_DICT').length();
%%%% ¡default!
10

%%% ¡prop!
SYMS_MARKER (metadata, option) is the symbol option.
%%%% ¡settings!
{'.' 'o' 'x' '+' '*' 's' 'd' 'v' '^' '>' '<' 'p' 'h' 'none'}
%%%% ¡default!
'o'

%%% ¡prop!
SYMS_FACE_COLOR (metadata, cell) is the symbol face color.
%%%% ¡check_value!
check = size(value, 1) == 1 || size(value, 1) == pl.get('ATLAS').get('BR_DICT').length();
%%%% ¡default!
{[0 0 0]}

%%% ¡prop!
SYMS_EDGE_COLOR (metadata, cell) is the symbol edge color.
%%%% ¡check_value!
check = size(value, 1) == 1 || size(value, 1) == pl.get('ATLAS').get('BR_DICT').length();
%%%% ¡default!
{[0 0 0]} 

%% ¡methods!
function h_panel = draw(pl, varargin)
    %DRAW draws the brain surface graphical panel.
    %
    % DRAW(PL) draws the brain surface graphical panel.
    %
    % H = DRAW(PL) returns a handle to the brain surface graphical panel.
    %
    % DRAW(PL, 'Property', VALUE, ...) sets the properties of the graphical
    %  panel with custom property-value couples.
    %  All standard plot properties of uipanel can be used.
    %
    % It is possible to access the properties of the various graphical
    %  objects from the handle to the brain surface graphical panel H.
    %
    % see also settings, uipanel, isgraphics.
   
    h = draw@PlotBrainSurface(pl, varargin{:});
    
    % initialization
    if isempty(pl.symbols)
        pl.symbols = cell(1, pl.get('ATLAS').get('BR_DICT').length);
    end
    
    X = cellfun(@(x) x.get('X'), pl.get('ATLAS').get('BR_DICT').get('IT_LIST'), 'UniformOutput', false);
    Y = cellfun(@(x) x.get('Y'), pl.get('ATLAS').get('BR_DICT').get('IT_LIST'), 'UniformOutput', false);
    Z = cellfun(@(x) x.get('Z'), pl.get('ATLAS').get('BR_DICT').get('IT_LIST'), 'UniformOutput', false);
    
    SYM_SIZE = pl.get('syms_size');
    SYM_SHOW = pl.get('syms');
    SYM_FACE_COLOR = pl.get('syms_face_color');
    SYM_EDGE_COLOR = pl.get('syms_edge_color');
    if length(SYM_SIZE) == 1
        SYM_SIZE = repmat(SYM_SIZE, 1, pl.get('ATLAS').get('BR_DICT').length);
    end
    if length(SYM_SHOW) == 1
        SYM_SHOW = repmat(SYM_SHOW, 1, pl.get('ATLAS').get('BR_DICT').length);
    end
    if length(SYM_FACE_COLOR) == 1
        sym_hold = SYM_FACE_COLOR{1};
        SYM_FACE_COLOR = cell(1, pl.get('ATLAS').get('BR_DICT').length);
        SYM_FACE_COLOR(:) = {sym_hold};
    end
    if length(SYM_EDGE_COLOR) == 1
        sym_hold = SYM_EDGE_COLOR{1};
        SYM_EDGE_COLOR = cell(1, pl.get('ATLAS').get('BR_DICT').length);
        SYM_EDGE_COLOR(:) = {sym_hold};
    end
    
    for i = 1:1:pl.get('ATLAS').get('BR_DICT').length
        
        if ~ishandle(pl.symbols(i))
            pl.symbols{i} = plot3(X{i}, Y{i}, Z{i}, ...
                'Marker', pl.get('syms_marker'));
        end
        set(pl.symbols{i}, ...
            'MarkerSize', SYM_SIZE(i), ...
            'MarkerFaceColor', cell2mat(SYM_FACE_COLOR(i)), ...
            'MarkerEdgeColor', cell2mat(SYM_EDGE_COLOR(i)) ...
            );
        
        if SYM_SHOW(i)
            set(pl.symbols{i}, ...
                'Visible', 'on');
        else
            set(pl.symbols{i}, ...
                'Visible', 'off');
        end
    end
    
    % output
    if nargout > 0
        h_panel = h;
    end
end

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Plot
%%%% ¡code!
fig = figure();
br1 = BrainRegion('ID', 'BR ID1', 'Label', 'brain region label 1', 'Notes', 'brain region notes 1', 'x', 1, 'y', 10, 'z', 11);
br2 = BrainRegion('ID', 'BR ID2', 'Label', 'brain region label 2', 'Notes', 'brain region notes 2', 'x', 2, 'y', 20, 'z', 22);
br3 = BrainRegion('ID', 'BR ID3', 'Label', 'brain region label 3', 'Notes', 'brain region notes 3', 'x', 3, 'y', 30, 'z', 33);
br4 = BrainRegion('ID', 'BR ID4', 'Label', 'brain region label 4', 'Notes', 'brain region notes 4', 'x', 4, 'y', 40, 'z', 44);
br5 = BrainRegion('ID', 'BR ID5', 'Label', 'brain region label 5', 'Notes', 'brain region notes 5', 'x', 5, 'y', 50, 'z', 55);

bs = BrainSurface('ID', 'Human_Cerebellum.nv');
br_dict =  IndexedDictionary( ...
    'id', 'idict', ...
    'it_class', 'BrainRegion', ...
    'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
    'it_list', {br1, br2, br3, br4, br5});
atlas = BrainAtlas('ID', 'BA ID', 'Label', 'Brain Atlas Label', 'Notes', 'Brain atlas notes', 'SURF', bs, 'BR_DICT', br_dict);
pl = PlotBrainAtlas('atlas', atlas, ...
    'syms', 1, 'SYMS_SIZE', [20:10:60], ...
    'SYMS_FACE_COLOR', {[0 0 0]}, 'SYMS_EDGE_COLOR', {[0 0 0]}, ...
    'SURF', ImporterBrainSurfaceNV('FILE', 'human_ICBM152.nv').get('SURF'));
pl.draw()

close(fig)