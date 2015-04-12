library(dplyr)
library(tidyr)
# You should create one R script called run_analysis.R that does the following. 
# -------------------------------------------------------------
# Merges the training and the test sets to create one data set.
# -------------------------------------------------------------
# get feature names
feature_names <- read.table("UCI HAR Dataset/features.txt",
                            header=FALSE,
                            stringsAsFactors=FALSE)[[2]]

# load test/training data
load_data <- function(groupname) {
    subjects_path <- file.path("UCI HAR Dataset",
                               groupname,
                               paste0("subject_", groupname, ".txt"))
    X_path <- file.path("UCI HAR Dataset",
                        groupname,
                        paste0("X_", groupname, ".txt"))
    y_path <- file.path("UCI HAR Dataset",
                        groupname,
                        paste0("y_", groupname, ".txt"))
    subjects <- read.table(subjects_path, col.names=c("subject_id"))
    X <- read.table(X_path, col.names=feature_names)
    y <- read.table(y_path, col.names=c("activity"))
    tbl_df(cbind(subjects, X, y))
}

if(!exists("merged_data")) { # prevent reloading during dev
    test_data <- load_data("test")
    train_data <- load_data("train")
    merged_data <- tbl_df(rbind(test_data, train_data))
}

# ---------------------------------------------------------------------------------------
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# ---------------------------------------------------------------------------------------
extracted <- select(merged_data,
                    grep("\\.mean\\.|\\.std\\.|^activity$|^subject_id$",
                         colnames(merged_data)))

# ----------------------------------------------------------------------
# Uses descriptive activity names to name the activities in the data set
# ----------------------------------------------------------------------
# load labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                            header=FALSE,
                            stringsAsFactors=FALSE)[[2]]
# convert
descriptive_activities <- mutate(extracted,
                      activity = ordered(activity,
                                         levels=1:6,
                                         labels=activity_labels))

# ------------------------------------------------------------------
# Appropriately labels the data set with descriptive variable names. 
# ------------------------------------------------------------------
tmp_colnames <- colnames(descriptive_activities)
# expand shortened versions of various parts of labels,
# downcase, and add underscores in lieu of camelcasing
tmp_colnames <- sub("^f", "fft", tmp_colnames)
tmp_colnames <- sub("^t", "time", tmp_colnames)
tmp_colnames <- gsub("([A-Z])", " \\1", tmp_colnames)
tmp_colnames <- sub("\\.std\\.", " standard_deviation", tmp_colnames)
tmp_colnames <- gsub("[ \\.]+", "_", tmp_colnames)
tmp_colnames <- sub("[ _]+$", "", tmp_colnames)
tmp_colnames <- tolower(tmp_colnames)
colnames(descriptive_activities) <- tmp_colnames

# ------------------------------------------------------------------------
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
# ------------------------------------------------------------------------
by_activity_subject <- group_by(descriptive_activities, subject_id, activity)
summary <- summarise_each(by_activity_subject, funs(mean))
# add a nicer name to the summary columns
colnames(summary)[3:length(colnames(summary))] <- 
    gsub("(.*)", "mean(\\1)", colnames(summary)[3:length(colnames(summary))])

# write the final data that will get uploaded
write.table(summary, "result.txt", row.names=FALSE)