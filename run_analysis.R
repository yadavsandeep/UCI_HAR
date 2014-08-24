#1. Merge Training and Test data sets
# It is assumed that working directory is set to UCI HAR Dataset under which train and test directories are saved

#Load features labels
features <- read.table("./features.txt") 
names(features) <- c("Features") 

# Load Activity labels 
activities <- read.table("./activity_labels.txt") 
names(activities) <- c("ID", "Activity") 

#Loading and Combining Test Data

xTestDF <- read.table("./test/X_test.txt") 
colnames(xTestDF) <- features[,2]

yTestDF <- read.table("./test/y_test.txt") 
colnames(yTestDF) <- c("Activity") 

subjectTestDF <- read.table("./test/subject_test.txt") 
colnames(subjectTestDF) <- c("Subject") 

testData <- cbind(subjectTestDF, yTestDF, xTestDF)
                     
#Loading and Combining Training Data

xTrainDF <- read.table("./train/X_train.txt") 
colnames(xTrainDF) <- features[,2]

yTrainDF <- read.table("./train/y_train.txt") 
colnames(yTrainDF) <- c("Activity") 

subjectTrainDF <- read.table("./train/subject_train.txt") 
colnames(subjectTrainDF) <- c("Subject") 

trainData <- cbind(subjectTrainDF, yTrainDF, xTrainDF)

#Merge test and train data using rbind

fullData <- rbind(testData,trainData)



featureIndices<-grep("(mean\\(\\))|(std\\(\\))",features) 
filteredData<-fullData[,featureIndices] 
names(filteredData)<-gsub("\\-|(\\(\\))","",names(filteredData)) 
names(filteredData)<-gsub("mean","Mean",names(filteredData)) 
names(filteredData)<-gsub("std","Std",names(filteredData)) 
names(filteredData)<-gsub("^t","time",names(filteredData)) 
names(filteredData)<-gsub("^f","freq",names(filteredData)) 


 #calculates means of mean and std measurements across activity and subject 
library(plyr)
meanTidyData<-ddply(filteredData, .(subjectid, activity), numcolwise( mean ) ) 

 

#writes to tab-delimited text file 
write.table(meanTidyData,file="tidyData.txt",sep="\t") 




