Codebook
====================

The code starts by creating R data sets from the text files. The imported files include:
* activity_labels.txt: This is the key that maps codes to activities.
* features.txt: This is a file containing the measurement names.
* subject_train.txt/subject_test.txt: These files contain the subject IDs for the training/test data sets.
* Y_train.txt/Y_test.txt: These contain the activity codes for the training/test data sets.
* X_train.txt/X_test.txt: These contain the raw measurements for the training/test data sets.

The code first converts the measurement names to an R-friendly format, stripping out punctuation and replacing with underscores.
An index vector is then created which contains true values where the measurement is either a mean or standard deviation.

For the training and test sets, IDs and activity codes are merged to the raw measurements. Measurements are assigned names from the cleaned up features data.

The training and test sets are then subset using the index vector and merged together. Activity names are then merged on by activity code.

The code then takes the mean value for each measurement summarized by subject and activity. This data set is then ordered and exported as a text file.

Variables
====================
ID is an integer that refers to the subject ID number. Activity description is a character variable describing the action taken by the subject.

Each measurement variable in the data is the mean value of all measurements taken. Each aggregated measure has both a mean and standard deviation measurement taken. Measurement details are provided below:
 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
