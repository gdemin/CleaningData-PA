CleaningData-PA
===============

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Script in this repository run_analysis.R that does the following. 

    Downloads and unzips ray data
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

So all you need - clone this repository and run script. It downloads data from site, transforms them to tidy dataset and saves to the working directory. Also it saves description of variables for codebook (file CodeBook.md). Further this file should be edited manually to add text in plain English. 

