% test RandomComparison

randomComparison_class_list =  RandomComparison.getList();

br1 = BrainRegion('BR1', 'brain region 1', 'notes 1', 1, 1.1, 1.11);
br2 = BrainRegion('BR2', 'brain region 2', 'notes 2', 2, 2.2, 2.22);
br3 = BrainRegion('BR3', 'brain region 3', 'notes 3', 3, 3.3, 3.33);
br4 = BrainRegion('BR4', 'brain region 4', 'notes 4', 4, 4.4, 4.44);
br5 = BrainRegion('BR5', 'brain region 5', 'notes 5', 5, 5.5, 5.55);
atlas = BrainAtlas('BA', 'brain atlas', 'notes', 'BrainMesh_ICBM152.nv', {br1, br2, br3, br4, br5});

%% Test 1 Instantiation
for i = 1:1:length(randomComparison_class_list)
    % setup
    randomComparison_class = randomComparison_class_list{i};
    subject_class = RandomComparison.getSubjectClass(randomComparison_class);

    atlases = repmat({atlas}, 1, Subject.getBrainAtlasNumber(subject_class));

    sub1 = Subject.getSubject(subject_class, 'id1', 'label 1', 'notes 1', atlases);
    sub2 = Subject.getSubject(subject_class, 'id2', 'label 2', 'notes 2', atlases);
    sub3 = Subject.getSubject(subject_class, 'id3', 'label 3', 'notes 3', atlases);

    group = Group(subject_class, 'id', 'label', 'notes', {sub1, sub2, sub3});
    
    % act
    randomcomparison = RandomComparison.getRandomComparison(randomComparison_class, ...
        'rc1', ...
        'random comparison label', ...
        'random comparison notes', ...
        atlas, ...
        'Degree', ...
        group, ...
        'setting name', 'setting value');
    
    % assert
    assert(~isempty(randomcomparison), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class ' instantiation fail.'])
    
end

%% Test 2: Static Functions
for i = 1:1:length(randomComparison_class_list)
    
    % setup
    randomComparison_class = randomComparison_class_list{i};
    subject_class = RandomComparison.getSubjectClass(randomComparison_class);
    
    atlases = repmat({atlas}, 1, Subject.getBrainAtlasNumber(subject_class));

    sub1 = Subject.getSubject(subject_class, 'id1', 'label 1', 'notes 1', atlases);
    sub2 = Subject.getSubject(subject_class, 'id2', 'label 2', 'notes 2', atlases);
    sub3 = Subject.getSubject(subject_class, 'id3', 'label 3', 'notes 3', atlases);

    group = Group(subject_class, 'id', 'label', 'notes', {sub1, sub2, sub3});

    % act
    randomcomparison = RandomComparison.getRandomComparison(randomComparison_class, ...
        'rc1', ...
        'random comparison label', ...
        'random comparison notes', ...
        atlas, ...
        'Degree', ...
        group, ...
        'setting name', 'setting value');
    
    % assert
    assert(isequal(randomcomparison.getClass(), randomComparison_class), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class '.getClass() fail.']) 
    assert(ischar(randomcomparison.getName()), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class '.getName() fail.']) 
    assert(ischar(randomcomparison.getDescription()), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class ' .getDescription() fail.']) 
    assert(~isempty(randomcomparison.getBrainAtlasNumber()), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class '.getBrainAtlasNumber() fail.'])
    assert(ischar(randomcomparison.getAnalysisClass()), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class '.getAnalysisClass() fail.'])
    assert(ischar(randomcomparison.getSubjectClass()), ...
        [BRAPH2.STR ':' randomComparison_class ':' BRAPH2.BUG_FUNC], ...
        [randomComparison_class '.getSubjectClass() fail.'])
end