#run_analysis.R

library(plyr)
library(dplyr)

#Merges the training and the test sets to create one data set.

setwd('UCI HAR Dataset')
subject_test <- read.table('test/subject_test.txt')
y_test <- read.table('test/y_test.txt')
X_test <- read.table('test/X_test.txt')

subject_train <- read.table('train/subject_train.txt')
y_train <- read.table('train/y_train.txt')
X_train <- read.table('train/X_train.txt')

subject <- rbind(subject_test,subject_train)
names(subject) <- 'subject'
y <- rbind(y_test,y_train)
names(y) <- 'activity_id'
X <- rbind(X_test,X_train)
features <- read.table('features.txt')
names(X) <- features[,2]

dataset <- cbind(y,subject,X)

#Extracts only the measurements on the mean and standard deviation for each measurement. 

data_subset <- dataset[,c(1,2,grep('std|mean',names(dataset)))]

#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table('activity_labels.txt')
names(activity_labels) <- c('activity_id','activity')

#data_named <- merge(activity_labels,data_subset)[,-1]
data_named <- join(data_subset,activity_labels)[,-1] #need plyr

#Appropriately labels the data set with descriptive variable names. 
# already done in previous steps

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- aggregate(. ~subject + activity, data_named, mean)
write.table(tidy_data, "tidy_data.txt",row.name=FALSE)

