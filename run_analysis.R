## Load data from computer into a variety of tables.
subject_train <-read.table("./data/train/subject_train.txt")
subject_test <-read.table("./data/test/subject_test.txt")
train  <-read.table("./data/train/X_train.txt")
test <- read.table("./data/test/X_test.txt")
label_train  <-read.table("./data/train/y_train.txt")
label_test <- read.table("./data/test/y_test.txt")

features <- read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")

## Add names to column names, and add activities and subjects to data.frames
## in both train and test

colnames(train) <- features[,2]
colnames(test) <- features[,2]
colnames(activities) <- c("key", "activity")
colnames(label_test) <- "label"
colnames(label_train) <- "label"
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

library(dplyr)
activity_test <- merge(label_test, activities, by.x = "label", by.y = "key")
activity_train <- merge(label_train, activities, by.x = "label", by.y = "key")
activity_test <- select(activity_test, activity)
activity_train <- select(activity_train, activity)

train <-cbind(subject_train,activity_train, train)
test <-cbind(subject_test,activity_test, test)


## Code assumes data has been downloaded, merged with subject and activity, 
## and saved into two files, test and train.

## First merge tables test and train.
my_df <-rbind.data.frame(train, test)
## Second, identify columns that deal with mean and standard deviation.
col_names <- grep("mean\\(|std\\(", names(my_df))
## Make sure we don't use information on the subject
col_names <- c(1,2, col_names)
## Select appropriate columns for the new data frame.
my_df <- my_df[,col_names]
## Make all names lower case and clean extra symbols
names(my_df) <- tolower(names(my_df))
names(my_df) <-gsub("\\(\\)", "", names(my_df))
## Clarify names by expanding abreviations
names(my_df) <-gsub("^t", "time", names(my_df))
names(my_df) <-gsub("^f", "force", names(my_df))
names(my_df) <-gsub("std", "standarddeviation", names(my_df))
names(my_df) <-gsub("acc", "acceleration", names(my_df))
names(my_df) <-gsub("mag", "magnitude", names(my_df))
## name dataframe something useful
trainplustrialfulldata <- my_df
View(trainplustrialfulldata)

library(dplyr)
## Group dataframe by subject and activity
my_df2 <-group_by(my_df, subject, activity)
## Create new dataframe that calculates the mean of grouped data
my_df_sum <-summarize_all(my_df2, mean)
trainplustrialmeans <- my_df_sum
View(trainplustrialmeans)

