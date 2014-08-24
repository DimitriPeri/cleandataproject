cleandataproject
================
---
title: "Course Project (Getting and Cleaning Data)"
author: "dnp"
date: "Saturday, August 23, 2014"
output: html_document
---

Step 1:
-------
The data zip file is downloaded from the url. Then it is unziped and saved in the working directory.
To avoid empty spaces in the name of the file, it is renamed as "uciHarDataset".

```
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  
if (!file.exists("uciHarDataset")){  
    download.file(fileurl, destfile="uciHarDataset.zip")  
    datedownloaded <- date()  
    unzip("uciHarDataset.zip")  
    file.rename("UCI HAR Dataset", "uciHarDataset")  
}  
```

Step 2:
-------
The following files are read into R objects with relevant column names and, for the measurement variables, with the names of the features from feature.txt.
    
Files:
------
- features.txt
- X-test.txt
- X_train.txt
- y_test.txt
- y_train.txt
- subject_test.txt
- subject_train.txt
- activity_labels.txt
    
The activity labels are lower cased and annotations are eliminated.

```
features <- read.table("./uciHarDataset/features.txt", header=F, col.names=c("id","features"))
xtest <- read.table("./uciHarDataset/test/X_test.txt", header=F, col.names=(features$features))
xtrain <- read.table("./uciHarDataset/train/X_train.txt", header=F, col.names=(features$features))
ytest <- read.table("./uciHarDataset/test/y_test.txt", header=F, col.names="activity")
ytrain <- read.table("./uciHarDataset/train/y_train.txt", header=F, col.names="activity")
testsubject <- read.table("./uciHarDataset/test/subject_test.txt", header=F, col.names="subject")
trainsubject <- read.table("./uciHarDataset/train/subject_train.txt", header=F, col.names="subject")
activitylabels <- read.table("./uciHarDataset/activity_labels.txt", header=F, col.names=c("level","description"))
activitylabels$description <- tolower(activitylabels$description)
activitylabels$description <- sub("_", "", activitylabels$description,)
```

Step 3:
-------
The data objects are combined to create a unique dataset. 

1. The data with the activity identifications are combined with the data with the measurements
2. The results are combined with the data objects of the subjects
3. The test and training data objects are merged to create "data"

```
xtest <- cbind(ytest, xtest)
xtrain <- cbind(ytrain, xtrain)

xtest <- cbind(testsubject, xtest)
xtrain <- cbind(trainsubject, xtrain)

data <- merge(xtrain, xtest, all=T)
```

Step 4:
-------
The activity column numbers are replaced with the descriptive activity names from the description column of the "activitylabels" object.

Activity labels:
----------------
- walking
- walkingupstairs
- walkingdownstairs
- sitting
- standing
- laying

```
data$activity <-as.factor(data$activity)
levels(data$activity) <- as.factor(activitylabels$description)
```

Step 5:
-------
Only the measurements on the mean and standard deviation are extracted and subseted from "data"

```
data <- data[grep("subject|activity|mean|std",names(data),)]
```

Step 6:
-------
Descriptive variable names for the measurement features are created through appropriate substitutions and the names of the columns are changed.

```
descriptivenames <- names(data)
descriptivenames <- gsub("[.]", "", descriptivenames)
descriptivenames <- sub("^[t]", "time", descriptivenames) 
descriptivenames <- sub("^[f]", "FFT", descriptivenames)
descriptivenames <- sub("Acc", "Accelaration", descriptivenames)
descriptivenames <- sub("Gyro", "Gyroscope", descriptivenames)
descriptivenames <- sub("Mag", "Magnitude", descriptivenames)
descriptivenames <- sub("mean", "Mean", descriptivenames)
descriptivenames <- sub("std", "StdDev", descriptivenames)
descriptivenames <- sub("BodyBody", "Body", descriptivenames)

names(data) <- descriptivenames
```

Step 7:
-------
The final step. The aggregate function is used to create the second, independent tidy data set with the average of each variable for each activity and each subject.

```
tidydataset <- aggregate(data[,-(1:2)], list(subject=data$subject, activity=data$activity), mean)
```
Structure of "tidydataset" (sample):
------------------------------------
- 'data.frame':    180 obs. of  81 variables:
-  $ subject                                 : int  1 2 3 4 5 6 7 8 9 10 ...
-  $ activity                                : Factor w/ 6 levels "walking","walkingupstairs",..: 1 1 1 1 1 1 1 1 1 1 ...
-  $ timeBodyAccelarationMeanX               : num  0.277 0.276 0.276 0.279 0.278 ...
-  $ timeBodyAccelarationMeanY               : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
-  $ timeBodyAccelarationMeanZ               : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...
-  $ timeBodyAccelarationStdDevX             : num  -0.284 -0.424 -0.36 -0.441 -0.294 ...
-  $ timeBodyAccelarationStdDevY             : num  0.1145 -0.0781 -0.0699 -0.0788 0.0767 ...
-  $ timeBodyAccelarationStdDevZ             : num  -0.26 -0.425 -0.387 -0.586 -0.457 ...
-  $ timeGravityAccelarationMeanX            : num  0.935 0.913 0.937 0.964 0.973 ...
-  $ timeGravityAccelarationMeanY            : num  -0.2822 -0.3466 -0.262 -0.0859 -0.1004 ...
-  $ timeGravityAccelarationMeanZ            : num  -0.0681 0.08473 -0.13811 0.12776 0.00248 ...
