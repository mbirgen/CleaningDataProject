subject_train <-read.table("./data/train/subject_train.txt")
subject_test <-read.table("./data/test/subject_test.txt")
train  <-read.table("./data/train/X_train.txt")
test <- read.table("./data/test/X_test.txt")
label_train  <-read.table("./data/train/y_train.txt")
label_test <- read.table("./data/test/y_test.txt")

features <- read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")

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
