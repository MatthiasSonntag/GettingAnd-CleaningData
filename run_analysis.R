

# 1. Merge data to new dataset

#read data: X_train,X_test, 
x.test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
x.train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
#make numerical data body and remove the previously loaded data
databody <- rbind(x.train,x.test)


#read dataset with raw column names of the numerical data body. 
#The raw names are stored in the second column (named V2).
features <- read.table("~/UCI HAR Dataset/features.txt",
                       stringsAsFactors=F, col.names=c("number","originalNames"))

# assign original names to the databody
names(databody) <- features$originalNames

#Add the colum subject and activitysubj
#additional col.: subject build from subject_train.txt an subject_test.txt
sub.test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
sub.train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(sub.train,sub.test)

#additional col.: activity subject build from y_train.txt an y_test.txt
activity.test <- read.table("~/UCI HAR Dataset/test/y_test.txt")
activity.train <- read.table("~/UCI HAR Dataset/train/y_train.txt")
activity <- rbind(activity.train,activity.test)

#Concatenate the new columns to the databody thus obtaining the whole dataset, 
#which is called whole.data
whole.data <- data.frame(subject,activity,databody)

#2. Extract mean and std measurements
#get the colum names of the whole.data dataset
ColumnNames <- colnames(whole.data)

#from which to extract the mean and standard deviation columns 
#and preserve the subject and activity column
col.indices <- c( which(grepl("V1"  ,ColumnNames)==T),
                  which(grepl("mean",ColumnNames)==T),
                  which(grepl("std", ColumnNames)==T))
meanSdData <- whole.data[,col.indices]



#3. Use desriptive names to decribe the activies in the respective column
#read activity labels
activity.labels <- read.table("~/UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F, col.names=c("number","action"))

#dimensions of activity.lables
#dal[1] corresponds to the number of different activities
dal <- dim(activity.labels)

#rename activities using a loop from 1 to number of columns of activity.labels
for (i in 1:dal[1]){
      #if the activity is 1 then the second coluumn of the 1. row of 
      #activity.labels is assigned to it,which is the decriptive activity name. 
      #This happens for each number fom 1 up to 6.
      meanSdData[meanSdData$V1.1==as.character(i),2]<-activity.labels[i,2] 
}

#4. Give the column names descriptive variable names
meanSdDataColumns <- colnames(meanSdData)
colnames(meanSdData) <- c("Subject","Activity",
                           meanSdDataColumns[3:length(meanSdDataColumns)])

#Give the columns descriptive Names
newColnames <- gsub("BodyBody","Body",colnames(meanSdData),fixed=T)
newColnames <- gsub(".","",newColnames,fixed=T)
newColnames <- gsub("tBody","TimeDomain.Body",newColnames,fixed=T)
newColnames <- gsub("tGravity","TimeDomain.Gravity",newColnames,fixed=T)
newColnames <- gsub("fBody","FrequencyDomain.Body",newColnames,fixed=T)
newColnames <- gsub("Mag","Magnitude",newColnames,fixed=T)
newColnames <- gsub("Acc","Acceleration",newColnames,fixed=T)
newColnames <- gsub("Gyro","AngularVelocity",newColnames,fixed=T)
newColnames <- gsub("std",".StandardDeviation",newColnames,fixed=T)
newColnames <- gsub("mean",".Mean",newColnames,fixed=T)
newColnames <- gsub("X",".X.Direction",newColnames,fixed=T)
newColnames <- gsub("Y",".Y.Direction",newColnames,fixed=T)
newColnames <- gsub("Z",".Z.Direction",newColnames,fixed=T)
newColnames <- gsub("MeanFreq","MeanFrequency",newColnames,fixed=T)
colnames(meanSdData) <- newColnames


#5. Create a new datset with the average of each variable for each activity and each subject
library(data.table)
#change from class data.frame to data.table
meanSdData <- data.table(meanSdData)
#setkey for fast use of data.table
setkey(meanSdData,Subject,Activity)
# create new tidy dataset Average
Average <- meanSdData[,lapply(.SD,mean),by=list(Subject,Activity)]
#write dataset without row names to txt-file
write.table(Average,"~/Average.txt",row.names=F)


