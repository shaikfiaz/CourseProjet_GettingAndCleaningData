# CourseProjet_GettingAndCleaningData
This is course project in Data Science specialization in Coursera on how to get and clean data. In particular this document describes the code inside run_analysis.R.
## Getting the data
* First download the zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" to the folder "Data"
* Extract the files using "unzip" command available in library downloader. Thereshould be a folder named UCI HAR Dataset
* Mark the connection train and test sub folders in " UCI HAR Dataset" to  variables TrainDataFolder and TestDataFolder
* Mark the connections with X_train.txt, y_train.txt, subject_train.txt to file.TrainSet, file.TrainLabel, file.TrainSubject
* Mark the connections with X_test.txt, y_test.txt, subject_test.txt to file.TestSet, file.TestLabel, file.TestSubject
* Read the files using read.table command. 
* For training data set name Measurements, Subjects, Labels as X_train, Y_train, subject_train variables, respectively
* 
