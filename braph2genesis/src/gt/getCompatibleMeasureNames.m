function list = getCompatibleMeasureNames(g)
%GETCOMPATIBLEMEASURENAMES returns the list of measures.
%
% CELL ARRAY = GETCOMPATIBLEMEASURENAMES(G) returns a cell array with the
%  names of measures compatible with the concrete graph G.
%
% CELL ARRAY = GETCOMPATIBLEMEASURENAMES(GRAPH_CLASS) returns a cell array
%  with the names of measures compatible with  a graph whose class is
%  GRAPH_CLASS.
%
% See also Graph, Measure, getCompatibleMeasures.

list = cellfun(@(measure_code) eval([measure_code '().get(''NAME'')']), getCompatibleMeasures(g), 'UniformOutput', false);

end