The code book describes the variables, the data, and any processes that are performed to pull and clean up the data.

The data
Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data

The zip data includes the following files:

'activity_labels.txt': Association of the class labels with activity name.

'features.txt': List of features.

'features_info.txt': Variables of the feature vector.

'README.txt'

'test/X_test.txt': Test data.

'test/y_test.txt': Test labels.

'train/X_train.txt': Training data.

'train/y_train.txt': Training labels.

The files are training and test data:

'train/subject_train.txt': Individual row identifies the subject who performed the activity for each window sample from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 

'total_acc_x_train.txt' and 'total_acc_z_train.txt':The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample radians/second.

Process details

There are 5 process parts:

Merges the training and test data sets to create one data set.
Extracts only the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Relabels the data set with descriptive activity names.
Creates a second, tidy data set with the average of each variable for each activity and each subject.
How run_analysis.R implements the above steps:

Requires data.table and plyr libraries.
Loads both test and train data
Loads the features and activity labels.
Pulls the mean and standard deviation column names and data.
Process both the test and train data. 
Merge data set.
