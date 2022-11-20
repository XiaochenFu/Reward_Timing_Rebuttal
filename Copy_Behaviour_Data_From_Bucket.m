%% script for quickly copying data
% For each animal, Copy data from bucket to 'Recording_Raw'. If the data is
% not in 'Recording_Raw', copy it to the 'Recording' folder as well

clear all
Mice_IDs = {'BL6_104', 'BL6_105','BL6_106','BL6_107', 'BL6_108'};
home_path = cd;
for kkk = 1:length(Mice_IDs)
    Mouse_ID = Mice_IDs{kkk};
    source_path = fullfile('Z:\Xiaochen\Rebuttal\',Mouse_ID);
    destination_path1 = fullfile(home_path,Mouse_ID,'Recording_Raw');
    destination_path2 = fullfile(home_path,Mouse_ID,'Recording');
    [~, ~, ~] = mkdir(destination_path1);
    [~, ~, ~] = mkdir(destination_path2);
    cd(source_path)
    source_filenames=dir;
    cd(destination_path1)
    destination_filename0 = dir;
    destination_filename = struct2cell(destination_filename0);
    destination_filename = destination_filename(1,3:end);
    for i=3:length(source_filenames)
        filename = source_filenames(i).name;
        
        if cell2mat(regexp(destination_filename,filename))
        else
            copyfile(fullfile(source_path,source_filenames(i).name),destination_path1);
            copyfile(fullfile(source_path,source_filenames(i).name),destination_path2);
        end
    end
    cd(home_path)
end

