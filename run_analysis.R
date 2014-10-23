# This script takes as input the Human Activity Recognition Using Smartphones Dataset
# obtained from the following address:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The script combines the results of the subjects and activity observations relating to the train
# and test sets. The script then performs some transformation and tidying of the dataset
# in order to make it more readable and standalone.

# The script summarises the combined data to produce an independent data set with the
# average of each variable for each activity and each subject.



setwd("~/coursera/UCI HAR Dataset") # Set working directory to local data directory

# Read in raw data files
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
All_features <- read.table("features.txt") # Features.txt file
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
activity_labs <- read.table("activity_labels.txt") # activity_labels

subject_all <- rbind(subject_test, subject_train) # Combine all subjects from train and test sets
names(subject_all) <- "subject" # rename the subject id variable to be more descriptive

names(X_train) <- All_features[,2] # rename the variables from the features file
names(y_train) <- "activity" # rename the activity id variable to be more descriptive
xy_train <- cbind(X_train, y_train) # Combine training set and training labels

names(X_test) <- All_features[,2] # rename the variables from the features file
names(y_test) <- "activity" # rename the activity id variable to be more descriptive
xy_test <- cbind(X_test, y_test) # Combine test set and test labels

xy_all <- rbind(xy_test, xy_train) # Combine test and training sets together

alldata <- cbind(xy_all, subject_all) # Combine all combined test and training subjects with all combined test and training sets

mean_obs <- All_features[grep("-mean()", All_features$V2),2] # Identify all variables containing mean

std_obs <- All_features[grep("-std()", All_features$V2),2] # Identify all variables containing std

all_columns <- c(as.character(mean_obs), as.character(std_obs), "activity", "subject") # Combine the mean and std column variables
meanstd_data <- alldata[,all_columns] # subset the entire dataset to include only mean, std, activity and subject variables

meanstd_data[,"activity"] <- activity_labs[meanstd_data[,"activity"],"V2"] # Change activity id to activity description

# Make variable names descriptive and more read-able
names(meanstd_data) <-sub("tBody", "timebody", names(meanstd_data),)
names(meanstd_data) <-sub("fBody", "frequencybody", names(meanstd_data),)
names(meanstd_data) <-sub("Body", "body", names(meanstd_data),)
names(meanstd_data) <-sub("tGravity", "timegravity", names(meanstd_data),)
names(meanstd_data) <-sub("Acc", "accelerometer", names(meanstd_data),)
names(meanstd_data) <-sub("Gyro", "gyroscope", names(meanstd_data),)
names(meanstd_data) <-sub("Mag", "magnitude", names(meanstd_data),)
names(meanstd_data) <-sub("Freq", "frequency", names(meanstd_data),)
names(meanstd_data) <-sub("Jerk", "jerk", names(meanstd_data),)
names(meanstd_data) <-sub("std", "standarddeviation", names(meanstd_data),)
names(meanstd_data) <-sub("\\()", "", names(meanstd_data),)
names(meanstd_data) <-gsub("-", "", names(meanstd_data),)

grpsubjectactivity <- group_by(meanstd_data, subject, activity) # Group the data according to the subject and activity

avegrpsubjectactivity <- grpsubjectactivity %>% summarise_each(funs(mean)) # New dataset from average variable grouped by subject / activity

write.table(avegrpsubjectactivity, "har_summary.txt", row.names=FALSE) #output the dataset omitting row numbers
