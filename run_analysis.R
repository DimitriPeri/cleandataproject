# Title: "Course Project (Getting and Cleaning Data)"
# Author: "dnp"
# Date: "Saturday, August 23, 2014"

# Data file downloading, unziping and renaming to a new name without empty spaces

fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("uciHarDataset")){
    download.file(fileurl, destfile="uciHarDataset.zip")
    datedownloaded <- date()
    unzip("uciHarDataset.zip")
    file.rename("UCI HAR Dataset", "uciHarDataset")
}

# Reading data from files and creating the relevand objects with the appropriate column names

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

# Combining the data objects into a unique dataset
# 1. Measurements' data sets with activity identifications

xtest <- cbind(ytest, xtest)
xtrain <- cbind(ytrain, xtrain)

# 2. With subjects

xtest <- cbind(testsubject, xtest)
xtrain <- cbind(trainsubject, xtrain)

# 3. Merging training and test data sets to create one dataset

data <- merge(xtrain, xtest, all=T)

# Labelling the activity column with descriptive activity names

data$activity <-as.factor(data$activity)
levels(data$activity) <- as.factor(activitylabels$description)

# Extracting only the measurements on the mean and standard deviation

data <- data[grep("subject|activity|mean|std",names(data),)]

# Creating descriptive variable names for the measurement features through appropriate substitutions

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

# Changing the column names of the dataset with the descriptive names

names(data) <- descriptivenames

# Creating the second, independent tidy data set with the average of each variable for each activity and each subject

tidydataset <- aggregate(data[,-(1:2)], list(subject=data$subject, activity=data$activity), mean)

# output
write.table(tidydataset, file = "tidydataset.txt", row.names = F)

