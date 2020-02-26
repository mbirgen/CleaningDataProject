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

