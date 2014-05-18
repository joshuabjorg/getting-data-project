## Name: run_analysis.R
## Created: 27APR14
## Purpose:  
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive activity names. 
## 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Included donwloading code in case needed

## Downloading files
#zipfile <- "UCI HAR Dataset.zip"

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zipfile)
#unzip(zipfile)

## Creating Data Sets

#   This is the key that maps codes to activities
labels <-read.table("UCI HAR Dataset/activity_labels.txt")

#   These are teh measurement names
names <- read.table("UCI HAR Dataset/features.txt")

#   Putting them into R-friendly format
varnames <- sub("[[:punct:]]","_",names$V2)

#   Creating an index vector of those that are of mean and std
index <- grepl("mean__",varnames) | grepl("std__",varnames)


#   For each data set, bind subject ID, activity code, measurements;
#   then assign varaiable names
train_data <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
                    read.table("UCI HAR Dataset/train/Y_train.txt"),
                    read.table("UCI HAR Dataset/train/X_train.txt"))
names(train_data) <- c("ID","Activity_Code",varnames) 

test_data <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt"),
                   read.table("UCI HAR Dataset/test/Y_test.txt"),
                   read.table("UCI HAR Dataset/test/X_test.txt"))
names(test_data) <- c("ID","Activity_Code",varnames) 

#   Subsetting data to mean and std measurements
train_trimmed <- train_data[,c(TRUE,TRUE,index)]
test_trimmed <- test_data[,c(TRUE,TRUE,index)]

#   Merging training and test data, then merging on activity names
pre_tidy <- rbind(train_trimmed,test_trimmed)
pre_tidy <-  merge(y=pre_tidy,x=labels, by.y="Activity_Code" ,by.x="V1")

names(pre_tidy)[1:2] <- c("Activity_Code","Acitivity_Description")

#   Taking average values and ording by ID, activity
library(plyr)
tidy <- aggregate(pre_tidy[,4:69],pre_tidy[,c(3,2)],mean)
tidy<-arrange(tidy, ID,Acitivity_Description )

#   Writing to file
write.table(tidy,file="./Tidy Data Set.txt")
