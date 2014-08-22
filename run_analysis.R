## run_analysis.R downloads a zip file, patches together different data sets, and 
## creates a tidy data set called tidydata.txt and places it into the folder "UCI HAR Dataset"

## Download data and place into current working directory
workingDir <- getwd()
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- paste(workingDir,"/RepResearchAssignment2.zip", sep="")
download.file(url=dataURL, destfile=destFile, method="curl")

## Unzip the zip file, producing the folder "UCI HAR Dataset"
unzip(zipfile=destFile)

## Read in the data from the Test set
## X_test is the actual data, various things being measured
## y_test is what activity they were doing
subject_test <- read.table(file=paste(workingDir,"/UCI HAR Dataset/test/subject_test.txt",sep=""), header=FALSE)
X_test <- read.table(file=paste(workingDir,"/UCI HAR Dataset/test/X_test.txt",sep=""), header=FALSE)
y_test <- read.table(file=paste(workingDir,"/UCI HAR Dataset/test/y_test.txt",sep=""), header=FALSE)

## Read in the data from the Train set
## subject_train is the ID number of the person measured
## X_train is the actual data, various things being measured
## y_train is what activity they were doing
subject_train <- read.table(file=paste(workingDir,"/UCI HAR Dataset/train/subject_train.txt",sep=""), header=FALSE)
X_train <- read.table(file=paste(workingDir,"/UCI HAR Dataset/train/X_train.txt",sep=""), header=FALSE)
y_train <- read.table(file=paste(workingDir,"/UCI HAR Dataset/train/y_train.txt",sep=""), header=FALSE)

## Merge the Test data into one data frame, merge the Train data into one data frame
test <- data.frame(subject_test,y_test,X_test)
train <- data.frame(subject_train,y_train,X_train)

## Merge the previous two data frames into one data frame
data <- rbind(test,train)

## Read in the column names for the 561 columns of X_test and X_train
## $V2 is used because the column names are found in the second column of the file
XcolNames <- read.table(file=paste(workingDir,"/UCI HAR Dataset/features.txt",sep=""))$V2

## Change the XcolNames to a character vector, concatenate with "SubjectID" and "ActivityID"
## And then rename the columns in the data frame
XcolNames <- as.character(XcolNames)
columnnames <- c("SubjectID","ActivityID",XcolNames)
colnames(data) <- columnnames

## Subset the columns that contain either mean or standard deviation values.
## There was a consensus on the Rep Research forums that column names containing
## "mean()" or "std()" were the columns that we were truly interested in.
## The first two columns were also included.
## Note that grep() was used here, and grepl() would have served equivalently.
## Lastly note that \\ was used because ( and ) are reserved characters.
data_ms <- data[,grep("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",colnames(data))]

## Now get rid of some nonstandard symbols in our column names.
names(data_ms) <- gsub("-","",names(data_ms))
names(data_ms) <- gsub("\\(","",names(data_ms))
names(data_ms) <- gsub("\\)","",names(data_ms))
names(data_ms) <- gsub("mean","Mean",names(data_ms))
names(data_ms) <- gsub("std","StdDev",names(data_ms))

## Now change the values "1", "2", "3", "4", "5" and "6" to those found in
## the file "activity_labels.txt.  The labels, respectively, are: "Walking",
## "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying".
activityLabels <- read.table(file=paste(workingDir,"/UCI HAR Dataset/activity_labels.txt",sep=""))$V2

## Standardize those activity labels just a bit, remove the underscore and go to lowercase.
activityLabels <- gsub("_","",activityLabels)
activityLabels <- tolower(activityLabels)

## Now it's time to go ahead and do the swap, from numbers to labels.
## We'll use a little indexing trick to make the replacements
data_ms$ActivityID <- activityLabels[data_ms$ActivityID]

## Now time to aggregate the data, taking the means of each variable for each 
## combination of Subject and Activity
tidydata <- aggregate(data_ms[,3:68],by=list(data_ms$SubjectID,data_ms$ActivityID),FUN=mean)

## And lastly, need to rename the first two columns due to aggregate() having renamed them to Group.1 Group.2
colnames(tidydata)[1:2] <- c("SubjectID","ActivityID")

## At this point, we are finished creating our tidy data set.
## The next step is to write this to a text file.
write.table(x=tidydata,file=paste(workingDir,"/UCI HAR Dataset/tidydata.txt", sep=""), row.names=FALSE)




