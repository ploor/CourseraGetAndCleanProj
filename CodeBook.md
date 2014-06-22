Source Data
=======================

A full description of the source data can be obtained at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data downloaded for the project was obtained from the zip file at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following data/metadata files were extracted from the zip file and utilized for this project:
 * `UCI HAR Dataset/activity_labels.txt`
 * `UCI HAR Dataset/features.txt`
 * `UCI HAR Dataset/test/subject_test.txt`
 * `UCI HAR Dataset/test/X_test.txt`
 * `UCI HAR Dataset/test/y_test.txt`
 * `UCI HAR Dataset/train/subject_test.txt`
 * `UCI HAR Dataset/train/X_test.txt`
 * `UCI HAR Dataset/train/y_test.txt`

Documentation was obtained from the following files:
 * `UCI HAR Dataset/README.txt`
 * `UCI HAR Dataset/features_info.txt`

## Information from `README.txt` ##

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
>
>For each record it is provided:
======================================
>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
>
The dataset includes the following files:
=========================================
>
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
>
The following files are available for the train and test data. Their descriptions are equivalent. 
>
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
>
>
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


## Information from `features_info.txt` ##

> Feature Selection 
>=================
>
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
>
The set of variables that were estimated from these signals are: 
>
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.
>
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
>
The complete list of variables of each feature vector is available in 'features.txt'


## Data cleaning in  `run_analysis.R` ##

The R script performs 6 basic steps, starting with a "step zero":
 * Load text files from zip file
The R script assumes the zip file from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
has been extracted in the working directory.
 
Then the R script continues with the 5 steps from the project assignment description:
 1. (do after Step 2) Merge the training and the test sets to create one data set
 2. (do before Step 1) Extract only the measurements on the mean and standard deviation for each measurement
 3. Use descriptive activity names to name the activities in the data set
 4. Appropriately label the data set with descriptive variable names
 5. Create a second, independent tidy data set<sup>1</sup> with the average of each variable for each activity and each subject
 
and finally the R script writes a space-delimited text file of the tidy data set to the working directory.

The structure of the tidy data set (before writing to text) is

Variable (R-friendly name) |Levels|Storage
-------------------------|------|-------
SubjectID                    |30|integer
ActivityName                 | 6|integer
tBodyAcc.mean.X              |  |double
tBodyAcc.mean.Y              |  |double
tBodyAcc.mean.Z              |  |double
tBodyAcc.std.X               |  |double
tBodyAcc.std.Y               |  |double
tBodyAcc.std.Z               |  |double
tGravityAcc.mean.X           |  |double
tGravityAcc.mean.Y           |  |double
tGravityAcc.mean.Z           |  |double
tGravityAcc.std.X            |  |double
tGravityAcc.std.Y            |  |double
tGravityAcc.std.Z            |  |double
tBodyAccJerk.mean.X          |  |double
tBodyAccJerk.mean.Y          |  |double
tBodyAccJerk.mean.Z          |  |double
tBodyAccJerk.std.X           |  |double
tBodyAccJerk.std.Y           |  |double
tBodyAccJerk.std.Z           |  |double
tBodyGyro.mean.X             |  |double
tBodyGyro.mean.Y             |  |double
tBodyGyro.mean.Z             |  |double
tBodyGyro.std.X              |  |double
tBodyGyro.std.Y              |  |double
tBodyGyro.std.Z              |  |double
tBodyGyroJerk.mean.X         |  |double
tBodyGyroJerk.mean.Y         |  |double
tBodyGyroJerk.mean.Z         |  |double
tBodyGyroJerk.std.X          |  |double
tBodyGyroJerk.std.Y          |  |double
tBodyGyroJerk.std.Z          |  |double
tBodyAccMag.mean             |  |double
tBodyAccMag.std              |  |double
tGravityAccMag.mean          |  |double
tGravityAccMag.std           |  |double
tBodyAccJerkMag.mean         |  |double
tBodyAccJerkMag.std          |  |double
tBodyGyroMag.mean            |  |double
tBodyGyroMag.std             |  |double
tBodyGyroJerkMag.mean        |  |double
tBodyGyroJerkMag.std         |  |double
fBodyAcc.mean.X              |  |double
fBodyAcc.mean.Y              |  |double
fBodyAcc.mean.Z              |  |double
fBodyAcc.std.X               |  |double
fBodyAcc.std.Y               |  |double
fBodyAcc.std.Z               |  |double
fBodyAccJerk.mean.X          |  |double
fBodyAccJerk.mean.Y          |  |double
fBodyAccJerk.mean.Z          |  |double
fBodyAccJerk.std.X           |  |double
fBodyAccJerk.std.Y           |  |double
fBodyAccJerk.std.Z           |  |double
fBodyGyro.mean.X             |  |double
fBodyGyro.mean.Y             |  |double
fBodyGyro.mean.Z             |  |double
fBodyGyro.std.X              |  |double
fBodyGyro.std.Y              |  |double
fBodyGyro.std.Z              |  |double
fBodyAccMag.mean             |  |double
fBodyAccMag.std              |  |double
fBodyBodyAccJerkMag.mean     |  |double
fBodyBodyAccJerkMag.std      |  |double
fBodyBodyGyroMag.mean        |  |double
fBodyBodyGyroMag.std         |  |double
fBodyBodyGyroJerkMag.mean    |  |double
fBodyBodyGyroJerkMag.std     |  |double

Variable |Levels
-------|------
SubjectID | 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
ActivityName | LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

## References ##
<sup>1</sup> Wickham, Hadley. Tidy data. The American Statistician. 2012-07-09. Available from: http://vita.had.co.nz/papers/tidy-data.html