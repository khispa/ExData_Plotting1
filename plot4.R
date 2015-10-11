#Set your working directory: setwd("yourworkingdirectory")
#Read the dataset, that must be in wd
electric <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE,na.strings = "NA")
#Correct the data types
for (i in 3:9) {
  electric[,i] <- as.numeric(electric[,i])
}
electric[,2] <- as.POSIXct(paste(electric[,1],electric[,2]),format ="%d/%m/%Y %T")
#Subset the selected dates (fix it)
electric <- subset(electric,as.Date("2007-01-31")< as.Date(electric[,2])&as.Date(electric[,2])<as.Date("2007-02-03"))
#Set area for plots
par(mfrow=c(2,2))
#Plots
plot(electric[,2], electric[,3], type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
plot(electric[,2], electric$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(electric$Time, electric$Sub_metering_1, type = "l",col = "black", ylab = "Energy sub metering", xlab = "")
lines(electric$Time,electric$Sub_metering_2, col = "red")
lines(electric$Time,electric$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(1.5,1.5,1.5),col=c("black", "red", "blue"),cex=0.4,bty = "n")
plot(electric[,2], electric$Global_reactive_power, type = "l",ylab = "Global Reactive Power", xlab = "datetime")
#Save plots
dev.copy(png,'plot4.png')
dev.off()
