Getting and Cleaning Data Project
====================

This repository contains a single script used tor read data collected from the accelerometers from the Samsung Galaxy S smartphones, found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The contained R script can be run provided that the data exist in the working directory. The script reads in the various raw text files and assembles them  into a readable, tody dataset. This data set contains average values for mean and standard deviation measurements summarized by subject and activity.

In order to generate the tidy data set, the script runs through the following steps:

1. Imports relevant text files.
2. Pulls in and cleans up variable names.
2. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data.
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a tidy data set with the average of each variable for each activity and each subject. 
