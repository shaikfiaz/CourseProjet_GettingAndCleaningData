library(downloader)
DataDir="./Data"
setwd(DataDir)



file.UCIHAR=paste(DataDir,"/","UCI HAR Dataset.zip",sep = "")

## Downloading the data and creation of file tags
url.HumanAct="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(file.UCIHAR)){download(url.HumanAct, dest=GDPFile, mode="wb") }
unzip(file.UCIHAR, exdir = DataDir)
DataSubFolder=paste(DataDir,"/","UCI HAR Dataset",sep="")

#Sub Folders Train and Test

TrainDataFolder=paste(DataSubFolder,"/","train",sep="")
TestDataFolder=paste(DataSubFolder,"/","test",sep="")

#Train

file.TrainSet=paste(TrainDataFolder,"/","X_train.txt",sep="")
file.TrainLabel=paste(TrainDataFolder,"/","y_train.txt",sep="")
file.TrainSubject=paste(TrainDataFolder,"/","subject_train.txt",sep="")

#Test

file.TestSet=paste(TestDataFolder,"/","X_test.txt",sep="")
file.TestLabel=paste(TestDataFolder,"/","y_test.txt",sep="")
file.TestSubject=paste(TestDataFolder,"/","subject_test.txt",sep="")

#Features

file.Features.Desc=paste(DataSubFolder,"/","features.txt",sep="")

#Activities

file.Activity.Desc=paste(DataSubFolder,"/","activity_labels.txt",sep="")


## Reading and naming features, activities, labels and subjects

#Feature descriptions

Feature.Names=read.table(file.Features.Desc)
Feature.Names[,2]=gsub("\\(|\\)","",Feature.Names[,2])
Feature.Names[,2]=gsub("-","_",Feature.Names[,2])
Feature.Names[,2]=gsub(",","_",Feature.Names[,2])
Feature.Names[,2]=gsub("__","_",Feature.Names[,2])

#Activity number and descriptions
Activity.Desc=read.table(file.Activity.Desc)
colnames(Activity.Desc)=c("Act.No","Act.Desc")

#Train

X_train=read.table(file.TrainSet)
Y_train=read.table(file.TrainLabel)
Subject_train=read.table(file.TrainSubject)
colnames(X_train)=Feature.Names[,2]
colnames(Y_train)="Activity"
colnames(Subject_train)="Subject"
Data.Train=cbind(X_train,Y_train,Subject_train)

#Test

X_test=read.table(file.TestSet)
Y_test=read.table(file.TestLabel)
Subject_test=read.table(file.TestSubject)
colnames(X_test)=Feature.Names[,2]
colnames(Y_test)="Activity"
colnames(Subject_test)="Subject"
Data.Test=cbind(X_test,Y_test,Subject_test)

##Combining train and test data

Data.Train.Test=rbind(Data.Train,Data.Test)

## Replacing Activity numbers with their appropriate descriptions

Data.Train.Test$Activity=Activity.Desc$Act.Desc[match(Data.Train.Test$Activity,Activity.Desc$Act.No)]

## Selecting only mean and Std features

#Features column names with mean

Ind.Mean.Feat=grep("mean",colnames(Data.Train.Test),ignore.case = TRUE)
Features.Mean=colnames(Data.Train.Test)[Ind.Mean.Feat]

#Features column names with standard deviation

Ind.Std.Feat=grep("std",colnames(Data.Train.Test),ignore.case = TRUE)
Features.Std=colnames(Data.Train.Test)[Ind.Std.Feat] 

#Combining mean and std features along with Subject and Activity

Features.Mean_n_Std=c(Features.Mean,Features.Std,"Subject","Activity")
Data.Train.Test.Mean_n_Std=Data.Train.Test[,Features.Mean_n_Std]
#colnames(Data.Train.Test.Mean_n_Std)=gsub("\\(|\\)","_",colnames(Data.Train.Test.Mean_n_Std))
# #Writing the data to txt file
# 
# file.DataMeanStd=paste(DataSubFolder,"/","DataMeanStd.txt",sep="")
# write.table(Data.Train.Test.Mean_n_Std,file.DataMeanStd,col.names = TRUE,row.names = FALSE)

## Creating second tidy data set with with the average of each variable for each activity and each subject.
library(reshape2)

IDs=c("Subject","Activity")
Measurements= c(Features.Mean,Features.Std)
DF_Melt=melt(Data.Train.Test.Mean_n_Std,id=IDs,measure.vars = Measurements)#Melting the data
<<<<<<< HEAD
Train_n_Test_Data_Summary=dcast(DF_Melt, Activity+Subject ~ variable, mean, value='value')#Summarizing the data
=======
Train_n_Test_Data_Summary=dcast(DF_Melt, Activity+Subject ~ variable, mean,value='value')#Summarizing the data
>>>>>>> All Files Added

#Writing Data to txt file
file.Summary=paste(DataSubFolder,"/","TrainTest_with_mean_of_Mean_Std_Summary.txt",sep="")
write.table(Train_n_Test_Data_Summary,file.Summary,col.names = TRUE,row.names = FALSE)

