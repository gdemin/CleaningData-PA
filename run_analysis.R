### download and load data

if (!file.exists("data/fuci_har.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile ="data/fuci_har.zip"  )
    unzip("data/fuci_har.zip")
}