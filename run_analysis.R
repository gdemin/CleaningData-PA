### download and load data

if (!file.exists("data/fuci_har.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile ="data/fuci_har.zip"  )
    unzip("data/fuci_har.zip")
}

# Read feature Description
codeframe = read.table("UCI HAR Dataset/features.txt",header=FALSE)
codeframe = setNames(codeframe,c("var_id","var_description"))

# read activity labels 
activity = read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)


# read train data 
x_train = read.table("UCI HAR Dataset/train/x_train.txt",header=FALSE)
y_train = read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)

train = cbind(subject_train,y_train,x_train)

# read test data
x_test = read.table("UCI HAR Dataset/test/x_test.txt",header=FALSE)
y_test = read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)

test = cbind(subject_test,y_test,x_test)

# combine test and train samples
data_set = rbind(test,train)

# set names of columns 
data_set =setNames(data_set,c("Subject","Activity",codeframe$var_description))

# Encode activity
data_set$Activity = activity$V2[data_set$Activity]

any(is.na(data_set$Activity)) # check that all labels applied. Should be FALSE

# Keep only mean and std

mean_std = grepl("(mean|std)",tolower(colnames(data_set))) & !grepl("angle",tolower(colnames(data_set)))
mean_std[1:2] = TRUE # we also need subject and activity

tidy = data_set[,mean_std]
# Just for beauty - replace minus with underscore and completly remove brackets

colnames(tidy) = gsub("-","_",colnames(tidy))
colnames(tidy) = gsub("(\\(|\\))","",colnames(tidy),perl=TRUE)

# save tidy dataset
write.table(tidy, file = "tidy.txt", row.names = FALSE, sep=",")

# save codebook. This file further will be edited manually. 

codebook = data.frame("Number" = seq_along(colnames(tidy)),"Variable_name" = colnames(tidy))
write.table(codebook, file = "CodeBook.md", row.names = FALSE, sep=" ")

