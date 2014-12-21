GettingandCleaningData
======================

This repository contains an R script that downloads and does some preprocessing on Human Activity Recognition data set. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
 
The project requires to create one R script called run_analysis.R that does the following.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Downloads of the data from the UCI Machine Learning Repository of Human Activity Recognition Using Smartphones Data Set. The full description of the data along with full data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repository contains the following files:
README.md - current file
Codebook.md -  information about the raw and tidy data set and process to transform them to a merged data set and tidy data set
run_Analysis.R - R script used to get and transform the raw data to a tidy data set
