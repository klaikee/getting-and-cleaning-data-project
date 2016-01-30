##Coursera Getting and Cleaning Data Assignment

Details of the data and transformations can be found in [CodeBook.md](./CodeBook.md)

###Summary of assignment instructions:

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###To use the R script
1. Download and extract the [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory.
2. Add run_analysis.R to the working directory.
3. Use `source("run_analysis.R")` in RStudio to:
  - Combine the training and test data sets into one
  - Extract the measurements on the mean and standard deviation
  - Add descriptive activity names
  - Label the variables
  - Generate a tidy data set with the average of each variable for each activity and each subject
  - Write the tidy data to a file in the working directory called tidydata.txt 
4. Use `data <- read.table("tidydata.txt", header = TRUE)` in RStudio to read the file.

