#Set your working directory: setwd("yourworkingdirectory")
#Read the dataset, that must be in wd
electric <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE,na.strings = "NA")
#Correct the data types
for (i in 3:9) {
  electric[,i] <- as.numeric(electric[,i])
}
electric[,1] <- as.Date(electric[,1], "%d/%m/%Y")
#Subset the selected dates
electric <- subset(electric,as.Date("2007-01-31")< electric[,1]&electric[,1]<as.Date("2007-02-03"))
#Plot
hist(electric$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
#Save plot
dev.copy(png,'plot1.png')
dev.off()
