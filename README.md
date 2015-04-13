# getdata-013 Project

## Files:
- README.md - this file
- run_analysis.R - performs analysis steps per assignment
- CodeBook.md - describes the variables, the data, and transformations used in run_analysis.R and it's final output

## Prerequisites:
The following R Packages need to be installed to run the script:

- dplyr

## Usage:
- Download the original dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Extract it into the working directory (same directory as this file).  You should end up with a "UCI HAR Dataset" folder containing all of the extracted data files
- Source "run_analysis.R" in R.  The script will run automatically.
- The uploadable result file will be output in the working directory as result.txt (considered tidy per https://class.coursera.org/getdata-013/forum/thread?thread_id=31)

## Reading result.txt
result.txt was outputted using:

    write.table(summary, "result.txt", row.names=FALSE)
    
and can thus be open and viewed using:

    tb <- read.table("result.txt", header = TRUE); View(tb)