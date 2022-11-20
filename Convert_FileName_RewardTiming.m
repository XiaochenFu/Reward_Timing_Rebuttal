function Result_Title = Convert_FileName_RewardTiming(FileName)
Strain = alphanumericsPattern(3);
ID = digitsPattern(3);
TrainingDate = "Day" + digitsPattern(1,2);
Task = digitsPattern(4);
RewardDelay = lettersPattern(4,5);
StartTime = digitsPattern(12);
FilenamePattern = Strain + "_" + ID + "_" + TrainingDate + "_" + Task + "_" + RewardDelay + "_" +  StartTime;

% t = extract(FileName,FilenamePattern)
ResultPattern =  TrainingDate + "_" + Task;
Result_Title = extract(FileName,ResultPattern);
Result_Title = Result_Title{1};