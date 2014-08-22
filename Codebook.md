# Codebook for UCI HAR Dataset

### This codebook is for the variables found in tidydata.txt created by run_analysis.R
### This was preparred with the aid of README.txt and features_info.txt, which are files found in the folder "UCI HAR Dataset", which appears in your working directory after running run_analysis.R.   
### Here is a link to the data set home page: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

SubjectID is a number between 1 and 30, each representing one of the thirty participants in the study.  

ActivityID is one of the six different activites that were used to generate data:
- laying
- sitting
- standing
- walking
- walkingdownstairs (walking down stairs)
- walkingupstairs (walking up stairs)

The remaining 66 columns have descriptive variable names that follow the following naming conventions:
- a prefix "t" represents "time"
- a prefix "f" represents "frequency domain signal"
- a substring "BodyAcc" represents (estimated) body acceleration
- a substring "GravityAcc" represents (total) gravity acceleration
- a substring "Gyro" represents angular velocity measured by the gyroscope
- a substring "Mag" represents magnitude
- a substring "Jerk" represents the acceleration of the acceleration
- a substring "Mean" represents that it is a mean
- a substring "StdDev" represents that it is a standard deviation
- a suffix "X", "Y", or "Z" represents motion in those respective directions  

The original values of these variables were normalized and bounded within [-1,1].  After running run_analysis.R, the values that appear in tidydata.txt are: the mean of that variable given each combination of Subject and Activity.  Note that the resulting values will still be within the interval [-1,1].  There are 30 subjects and 6 activiies, leading to 180 combinations of subject and activity.  For each of those 180 combinations, all values of a given variable associated with the given combination where averaged.  

For example, row 3 represents Subject 3 doing the activity Laying.  Column 3 is "tBodyAccMeanX".  Then, the value in row 3, column 3 is then the mean of all the values of Subject 3's average body acceleration in the X direction while laying down.

| Column Number  | Variable Name                | Description  |
| -------------- |:---------------------------- |:------------ |
| 1              | SubjectID                    | Subject ID   
| 2              | ActivityID                   | Activity ID          
| 3              | tBodyAccMeanX                | Average body acceleration in X direction           
| 4              | tBodyAccMeanY                | Average body acceleration in Y direction        
| 5              | tBodyAccMeanZ                | Average body acceleration in Z direction          
| 6              | tBodyAccStdDevX              | Standard deviation of body acceleration in X direction           
| 7              | tBodyAccStdDevY              | Standard deviation of body acceleration in Y direction        
| 8              | tBodyAccStdDevZ              | Standard deviation of body acceleration in Z direction          
| 9              | tGravityAccMeanX             | Average gravity acceleration in X direction           
| 10             | tGravityAccMeanY             | Average gravity acceleration in Y direction        
| 11             | tGravityAccMeanZ             | Average gravity acceleration in Z direction          
| 12             | tGravityAccStdDevX           | Standard deviation of gravity acceleration in X direction           
| 13             | tGravityAccStdDevY           | Standard deviation of gravity acceleration in Y direction        
| 14             | tGravityAccStdDevZ           | Standard deviation of gravity acceleration in Z direction          
| 15             | tBodyAccJerkMeanX            | Average body jerk in X direction           
| 16             | tBodyAccJerkMeanY            | Average body jerk in Y direction       
| 17             | tBodyAccJerkMeanZ            | Average body jerk in Z direction          
| 18             | tBodyAccJerkStdDevX          | Standard deviation of body jerk in X direction           
| 19             | tBodyAccJerkStdDevY          | Standard deviation of body jerk in Y direction        
| 20             | tBodyAccJerkStdDevZ          | Standard deviation of body jerk in Z direction          
| 21             | tBodyGyroMeanX               | Average body rotation in X direction           
| 22             | tBodyGyroMeanY               | Average body rotation in Y direction         
| 23             | tBodyGyroMeanZ               | Average body rotation in Z direction           
| 24             | tBodyGyroStdDevX             | Standard deviation of body rotation in X direction            
| 25             | tBodyGyroStdDevY             | Standard deviation of body rotation in Y direction         
| 26             | tBodyGyroStdDevZ             | Standard deviation of body rotation in Z direction           
| 27             | tBodyGyroJerkMeanX           | Average body rotation jerk in X direction           
| 28             | tBodyGyroJerkMeanY           | Average body rotation jerk in Y direction        
| 29             | tBodyGyroJerkMeanZ           | Average body rotation jerk in Z direction          
| 30             | tBodyGyroJerkStdDevX         | Standard deviation of body rotation jerk in X direction           
| 31             | tBodyGyroJerkStdDevY         | Standard deviation of body rotation jerk in Y direction        
| 32             | tBodyGyroJerkStdDevZ         | Standard deviation of body rotation jerk in Z direction          
| 33             | tBodyAccMagMean              | Average magnitude of body acceleration           
| 34             | tBodyAccMagStdDev            | Standard deviation of magnitude of body acceleration        
| 35             | tGravityAccMagMean           | Average magnitude of gravity acceleration          
| 36             | tGravityAccMagStdDev         | Standard deviation of magnitude of gravity acceleration           
| 37             | tBodyAccJerkMagMean          | Average magnitude of body jerk        
| 38             | tBodyAccJerkMagStdDev        | Standard deviatiion of magnitude of body jerk          
| 39             | tBodyGyroMagMean             | Average magnitude of body rotation           
| 40             | tBodyGyroMagStdDev           | Standard deviation of magnitude of body rotation        
| 41             | tBodyGyroJerkMagMean         | Average magnitude of body rotation jerk       
| 42             | tBodyGyroJerkMagStdDev       | Standard deviation of magnitude of body rotation jerk           
| 43             | fBodyAccMeanX                | Average body acceleration in X direction        
| 44             | fBodyAccMeanY                | Average body acceleration in Y direction          
| 45             | fBodyAccMeanZ                | Average body acceleration in Z direction           
| 46             | fBodyAccStdDevX              | Standard deviation of body acceleration in X direction        
| 47             | fBodyAccStdDevY              | Standard deviation of body acceleration in Y direction          
| 48             | fBodyAccStdDevZ              | Standard deviation of body acceleration in Z direction           
| 49             | fBodyAccJerkMeanX            | Average body jerk in X direction         
| 50             | fBodyAccJerkMeanY            | Average body jerk in Y direction           
| 51             | fBodyAccJerkMeanZ            | Average body jerk in Z direction            
| 52             | fBodyAccJerkStdDevX          | Standard deviation of body jerk in X direction        
| 53             | fBodyAccJerkStdDevY          | Standard deviation of body jerk in Y direction          
| 54             | fBodyAccJerkStdDevZ          | Standard deviation of body jerk in Z direction           
| 55             | fBodyGyroMeanX               | Average body rotation in X direction        
| 56             | fBodyGyroMeanY               | Average body rotation in Y direction          
| 57             | fBodyGyroMeanZ               | Average body rotation in Z direction           
| 58             | fBodyGyroStdDevX             | Standard deviation of body rotation in X direction        
| 59             | fBodyGyroStdDevY             | Standard deviation of body rotation in Y direction          
| 60             | fBodyGyroStdDevZ             | Standard deviation of body rotation in Z direction           
| 61             | fBodyAccMagMean              | Average body rotation magnitude        
| 62             | fBodyAccMagStdDev            | Standard deviation of body rotation magnitude          
| 63             | fBodyBodyAccJerkMagMean      | Average magnitude of body jerk
| 64             | fBodyBodyAccJerkMagStdDev    | Standard deviation of magnitude of body jerk
| 65             | fBodyBodyGyroMagMean         | Average magnitude of body rotation
| 66             | fBodyBodyGyroMagStdDev       | Standard deviation of magnitude of body rotation
| 67             | fBodyBodyGyroJerkMagMean     | Average magnitude of body rotation jerk
| 68             | fBodyBodyGyroJerkMagStdDev   | Standard deviation of body rotation jerk




