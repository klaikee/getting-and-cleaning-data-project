# STEP 1: Merges the training and the test sets to create one data set.
# The data must already be downloaded and extracted into the working directory

#read the test data sets
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#merge the test data sets horizontally
xysubjecttest <- cbind(subjecttest, ytest, xtest)

#read the train data sets
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#merge the train data sets horizontally
xysubjecttrain <- cbind(subjecttrain, ytrain, xtrain)

#merge the test and train data sets 
mergeddata <- rbind(xysubjecttest, xysubjecttrain)


# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#read the variable names data set
features <- read.table("./UCI HAR Dataset/features.txt")

#subset mean and std data from the merged data using the variable names
meanstddata <- cbind(mergeddata[,c(1,2)], mergeddata[,grep(paste(c("std\\(\\)","mean\\(\\)"),collapse="|"), features$V2)+2])


# STEP 3: Uses descriptive activity names to name the activities in the data set

#provide descriptive activity names
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
labelv <- as.vector(activitylabels[,2])
names(labelv) <- activitylabels[,1]
meanstddata$V1.1 <- labelv[meanstddata$V1.1]


# STEP 4: Appropriately labels the data set with descriptive variable names.

#Label the data set variables
names(meanstddata) <- c("subject", "activity", as.character(features[grep(paste(c("std\\(\\)","mean\\(\\)"),collapse="|"), features$V2),2]))

#Make the variable names more descriptive
names(meanstddata) <- tolower(names(meanstddata)) #change names to lower case
names(meanstddata) <- gsub("-","", names(meanstddata)) #remove "-" from the names
names(meanstddata) <- gsub("\\(\\)","", names(meanstddata)) #remove "()" from the names"
names(meanstddata) <- gsub("^t","time", names(meanstddata)) #replace "t" with "time"
names(meanstddata) <- gsub("^f","freq", names(meanstddata)) #replace "f" with "freq" for frequency
names(meanstddata) <- gsub("std","stddev", names(meanstddata)) #replace "std" with "stddev" for standard deviation
 

# STEP 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
# calculate the average of each variable for each activity and each subject.
tidymeanstddata <- ddply(meanstddata, .(subject, activity),  function(x) colMeans(x[, -c(1,2)]))
# rename the variables to represent the mean data
names(tidymeanstddata)[-c(1,2)] <- paste0("mean", names(tidymeanstddata)[-c(1,2)])

# write data to a file in the working directory
write.table(tidymeanstddata, "tidydata.txt", row.name=FALSE)
