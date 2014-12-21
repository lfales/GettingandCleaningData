## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## install required packages for the project
install.packages("data.table")
install.packages("plyr")
library(data.table)
library(plyr)

## Set working diectory
setwd("/GitHub")

## Download data files for project analysis
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile="data/UCI_HAR_data.zip"
download.file(fileURL,destfile=zipfile)
dateDownloaded <- date()
unzip(zipfile, exdir="Coursera")

## Load tables and set names of the activity_labels, features, training and test data
activity_labels <- read.table("./Coursera/UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./Coursera/UCI HAR Dataset/features.txt")[,2]
X_test <- read.table("./Coursera/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Coursera/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Coursera/UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features

X_train <- read.table("./Coursera/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Coursera/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Coursera/UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features

## Pull the mean and standard deviation values from the features, test and train data
features2 <- grepl("mean|std", features)
X_test = X_test[,features2]
X_train = X_train[,features2]

## Build activity labels for the test and train data
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "Subject"
 
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "Subject"

## Combine the test and train data
testdata <- cbind(as.data.table(subject_test), y_test, X_test)
traindata <- cbind(as.data.table(subject_train), y_train, X_train)

## Merge the test and train data
mergedata = rbind(testdata, traindata)

## Label the merged data
Mlabels = c("Subject", "Activity_ID", "Activity_Label")
Setlabels = setdiff(colnames(mergedata), Mlabels)
meltdata = melt(mergedata, id=Mlabels, measure.vars=Setlabels)

tidy <- ddply(meltdata,.(Subject,Activity_Label), numcolwise(mean))
write.table(tidy,file="tidy.txt", row.names=FALSE)
