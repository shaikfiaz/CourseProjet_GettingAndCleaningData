# Codebook for run_analysis.R
This is the codebook for the course project in Data Science specialization in Coursera on how to get and clean data. In particular this document describes how the Samsung d

## Assumptions

* Mean features have string "mean" some where in the feature desctiption and it is case insensitive
* Standard deviation features have string "std" some where in the feature desctiption and it is case insensitive
* Files with labels "train" are assumed to be training and "test" are for testing. X's are measurements, y's are activities and subjects are subjects

## Data Preprocessing: 
* Raw data contains multiple files. X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_tes.txt, features.txt, activity_labels.txt
* The names of features are assigned as column names for X. The names are changed for better readability. Patterns like "()", ",", "__" are either removed or replaced with "_".
* Different text files are downloaded and merged to form Train and test data sets. They are named as "Data.Train"" and "Data.Test"", respectively.
* Names of features are replaced with second column of features.txt and y is labelled as "Activity" and subject is names as "Subject"
* Units of all acceleration features are in "g=m/s^2" and units of gyro are in "rad/sec"
* All features are numeric and Activity and subject are factors
* Training and test data are combined to form one data.frame named "Data.Train.Test"
* Data is down selected with features reperesenting only mean and standard deviation. 
* "Data.Train.Test" is summarized for each subject and each activity into the data.frame "Train_n_Test_Data_Summary"
* The units remain unchanged after summarization also.