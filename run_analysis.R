# Module Getting and Cleaning Data, week 4
# Getting and Cleaning Data Course Project
#
# Assignment:
# You should create one R script called run_analysis.R that does the following.
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##-------------------------------------------------------
##----- Set location where data is stored (by user)
##-------------------------------------------------------

## Copy path where data and script is stored
folderpath<-"C:/Users/path/to/data"

##-------------------------------------------------------
##-----Set working directory
##-------------------------------------------------------

setwd(folderpath)
rm(folderpath)

##-------------------------------------------------------
##-----Import datasets
##-------------------------------------------------------

#import subject data from both groups, combine and rename column
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")
subjects<-rbind(subject_test, subject_train)
names(subjects)<-"subject"
rm(subject_test)
rm(subject_train)

#import measurements data from both groups and combine
X_test<-read.table("X_test.txt")
X_train<-read.table("X_train.txt")
measurements<-rbind(X_test, X_train)
rm(X_test)
rm(X_train)

#import activity data from both groups, combine and  rename column
Y_test<-read.table("Y_test.txt")
Y_train<-read.table("Y_train.txt")
activities<-rbind(Y_test, Y_train)
names(activities)<-"activity"
rm(Y_test)
rm(Y_train)

#import activitylabels
activitylist <- read.table("activity_labels.txt")

#import descriptive names of variables in measurements
#only second columns is needed
measurementvariables <- read.table("features.txt", stringsAsFactors=FALSE)
measurementvariables <- measurementvariables[,2]

##-------------------------------------------------------
##-----Rename values and variables in activities
##-------------------------------------------------------

#rename the values in activities$activity by descriptive names from activitylist
activities$activity <- activitylist[activities[,1], 2]
activities$activity <- gsub(" ", "", activities$activity)
rm(activitylist)

##-------------------------------------------------------
##-----Take subset of variables in measurements and rename
##-------------------------------------------------------

#check if values in measurementvariables contains 'std' or 'mean', 
#store results as TRUE/FALSE in MeanStdColumns
MeanStdColumns <- grepl("(std|mean[^F])", measurementvariables)

#only keep the columns in measurements that are TRUE in MeanstdColumns
#66 variables 
measurements <- measurements[, MeanStdColumns]

#rename the columns in meausrements, use names from columns measurementvariables
#that have a TRUE value in MeanStdColumns
names(measurements) <- measurementvariables[MeanStdColumns]
rm(MeanStdColumns)
rm(measurementvariables)

##-------------------------------------------------------
##-----Combine data and create tidy data set
##-------------------------------------------------------

# combine the subject, activities and measurements
totalset<-cbind(subjects,activities,measurements)
rm(subjects)
rm(activities)
rm(measurements)

## new dataset 'Averageset' with average of each variable for each activity and each subject.
averageset<-aggregate(totalset[, 3:68], list(totalset$subject, 
                                             totalset$activity), mean)
names(averageset)[names(averageset) == 'Group.1'] <- 'subject'
names(averageset)[names(averageset) == 'Group.2'] <- 'activity'

#new dataset is exported to txt file
write.table(averageset, file = "./DatasetTidy.txt")
