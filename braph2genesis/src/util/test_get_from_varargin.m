%TEST_GET_FROM_VARARGIN

%% Test 1: Empty
value = 0;
handle = 'Value';
varargin = {};
assert(isequal(get_from_varargin(value, handle, varargin{:}), value), ...
    [BRAPH2.STR ':get_from_varargin:' BRAPH2.BUG_FUNC], ...
    'Error with empty varargin.')

%% Test 2: Full
value = 0;
handle = 'Value';
varargin = {'Handle2', 'none', 'Value', 1, 'Handle 3', 'none'};
assert(isequal(get_from_varargin(value, handle, varargin{:}), 1), ...
    [BRAPH2.STR ':get_from_varargin:' BRAPH2.BUG_FUNC], ...
    'Error with full varargin.')
assert(isequal(get_from_varargin(value, handle, varargin), 1), ...
    [BRAPH2.STR ':get_from_varargin:' BRAPH2.BUG_FUNC], ...
    'Error with full varargin.')