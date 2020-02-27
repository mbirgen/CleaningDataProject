# CleaningDataProject
Getting and Cleaning Data Course Project
This is a project as part of the Coursera course of the same name.

## Scripts
The repo contains one script.

### run_analysis.R
This script 
1. looks in the /data folder for relevant files
2. uploads the files
3. merges the files into two data files called train and trial
4. merges train and trial into a single data file
5. creates a smaller data file that only includes data on means and standard deviations called trainplustrialfulldata
6. improves names of columns
7. groups trainplustrialfulldata by subject and activity
8. creates a smaller data fill that only includes means of the mean and standard deviation data called trainplustrialmeans

#### Requirements
-- The necessary files in the /data folder are 
* ./data/features.txt
 * ./data/activity_labels.txt
 * ./data/train/subject_train.txt
 * ./data/train/X_train.txt
 * ./data/train/y_train.txt
 * ./data/test/subject_test.txt
 * ./data/test/X_test.txt
 * ./data/test/y_test.txt
