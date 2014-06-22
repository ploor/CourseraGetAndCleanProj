Coursera Getting and Cleaning Data Project
=======================

This repo is for the [Coursera Getting and Cleaning Data](https://www.coursera.org/course/getdata) Course Project, which creates a "tidy data set<sup>1</sup>."  It contains the following files:

 * **`README.md`**: Markdown file for this README.
 * **`CodeBook.md`**: Markdown description of the source data, cleaning work, and "tidy data set"
 * **`run_analysis.R`**: The R script that produces the "tidy data set" from the source data

A full description of the source data can be obtained at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data downloaded for the project was obtained from the zip file at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project assumes that the data files and documentation within the zip file is accurate.

It is assumed that the zip file is extracted to the R working directory before runing the R script.


## `run_analysis.R` ##

The R script performs 6 basic steps, starting with a "step zero":
 * Load text files from zip file
 
Then the R script continues with the 5 steps from the project assignment description:
 1. (do after Step 2) Merge the training and the test sets to create one data set
 2. (do before Step 1) Extract only the measurements on the mean and standard deviation for each measurement
 3. Use descriptive activity names to name the activities in the data set
 4. Appropriately label the data set with descriptive variable names
 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
 
and finally the R script writes a space-delimited text file of the tidy data set to the working directory.
 
## References ##
<sup>1</sup> Wickham, Hadley. Tidy data. The American Statistician. 2012-07-09. Available from: http://vita.had.co.nz/papers/tidy-data.html