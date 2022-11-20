% Transfer data
Copy_Behaviour_Data_From_Bucket

% open scripts necessary for everyday analyse routine 
Mice_IDs = {'Tbx_283', 'Tbx_284','LBHD_207','CCK_203', 'CCK_204'};
home_path = cd;
for kkk = 1:length(Mice_IDs)
    Mouse_ID = Mice_IDs{kkk};
    code_path = fullfile(home_path,Mouse_ID,'Code');
    cd(code_path)
%     edit GNG_Outside.m
%     edit GNG_Inside.m
%     edit GNG_Accuracy_Outside.m
%     edit GNG_Accuracy_Inside.m
    edit Accuracy_All_Day.m     
    cd(home_path)
end