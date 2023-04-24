%% ¡header!
ExporterGroupSubjectCON_MP_XLS < Exporter (ex, exporter of CON MP subject group in XLS/XLSX) exports a group of subjects with connectivity multiplex data to a series of XLSX file.

%%% ¡description!
ExporterGroupSubjectCON_MP_XLS exports a group of subjects with connectivity multiplex data to a series of XLSX file and their covariates (if existing).
All these files are saved in the same folder.
Each file contains a table with of values corresponding to the adjacency matrix of a layer.
The XLS/XLSX file containing the covariates consists of the following columns:
Subject ID (column 1), Subject AGE (column 2), and, Subject SEX (column 3).
The first row contains the headers and each subsequent row the values for each subject.

%%% ¡seealso!
Group, SunbjectCON_MP, ImporterGroupSubjectCON_MP_XLS

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the CON MP subject group exporter in XLS/XLSX.
%%%% ¡default!
'ExporterGroupSubjectCON_MP_XLS'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the CON MP subject group exporter in XLS/XLSX.
%%%% ¡default!
'ExporterGroupSubjectCON_MP_XLS exports a group of subjects with connectivity multiplex data to a series of XLSX file and their covariates (if existing).'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the CON MP subject group exporter in XLS/XLSX.

%%% ¡prop!
ID (data, string) is a few-letter code for the CON MP subject group exporter in XLS/XLSX.
%%%% ¡default!
'ExporterGroupSubjectCON_MP_XLS ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the CON MP subject group exporter in XLS/XLSX.
%%%% ¡default!
'ExporterGroupSubjectCON_MP_XLS label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the CON MP subject group exporter in XLS/XLSX.
%%%% ¡default!
'ExporterGroupSubjectCON_MP_XLS notes'

%% ¡props!

%%% ¡prop!
GR (data, item) is a group of subjects with connectivity multiplex data.
%%%% ¡settings!
'Group'
%%%% ¡check_prop!
check = any(strcmp(value.get(Group.SUB_CLASS_TAG), subclasses('SubjectCON_MP', [], [], true))); 
%%%% ¡default!
Group('SUB_CLASS', 'SubjectCON_MP', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectCON_MP'))

%%% ¡prop!
DIRECTORY (data, string) is the directory name where to save the group of subjects with connectivity multiplex data.
%%%% ¡default!
[fileparts(which('test_braph2')) filesep 'default_group_subjects_CON_MP_most_likely_to_be_erased']

%%% ¡prop!
PUT_DIR (query, item) opens a dialog box to set the directory where to save the group of subjects with connectivity data.
%%%% ¡settings!
'ExporterGroupSubjectCON_MP_XLS'
%%%% ¡calculate!
directory = uigetdir('Select directory');
if ischar(directory) && isfolder(directory)
    ex.set('DIRECTORY', directory);
end
value = ex;

%%% ¡prop!
SAVE (result, empty) saves the group of subjects with connectivity multiplex data in XLS/XLSX files in the selected directory.
%%%% ¡calculate!
directory = ex.get('DIRECTORY');

if isfolder(directory)
    wb = braph2waitbar(ex.get('WAITBAR'), 0, 'Retrieving path ...');

    gr = ex.get('GR');

    gr_directory = [directory filesep() gr.get('ID')];
    if ~exist(gr_directory, 'dir')
        mkdir(gr_directory)
    end
    
	braph2waitbar(wb, .15, 'Organizing info ...')

    sub_dict = gr.get('SUB_DICT');
    sub_number = sub_dict.get('LENGTH');
    sub_id = cell(sub_number, 1);
% % %     age = cell(sub_number, 1);
% % %     sex = cell(sub_number, 1);

    for i = 1:1:sub_number
        braph2waitbar(wb, .25 + .75 * i / sub_number, ['Saving subject ' num2str(i) ' of ' num2str(sub_number) ' ...'])

        layers_number = sub_dict.get('IT', 1).get('L');
        sub = sub_dict.get('IT', i);
        
        sub_directory = [gr_directory filesep() sub.get('ID')];
        if ~exist(sub_directory, 'dir')
            mkdir(sub_directory)
        end

        sub_id(i) = {sub.get('ID')};
        sub_CON_MP = sub.get('CON_MP');
% % %         age{i} =  sub.get('AGE');
% % %         sex{i} =  sub.get('SEX');
        
        for j = 1:1:layers_number
            tab = table(sub_CON_MP{j});
            
            sub_file = [sub_directory filesep() sub_id{i} '_' int2str(j) '.xlsx'];
            
            % save file
            writetable(tab, sub_file, 'Sheet', 1, 'WriteVariableNames', 0);
        end
    end
    
% % %     % if covariates save them in another file
% % %     if sub_number ~= 0 && ~isequal(sex{:}, 'unassigned')  && ~isequal(age{:},  0) 
% % %         tab2 = cell(1 + sub_number, 3);
% % %         tab2{1, 1} = 'ID';
% % %         tab2{1, 2} = 'Age';
% % %         tab2{1, 3} = 'Sex';
% % %         tab2(2:end, 1) = sub_id;
% % %         tab2(2:end, 2) = age;
% % %         tab2(2:end, 3) = sex;
% % %         tab2 = table(tab2);
% % %         
% % %         % save
% % %         writetable(tab2, [gr_directory filesep() gr.get('ID') '_covariates.xlsx'], 'Sheet', 1, 'WriteVariableNames', 0);
% % %     end
    
    braph2waitbar(wb, 'close')
end

% sets value to empty
value = [];

%% ¡tests!

%%% ¡excluded_props!
[ExporterGroupSubjectCON_MP_XLS.PUT_DIR]

%%% ¡test!
%%%% ¡name!
Delete directory TBE
%%%% ¡probability!
1
%%%% ¡code!
warning('off', 'MATLAB:DELETE:FileNotFound')
dir_to_be_erased = ExporterGroupSubjectCON_MP_XLS.getPropDefault('DIRECTORY');
if isfolder(dir_to_be_erased)
    rmdir(dir_to_be_erased, 's')
end
warning('on', 'MATLAB:DELETE:FileNotFound')


%%% ¡test!
%%%% ¡name!
Export and import
%%%% ¡probability!
.01
%%%% ¡code!
br1 = BrainRegion( ...
    'ID', 'ISF', ...
    'LABEL', 'superiorfrontal', ...
    'NOTES', 'notes1', ...
    'X', -12.6, ...
    'Y', 22.9, ...
    'Z', 42.4 ...
    );
br2 = BrainRegion( ...
    'ID', 'lFP', ...
    'LABEL', 'frontalpole', ...
    'NOTES', 'notes2', ...
    'X', -8.6, ...
    'Y', 61.7, ...
    'Z', -8.7 ...
    );
br3 = BrainRegion( ...
    'ID', 'lRMF', ...
    'LABEL', 'rostralmiddlefrontal', ...
    'NOTES', 'notes3', ...
    'X', -31.3, ...
    'Y', 41.2, ...
    'Z', 16.5 ...
    );
br4 = BrainRegion( ...
    'ID', 'lCMF', ...
    'LABEL', 'caudalmiddlefrontal', ...
    'NOTES', 'notes4', ...
    'X', -34.6, ...
    'Y', 10.2, ...
    'Z', 42.8 ...
    );
br5 = BrainRegion( ...
    'ID', 'lPOB', ...
    'LABEL', 'parsorbitalis', ...
    'NOTES', 'notes5', ...
    'X', -41, ...
    'Y', 38.8, ...
    'Z', -11.1 ...
    );

ba = BrainAtlas( ...
    'ID', 'TestToSaveCoolID', ...
    'LABEL', 'Brain Atlas', ...
    'NOTES', 'Brain atlas notes', ...
    'BR_DICT', IndexedDictionary('IT_CLASS', 'BrainRegion', 'IT_KEY', 1, 'IT_LIST', {br1, br2, br3, br4, br5}) ...
    );

sub1 = SubjectCON_MP( ...
    'ID', 'SUB CON_MP 1', ...
    'LABEL', 'Subejct CON_MP 1', ...
    'NOTES', 'Notes on subject CON_MP 1', ...
    'BA', ba, ... % % %     'age', 75, ... % % %     'sex', 'female', ...
    'L', 2, ...
    'CON_MP', {rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH')), rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH'))} ...
    );
sub2 = SubjectCON_MP( ...
    'ID', 'SUB CON_MP 2', ...
    'LABEL', 'Subejct CON_MP 2', ...
    'NOTES', 'Notes on subject CON_MP 2', ...
    'BA', ba, ... % % %     'age', 70, ... % % %     'sex', 'male', ...
    'L', 2, ...
    'CON_MP', {rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH')), rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH'))} ...
    );
sub3 = SubjectCON_MP( ...
    'ID', 'SUB CON_MP 3', ...
    'LABEL', 'Subejct CON_MP 3', ...
    'NOTES', 'Notes on subject CON_MP 3', ...
    'BA', ba, ... % % %     'age', 50, ... % % %     'sex', 'female', ...
    'L', 2, ...
    'CON_MP', {rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH')), rand(ba.get('BR_DICT').get('LENGTH'), ba.get('BR_DICT').get('LENGTH'))} ...
    );

gr = Group( ...
    'ID', 'GR CON_MP', ...
    'LABEL', 'Group label', ...
    'NOTES', 'Group notes', ...
    'SUB_CLASS', 'SubjectCON_MP', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectCON_MP', 'IT_KEY', 1, 'IT_LIST', {sub1, sub2, sub3}) ...
    );

directory = [fileparts(which('test_braph2')) filesep 'trial_group_subjects_CON_MP_to_be_erased'];
if ~exist(directory, 'dir')
    mkdir(directory)
end

ex = ExporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', directory, ...
    'GR', gr ...
    );
ex.get('SAVE');

% import with same brain atlas
im1 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [directory filesep() gr.get(Group.ID)], ...
    'BA', ba ...
    );
gr_loaded1 = im1.get('GR');

assert(gr.get('SUB_DICT').get('LENGTH') == gr_loaded1.get('SUB_DICT').get('LENGTH'), ...
	[BRAPH2.STR ':ExporterGroupSubjectCON_MP_XLS:' BRAPH2.FAIL_TEST], ...
    'Problems saving or loading a group.')
for i = 1:1:max(gr.get('SUB_DICT').get('LENGTH'), gr_loaded1.get('SUB_DICT').get('LENGTH'))
    sub = gr.get('SUB_DICT').get('IT', i);
    sub_loaded = gr_loaded1.get('SUB_DICT').get('IT', i);    
    assert( ...
        isequal(sub.get('ID'), sub_loaded.get('ID')) & ...
        isequal(sub.get('BA'), sub_loaded.get('BA')) & ... % % %         isequal(sub.get('AGE'), sub_loaded.get('AGE')) & ... % % %         isequal(sub.get('SEX'), sub_loaded.get('SEX')) & ...
        isequal(sub.get('L'), sub_loaded.get('L')) & ...
        isequal(sub.get('CON_MP'), sub_loaded.get('CON_MP')), ...
        [BRAPH2.STR ':ExporterGroupSubjectCON_MP_XLS:' BRAPH2.FAIL_TEST], ...
        'Problems saving or loading a group.')    
end

% import with new brain atlas
im2 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [directory filesep() gr.get(Group.ID)], ...
    'BA', ba ...
    );
gr_loaded2 = im2.get('GR');

assert(gr.get('SUB_DICT').get('LENGTH') == gr_loaded2.get('SUB_DICT').get('LENGTH'), ...
	[BRAPH2.STR ':ExporterGroupSubjectCON_MP_XLS:' BRAPH2.FAIL_TEST], ...
    'Problems saving or loading a group.')
for i = 1:1:max(gr.get('SUB_DICT').get('LENGTH'), gr_loaded2.get('SUB_DICT').get('LENGTH'))
    sub = gr.get('SUB_DICT').get('IT', i);
    sub_loaded = gr_loaded2.get('SUB_DICT').get('IT', i);
    assert( ...
        isequal(sub.get('ID'), sub_loaded.get('ID')) & ... % % %         isequal(sub.get('AGE'), sub_loaded.get('AGE')) & ... % % %         isequal(sub.get('SEX'), sub_loaded.get('SEX')) & ...
        isequal(sub.get('L'), sub_loaded.get('L')) & ...
        isequal(sub.get('CON_MP'), sub_loaded.get('CON_MP')), ...
        [BRAPH2.STR ':ExporterGroupSubjectCON_MP_XLS:' BRAPH2.FAIL_TEST], ...
        'Problems saving or loading a group.')    
end

rmdir(directory, 's')