# Welcome to the my solution for assignment 2 of Getting and Cleaning Data, july 2014.

#### Here is a link to the data set home page: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Grading this assignment
If for some reason my tidy data set does not appear on the Coursera webpage of Reproducible Research, please find it in the GitHub repository: https://github.com/ibanmd/RepResearchAssgn2  It is called "tidydata.txt"   
I have written most of this assignment in an informal tone, because I know that my audience also worked on the same material and is familiar with it.

### Making my script work on your Windows computer  
***Note*** In order to make this script work on a Windows computer (it was made to work on a Mac), ***replace*** lines 6, 7 and 8 of my script with these 3 lines:

dataURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"   
destFile <- paste(workingDir,"/RepResearchAssignment2.zip", sep="")    
download.file(url=dataURL, destfile=destFile)    

Basically, in order to work on a Windows computer, the "https" is changed to "http" and the method="curl" is removed.

## What the script does
The script reads in the various data sets found in the folder "UCI HAR Dataset", pieces them together into one big data frame, and then finds the mean for each column and for each unique combination of Subject ID and Activity ID. After it does this, it creates a text file called "tidydata.txt" inside that same folder.

## How the script works
All that is required for the script to work is to simply run it! ***See note below***  Here is a quick summary of what the my version of run_analysis.R does:  

1. Downloads the .zip file from Coursera into your working directory.  I am not certain that this will work on any computer, but it should work on any Mac.
2. Unzips the file, creating the "UCI HAR Dataset"" folder.
3. Loads all the various data sets into R and combines them into 1 data frame, of dimension 563x10299
4. Adds in the column names to the data frame
5. Uses grep() to subset the data frame to include columns with "mean()" or "std()"
6. Uses gsub() to clean up the column names
7. Replaces the numbers 1 through 6 in the Activity ID column with their corresponding names
8. Uses aggregate() to take the mean of each column by each combination of Subject and Activity
9. Creates a text file of the resulting 180x68 data frame and puts it into the "UCI HAR Dataset" folder

