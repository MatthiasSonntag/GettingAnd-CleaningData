---
title: "Code book"
author: "Matthias Sonntag"
date: "26.07.2015"
output: html_document
---

## Project Description
Short description of the project

The aim of the project is to build a new dataset called Average from the dataset "Human Activity Recognition Using Smartphones Data Set" $^1$. The new dataset should consist only of the subjects the activities performed by the subjects an the averages of the measurements of the mean and the standard deviations. All variables of the dataset should have self-explaining names and the activity categories should be the descriptive ones provided in the original dataset. 

##Study design and data processing

###Collection of the raw data 
The raw data consits of the triaxial accelarations and angular velocities of 30 volunteers, who performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) thereby wearing Samsung Galaxy S II smartphones$^1$. The smartphones gyroscopes and the accelerometers were therefore read out at a frequency rate of 50Hz$^1$. Further information in the README.txt and features_info.txt of the dataset$^1$.

###Notes on the original data 
The following is a very rough summary of the information found in the README.txt an features_info.txt in the original dataset, look there for further information$^1$.  The raw data has been aggregated and processed using different filtering methods, calculating derivatives, vectorial magnitudes and performing Fast Fourier Transformations. Subsequently several further calculations including computation of the mean the standart deviation and others were carried out resulting in 561 variables, which taken alltogether are called the features vector for every record of the experiment (record: each activity performed by a subject). 

##Creating the tidy datafile

###Guide to create the tidy data file
1. Download the zip-file containing the original data from here:
<http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip> .

2. Unzip the file and put the resulting folder (UCI HAR Dataset) in the working directory of your run_analysis.R-file

3. Execute the script run_analysis.R.

###Cleaning of the data
1. Merge the needed original data to a dataset with the following variables:
 subject |  activity |  561 columns named after the measurement variables.
 This is achieved by concatenating the txt-files listed in the README.md-file

2. Extract only measurements of the mean and the standard deviation of the measurements: I used all columns / variables from the original dataset in which grepl() found std oder mean. This decission arised when I considered the level of processing carried out on the initial measurement data. In my opinion one cannot speak of measurements anymore, therefore extracting specific variables by the processing depth eventually leading to less variables does not make sense for me. Another possibility would have been to use only time domain data of the angular momentum and the accelerations without the jerk variables since those are closest to the initial measurements. 
3. Use desriptive names to decribe the activies in the respective column
4. Give the column names descriptive variable names
5. Create a new datset with the average of each variable for each activity and each subject
[Link to the README document that describes the code in greater detail](README.md)

##Description of the variables in the Average.txt file
* Dimensions of the dataset: 81 variables, 180 observables

* Summary of the data: The first variable of the Average dataset is a subject identifier. The second variable names the activity performed by the subject. The following 79 columns are averages of the original's mean and standard deviation data for each activity and subject. Since the original data was normalized$^1$ all the averages of the time and frequency domain data are unitless too.   

* Variables present in the dataset:

```
##  [1] Subject                                                           
##  [2] Activity                                                          
##  [3] TimeDomain.BodyAcceleration.Mean.X.Direction                      
##  [4] TimeDomain.BodyAcceleration.Mean.Y.Direction                      
##  [5] TimeDomain.BodyAcceleration.Mean.Z.Direction                      
##  [6] TimeDomain.GravityAcceleration.Mean.X.Direction                   
##  [7] TimeDomain.GravityAcceleration.Mean.Y.Direction                   
##  [8] TimeDomain.GravityAcceleration.Mean.Z.Direction                   
##  [9] TimeDomain.BodyAccelerationJerk.Mean.X.Direction                  
## [10] TimeDomain.BodyAccelerationJerk.Mean.Y.Direction                  
## [11] TimeDomain.BodyAccelerationJerk.Mean.Z.Direction                  
## [12] TimeDomain.BodyAngularVelocity.Mean.X.Direction                   
## [13] TimeDomain.BodyAngularVelocity.Mean.Y.Direction                   
## [14] TimeDomain.BodyAngularVelocity.Mean.Z.Direction                   
## [15] TimeDomain.BodyAngularVelocityJerk.Mean.X.Direction               
## [16] TimeDomain.BodyAngularVelocityJerk.Mean.Y.Direction               
## [17] TimeDomain.BodyAngularVelocityJerk.Mean.Z.Direction               
## [18] TimeDomain.BodyAccelerationMagnitude.Mean                         
## [19] TimeDomain.GravityAccelerationMagnitude.Mean                      
## [20] TimeDomain.BodyAccelerationJerkMagnitude.Mean                     
## [21] TimeDomain.BodyAngularVelocityMagnitude.Mean                      
## [22] TimeDomain.BodyAngularVelocityJerkMagnitude.Mean                  
## [23] FrequencyDomain.BodyAcceleration.Mean.X.Direction                 
## [24] FrequencyDomain.BodyAcceleration.Mean.Y.Direction                 
## [25] FrequencyDomain.BodyAcceleration.Mean.Z.Direction                 
## [26] FrequencyDomain.BodyAcceleration.MeanFrequency.X.Direction        
## [27] FrequencyDomain.BodyAcceleration.MeanFrequency.Y.Direction        
## [28] FrequencyDomain.BodyAcceleration.MeanFrequency.Z.Direction        
## [29] FrequencyDomain.BodyAccelerationJerk.Mean.X.Direction             
## [30] FrequencyDomain.BodyAccelerationJerk.Mean.Y.Direction             
## [31] FrequencyDomain.BodyAccelerationJerk.Mean.Z.Direction             
## [32] FrequencyDomain.BodyAccelerationJerk.MeanFrequency.X.Direction    
## [33] FrequencyDomain.BodyAccelerationJerk.MeanFrequency.Y.Direction    
## [34] FrequencyDomain.BodyAccelerationJerk.MeanFrequency.Z.Direction    
## [35] FrequencyDomain.BodyAngularVelocity.Mean.X.Direction              
## [36] FrequencyDomain.BodyAngularVelocity.Mean.Y.Direction              
## [37] FrequencyDomain.BodyAngularVelocity.Mean.Z.Direction              
## [38] FrequencyDomain.BodyAngularVelocity.MeanFrequency.X.Direction     
## [39] FrequencyDomain.BodyAngularVelocity.MeanFrequency.Y.Direction     
## [40] FrequencyDomain.BodyAngularVelocity.MeanFrequency.Z.Direction     
## [41] FrequencyDomain.BodyAccelerationMagnitude.Mean                    
## [42] FrequencyDomain.BodyAccelerationMagnitude.MeanFrequency           
## [43] FrequencyDomain.BodyAccelerationJerkMagnitude.Mean                
## [44] FrequencyDomain.BodyAccelerationJerkMagnitude.MeanFrequency       
## [45] FrequencyDomain.BodyAngularVelocityMagnitude.Mean                 
## [46] FrequencyDomain.BodyAngularVelocityMagnitude.MeanFrequency        
## [47] FrequencyDomain.BodyAngularVelocityJerkMagnitude.Mean             
## [48] FrequencyDomain.BodyAngularVelocityJerkMagnitude.MeanFrequency    
## [49] TimeDomain.BodyAcceleration.StandardDeviation.X.Direction         
## [50] TimeDomain.BodyAcceleration.StandardDeviation.Y.Direction         
## [51] TimeDomain.BodyAcceleration.StandardDeviation.Z.Direction         
## [52] TimeDomain.GravityAcceleration.StandardDeviation.X.Direction      
## [53] TimeDomain.GravityAcceleration.StandardDeviation.Y.Direction      
## [54] TimeDomain.GravityAcceleration.StandardDeviation.Z.Direction      
## [55] TimeDomain.BodyAccelerationJerk.StandardDeviation.X.Direction     
## [56] TimeDomain.BodyAccelerationJerk.StandardDeviation.Y.Direction     
## [57] TimeDomain.BodyAccelerationJerk.StandardDeviation.Z.Direction     
## [58] TimeDomain.BodyAngularVelocity.StandardDeviation.X.Direction      
## [59] TimeDomain.BodyAngularVelocity.StandardDeviation.Y.Direction      
## [60] TimeDomain.BodyAngularVelocity.StandardDeviation.Z.Direction      
## [61] TimeDomain.BodyAngularVelocityJerk.StandardDeviation.X.Direction  
## [62] TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Y.Direction  
## [63] TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Z.Direction  
## [64] TimeDomain.BodyAccelerationMagnitude.StandardDeviation            
## [65] TimeDomain.GravityAccelerationMagnitude.StandardDeviation         
## [66] TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation        
## [67] TimeDomain.BodyAngularVelocityMagnitude.StandardDeviation         
## [68] TimeDomain.BodyAngularVelocityJerkMagnitude.StandardDeviation     
## [69] FrequencyDomain.BodyAcceleration.StandardDeviation.X.Direction    
## [70] FrequencyDomain.BodyAcceleration.StandardDeviation.Y.Direction    
## [71] FrequencyDomain.BodyAcceleration.StandardDeviation.Z.Direction    
## [72] FrequencyDomain.BodyAccelerationJerk.StandardDeviation.X.Direction
## [73] FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Y.Direction
## [74] FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Z.Direction
## [75] FrequencyDomain.BodyAngularVelocity.StandardDeviation.X.Direction 
## [76] FrequencyDomain.BodyAngularVelocity.StandardDeviation.Y.Direction 
## [77] FrequencyDomain.BodyAngularVelocity.StandardDeviation.Z.Direction 
## [78] FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation       
## [79] FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation   
## [80] FrequencyDomain.BodyAngularVelocityMagnitude.StandardDeviation    
## [81] FrequencyDomain.BodyAngularVelocityJerkMagnitude.StandardDeviation
```

###Variable 1 
Subject identifiers fpr the subjects perfoming in the experiment.

Variable name: Subject

Class: Integer

Values: 1, 2, 3, ... , 30

Unit: -

###Variable 2 
Activites performed by the subjects in the experiments.

Variable name: Activities

Class: Character

Values: WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, SITTING, LAYING,STAYING

Unit: -

###Variable 3 
Mean of the mean of the time domain measurement of the body acceleration in x direction

Variable name: TimeDomain.BodyAcceleration.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 4 
Mean of the mean of the time domain measurement of the body acceleration in y direction

Variable name: TimeDomain.BodyAcceleration.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 5 
Mean of the mean of the time domain measurement of the body acceleration in z direction

Variable name: TimeDomain.BodyAcceleration.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 6 
Mean of the mean of the time domain measurement of the gravity acceleration in x direction

Variable name: TimeDomain.GravityAcceleration.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 7 
Mean of the mean of the time domain measurement of the gravity acceleration in y direction

Variable name: TimeDomain.GravityAcceleration.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 8 
Mean of the mean of the time domain measurement of the gravity acceleration in z direction

Variable name: TimeDomain.GravityAcceleration.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 9 
Mean of the mean of the time domain measurement of the body acceleration jerk in x direction

Variable name: TimeDomain.BodyAccelerationJerk.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 10 
Mean of the mean of the time domain measurement of the body acceleration jerk in y direction

Variable name: TimeDomain.BodyAccelerationJerk.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 11 
Mean of the mean of the time domain measurement of the body acceleration jerk in z direction

Variable name: TimeDomain.BodyAccelerationJerk.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 12 
Mean of the mean of the time domain measurement of the angular velocity in x direction

Variable name: TimeDomain.BodyAngularVelocity.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 13 
Mean of the mean of the time domain measurement of the angular velocity in y direction

Variable name: TimeDomain.BodyAngularVelocity.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 14 
Mean of the mean of the time domain measurement of the angular velocity in z direction

Variable name: TimeDomain.BodyAngularVelocity.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 15 
Mean of the mean of the time domain measurement of the angular velocity jerk in x direction

Variable name: TimeDomain.BodyAngularVelocityJerk.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 16 
Mean of the mean of the time domain measurement of the angular velocity jerk in y direction

Variable name: TimeDomain.BodyAngularVelocityJerk.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 17 
Mean of the mean of the time domain measurement of the angular velocity jerk in z direction

Variable name: TimeDomain.BodyAngularVelocityJerk.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 18 
Mean of the mean of the time domain measurement of the bodyy acceleration magnitude 

Variable name: TimeDomain.BodyAccelerationMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 19 
Mean of the mean of the time domain measurement of the gravity acceleration magnitude 

Variable name: TimeDomain.GravityAccelerationMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 20 
Mean of the mean of the time domain measurement of the body acceleration jerk magnitude 

Variable name: TimeDomain.BodyAccelerationJerkMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 21 
Mean of the mean of the time domain measurement of the angular velocity magnitude 

Variable name: TimeDomain.BodyAngularVelocityMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 22 
Mean of the mean of the time domain measurement of the angular velocity jerk magnitude 

Variable name: TimeDomain.BodyAngularVelocityJerkMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 23
Mean of the mean of the frequency domain measurement of the body acceleration in x direction 

Variable name: FrequencyDomain.BodyAcceleration.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 24
Mean of the mean of the frequency domain measurement of the body acceleration in y direction 

Variable name: FrequencyDomain.BodyAcceleration.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 25
Mean of the mean of the frequency domain measurement of the body acceleration in z direction 

Variable name: FrequencyDomain.BodyAcceleration.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 26
Mean of the mean of the frequency domain measurement of the body acceleration frequency in x direction 

Variable name: FrequencyDomain.BodyAcceleration.MeanFrequency.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 27
Mean of the mean of the frequency domain measurement of the body acceleration frequency in y direction 

Variable name: FrequencyDomain.BodyAcceleration.MeanFrequency.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 28
Mean of the mean of the frequency domain measurement of the body acceleration frequeny in z direction 

Variable name: FrequencyDomain.BodyAcceleration.MeanFrequency.Z.Direction

Class: Numeric

Values: [-1,1]

###Variable 29
Mean of the mean of the frequency domain measurement of the body acceleration jerk in x direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 30
Mean of the mean of the frequency domain measurement of the body acceleration jerk in y direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 31
Mean of the mean of the frequency domain measurement of the body acceleration jerk in z direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 32
Mean of the mean of the frequency domain measurement of the body acceleration jerk frequency in x direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.MeanFrequency.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 33
Mean of the mean of the frequency domain measurement of the body acceleration jerk frequency in y direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.MeanFrequency.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 34
Mean of the mean of the frequency domain measurement of the body acceleration jerk frequency in z direction 

Variable name: FrequencyDomain.BodyAccelerationJerk.MeanFrequency.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 35
Mean of the mean of the frequency domain measurement of the angular velocity in x direction 

Variable name: FrequencyDomain.BodyAngularVelocity.Mean.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 36
Mean of the mean of the frequency domain measurement of the angular velocity in y direction 

Variable name: FrequencyDomain.BodyAngularVelocity.Mean.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -


###Variable 37
Mean of the mean of the frequency domain measurement of the angular velocity in z direction 

Variable name: FrequencyDomain.BodyAngularVelocity.Mean.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 38
Mean of the mean of the frequency domain measurement of the angular velocity frequeny in x direction 

Variable name: FrequencyDomain.BodyAngularVelocity.MeanFrequency.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 39
Mean of the mean of the frequency domain measurement of the angular velocity frequency in y direction 

Variable name: FrequencyDomain.BodyAngularVelocity.MeanFrequency.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 40
Mean of the mean of the frequency domain measurement of the angular velocity frequeny in z direction 

Variable name: FrequencyDomain.BodyAngularVelocity.MeanFrequency.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 41
Mean of the mean of the frequency domain measurement of the body acceleration magnitude 

Variable name: FrequencyDomain.BodyAccelerationMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 42
Mean of the mean of the frequency domain measurement of the body acceleration magnitude frequency

Variable name: FrequencyDomain.BodyAccelerationMagnitude.MeanFrequency

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 43
Mean of the mean of the frequency domain measurement of the body acceleration jerk magnitude 

Variable name: FrequencyDomain.BodyAccelerationJerkMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 44
Mean of the mean of the frequency domain measurement of the body acceleration jerk magnitude frequency

Variable name: FrequencyDomain.BodyAccelerationJerkMagnitude.MeanFrequency

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 45
Mean of the mean of the frequency domain measurement of the angular velocity magnitude 

Variable name: FrequencyDomain.BodyAngularVelocityMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 46
Mean of the mean of the frequency domain measurement of the angular velocity magnitude frequency 

Variable name: FrequencyDomain.BodyAngularVelocityMagnitude.MeanFrequency

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 47
Mean of the mean of the frequency domain measurement of the angular velocity jerk magnitude 

Variable name: FrequencyDomain.BodyAngularVelocityJerkMagnitude.Mean

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 48
Mean of the mean of the frequency domain measurement of the angular velocity jerk magnitude frequency

Variable name: FrequencyDomain.BodyAngularVelocityJerkMagnitude.MeanFrequency

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 49
Mean of the standard deviation of the time domain measurement of the body acceleration in x direction 

Variable name: TimeDomain.BodyAcceleration.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 50
Mean of the standard deviation of the time domain measurement of the body acceleration in y direction 

Variable name: TimeDomain.BodyAcceleration.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 51
Mean of the standard deviation of the time domain measurement of the body acceleration in z direction 

Variable name: TimeDomain.BodyAcceleration.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 52
Mean of the standard deviation of the time domain measurement of the gravity acceleration in x direction 

Variable name: TimeDomain.GravityAcceleration.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 53
Mean of the standard deviation of the time domain measurement of the gravity acceleration in y direction 

Variable name: TimeDomain.GravityAcceleration.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 54
Mean of the standard deviation of the time domain measurement of the gravity acceleration in z direction 

Variable name: TimeDomain.GravityAcceleration.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 55
Mean of the standard deviation of the time domain measurement of the body acceleration jerk in x direction 

Variable name: TimeDomain.BodyAccelerationJerk.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 56
Mean of the standard deviation of the time domain measurement of the body acceleration jerk in y direction 

Variable name: TimeDomain.BodyAccelerationJerk.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 57
Mean of the standard deviation of the time domain measurement of the body acceleration jerk in z direction 

Variable name: TimeDomain.BodyAccelerationJerk.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 58
Mean of the standard deviation of the time domain measurement of the angular velocity in x direction

Variable name: TimeDomain.BodyAngularVelocity.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 59
Mean of the standard deviation of the time domain measurement of the angular velocity in y direction

Variable name: TimeDomain.BodyAngularVelocity.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 60
Mean of the standard deviation of the time domain measurement of the angular velocity in z direction

Variable name: TimeDomain.BodyAngularVelocity.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 61
Mean of the standard deviation of the time domain measurement of the angular velocity jerk in x direction

Variable name: TimeDomain.BodyAngularVelocityJerk.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 62
Mean of the standard deviation of the time domain measurement of the angular velocity jerk in y direction

Variable name: TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 63
Mean of the standard deviation of the time domain measurement of the angular velocity jerk in z direction

Variable name: TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 64
Mean of the standard deviation of the time domain measurement of the body acceleration magnitude 

Variable name: TimeDomain.BodyAccelerationMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 65
Mean of the standard deviation of the time domain measurement of the gravitiy acceleration magnitude 

Variable name: TimeDomain.GravityAccelerationMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 66
Mean of the standard deviation of the time domain measurement of the body acceleration jerk magnitude 

Variable name: TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -


###Variable 67
Mean of the standard deviation of the time domain measurement of the  angular velocity magnitude 

Variable name: TimeDomain.BodyAngularVelocityMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 68
Mean of the standard deviation of the time domain measurement of the body angular velocity jerk magnitude 

Variable name: TimeDomain.BodyAngularVelocityJerkMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -


###Variable 69
Mean of the standard deviation of the frequency domain measurement of the body acceleration in x direction

Variable name: FrequencyDomain.BodyAcceleration.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 70
Mean of the standard deviation of the frequency domain measurement of the body acceleration in y direction

Variable name: FrequencyDomain.BodyAcceleration.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -


###Variable 71
Mean of the standard deviation of the frequency domain measurement of the body acceleration in z direction

Variable name: FrequencyDomain.BodyAcceleration.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 72
Mean of the standard deviation of the frequency domain measurement of the body acceleration jerk in x direction

Variable name: FrequencyDomain.BodyAccelerationJerk.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 73
Mean of the standard deviation of the frequency domain measurement of the body acceleration jerk in y direction

Variable name: FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 74
Mean of the standard deviation of the frequency domain measurement of the body acceleration jerk in z direction

Variable name: FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 75
Mean of the standard deviation of the frequency domain measurement of the angular velocity in x direction

Variable name: FrequencyDomain.BodyAngularVelocity.StandardDeviation.X.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 76
Mean of the standard deviation of the frequency domain measurement of the angular velocity in y direction

Variable name: FrequencyDomain.BodyAngularVelocity.StandardDeviation.Y.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 77
Mean of the standard deviation of the frequency domain measurement of the angular velocity in z direction

Variable name: FrequencyDomain.BodyAngularVelocity.StandardDeviation.Z.Direction

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 78
Mean of the standard deviation of the frequency domain measurement of the body acceleration magnitude 

Variable name: FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 79
Mean of the standard deviation of the frequency domain measurement of the body acceleration jerk magnitude 

Variable name: FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 80
Mean of the standard deviation of the frequency domain measurement of the angular velocity magnitude

Variable name: FrequencyDomain.BodyAngularVelocityMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

###Variable 81
Mean of the standard deviation of the frequency domain measurement of the angular velocity jerk magnitude

Variable name: FrequencyDomain.BodyAngularVelocityMagnitude.StandardDeviation

Class: Numeric

Values: [-1,1]

Unit: -

##Sources
$^1$: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

$^2$: Joris Schut, https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41 (27.05.2015).

##Annex
Code used to list the variable names

```r
Average <- read.table("Average.txt",header=T)
noquote(colnames(Average))
```
