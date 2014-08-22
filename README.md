---
title: "Readme"
author: "cannyan"
date: "Thursday, August 21, 2014"
output: html_document
---

### run_analysis.R

There is one script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Prerequisites

In order for this script to be successful, the data should already be downloaded to your working directory.

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip this file and place the 'UCI HAR Dataset' folder into your working directory.

This script makes use of the 'reshape2' library and makes a call to it within the script. Please make sure the 'reshape2' library is available within your R session. If it is not already installed, use the `install.packages("reshape2")` command to install it.

### Output

This script will output a file called 'tidydata.txt' to your working directory.
