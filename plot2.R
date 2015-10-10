#Set wd: setwd("/Users/khispa/ExData_Plotting1")
#Read the dataset, that must be in wd
electric <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE,na.strings = "NA")
#Correct the data types
for (i in 3:9) {
  electric[,i] <- as.numeric(electric[,i])
}
electric[,2] <- as.POSIXct(paste(electric[,1],electric[,2]),format ="%d/%m/%Y %T")
#Subset the selected dates (fix it)
electric <- subset(electric,as.Date("2007-01-31")< as.Date(electric[,2])&as.Date(electric[,2])<as.Date("2007-02-03"))
#plot
plot(electric[,2], electric[,3], type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
#Save plot
dev.copy(png,'plot2.png')
dev.off()
