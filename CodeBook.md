==================================================================

This CodeBook.md file describes the har_summary.txt dataset produced from the run-analysis.R script including the data,
transformations and work performed on it's source dataset 'Human Activity Recognition Using Smartphones Dataset'
in order to meet the requirments of the Course Project assigned as part of Coursera's Getting and 
Cleaning Data Course (getdata-008, Oct 2014).

Version 1.0, 22/10/2014
==================================================================
==================================================================

DATA METRICS AND UNITS
======================
The har_summary.txt dataset comprises 180 observations of the average mean and standard deviation results of 79 variables
relating to 6 activities undertaken by 30 subjects.

Column headers are included in the dataset.
Row numbers are not included in the dataset.

- 'subject': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'activity' : Each row identifies an activity. The range is WALKING, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS, SITTING
, STANDING, LAYING
.

- 'time...': Each variable prefixed with 'time' contains a time domain signal

- 'frequency...': Each variable prefixed with 'frequency' contains a frequency domain signal

DATA ORIGIN
================
The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals timeaccelerator-XYZ and timegyroscope-XYZ.
These time domain signals (prefixed 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median
filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals (timebodyaccelerate-XYZ and timegravityaccelerate-XYZ) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timebodyacceleratejerk-XYZ and
timebodygyroscopejerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(timebodyaccelerometermagnitude, timegravityaccelerometermagnitude, timebodyaccelerometerjerkmagnitude,
timebodygyroscopemagnitude, timebodygyroscopejerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencybodyaccelerometer-XYZ, 
frequencybodyaccelerometerjerk-XYZ, frequencybodygyroscope-XYZ, frequencybodyaccelerometerjerkmagnitude,
frequencybodygyroscopemagnitude, frequencybodygyroscopejerkmagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additonally, the dataset included the associated reference files relating to the subjects undertaking the study and the activities
they performed.

WORK PERFORMED
==============

The following steps were performed by the run_analysis.R script to produce the har_summary.txt dataset:

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

DATA TRANSFORMATION
===================
During processing, the run_analysis.R script performed the following data transformations:

1. The appropriate variable names were applied to each variable column as specified in the features.txt source file
2. The variable names relating to the suject and activity were set to 'subject' and 'activity respectively
3. The activity numbers were replaced by the activity description as specified in the activity_labels.txt source file
4. The variable names were transformed to make them more readable, remove unwanted characters, set to lower case
5. The combined results were summarised to the average of each variable for each activity and each subject

DATASET VARIABLES
=================
The complete list of variables held in the har_summary.txt dataset is as follows:

"timebodyaccelerometermeanX"
"timebodyaccelerometermeanY"                                  
"timebodyaccelerometermeanZ"
"timegravityaccelerometermeanX"                               
"timegravityaccelerometermeanY"
"timegravityaccelerometermeanZ"                               
"timebodyaccelerometerjerkmeanX"
"timebodyaccelerometerjerkmeanY"                              
"timebodyaccelerometerjerkmeanZ"
"timebodygyroscopemeanX"
"timebodygyroscopemeanY"
"timebodygyroscopemeanZ"                                      
"timebodygyroscopejerkmeanX"
"timebodygyroscopejerkmeanY"
"timebodygyroscopejerkmeanZ"
"timebodyaccelerometermagnitudemean"
"timegravityaccelerometermagnitudemean"
"timebodyaccelerometerjerkmagnitudemean"
"timebodygyroscopemagnitudemean"
"timebodygyroscopejerkmagnitudemean"
"frequencybodyaccelerometermeanX"
"frequencybodyaccelerometermeanY"
"frequencybodyaccelerometermeanZ"
"frequencybodyaccelerometermeanfrequencyX"
"frequencybodyaccelerometermeanfrequencyY"
"frequencybodyaccelerometermeanfrequencyZ"
"frequencybodyaccelerometerjerkmeanX"
"frequencybodyaccelerometerjerkmeanY"
"frequencybodyaccelerometerjerkmeanZ"
"frequencybodyaccelerometerjerkmeanfrequencyX"                
"frequencybodyaccelerometerjerkmeanfrequencyY"
"frequencybodyaccelerometerjerkmeanfrequencyZ"                
"frequencybodygyroscopemeanX"
"frequencybodygyroscopemeanY"                                 
"frequencybodygyroscopemeanZ"
"frequencybodygyroscopemeanfrequencyX"                        
"frequencybodygyroscopemeanfrequencyY"
"frequencybodygyroscopemeanfrequencyZ"                        
"frequencybodyaccelerometermagnitudemean"
"frequencybodyaccelerometermagnitudemeanfrequency"            
"frequencybodybodyaccelerometerjerkmagnitudemean"
"frequencybodybodyaccelerometerjerkmagnitudemeanfrequency"    
"frequencybodybodygyroscopemagnitudemean"
"frequencybodybodygyroscopemagnitudemeanfrequency"            
"frequencybodybodygyroscopejerkmagnitudemean"
"frequencybodybodygyroscopejerkmagnitudemeanfrequency"        
"timebodyaccelerometerstandarddeviationX"
"timebodyaccelerometerstandarddeviationY"                     
"timebodyaccelerometerstandarddeviationZ"
"timegravityaccelerometerstandarddeviationX"                  
"timegravityaccelerometerstandarddeviationY"
"timegravityaccelerometerstandarddeviationZ"                  
"timebodyaccelerometerjerkstandarddeviationX"
"timebodyaccelerometerjerkstandarddeviationY"                 
"timebodyaccelerometerjerkstandarddeviationZ"
"timebodygyroscopestandarddeviationX"                         
"timebodygyroscopestandarddeviationY"
"timebodygyroscopestandarddeviationZ"                         
"timebodygyroscopejerkstandarddeviationX"
"timebodygyroscopejerkstandarddeviationY"                     
"timebodygyroscopejerkstandarddeviationZ"
"timebodyaccelerometermagnitudestandarddeviation"             
"timegravityaccelerometermagnitudestandarddeviation"
"timebodyaccelerometerjerkmagnitudestandarddeviation"         
"timebodygyroscopemagnitudestandarddeviation"
"timebodygyroscopejerkmagnitudestandarddeviation"             
"frequencybodyaccelerometerstandarddeviationX"
"frequencybodyaccelerometerstandarddeviationY"                
"frequencybodyaccelerometerstandarddeviationZ"
"frequencybodyaccelerometerjerkstandarddeviationX"            
"frequencybodyaccelerometerjerkstandarddeviationY"
"frequencybodyaccelerometerjerkstandarddeviationZ"            
"frequencybodygyroscopestandarddeviationX"
"frequencybodygyroscopestandarddeviationY"                    
"frequencybodygyroscopestandarddeviationZ"
"frequencybodyaccelerometermagnitudestandarddeviation"        
"frequencybodybodyaccelerometerjerkmagnitudestandarddeviation"
"frequencybodybodygyroscopemagnitudestandarddeviation"        
"frequencybodybodygyroscopejerkmagnitudestandarddeviation"
"activity"                                                    
"subject"