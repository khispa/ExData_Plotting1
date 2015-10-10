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
#Plot
plot(electric$Time, electric$Sub_metering_1, type = "l",col = "black", ylab = "Energy sub metering", xlab = "")
lines(electric$Time,electric$Sub_metering_2, col = "red")
lines(electric$Time,electric$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(1.5,1.5,1.5),col=c("black", "red", "blue"),cex=0.6)
#Save plot
dev.copy(png,'plot3.png')
dev.off()
