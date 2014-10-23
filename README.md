==================================================================

This README.md file describes how run_analysis.R works.

run_analysis.R is Kate Hornby's solution to the Course Project
assigned as part of Coursera's Getting and Cleaning Data Course
(getdata-008, Oct 2014).

Version 1.0
22/10/2014
==================================================================
The data used by this R script is the Human Activity Recognition Using
Smartphones Dataset and it was sourced from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file was downloaded then unzipped to a local directory held on K Hornby's PC
==================================================================

The run_analysis.R scrip performs the following steps:

1. Sets the working directory to the directory containing the downloaded and unzipped dataset
2. Reads the following eight raw data files into R:
	subject_train.txt, subject_test.txt, features.txt, X_train.txt, y_train.txt, X_test.txt,
	y_test.txt, activity_labels.txt
3. Combines the subjects from the train and test sets (subject_train.txt, subject_test.txt)
4. Assigns descriptive names to the subject, activity id and activity variables
5. Combines training set and training labels (X_train.txt, y_train.txt)
6. Combines test set and test labels (X_test.txt, y_test.txt)
7. Combines test and training sets together (results of step 5 + results of step 6)
8. Combines all combined test and training subjects with all combined test and training sets (results of step 3 + results of step 7)
9. Identifies all variables containing the characters 'mean' or 'std'
10. Combines the mean and std variables into a single list
11. Subsets the entire dataset to include only mean, std, activity and subject variables (all other variables are dropped from the dataset)
12. Changes activity id to activity description (integer value replaced by description e.g. 1 replaced by 'WALKING')
13. Modifies the variable names to make them more descriptive and read-able (e.g. all lower case, dashes removed, abbreviations replaced by non-abbreviated words)
14. Groups the dataset by subject and activity
15. Creates a new dataset from mean of variables grouped by subject / activity
