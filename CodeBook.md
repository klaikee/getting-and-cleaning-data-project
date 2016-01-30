##CodeBook

###Data source
Data: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
Description of data: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
	
###Transforming the data
#####Step 1 
Merge data from:
- `UCI HAR Dataset/train/subject_train.txt`
- `UCI HAR Dataset/train/x_train.txt`
- `UCI HAR Dataset/train/y_train.txt`
- `UCI HAR Dataset/test/subject_test.txt`
- `UCI HAR Dataset/test/x_test.txt`
- `UCI HAR Dataset/test/y_test.txt`

#####Step 2
Subset the merged data set to keep only measurements on the mean and standard deviation for each measurement.  
Variables where the name contained "mean()" or "std()" were considered.
	
#####Step 3
Replace activity IDs in the merged data set with descriptive activity names from `UCI HAR Dataset/activity_labels.txt`
	
#####Step 4
Label the merged data set with variable names from features.txt.  
The following changes were applied to make variable names descriptive:
- changed variable name to all lower case
- removed all instances of "()" from the variable name
- removed all instances of "-" from the variable name
- if the first character was "t", replaced with the more descriptive "time" in the variable name
- if the first character was "f", replaced with the more descriptive "freq" in the variable name
- replaced "std" with the more descriptive "stddev" in the variable name

#####Step 5
Create a separate tidy data set from the merged data set with the mean of each variable for each activity and each subject

In the tidy data set: 
- each variable forms a column: 68 columns
- each observation forms a row: 180 rows (30 subjects * 6 activities)

#####Variables in tidydata.txt data set  
 
*Identifiers*  
```
subject - The ID of the test subject  
activity - The activity performed by the test subject
- Walking
- Walking Upstairs
- Walking Downstairs
- Sitting
- Standing
- Laying  
```

*Measurements* (the mean of each measurement for each activity and each subject)

	meantimebodyaccmeanx              
	meantimebodyaccmeany             
	meantimebodyaccmeanz              
	meantimebodyaccstddevx           
	meantimebodyaccstddevy            
	meantimebodyaccstddevz           
	meantimegravityaccmeanx           
	meantimegravityaccmeany          
	meantimegravityaccmeanz           
	meantimegravityaccstddevx        
	meantimegravityaccstddevy         
	meantimegravityaccstddevz        
	meantimebodyaccjerkmeanx          
	meantimebodyaccjerkmeany         
	meantimebodyaccjerkmeanz          
	meantimebodyaccjerkstddevx       
	meantimebodyaccjerkstddevy        
	meantimebodyaccjerkstddevz       
	meantimebodygyromeanx             
	meantimebodygyromeany            
	meantimebodygyromeanz             
	meantimebodygyrostddevx          
	meantimebodygyrostddevy           
	meantimebodygyrostddevz          
	meantimebodygyrojerkmeanx         
	meantimebodygyrojerkmeany        
	meantimebodygyrojerkmeanz         
	meantimebodygyrojerkstddevx      
	meantimebodygyrojerkstddevy       
	meantimebodygyrojerkstddevz      
	meantimebodyaccmagmean            
	meantimebodyaccmagstddev         
	meantimegravityaccmagmean         
	meantimegravityaccmagstddev      
	meantimebodyaccjerkmagmean        
	meantimebodyaccjerkmagstddev     
	meantimebodygyromagmean           
	meantimebodygyromagstddev        
	meantimebodygyrojerkmagmean       
	meantimebodygyrojerkmagstddev    
	meanfreqbodyaccmeanx              
	meanfreqbodyaccmeany             
	meanfreqbodyaccmeanz              
	meanfreqbodyaccstddevx           
	meanfreqbodyaccstddevy            
	meanfreqbodyaccstddevz           
	meanfreqbodyaccjerkmeanx          
	meanfreqbodyaccjerkmeany         
	meanfreqbodyaccjerkmeanz          
	meanfreqbodyaccjerkstddevx       
	meanfreqbodyaccjerkstddevy        
	meanfreqbodyaccjerkstddevz       
	meanfreqbodygyromeanx             
	meanfreqbodygyromeany            
	meanfreqbodygyromeanz             
	meanfreqbodygyrostddevx          
	meanfreqbodygyrostddevy           
	meanfreqbodygyrostddevz          
	meanfreqbodyaccmagmean            
	meanfreqbodyaccmagstddev         
	meanfreqbodybodyaccjerkmagmean    
	meanfreqbodybodyaccjerkmagstddev 
	meanfreqbodybodygyromagmean       
	meanfreqbodybodygyromagstddev    
	meanfreqbodybodygyrojerkmagmean   
	meanfreqbodybodygyrojerkmagstddev

	
