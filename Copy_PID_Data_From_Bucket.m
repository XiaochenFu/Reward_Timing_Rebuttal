%% script for quickly copying data
% For each animal, Copy data from bucket to 'Recording_Raw'. If the data is
% not in 'Recording_Raw', copy it to the 'Recording' folder as well

clear all
home_path = fullfile(cd,'Stimuli','PID');

PID_folder_keyword = 'today';
PID_home_path = 'Z:\Xiaochen\Test_Janinesetup\PID';
PID_folder_name = get_defined_folder_names(PID_home_path,PID_folder_keyword);
PID_path = fullfile(PID_home_path,PID_folder_name{1});

PID_file_keyword = 'latest';

script_template_folder = 'C:\Users\yycxx\OneDrive - OIST\Reward_Timing_Rebuttal\Batch_1\Stimuli\PID\PID_template';

destination_path = fullfile(home_path,PID_folder_name{1});
% mkdir(destination_path)
PID_file_name = get_defined_file_names(PID_path,PID_file_keyword);

if iscell('PID_file_name')
    for i=1:length(PID_file_name)
        copyfile(fullfile(PID_path,PID_file_name{i}),destination_path);
    end
else
    copyfile(fullfile(PID_path,PID_file_name),destination_path);
end



% cd(PID_home_path)
cd(destination_path)
if exist("PID_Test_2080.m")
else
    copyfile(fullfile(script_template_folder,"PID_Test_2080.m"),destination_path);
    copyfile(fullfile(script_template_folder,"PID_Test_4060.m"),destination_path);
end
edit("PID_Test_2080.m")
edit("PID_Test_4060.m")