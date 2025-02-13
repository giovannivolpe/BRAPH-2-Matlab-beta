function [target_dir, source_dir] = genesis(target_dir, source_dir, run_number, develop)
%GENESIS generates BRAPH2.
%
% [TARGET_DIR, SOURCE_DIR] = GENESIS() generates BRAPH2 from the default
%  SOURCE_DIR (the directory that contains braph2genesis) to the default
%  TARGET_DIR (the directory 'braph2' in the superdirectory of SOURCE_DIR).
%
% GENESIS(TARGET_DIR) generates BRAPH2 in TARGET_DIR from the default
%  SOURCE_DIR.
%
% GENESIS(TARGET_DIR, SOURCE_DIR) generates BRAPH2 in TARGET_DIR from
%  SOURCE_DIR.
%
% GENESIS(TARGET_DIR, SOURCE_DIR, RUN_NUMBER) runs the creation scripts
%  RUN_NUMBER times. RUN_NUMBER = 2 (default) improves the computational
%  efficiency of the code  mainly by hardcoding some intermediate values.
%
% GENESIS([], [], [], DEVELOP) determines whether to compile also the
%  development examples (by default it does NOT compile them).
%
% See also braph2genesis, create_Element, create_layout,
%  create_test_Element, hard_code_constants.

fp = filesep();

if nargin < 4
    develop = false;
end

if nargin < 3
    run_number = 1;
end

if nargin < 2 || isempty(source_dir)
    source_dir = fileparts(which('braph2genesis'));
end

if nargin < 1 || isempty(target_dir)
    target_dir = [fileparts(source_dir) fp 'braph2'];
end

disp('¡ BRAPH 2 Genesis')
disp(['¡ source dir: ' source_dir])
disp(['¡ target dir: ' target_dir])
disp(' ')

%% CREATE DIR STRUCTURE
% braph2
mkdir(target_dir)

disp('¡! created target dir')

% src
mkdir([target_dir fp 'src' fp 'util'])
mkdir([target_dir fp 'src' fp 'ds'])
mkdir([target_dir fp 'src' fp 'ds' fp 'examples'])
mkdir([target_dir fp 'src' fp 'atlas'])
mkdir([target_dir fp 'src' fp 'gt'])
mkdir([target_dir fp 'src' fp 'cohort'])
mkdir([target_dir fp 'src' fp 'analysis'])
mkdir([target_dir fp 'src' fp 'nn'])
mkdir([target_dir fp 'src' fp 'gui'])
mkdir([target_dir fp 'src' fp 'gui' fp 'layouts'])
mkdir([target_dir fp 'src' fp 'gui' fp 'examples'])

disp('¡! created dir structure - SRC')

% brainsurfs
mkdir([target_dir fp 'brainsurfs'])

disp('¡! created dir structure - BRAINSURFS')

% atlases
mkdir([target_dir fp 'atlases'])

disp('¡! created dir structure - ATLASES')

% graphs
mkdir([target_dir fp 'graphs'])

disp('¡! created dir structure - GRAPHS')

% measures
mkdir([target_dir fp 'measures'])

disp('¡! created dir structure - MEASURES')

% neural networks
mkdir([target_dir fp 'neuralnetworks'])

disp('¡! created dir structure - NEURALNETWORKS')

% pipelines
mkdir([target_dir fp 'pipelines'])

disp('¡! created dir structure - PIPELINES')

% test
mkdir([target_dir fp 'test'])

disp('¡! created dir structure - TEST')

disp(' ')

%% COPY READY FILES
% braph2.m and license.rtf
copyfile([source_dir fp '_braph2' fp 'braph2.m'], [target_dir fp 'braph2.m'])
copyfile([source_dir fp 'braph2license.rtf'], [target_dir fp 'braph2license.rtf'])
disp('¡! copied ready files - braph2')
disp(' ')

% src
copydir([source_dir fp 'src' fp 'util'], [target_dir fp 'src' fp 'util'])
disp('¡! copied ready files - src/util')
copydir([source_dir fp 'src' fp 'ds'], [target_dir fp 'src' fp 'ds'])
disp('¡! copied ready files - src/ds')
copydir([source_dir fp 'src' fp 'ds' fp 'examples'], [target_dir fp 'src' fp 'ds' fp 'examples'])
disp('¡! copied ready files - ds/examples')
copydir([source_dir fp 'src' fp 'atlas'], [target_dir fp 'src' fp 'atlas'])
disp('¡! copied ready files - src/atlas')
copydir([source_dir fp 'src' fp 'gt'], [target_dir fp 'src' fp 'gt'])
disp('¡! copied ready files - src/gt')
copydir([source_dir fp 'src' fp 'cohort'], [target_dir fp 'src' fp 'cohort'])
disp('¡! copied ready files - src/cohort')
copydir([source_dir fp 'src' fp 'analysis'], [target_dir fp 'src' fp 'analysis'])
disp('¡! copied ready files - src/analysis')
copydir([source_dir fp 'src' fp 'nn'], [target_dir fp 'src' fp 'nn'])
disp('¡! copied ready files - src/nn')
copydir([source_dir fp 'src' fp 'gui'], [target_dir fp 'src' fp 'gui'])
disp('¡! copied ready files - src/gui')
copydir([source_dir fp 'src' fp 'gui' fp 'layouts'], [target_dir fp 'src' fp 'gui' fp 'layouts'])
disp('¡! copied ready files - src/gui/layouts')
copydir([source_dir fp 'src' fp 'gui' fp 'examples'], [target_dir fp 'src' fp 'gui' fp 'examples'])
disp('¡! copied ready files - src/gui/examples')
disp(' ')

% brainsurfs
copydir([source_dir fp 'brainsurfs'], [target_dir fp 'brainsurfs'], Inf)
disp('¡! copied ready files - brainsurf')
disp(' ')

% atlases
copydir([source_dir fp 'atlases'], [target_dir fp 'atlases'], Inf)
disp('¡! copied ready files - atlases')
disp(' ')

% graphs
copydir([source_dir fp 'graphs'], [target_dir fp 'graphs'], Inf)
disp('¡! copied ready files - graphs')
disp(' ')

% measures
copydir([source_dir fp 'measures'], [target_dir fp 'measures'], Inf)
disp('¡! copied ready files - measures')
disp(' ')

% neuralnetworks
copydir([source_dir fp 'neuralnetworks'], [target_dir fp 'neuralnetworks'], Inf)
disp('¡! copied ready files - neuralnetworks')
disp(' ')

% pipelines
copydir([source_dir fp 'pipelines'], [target_dir fp 'pipelines'], Inf)
disp('¡! copied ready files - pipelines')
disp(' ')

% test
copydir([source_dir fp 'test'], [target_dir fp 'test'], Inf)
disp('¡! copied ready files - test')
disp(' ')

%% CREATE ELEMENTS
for run = 1:1:run_number

    disp(['¡! started run number ' int2str(run)])
    disp(' ')

    % src
    util_gen_list = getGenerators([source_dir fp 'src' fp 'util']);
    for i = 1:numel(util_gen_list)
        create_Element([source_dir fp 'src' fp 'util' fp util_gen_list{i}], [target_dir fp 'src' fp 'util'])
    end

    if exist('Category', 'class') == 8 && run_number == 2, hard_code_constants([target_dir fp 'src' fp 'ds' fp 'Category.m']), end % % % TO BE CHECKED
    if exist('Format', 'class') == 8 && run_number == 2, hard_code_constants([target_dir fp 'src' fp 'ds' fp 'Format.m']), end % % % TO BE CHECKED
	if exist('Element', 'class') == 8 && run_number == 2, hard_code_constants([target_dir fp 'src' fp 'ds' fp 'Element.m']), end % % % TO BE CHECKED
	ds_gen_list = getGenerators([source_dir fp 'src' fp 'ds']);
    for i = 1:numel(ds_gen_list)
        create_Element([source_dir fp 'src' fp 'ds' fp ds_gen_list{i}], [target_dir fp 'src' fp 'ds'])
    end

    if develop
        ds_examples_gen_list = getGenerators([source_dir fp 'src' fp 'ds' fp 'examples']);
        for i = 1:numel(ds_examples_gen_list)
            create_Element([source_dir fp 'src' fp 'ds' fp 'examples' fp ds_examples_gen_list{i}], [target_dir fp 'src' fp 'ds' fp 'examples'])
        end
    end
    
    atlas_gen_list = getGenerators([source_dir fp 'src' fp 'atlas']);
    for i = 1:numel(atlas_gen_list)
        create_Element([source_dir fp 'src' fp 'atlas' fp atlas_gen_list{i}], [target_dir fp 'src' fp 'atlas'])
    end

    gt_gen_list = getGenerators([source_dir fp 'src' fp 'gt']);
    for i = 1:numel(gt_gen_list)
        create_Element([source_dir fp 'src' fp 'gt' fp gt_gen_list{i}], [target_dir fp 'src' fp 'gt'])
    end

    cohort_gen_list = getGenerators([source_dir fp 'src' fp 'cohort']);
	for i = 1:numel(cohort_gen_list)
        create_Element([source_dir fp 'src' fp 'cohort' fp cohort_gen_list{i}], [target_dir fp 'src' fp 'cohort'])
	end

    analysis_gen_list = getGenerators([source_dir fp 'src' fp 'analysis']);
    for i = 1:numel(analysis_gen_list)
        create_Element([source_dir fp 'src' fp 'analysis' fp analysis_gen_list{i}], [target_dir fp 'src' fp 'analysis'])
    end
    
    % nn
    nn_gen_list = getGenerators([source_dir fp 'src' fp 'nn']);
    for i = 1:numel(nn_gen_list)
        create_Element([source_dir fp 'src' fp 'nn' fp nn_gen_list{i}], [target_dir fp 'src' fp 'nn'])
    end

    % graphs
    graphs_gen_list = getGenerators([source_dir fp 'graphs']);
    for i = 1:numel(graphs_gen_list)
        create_Element([source_dir fp 'graphs' fp graphs_gen_list{i}], [target_dir fp 'graphs'])
    end

    % measures
    measures_gen_list = getGenerators([source_dir fp 'measures']);
    for i = 1:numel(measures_gen_list)
        create_Element([source_dir fp 'measures' fp measures_gen_list{i}], [target_dir fp 'measures'])
    end

    % neural networks
    neuralnetworks_gen_list = getGenerators([source_dir fp 'neuralnetworks']);
    for i = 1:numel(neuralnetworks_gen_list)
        create_Element([source_dir fp 'neuralnetworks' fp neuralnetworks_gen_list{i}], [target_dir fp 'neuralnetworks'])
    end

    % gui
    gui_gen_list = getGenerators([source_dir fp 'src' fp 'gui']);
    for i = 1:numel(gui_gen_list)
        create_Element([source_dir fp 'src' fp 'gui' fp gui_gen_list{i}], [target_dir fp 'src' fp 'gui'])
    end

    if develop
        gui_examples_gen_list = getGenerators([source_dir fp 'src' fp 'gui' fp 'examples']);
        for i = 1:numel(gui_examples_gen_list)
            create_Element([source_dir fp 'src' fp 'gui' fp 'examples' fp gui_examples_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'examples'])
        end
    end

    % pipelines
    pipelines_contents = dir([source_dir fp 'pipelines']);  % get the folder contents
    pipelines_dir_list = pipelines_contents([pipelines_contents(:).isdir] == 1);  % remove all files (isdir property is 0)
    pipelines_dir_list = pipelines_dir_list(~ismember({pipelines_dir_list(:).name}, {'.', '..'}));  % remove '.' and '..'
    for i = 1:1:length(pipelines_dir_list)
        pipeline_dir_name = pipelines_dir_list(i).name;
        pipeline_gen_list = getGenerators([source_dir fp 'pipelines' fp pipeline_dir_name]);
        for j = 1:numel(pipeline_gen_list)
            create_Element([source_dir fp 'pipelines' fp pipeline_dir_name fp pipeline_gen_list{j}], [target_dir fp 'pipelines' fp pipeline_dir_name])
        end
    end

    % LOAD BRAPH2
    addpath(target_dir)
    braph2(false, 'warning')

    disp('¡! loaded BRAPH2')
    disp(' ')
    
    disp(['¡! completed run number ' int2str(run)])
    disp(' ')
end

%% CREATE LAYOUTS
% src
util_gen_list = getGenerators([source_dir fp 'src' fp 'util']);
parfor i = 1:numel(util_gen_list)
    create_layout([source_dir fp 'src' fp 'util' fp util_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

ds_gen_list = getGenerators([source_dir fp 'src' fp 'ds']);
parfor i = 1:numel(ds_gen_list)
    create_layout([source_dir fp 'src' fp 'ds' fp ds_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

if develop
    gui_examples_gen_list = getGenerators([source_dir fp 'src' fp 'ds' fp 'examples']);
    parfor i = 1:numel(gui_examples_gen_list)
        create_layout([source_dir fp 'src' fp 'ds' fp 'examples' fp gui_examples_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
    end
end

atlas_gen_list = getGenerators([source_dir fp 'src' fp 'atlas']);
parfor i = 1:numel(atlas_gen_list)
    create_layout([source_dir fp 'src' fp 'atlas' fp atlas_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

gt_gen_list = getGenerators([source_dir fp 'src' fp 'gt']);
parfor i = 1:numel(gt_gen_list)
    create_layout([source_dir fp 'src' fp 'gt' fp gt_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

cohort_gen_list = getGenerators([source_dir fp 'src' fp 'cohort']);
parfor i = 1:numel(cohort_gen_list)
    create_layout([source_dir fp 'src' fp 'cohort' fp cohort_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

analysis_gen_list = getGenerators([source_dir fp 'src' fp 'analysis']);
parfor i = 1:numel(analysis_gen_list)
    create_layout([source_dir fp 'src' fp 'analysis' fp analysis_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

% nn
nn_gen_list = getGenerators([source_dir fp 'src' fp 'nn']);
parfor i = 1:numel(nn_gen_list)
    create_layout([source_dir fp 'src' fp 'nn' fp nn_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

% gui
gui_gen_list = getGenerators([source_dir fp 'src' fp 'gui']);
parfor i = 1:numel(gui_gen_list)
    create_layout([source_dir fp 'src' fp 'gui' fp gui_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

if develop
    gui_examples_gen_list = getGenerators([source_dir fp 'src' fp 'gui' fp 'examples']);
    parfor i = 1:numel(gui_examples_gen_list)
        create_layout([source_dir fp 'src' fp 'gui' fp 'examples' fp gui_examples_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
    end
end

% graphs
graphs_gen_list = getGenerators([source_dir fp 'graphs']);
parfor i = 1:numel(graphs_gen_list)
    create_layout([source_dir fp 'graphs' fp graphs_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

% measures
measures_gen_list = getGenerators([source_dir fp 'measures']);
parfor i = 1:numel(measures_gen_list)
    create_layout([source_dir fp 'measures' fp measures_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end

% neuralnetworks
neuralnetworks_gen_list = getGenerators([source_dir fp 'neuralnetworks']);
parfor i = 1:numel(neuralnetworks_gen_list)
    create_layout([source_dir fp 'neuralnetworks' fp neuralnetworks_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
end 

% pipelines
pipelines_contents = dir([source_dir fp 'pipelines']);  % get the folder contents
pipelines_dir_list = pipelines_contents([pipelines_contents(:).isdir] == 1);  % remove all files (isdir property is 0)
pipelines_dir_list = pipelines_dir_list(~ismember({pipelines_dir_list(:).name}, {'.', '..'}));  % remove '.' and '..'
for i = 1:1:length(pipelines_dir_list)
    pipeline_dir_name = pipelines_dir_list(i).name;
    pipeline_gen_list = getGenerators([source_dir fp 'pipelines' fp pipeline_dir_name]);
    parfor j = 1:numel(pipeline_gen_list)
        create_layout([source_dir fp 'pipelines' fp pipeline_dir_name fp pipeline_gen_list{j}], [target_dir fp 'src' fp 'gui' fp 'layouts'])
    end
end

%% CREATE TEST
% src
util_gen_list = getGenerators([source_dir fp 'src' fp 'util']);
parfor i = 1:numel(util_gen_list)
    create_test_Element([source_dir fp 'src' fp 'util' fp util_gen_list{i}], [target_dir fp 'src' fp 'util'])
end

ds_gen_list = getGenerators([source_dir fp 'src' fp 'ds']);
parfor i = 1:numel(ds_gen_list)
    create_test_Element([source_dir fp 'src' fp 'ds' fp ds_gen_list{i}], [target_dir fp 'src' fp 'ds'])
end

if develop
    gui_examples_gen_list = getGenerators([source_dir fp 'src' fp 'ds' fp 'examples']);
    parfor i = 1:numel(gui_examples_gen_list)
        create_test_Element([source_dir fp 'src' fp 'ds' fp 'examples' fp gui_examples_gen_list{i}], [target_dir fp 'src' fp 'ds' fp 'examples'])
    end
end

atlas_gen_list = getGenerators([source_dir fp 'src' fp 'atlas']);
parfor i = 1:numel(atlas_gen_list)
    create_test_Element([source_dir fp 'src' fp 'atlas' fp atlas_gen_list{i}], [target_dir fp 'src' fp 'atlas'])
end

gt_gen_list = getGenerators([source_dir fp 'src' fp 'gt']);
parfor i = 1:numel(gt_gen_list)
    create_test_Element([source_dir fp 'src' fp 'gt' fp gt_gen_list{i}], [target_dir fp 'src' fp 'gt'])
end

cohort_gen_list = getGenerators([source_dir fp 'src' fp 'cohort']);
parfor i = 1:numel(cohort_gen_list)
    create_test_Element([source_dir fp 'src' fp 'cohort' fp cohort_gen_list{i}], [target_dir fp 'src' fp 'cohort'])
end

analysis_gen_list = getGenerators([source_dir fp 'src' fp 'analysis']);
parfor i = 1:numel(analysis_gen_list)
    create_test_Element([source_dir fp 'src' fp 'analysis' fp analysis_gen_list{i}], [target_dir fp 'src' fp 'analysis'])
end

% nn
nn_gen_list = getGenerators([source_dir fp 'src' fp 'nn']);
parfor i = 1:numel(nn_gen_list)
    create_test_Element([source_dir fp 'src' fp 'nn' fp nn_gen_list{i}], [target_dir fp 'src' fp 'nn'])
end

% gui
gui_gen_list = getGenerators([source_dir fp 'src' fp 'gui']);
parfor i = 1:numel(gui_gen_list)
    create_test_Element([source_dir fp 'src' fp 'gui' fp gui_gen_list{i}], [target_dir fp 'src' fp 'gui'])
end

if develop
    gui_examples_gen_list = getGenerators([source_dir fp 'src' fp 'gui' fp 'examples']);
    parfor i = 1:numel(gui_examples_gen_list)
        create_test_Element([source_dir fp 'src' fp 'gui' fp 'examples' fp gui_examples_gen_list{i}], [target_dir fp 'src' fp 'gui' fp 'examples'])
    end
end

% graphs
graphs_gen_list = getGenerators([source_dir fp 'graphs']);
parfor i = 1:numel(graphs_gen_list)
    create_test_Element([source_dir fp 'graphs' fp graphs_gen_list{i}], [target_dir fp 'graphs'])
end

% measures
measures_gen_list = getGenerators([source_dir fp 'measures']);
parfor i = 1:numel(measures_gen_list)
    create_test_Element([source_dir fp 'measures' fp measures_gen_list{i}], [target_dir fp 'measures'])
end

% neuralnetworks
neuralnetworks_gen_list = getGenerators([source_dir fp 'neuralnetworks']);
parfor i = 1:numel(neuralnetworks_gen_list)
    create_test_Element([source_dir fp 'neuralnetworks' fp neuralnetworks_gen_list{i}], [target_dir fp 'neuralnetworks'])
end 

% pipelines
pipelines_contents = dir([source_dir fp 'pipelines']);  % get the folder contents
pipelines_dir_list = pipelines_contents([pipelines_contents(:).isdir] == 1);  % remove all files (isdir property is 0)
pipelines_dir_list = pipelines_dir_list(~ismember({pipelines_dir_list(:).name}, {'.', '..'}));  % remove '.' and '..'
for i = 1:1:length(pipelines_dir_list)
    pipeline_dir_name = pipelines_dir_list(i).name;
    pipeline_gen_list = getGenerators([source_dir fp 'pipelines' fp pipeline_dir_name]);
    parfor j = 1:numel(pipeline_gen_list)
        create_test_Element([source_dir fp 'pipelines' fp pipeline_dir_name fp pipeline_gen_list{j}], [target_dir fp 'pipelines' fp pipeline_dir_name])
    end
end

end