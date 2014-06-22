dataPath="./UCI HAR Dataset" 

#Step 0: Load text files
testPath <- paste(dataPath, "test" , sep="/")
trainPath<- paste(dataPath, "train", sep="/")
features <- read.table(paste(dataPath, "features.txt", sep="/")
                      ,header=F, as.is=T
                      ,col.names=c("MeasurementID", "MeasurementName"))
  
subject_test <- read.table(paste(testPath, "subject_test.txt", sep="/")
                          ,header=F,col.names=c("SubjectID"))
subject_train<- read.table(paste(trainPath, "subject_train.txt", sep="/")
                          ,header=F,col.names=c("SubjectID"))
  
X_test <- read.table(paste(testPath, "X_test.txt", sep="/")
                    ,header=F, col.names=features$MeasurementName)
X_train<- read.table(paste(trainPath, "X_train.txt", sep="/")
                    ,header=F, col.names=features$MeasurementName)

y_test <- read.table(paste(testPath, "y_test.txt", sep="/")
                    ,header=F,col.names=c("ActivityID"))
y_train<- read.table(paste(trainPath, "y_train.txt", sep="/")
                    ,header=F,col.names=c("ActivityID"))
  
activity_labels<-read.table(paste(dataPath, "activity_labels.txt", sep="/")
                            ,header=F, as.is=T
                            ,col.names=c("ActivityID", "ActivityName"))
  
  
## Step 2 (do before Step 1)
# Extract only the measurements on the mean and standard deviation
# for each measurement
keep_features <- grep(".*mean\\(\\)|.*std\\(\\)", features$MeasurementName)
X_test <-X_test[,keep_features]
X_train<-X_train[,keep_features]


## Step 1 (do after Step 2)
# Merge the training and the test sets to create one data set
merged_test <- cbind(subject_test , y_test , X_test)
merged_train<- cbind(subject_train, y_train, X_train)
merged_all <- rbind(merged_test, merged_train)

## Step 3
# Use descriptive activity names to name the activities in the data set
activity_labels$ActivityName <- as.factor(activity_labels$ActivityName)
merged_all<- merge(activity_labels,merged_all)

# let's also make SubjectID into a factor
merged_all$SubjectID <-as.factor(merged_all$SubjectID)


## Step 4
# Appropriately label the data set with descriptive variable names
colnames<-colnames(merged_all)

# inner gsub: replace multiple . with one .
# outer gsub: remove trailing .
colnames<-gsub( "\\.+$", "", gsub("\\.{2,}","\\.",colnames))
colnames(merged_all)<-colnames

## Step 5
# Create a second, independent tidy data set with the average
# of each variable for each activity and each subject

# start with second column to skip ActivityID.
# We'll keep ActivityName
TidyDS<-aggregate(. ~ SubjectID+ActivityName
                 ,data=merged_all[2:ncol(merged_all)]
                 ,FUN=mean)

write.table(TidyDS, file = paste(".", "TidyDS.txt", sep="/")
           ,sep = " ", row.names = F, col.names = T)