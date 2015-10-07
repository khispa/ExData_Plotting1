#Read the dataset
electric <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors=FALSE,na.strings = "NA")
#Correct the data types
for (i in 3:9) {
  electric[,i] <- as.numeric(electric[,i])
}
electric[,1] <- as.Date(electric[,1], "%d/%m/%Y")
#Subset the selected dates
electric <- subset(electric,as.Date("2007-01-31")< electric[,1]&electric[,1]<as.Date("2007-02-03"))
#Plot
