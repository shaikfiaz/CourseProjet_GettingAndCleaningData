# CourseProjet_GettingAndCleaningData
This is course project in Data Science specialization in Coursera on how to get and clean data. In particular this document describes the code inside run_analysis.R.
## Getting the data
* First download the zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" to the folder "Data"
* Extract the files using "unzip" command available in library downloader. Thereshould be a folder named UCI HAR Dataset
* Mark the connection train and test sub folders in " UCI HAR Dataset" to  variables TrainDataFolder and TestDataFolder
* Mark the connections with X_train.txt, y_train.txt, subject_train.txt to file.TrainSet, file.TrainLabel, file.TrainSubject
* Mark the connections with X_test.txt, y_test.txt, subject_test.txt to file.TestSet, file.TestLabel, file.TestSubject
* Mark the connections with features.txt, activity_labels.txt to file.Features.Desc, file.Activity.Desc, respectively.
* Read the files using read.table command. For example X_train=read.table(file.TrainSet).
* Activity_lables and Features are named as data frame "Activity.Desc" and "Feature.Names"
## Preprocessing i.e changing the name variables, joining varaibles
* For training data set name Measurements, Subjects, Labels as X_train, Y_train, subject_train variables, respectively
* For testing data set name Measurements, Subjects, Labels as X_test, Y_test, subject_test variables, respectively
* Rename the column names of X_train and X_test with feature names Feature.Names. 
* Rename the varaible in Y_train and Y_test to "Activity" and subject_train, subject_test to "Subject".
* Join the data frames X_train,Y_train,subject_train using "cbind" command and call it "Data.Train". Similarly join X_test,Y_test,subject_test data frames to "Data.Test".
## Join the Train and Test data
* Combine Data.Train and Data.Test by using "rbind" command and name it as "Data.Train.Test
## Replacing Activity numbers with activity names
* Use match command and data frame of Activity.Desc to rename the data activity numbers with activity names. Data.Train.Test$Activity=Activity.Desc$Act.Desc[match(Data.Train.Test$Activity,Activity.Desc$Act.No)]
## Selecting only mean and std measurements
* Partial string matching using "grep" command is used to get variable names which has mean and std. Named them as Features.Mean and Features.Std.
* New data frame "Data.Train.Test.Mean_n_Std" with only with mean and std varaibles is created by following commands
Features.Mean_n_Std=c(Features.Mean,Features.Std,"Subject","Activity");
Data.Train.Test.Mean_n_Std=Data.Train.Test[,Features.Mean_n_Std];
* 

