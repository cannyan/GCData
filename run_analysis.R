## Read in the features.txt file which will become our column names for our data
features <- read.table("UCI HAR Dataset/features.txt")

## Read in the Activity labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Read in the test data
test <- read.table("UCI HAR Dataset/test/X_test.txt")
testrows <- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubj <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read in the train data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainrows <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainsubj <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merge the test and the train sets to create one data set
data <- rbind(test, train)

## Append the column names from the features.txt file
colnames(data) <- features[,2]

## Extract only the measurements on the mean and standard deviation for each
## measurement
meanstd <- data[, grep("-mean\\(\\)|-std\\(\\)", colnames(data))]

## Add a column for Activity Name to the Y data
testrows$Activity <- labels[testrows[,1],2]
trainrows$Activity <- labels[trainrows[,1],2]

## Combine the test and train data together for the Y data and the subject data
rows <- rbind(testrows, trainrows)
subjects <- rbind(testsubj, trainsubj)

## Add the Subject and Activity information to the beginning of the data table
meanstd <- cbind(subjects, rows[,2], meanstd)

## Give the Subject and Activity columns appropriate names
colnames(meanstd)[1] <- "subject"
colnames(meanstd)[2] <- "activity"

##Clean up the variable names by removing hyphens, underscores, parentheses, and
##Upper Case
colnames(meanstd) <- gsub("-|\\(|\\)", "", colnames(meanstd))
colnames(meanstd) <- tolower(colnames(meanstd))
meanstd[,2] <- gsub("_", "", meanstd[,2])
meanstd[,2] <- tolower(meanstd[,2])

## Melt and recast the required data into the required tidy data set
library("reshape2")
tidymelt <- melt(meanstd, id=c("subject", "activity"))
tidydata <- dcast(tidymelt, subject + activity ~ variable, mean)

## Write the new tidy data set to a new file
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
