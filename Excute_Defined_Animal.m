addpath('C:\Users\yycxx\OneDrive - OIST\Reward_Timing_Rebuttal\CommonFunctions')
cd('C:\Users\yycxx\OneDrive - OIST\Reward_Timing_Rebuttal\CommonFunctions')
Batch_IDs = {'1'};
% Mice_ID
mydir  = pwd;
idcs   = strfind(mydir,'\');
home_path = mydir(1:idcs(end)-1);
for kkk = 1:length(Batch_IDs)
    Batch_ID = Batch_IDs{kkk};
    % enter the batch folder
    batch_path = fullfile(home_path,[ 'Batch_' Batch_ID]);
    cd(batch_path )
    D = dir;
    for jjj = 1:length(D)
        currD = D(jjj).name;
        if isfolder(currD)
            %             if contains(currD,["LBHD"])%, ,
            if contains(currD,["108"]),
                cd([currD])
                if ~exist("Code","file")
                    mkdir("Code")
                    mkdir("Behaviour_Preprocess")
                    mkdir("Behaviour_Accuracy")
                end
                cd('Code')
                %                 Extract_Sniff_Pattern_Individual_Mouse
                %                 Transfer_Learning_Curve_fig
                %                 Extract_learning_Curve_from_Fig
                %
                Restriction = 'all';
                if any(contains(currD,["105","107"]))
                    reward_timing = 'short';
                else
                    reward_timing = 'long';
                end

                GNG_Outside_Defined_Animal
                %                 Restriction = 'Day6';
                GNG_Accuracy_Outside_Defined_Animal
                %                 clearvars -except Batch_IDs home_path kkk Batch_ID batch_path D jjj

                %                 close all

            end
            cd(batch_path)
        end
    end
    cd(home_path)
end