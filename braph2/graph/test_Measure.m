% test Measure
measure_class_list = Measure.getList();

%% Test 1: All measures not abstract
for i = 1:1:length(measure_class_list)
    measure_class = measure_class_list{i};

    graph_class_list = Measure.getCompatibleGraphList(measure_class);
    for j = 1:1:length(graph_class_list)
        graph_class = graph_class_list{j};
        g = Graph.getGraph(graph_class, []);
        m = Measure.getMeasure(measure_class, g);
        value = m.getValue();
        if m.is_superglobal(m)
            assert(iscell(value) && numel(value) == 1, ...
                [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
                [measure_class '.getValue() used with ' graph_class ' should return a cell'])
        end
        if m.is_unilayer(m)
            assert(iscell(value) && isequal(size(value), [g.layernumber() 1]), ...
                [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
                [measure_class '.getValue() used with ' graph_class ' should return a cell column vector with length equal to the number of layers'])
        end
        if m.is_bilayer(m)
            assert(iscell(value) && isequal(size(value), [g.layernumber() g.layernumber()]), ...
                [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
                [measure_class '.getValue() used with ' graph_class ' should return a matrix with dimensions equal to the number of layers'])
        end
    end
end

%% Test 2: Implementation static methods
for i = 1:1:length(measure_class_list)
    measure_class = measure_class_list{i};
    
    graph_class_list = Measure.getCompatibleGraphList(measure_class);
    for j = 1:1:length(graph_class_list)
        graph_class = graph_class_list{j};
        A = rand(randi(10));
        g = Graph.getGraph(graph_class, []);
        m = Measure.getMeasure(measure_class, g);
        
        assert(isequal(m.getClass(), measure_class), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getClass() used with ' graph_class ' should return ''' measure_class ''''])
        
        assert(ischar(m.getClass()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getClass() used with ' graph_class ' should return a char array'])
        
        assert(ischar(m.getName()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getName() used with ' graph_class ' should return a char array'])
        
        assert(ischar(m.getDescription()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getDescription() used with ' graph_class ' should return a char array'])
        
        assert(isnumeric(m.getMeasureFormat()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            'Graph.getMeasureFormat() should return a number')
        
        assert(islogical(m.is_global(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_global() used with ' graph_class ' should return a logical'])
        
        assert(islogical(m.is_nodal(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_nodal() used with ' graph_class ' should return a logical'])
        
        assert(islogical(m.is_binodal(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_nodal() used with ' graph_class ' should return a logical'])

        assert(isnumeric(m.getMeasureScope()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            'Graph.getMeasureScope() should return a number')
         
        assert(islogical(m.is_superglobal(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_superglobal() used with ' graph_class ' should return a logical'])
        
        assert(islogical(m.is_unilayer(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_unilayer() used with ' graph_class ' should return a logical'])
        
        assert(islogical(m.is_bilayer(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_bilayer() used with ' graph_class ' should return a logical'])
        
        assert(isnumeric(m.getParametricity()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            'Graph.getParametricity() should return a number')
         
        assert(islogical(m.is_parametric(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_parametric() used with ' graph_class ' should return a logical'])
        
        assert(islogical(m.is_nonparametric(m)), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_nonparametric() used with ' graph_class ' should return a logical'])
        
        assert(iscell(m.getCompatibleGraphList()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getCompatibleGraphList() used with ' graph_class ' should return a cell array'])

        assert(isnumeric(m.getCompatibleGraphNumber()), ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.getCompatibleGraphNumber() used with ' graph_class ' should return a number'])
    end

end

%% Test 3: Either global or nodal or binodal
for i = 1:1:length(measure_class_list)
    measure_class = measure_class_list{i};
    
        assert(Measure.is_global(measure_class) + ...
            Measure.is_nodal(measure_class) + ...
            Measure.is_binodal(measure_class) == 1, ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_global() + ' ...
            measure_class '.is_nodal() + ' ...
            measure_class '.is_binodal() ~= 1'])
end

%% Test 4: Either superglobal or unilayer or bilayer
for i = 1:1:length(measure_class_list)
    measure_class = measure_class_list{i};
    
        assert(Measure.is_superglobal(measure_class) + ...
            Measure.is_unilayer(measure_class) + ...
            Measure.is_bilayer(measure_class) == 1, ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_superglobal() + ' ...
            measure_class '.is_unilayer() + ' ...
            measure_class '.is_bilayer() ~= 1'])
end

%% Test 5: Either parametric or non-parametric
for i = 1:1:length(measure_class_list)
    measure_class = measure_class_list{i};
    
        assert(Measure.is_parametric(measure_class) + ...
            Measure.is_nonparametric(measure_class) == 1, ...
            [BRAPH2.STR ':' measure_class ':' BRAPH2.WRONG_OUTPUT], ...
            [measure_class '.is_parametric() + ' ...
            measure_class '.is_nonparametric() ~= 1'])
end